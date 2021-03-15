//
//  ProtocolX.h
//  STProject
//
//  Created by xs on 2021/3/12.
//

#import <Foundation/Foundation.h>
#pragma warning-协议(Protocol)

/*
 1.就一个用途，用来声明一大堆的方法（不能声明成员变量），不能写实现
 2.只要某个类遵守了这个协议，就永拥有了这个协议中的所有方法声明,其子类也遵守
 3.OC不能继承多个类，但是能遵守多个协议
 4.协议可以遵守协议，一个协议遵守了另一个协议，就可以拥有另一份协议中的方法声明
 5.基协议：<NSObject>是基协议，是最根本最根本的协议，其中声明了很多最基本的方法，比如description，retain，release
 */
@protocol XSProtocol <NSObject>

@optional  //不强制要求实现的方法
- (void)testProtocol1;
@required  // 必须实现的方法(默认)
- (void)testProtocol2;

@end

@interface ProtocolX : NSObject

@end


