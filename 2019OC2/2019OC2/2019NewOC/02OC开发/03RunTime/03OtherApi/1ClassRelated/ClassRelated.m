//
//  ClassRelated.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ClassRelated.h"
#import <objc/runtime.h>




@implementation ClassRelated

void run(){

}


/**
 类相关
 */
- (void)test1{
    NSObject *obje = [NSObject new];
    // 实例对象 类对象
    Class type1 = object_getClass(obje);
    Class type2 = object_getClass(type1);
    BOOL isClass = object_isClass(type1);

    //设置isa指向的Class 同名方法调换类调用
    object_setClass(obje, [NSObject class]);

    // 类对象 原类对象
    BOOL isMetaClass = class_isMetaClass(type2);
    Class superClass = class_getSuperclass(type1);


    //创建，注册 销毁类
    Class person = objc_allocateClassPair([NSObject class], "person", 0);
    objc_registerClassPair(person);
    class_addIvar(person, "_age", 4, 1, @encode(int));
    class_addMethod(person, @selector(run), (IMP)run, "v@:");

    objc_disposeClassPair(person);

}
@end
