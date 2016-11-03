//
//  XJContact.m
//  shorthand
//
//  Created by 刘向晶 on 2016/10/22.
//  Copyright © 2016年 安系列. All rights reserved.
//

#import "XJContact.h"

@implementation XJContact
- (NSString *)description {
    return [NSString stringWithFormat:@"%@:%@",self.fullName,self.phoneNumber];
}
@end
