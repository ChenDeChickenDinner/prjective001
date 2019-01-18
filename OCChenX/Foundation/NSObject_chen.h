//
//  objectInit.h
//  ursInclude
//
//  Created by xs on 2018/11/30.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol objectInitProtocol<NSObject>

@end


@interface objectInit : NSObject<objectInitProtocol>
+ (void)chenxiawei;
@end

@interface objectInitChild : objectInit

@end

/*
 1.暴露类的加载与初始化
 + (void)load;
 + (void)initialize;

 2.暴露类创建对象 alloc、new
 + (instancetype)allocWithZone:(struct _NSZone *)zone
 + (instancetype)alloc
 + (instancetype)new

 3.暴露对象的初始化
 - (instancetype)init

 4.获取类对象，实例对象的类信息，以及比对
 1.1 + (Class)class
 1.2 - (Class)class

 2.1 + (Class)superclass;
 2.2 @property (readonly) Class superclass;

 3.1 + (BOOL)isSubclassOfClass:(Class)aClass;
 3.2 - (BOOL)isKindOfClass:(Class)aClass;
 3.3 - (BOOL)isMemberOfClass:(Class)aClass;

 5.判断类对象,是否实现某类方法
 1.- (BOOL)respondsToSelector:(SEL)aSelector;

 6.判断实例对象,是否实现某实例方法
 1.+ (BOOL)instancesRespondToSelector:(SEL)aSelector;
 2.- (BOOL)respondsToSelector:(SEL)aSelector;

 7.判断类对象，实例对象是否遵守某协议
 1.+ (BOOL)conformsToProtocol:(Protocol *)protocol;
 2.- (BOOL)conformsToProtocol:(Protocol *)aProtocol;
 */
