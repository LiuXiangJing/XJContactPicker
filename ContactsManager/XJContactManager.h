//
//  XJContactManager.h
//  shorthand
//
//  Created by 刘向晶 on 2016/10/22.
//  Copyright © 2016年 安系列. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "XJContactDefines.h"
@interface XJContactManager : NSObject

/**
 这是一个单例，你也可以不使用单例，但必须创建成全局的

 @return 联系人管理器
 */
+ (instancetype)shareManager;

- (void)presentContactsViewOnController:(id)controller chooseComplete:(XJContactChooseComplete)complete;
@end
