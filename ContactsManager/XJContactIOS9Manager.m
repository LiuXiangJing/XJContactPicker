//
//  XJContactIOS9Manager.m
//  shorthand
//
//  Created by 刘向晶 on 2016/10/22.
//  Copyright © 2016年 安系列. All rights reserved.
//

#import "XJContactIOS9Manager.h"
#import <ContactsUI/ContactsUI.h>
@interface XJContactIOS9Manager ()<CNContactPickerDelegate>
@property(nonatomic,copy) XJContactChooseComplete chooseAction;

@end
@implementation XJContactIOS9Manager
+ (instancetype)shareManager {
    XJContactIOS9Manager * contactManager = [[XJContactIOS9Manager alloc]init];
    return contactManager;
}
- (void)presentContactsViewOnController:(id)controller chooseComplete:(XJContactChooseComplete)complete {
    self.chooseAction = complete;
    CNContactPickerViewController *contactVc = [[CNContactPickerViewController alloc] init];
    contactVc.delegate = self;

    contactVc.displayedPropertyKeys  =@[CNContactPhoneNumbersKey];
        //    这行代码打开就是可以点进详通讯录情页，但是无法监听具体点了哪个，所以设置默认做法。
    contactVc.predicateForEnablingContact = [NSPredicate predicateWithFormat:@"phoneNumbers.@count > 0"];
    contactVc.predicateForSelectionOfContact = [NSPredicate predicateWithValue:NO];
    [controller presentViewController:contactVc animated:YES completion:nil];

}

-(void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    XJContact *personEntity = [[XJContact alloc] init];
    NSString *lastname = contact.familyName;
    NSString *firstname = contact.givenName;
    personEntity.lastName = lastname;
    personEntity.firstName = firstname;
    
    NSMutableString *fullname = [[NSString stringWithFormat:@"%@%@",lastname,firstname] mutableCopy];
    [fullname replaceOccurrencesOfString:@"(null)" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, fullname.length)];
    personEntity.fullName = fullname;

    
    NSString *fullPhoneStr = [NSString string];
    NSArray *phoneNums = contact.phoneNumbers;
    for (CNLabeledValue *labeledValue in phoneNums) {
        
        CNPhoneNumber *phoneNumer = labeledValue.value;
        NSString *phoneValue = phoneNumer.stringValue;
        
        if (phoneValue.length > 0) {
            fullPhoneStr = [fullPhoneStr stringByAppendingString:phoneValue];
            fullPhoneStr = [fullPhoneStr stringByAppendingString:@","];
        }
    }
    if (fullPhoneStr.length > 1) {
        personEntity.phoneNumber = [fullPhoneStr substringToIndex:fullPhoneStr.length - 1];
    }
    self.chooseAction(personEntity);
}

- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(CNContactProperty *)contactProperty
{
    XJContact *personEntity = [[XJContact alloc] init];
    NSString *lastname = contactProperty.contact.familyName;
    NSString *firstname = contactProperty.contact.givenName;
    personEntity.lastName = lastname;
    personEntity.firstName = firstname;
    
    NSMutableString *fullname = [[NSString stringWithFormat:@"%@%@",lastname,firstname] mutableCopy];
    [fullname replaceOccurrencesOfString:@"(null)" withString:@"" options:NSCaseInsensitiveSearch range:NSMakeRange(0, fullname.length)];
    personEntity.fullName = fullname;
    
    if ([contactProperty.key isEqualToString:CNContactPhoneNumbersKey]) {
        CNPhoneNumber *phoneNumer = contactProperty.value;
        personEntity.phoneNumber = phoneNumer.stringValue;
    }
    self.chooseAction(personEntity);
}
- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker
{
    self.chooseAction(nil);
}

@end
