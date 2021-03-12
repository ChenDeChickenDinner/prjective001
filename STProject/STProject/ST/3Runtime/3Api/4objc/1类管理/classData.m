//
//  classData.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "classData.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation classData
+ (void)load{
    
    { // 获取所有的类
        unsigned int outCount = 0;
        Class *classList = objc_copyClassList(&outCount);
        for (int i = 0; i < outCount; i++) {
            Class class = classList[i];
            //        NSLog(@"%@",NSStringFromClass(class));
        }
    }
    
    { // 类的动态创建，注册，销毁
        Class class = objc_allocateClassPair([NSObject class], "person", 0);
        objc_registerClassPair(class);
//        class_addIvar(class, "_age", 4, 1, @encode(int));
//        class_addMethod(class, @selector(run), (IMP)run, "v@:");
//        class_addProtocol(class, @protocol(NSObject));
        objc_disposeClassPair(class);
    }
    
    
   
    //通过C字符串类名获取类、元类、
    Class instClass = objc_getClass("classData"); // 类对象
    Class metaClass = objc_getMetaClass("classData"); // 元类对象
}
@end
