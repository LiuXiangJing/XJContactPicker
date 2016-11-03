//
//  XJContactDefines.h
//  XJContactPickerDemo
//
//  Created by 刘向晶 on 2016/11/3.
//  Copyright © 2016年 Tintin. All rights reserved.
//

#ifndef XJContactDefines_h
#define XJContactDefines_h
#import "XJContact.h"
typedef void (^XJContactChooseComplete)(XJContact * contact);

#define SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)


#endif /* XJContactDefines_h */
