//
//  FuncRelated.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "FuncRelated.h"
#import <objc/runtime.h>
@interface school :NSObject
@property (nonatomic,assign) int age;
- (void)instancetest;
+ (void)classtest;
- (void)test1;
- (void)test2;

@end

@implementation school
@end
@implementation FuncRelated
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
