//
//  objc_class.m
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import "objc_class.h"
#import <objc/runtime.h>

@implementation objc_class


+ (void)load{
    
    //元类对象
    Class object_meatClass = object_getClass([NSObject class]);
    
    //类对象
    Class object_class1 = [NSObject class];
    Class object_class2 = [[NSObject class] class];
    Class object_class3 = object_getClass([[NSObject alloc]init]);
    
    //实例对象
    NSObject *object = [[NSObject alloc]init];
}

@end
