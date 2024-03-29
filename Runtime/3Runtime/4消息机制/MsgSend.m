//
//  MsgSend.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "MsgSend.h"
#import <objc/runtime.h>
@interface ChenPerson :NSObject
- (void)personTest;
@end
@implementation ChenPerson
@end
@implementation MsgSend





- (void)test0{
    ChenPerson *person = [[ChenPerson alloc]init];
    [person personTest];
    // objc_msgSend(person, @selector(personTest));
    // 消息接收者（receiver）：person
    // 消息名称：personTest
}

/**
 消息发送

 */
- (void)test1{

}
/**
 动态方法解析:
 一种名为动态方法解析的手段，使得我们可以在运行时动态地为一个 selector 提供实现
 1.是否曾经有动态解析
 2.调用+resolveInstanceMethod:或者+resolveClassMethod:方法来动态解析方法
 3.标记为已经动态解析
 4.消息发送



 */
- (void)other
{
    NSLog(@"%s", __func__);
}


/**
 消息转发
 1.
 */
- (id)forwardingTargetForSelector:(SEL)aSelector{
    /*
     1.给指定的 对象 发送aSelector消息
     */
    if (aSelector == @selector(test)) {
        // objc_msgSend([[NSObject alloc] init], aSelector)
        return [[NSObject alloc] init];
    }
    return [super forwardingTargetForSelector:aSelector];
}



/**
 1.当 forwardingTargetForSelector 返回空对象时候 会调用到这里
 2.NSMethodSignature方法签名：返回值类型、参数类型
 */
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector
{
    /* NSMethodSignature API
     */
    if (aSelector == @selector(test)) {
        return [NSMethodSignature signatureWithObjCTypes:"v16@0:8"];
    }
    return [super methodSignatureForSelector:aSelector];
}


/**
 当 methodSignatureForSelector 返回的是有效的 方法签名时候 会调用到这里
 1.根据 NSMethodSignature 封装一个 anInvocation 对象
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    /* 利用 anInvocation 做事情
     NSInvocation封装了一个方法调用，包括：方法调用者、方法名、方法参数
     anInvocation.target 方法调用者
     anInvocation.selector 方法名
     [anInvocation getArgument:NULL atIndex:0]
     */
    /*自由发挥，利用这个原理做一些 功能业务性的东西

     */
}
@end

/**
 [super message]的底层实现
 1.消息接收者仍然是子类对象
 2.从父类开始查找方法的实现
 struct objc_super arg = {self, [MJPerson class]};
 objc_msgSendSuper(arg, @selector(message));
 */
struct objc_super {
    __unsafe_unretained _Nonnull id receiver; // 消息接收者
    __unsafe_unretained _Nonnull Class super_class; // 消息接收者的父类
};
static void test6(){

}



