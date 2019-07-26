//
//  XSNSObjectProtocol.h
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XSNSObject



- (instancetype)self;
- (Class)class;
@property (readonly) Class superclass;

- (id)performSelector:(SEL)aSelector;
- (id)performSelector:(SEL)aSelector withObject:(id)object;
- (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;

- (BOOL)isProxy;
- (BOOL)isKindOfClass:(Class)aClass;
- (BOOL)isMemberOfClass:(Class)aClass;
- (BOOL)conformsToProtocol:(Protocol *)aProtocol;

- (BOOL)respondsToSelector:(SEL)aSelector;
- (BOOL)isEqual:(id)object;

@property (readonly, copy) NSString *description;


@optional
@property (readonly, copy) NSString *debugDescription;

@end

@interface XSNSObjectProtocol : NSObject

@end

