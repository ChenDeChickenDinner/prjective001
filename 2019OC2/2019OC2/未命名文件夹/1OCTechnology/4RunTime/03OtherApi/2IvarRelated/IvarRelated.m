//
//  IvarRelated.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "IvarRelated.h"
#import <objc/runtime.h>

@implementation IvarRelated
/**
 类,对象的成员变量信息
 */
- (void)test2{

    unsigned int count;
    Ivar *ivarList = class_copyIvarList([NSObject class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivarList[i];
    }
    free(ivarList);

    NSObject *value = [[NSObject alloc]init];
    Ivar age1 = class_getClassVariable([NSObject class], "_age");
    Ivar age2 = class_getInstanceVariable([NSObject class], "_age");

    const char *name = ivar_getName(age1);
    const char *encoding = ivar_getTypeEncoding(age1);
    object_setIvar(value, age1, @12);
    object_getIvar(value, age1);

}
@end
