//
//  selfSuper.m
//  Runtime
//
//  Created by xs on 2019/7/30.
//  Copyright © 2019 xax. All rights reserved.
//

#import "selfSuper.h"

@implementation selfSuper

/**
 self:
 1.是一个隐私参数,代表当前对象,实例对象，或者类对象
 2.执行时调用RT的objc_msgSend();
 3. id _Nullable objc_msgSend(id _Nullable self, SEL _Nonnull op, ...)
 
 super:
 1.super并不是隐藏参数，它实际上只是一个”编译器标示符”，
 2.它负责告诉编译器，当调用方法时，去调用父类的方法，而不是本类中的方法。
 
 3.在调用[super class]的时候，runtime会去调用objc_msgSendSuper方法，而不是objc_msgSend
 4.id _Nullable objc_msgSendSuper(struct objc_super * _Nonnull super, SEL _Nonnull op, ...)
 

 struct objc_super {
 __unsafe_unretained _Nonnull id receiver; // 消息接收者
 __unsafe_unretained _Nonnull Class super_class; // 消息接收者的父类
 };
 */
- (instancetype)init{
    self = [super init];
    
    return self;
}
@end
