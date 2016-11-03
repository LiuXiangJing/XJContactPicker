//
//  XJContactManager.m
//  shorthand
//
//  Created by 刘向晶 on 2016/10/22.
//  Copyright © 2016年 安系列. All rights reserved.
//


#import "XJContactManager.h"
#import "XJContactIOS8Manager.h"
#import "XJContactIOS9Manager.h"
@interface XJContactManager ()
@property (nonatomic,strong)XJContactIOS9Manager * contactIOS9Manager;
@property (nonatomic,strong)XJContactIOS8Manager * contactIOS8Manager;
@end
#import <UIKit/UIKit.h>
@implementation XJContactManager
+ (instancetype)shareManager {
    static XJContactManager * contactManger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        contactManger = [[XJContactManager alloc]init];
    });
    return contactManger;
}
- (void)presentContactsViewOnController:(id)controller chooseComplete:(XJContactChooseComplete)complete {
    if (SYSTEM_VERSION_LESS_THAN(@"9.0")) {
        [self.contactIOS8Manager presentContactsViewOnController:controller chooseComplete:complete];
    }else{
        [self.contactIOS9Manager presentContactsViewOnController:controller chooseComplete:complete];
    }
}
- (XJContactIOS8Manager *)contactIOS8Manager {
    if (!_contactIOS8Manager) {
        _contactIOS8Manager = [XJContactIOS8Manager shareManager];
    }
    return _contactIOS8Manager;
}
- (XJContactIOS9Manager *)contactIOS9Manager {
    if (!_contactIOS9Manager) {
        _contactIOS9Manager = [XJContactIOS9Manager shareManager];
    }
    return _contactIOS9Manager;
}
@end
