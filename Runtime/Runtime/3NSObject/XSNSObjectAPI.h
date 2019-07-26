//
//  XSNSObjectAPI.h
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
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

