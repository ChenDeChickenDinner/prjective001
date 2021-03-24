//
//  Method1.m
//  test
//
//  Created by xs on 2021/3/23.
//

#import "Method.h"
#import <objc/runtime.h>

@implementation Method1
-(void)testInts{
    
}
+(void)testClas{
    
}
// 获取 Method
+ (void)load{
    Class class = [Method1 class];
    Class methClass = objc_getMetaClass(class_getName(class));
    BOOL value = YES;
    id object = value?class:methClass;

    {
        //  从一个类对象，元类对象中获取 Method（粗略获取）
        unsigned int outCount = 0;
        Method *methodList = class_copyMethodList(object, &outCount);
        for (int i = 0; i < outCount; i++) {
            Method method = methodList[i];
        }
    }
    {
        // 根据 sel 从一个类对象，元类对象中获取 Method(精准获取)

        Method classMethod = class_getClassMethod(object, @selector(testClas));
        
        Method instanceMethod = class_getInstanceMethod(object, @selector(testInts));
    }

}
// 获取 IMP
+ (void)load1{
    Class class = [Method1 class];
    Class methClass = objc_getMetaClass(class_getName(class));
    BOOL value = YES;
    id object = value?class:methClass;
    Method method = class_getInstanceMethod(object, @selector(testInts));

    
    
    //从一个类对象，元类对象中 根据 sel 获取 IMP
    IMP imp1 = class_getMethodImplementation(object, @selector(NSObject_Class_Fuc));

    //从一个Method中  IMP
    IMP imp2 = method_getImplementation(method);

    
    //创建一个指针函数的指针，该函数调用时会调用特定的block
     IMP imp = imp_implementationWithBlock(^(){
         
     });
     //返回与IMP(使用imp_implementationWithBlock创建的)相关的block
     id block = imp_getBlock(imp);
     //解除block与IMP(使用imp_implementationWithBlock创建的)的关联关系，并释放block的拷贝
     BOOL remove = imp_removeBlock(imp);
    
}
// 获取 SEL
+ (void)load2{
    Class class = [Method1 class];
    Class methClass = objc_getMetaClass(class_getName(class));
    BOOL value = YES;
    id object = value?class:methClass;
    Method method = class_getInstanceMethod(object, @selector(testInts));

    
    SEL sel =  method_getName(method);
    SEL sel1 = @selector(load1);
    SEL sel2 = NSSelectorFromString(@"test1");
    SEL sel3 = sel_registerName("test1");
    
}

// 获取 NSMethodSignature
+ (void)load3{
    NSMethodSignature *sig1 = [NSObject instanceMethodSignatureForSelector:@selector(description)];
    NSMethodSignature *sig2 = [[NSObject new] methodSignatureForSelector:@selector(description)];
    
    NSMethodSignature *sig3 = [NSMethodSignature signatureWithObjCTypes:"v@:"];
    
    NSUInteger methodReturnLength = sig1.methodReturnLength; //判断有没返回值
    NSUInteger frameLength = sig1.frameLength; //判断

    
    const char *methodReturnType = sig1.methodReturnType; //返回值 类型 编码
    const char *type = [sig1 getArgumentTypeAtIndex:0]; //获取参数类型
    NSUInteger numberOfArguments = sig1.numberOfArguments; //参数个数

}
/*获取 NSInvocation
 简单来说，借助NSInvocation，我们可以向"Objective-C对象发送消息"这一操作保存到一个对象里，并执行这一操作。
 NSInvocation的几个主要的属性和接口
 
 */
+ (void)load4{
    NSMethodSignature *sig = [self instanceMethodSignatureForSelector:@selector(description)];
    // -- 根据方法签名创建一个NSInvocation
    NSInvocation * invocation = [NSInvocation  invocationWithMethodSignature:sig];
    // -- 设置调用者
    [invocation setTarget:self];
    // -- 设在被调用的消息
    [invocation setSelector:@selector(instanceLog)];
    NSString * str1 = @"test1";
    NSString * str2 = @"test2";
    [invocation setArgument:&str1 atIndex:2];
    [invocation setArgument:&str2 atIndex:3];
    
    // --  执行
    [invocation invoke];
}
@end
