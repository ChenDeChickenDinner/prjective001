//
//  testclass.m
//  test
//
//  Created by xs on 2021/3/15.
//

#import "objc_msgSend.h"
#import <objc/runtime.h>


/*
 OC中的方法调用，其实都是转换为objc_msgSend函数的调用
 a.objc_msgSend的执行流程可以分为3大阶段
 
 
 第一步：消息发送:
 1.receiver是否为nil return
 2.从reveiver_Class的cache中查找方法
 
 3.从reveiver_Class的class_rw_t中查找方法
 4.从superClass的cache中查找方法
 5.从superClass的class_rw_t中查找方法
 (3.4.4步中如果找到方法，会将方法缓存到reveiverClass的cache中)
 
 6.上层是否还有superClass，一直找到基类，若还是没有找到则进入 动态方法解析阶段
*/

@interface testclass : NSObject
- (void)funcIns;
+ (void)funcClass;
@end


@implementation testclass

// load 不走 objc_msgSend 它是在runtime中利用方法地址直接调用的
+ (void)load{
    [self funcClass];
}

- (void)funcIns2{
    NSLog(@"");

}
+ (void)funcClass2{
    NSLog(@"");
}
/*
 第二步：动态方法解析:
if (resolver  &&  !triedResolver) {// 如果消息接收者有值，且没有进行过动态解析
   _class_resolveMethod(cls, sel, inst); // 这里给了一次动态添加方法的机会
   triedResolver = YES; //标记 已经 动态解 过
   goto retry; // 再从新走到  第一步 消息发送 阶段 查找方法
}

void _class_resolveMethod(Class cls, SEL sel, id inst)
{
    if (! cls->isMetaClass()) {
       // 如果不是元类对象：给类对象添加对象方法
       _class_resolveInstanceMethod(cls, sel, inst);  + (BOOL)resolveInstanceMethod:(SEL)sel
    }else {
       // 给元类对象添加 类方法
       _class_resolveClassMethod(cls, sel, inst); + (BOOL)resolveClassMethod:(SEL)sel
    }
}
*/
//对象方法动态解析
+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(funcIns)) {
        Method method = class_getInstanceMethod(self, @selector(funcIns2));
        class_addMethod(self, sel, method_getImplementation(method), method_getTypeEncoding(method));
        return YES;

    }

    return [super resolveInstanceMethod:sel];
}
//类方法动态解析
 + (BOOL)resolveClassMethod:(SEL)sel{
     if (sel == @selector(funcClass)) {
         Class metaClass = objc_getMetaClass(class_getName([self class]));
         Method method = class_getClassMethod(metaClass, @selector(funcClass2));
         class_addMethod(metaClass, sel, method_getImplementation(method), method_getTypeEncoding(method));
         return YES;

     }
     
     return [super resolveClassMethod:sel];
 }

/*
 第三步：消息转发
1.当在 动态方法解析 步骤中也没有动态增加方法，则会来到消息转发过程
2.先调用 forwardingTargetForSelector 要求返回一个处理消息的对象
3.下面三个方法 -号开头的是处理对象方法 + 号开头的是处理类方法
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
     */
 
}
/**
 当 methodSignatureForSelector 返回空的时候
 就会调用doesNotRecognizeSelector:方法 报方法找不到
 */
@end
