//
//  XJContactIOS8Manager.m
//  shorthand
//
//  Created by 刘向晶 on 2016/10/22.
//  Copyright © 2016年 安系列. All rights reserved.
//

#import "XJContactIOS8Manager.h"

#import <AddressBookUI/AddressBookUI.h>
@interface XJContactIOS8Manager ()<ABPeoplePickerNavigationControllerDelegate>
@property(nonatomic,copy) XJContactChooseComplete chooseAction;

@end
@implementation XJContactIOS8Manager
+ (instancetype)shareManager {
    XJContactIOS8Manager * contactManager = [[XJContactIOS8Manager alloc]init];
    return contactManager;
}
- (void)presentContactsViewOnController:(id)controller chooseComplete:(XJContactChooseComplete)complete {
    self.chooseAction = complete;
    ABPeoplePickerNavigationController *ppnc = [[ABPeoplePickerNavigationController alloc] init];
    ppnc.predicateForSelectionOfPerson = [NSPredicate predicateWithValue:false];
    ppnc.peoplePickerDelegate = self;
    [controller presentViewController:ppnc animated:YES completion:nil];

}

// 当用户选中某一个联系人的某一个属性时会执行该方法,并且选中属性后会退出控制器
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier {
    
    ABMultiValueRef phone = ABRecordCopyValue(person, kABPersonPhoneProperty);
    long index = ABMultiValueGetIndexForIdentifier(phone,identifier);
    NSString *phoneNO = (__bridge NSString *)ABMultiValueCopyValueAtIndex(phone, index);
    
    CFStringRef lastName = ABRecordCopyValue(person, kABPersonLastNameProperty);
    CFStringRef firstName = ABRecordCopyValue(person, kABPersonFirstNameProperty);
    
    NSString *lastname = (__bridge_transfer NSString *)(lastName);
    NSString *firstname = (__bridge_transfer NSString *)(firstName);
    
    XJContact *personEntity = [[XJContact alloc] init];
    personEntity.lastName = lastname;
    personEntity.firstName = firstname;
    
    NSMutableString *fullname = [[NSString stringWithFormat:@"%@%@",lastname,firstname] mutableCopy];
    [fullname replaceOccurrencesOfString:@"(null)" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, fullname.length)];
    personEntity.fullName = fullname;
    if (phoneNO) {
        personEntity.phoneNumber = phoneNO;
    }
    self.chooseAction(personEntity);
}

@end
