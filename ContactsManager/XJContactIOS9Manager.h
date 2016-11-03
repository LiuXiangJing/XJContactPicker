//
//  XJContactIOS9Manager.h
//  shorthand
//
//  Created by 刘向晶 on 2016/10/22.
//  Copyright © 2016年 安系列. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XJContactDefines.h"

@interface XJContactIOS9Manager : NSObject
+ (instancetype)shareManager;
- (void)presentContactsViewOnController:(id)controller chooseComplete:(XJContactChooseComplete)complete;
@end
