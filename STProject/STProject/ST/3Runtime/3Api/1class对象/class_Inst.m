//
//  class_Inst.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "class_Inst.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation class_Inst
+ (void)run{
    
}
- (void)test{
    
}
+ (void)load{
    Class class = [NSObject class];
    Class mettClass = objc_getMetaClass(class_getName(class));
        
    const char *classNameC = class_getName([NSObject class]);

    
    { // 元类对象的检测
        BOOL isMetaCLass = class_isMetaClass(class);
        
        // 检测是否遵守协议
        BOOL isConformsProtocol = class_conformsToProtocol(class, @protocol(NSObject));
        
        // 检测是否实现方法
        BOOL isRespondsSel1 = class_respondsToSelector(class, @selector(NSObject_Instd_Fuc));
        NSLog(@"");
    }

    { // 获取信息
        unsigned int count = 0;
        objc_property_t *propertyList = class_copyPropertyList(class, &count);
        Ivar *ivarlist = class_copyIvarList(class, &count);
        Method *methodList = class_copyMethodList(class, &count);
        Protocol *__unsafe_unretained *protocolList = class_copyProtocolList(class, &count);

    }
    {
        //根据方法名获取IMP
        IMP imp1 = class_getMethodImplementation(class, @selector(NSObject_Class_Fuc));
        IMP imp2 = class_getMethodImplementation(class, @selector(NSObject_Instd_Fuc));
    
        //根据方法名获取Method
        Method classMethod = class_getClassMethod(class, @selector(load));
        
        Method instanceMethod = class_getInstanceMethod(class, @selector(test));
        
        
        Ivar ivar1 = class_getClassVariable(class, "_str");
        
        Ivar ivar2 = class_getInstanceVariable(class, "_str");
    }
    
    {
        class_addIvar(class, "_age", 4, 1, @encode(int));
//            class_addMethod(class, @selector(run), (IMP)run, "v@:");
        class_addProtocol(class, @protocol(NSObject));
    }
}


@end
