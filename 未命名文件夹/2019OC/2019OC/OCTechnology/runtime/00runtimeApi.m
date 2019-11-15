//
//  runtimeApi.m
//  test1
//
//  Created by xs on 2019/2/25.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "runtimeApi.h"
/*
 什么是Runtime
 1.OC是一门动态性比较强的编程语言，允许很多操作推迟到程序运行时再进行
 2.OC的动态性就是由Runtime来支撑和实现的，Runtime是一套C语言的API，封装了很多动态性相关的函数
 3.平时编写的OC代码，底层都是转换成了Runtime API进行调用

 Runtime支撑的技术
 1.msgSend
 2.AssociatedObject
 3.KVO，KVC
 Runtime 常用的API
 1.字典转模型
 a.利用Runtime遍历所有的属性或者成员变量
 b.利用KVC设值

 2.替换方法实现
 */

void run(){

}
@interface school :NSObject
@property (nonatomic,assign) int age;
- (void)instancetest;
+ (void)classtest;
- (void)test1;
- (void)test2;

@end

@implementation school
@end
@implementation runtimeApi

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

/**
 类,对象的成员变量信息
 */
- (void)test2{

    unsigned int count;
    Ivar *ivarList = class_copyIvarList([school class], &count);
    for (int i = 0; i<count; i++) {
        Ivar ivar = ivarList[i];
    }
    free(ivarList);

    school *value = [[school alloc]init];
    Ivar age1 = class_getClassVariable([school class], "_age");
    Ivar age2 = class_getInstanceVariable([school class], "_age");

    const char *name = ivar_getName(age1);
    const char *encoding = ivar_getTypeEncoding(age1);
    object_setIvar(value, age1, @12);
    object_getIvar(value, age1);

}

- (void)test3{
    /*
     获取 Method 的 表示信息
     */
    // 获取类的所有对象方法 或者元类对象的所有类方法
    unsigned int count;
    Method *methodList =  class_copyMethodList([school class], &count);
    for (int i = 0; i < count; i++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        IMP imp = method_getImplementation(method);
        const char *encoding = method_getTypeEncoding(method);
    }
    free(methodList);

    //（根据类，方法名）获得一个实例方法、类方法 Method对象
    Method method1 = class_getClassMethod([school class], @selector(classtest));
    Method method2 = class_getInstanceMethod([school class], @selector(instancetest));

    Method method21 = class_getInstanceMethod([school class], @selector(test1));
    Method method22 = class_getInstanceMethod([school class], @selector(test2));
    //交换方法实现
    method_exchangeImplementations(method21, method22);



    //（根据类，方法名）获得一个实例方法、类方法 imp对象
    IMP imp1 = class_getMethodImplementation([school class], @selector(classtest));
    IMP imp2 = class_getMethodImplementation([school class], @selector(instancetest));

    //动态替换方法实现
    IMP imp3  = class_replaceMethod([school class], @selector(test1), imp2, "v");


    
    // block 生成 IMP
    IMP imp4 =  imp_implementationWithBlock(^{
    });
    id impBlock = imp_getBlock(imp4);

}
- (void)test4{
    SEL sel1 = @selector(test1);
    SEL sel2 = sel_registerName("test1");
    SEL sel3 = NSSelectorFromString(@"test1");
    Method method = class_getClassMethod([school class], @selector(test1));
    SEL sel4 = method_getName(method);

}
@end
