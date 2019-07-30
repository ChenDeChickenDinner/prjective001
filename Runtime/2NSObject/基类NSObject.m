//
//  XSNSObjectAPI.m
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//


#import <Foundation/Foundation.h>

/*
 类 分类的 load
 1.调用时机:Runtime加载类,分类的时候调用，所有父类 子类 分类 都会调用
 2.调用方式:直接由系统通过方法地址调用，而不是消息机制的寻址方式
 3.调用顺序:循环遍历类的直接找到方法地址调用
 1.有继承关系:先父类 在子类
 2.无继承关系:按照编译先后顺序调用（先编译，先调用）
 3.有分类:先调用类的+load,再调用分类的+load
 4.多分类:按照编译先后顺序调用（先编译，先调用）
 */
 + (void)load;


 + (void)initialize;
 
 + (instancetype)new ;
 + (instancetype)allocWithZone:(struct _NSZone *)zone ;
 + (instancetype)alloc;
 
 
 - (instancetype)init;
 
 
 - (void)dealloc ;
 
 - (void)finalize ;
 
 - (id)copy;
 - (id)mutableCopy;
 
 + (id)copyWithZone:(struct _NSZone *)zone ;
 + (id)mutableCopyWithZone:(struct _NSZone *)zone ;
 
 + (BOOL)instancesRespondToSelector:(SEL)aSelector;
 + (BOOL)conformsToProtocol:(Protocol *)protocol;
 - (IMP)methodForSelector:(SEL)aSelector;
 + (IMP)instanceMethodForSelector:(SEL)aSelector;
 - (void)doesNotRecognizeSelector:(SEL)aSelector;
 
 - (id)forwardingTargetForSelector:(SEL)aSelector ;
 - (void)forwardInvocation:(NSInvocation *)anInvocation;
 - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector ;
 
 + (NSMethodSignature *)instanceMethodSignatureForSelector:(SEL)aSelector;
 
 - (BOOL)allowsWeakReference ;
 - (BOOL)retainWeakReference ;
 
 + (BOOL)isSubclassOfClass:(Class)aClass;
 
 + (BOOL)resolveClassMethod:(SEL)sel;
 + (BOOL)resolveInstanceMethod:(SEL)sel ;
 
 + (NSUInteger)hash;
 + (Class)superclass;
 + (Class)class;
 + (NSString *)description;
 + (NSString *)debugDescription;
 */
@interface XSNSObjectAPI : NSObject


@end


@implementation XSNSObjectAPI

@end
