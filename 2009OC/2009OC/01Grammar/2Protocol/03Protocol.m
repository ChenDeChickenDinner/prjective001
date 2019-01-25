//
//  03Protocol.m
//  2009OC
//
//  Created by xs on 2019/1/23.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "03Protocol.h"

@implementation _3Protocol

@end
/*
 Protocol
 1.就一个用途，用来声明一大堆的方法（不能声明成员变量），不能写实现
 2.只要某个类遵守了这个协议，就永拥有了这个协议中的所有方法声明,其子类也遵守
 3.OC不能继承多个类，但是能遵守多个协议
 4.协议可以遵守协议，一个协议遵守了另一个协议，就可以拥有另一份协议中的方法声明

 5.基协议：<NSObject>是基协议，是最根本最根本的协议，其中声明了很多最基本的方法，比如description，retain，release

 */
//声明协议
@protocol chenProtocol <NSObject> //1.基协议可以选择遵守或者不遵守2.遵守其它的1个或者多个协议
@optional //不强制要求实现的方法
- (void)test1;

@required // 必须实现的方法
- (void)test2;
@end



@interface ChenObje : NSObject<chenProtocol>//遵守协议
@property(nonatomic,weak)id<chenProtocol> delegate;// 成员变量遵守某个协议
@end

@implementation ChenObje
// 实现遵守的协议
- (void)test2{

}
@end
