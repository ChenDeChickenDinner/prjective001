//
//  Interface.h
//  Runtime
//
//  Created by xs on 2021/3/8.
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



#pragma warning-类的声明与实现
/*
1.成员变量
2.类方法
3.对象方法
 */

#pragma warning-类的继承
/*
 1.子类拥有父类的全部属性、方法
 2.子类可以重写父类的方法实现
 3.父类指针可以指向子类对象 多态
 */
@interface NSObject2 : NSObject
@property NSString *str;
-(void)test;
+(void)test;
@end

#pragma warning-类的扩展
/*
 1.可以为元类添加新的属性、方法、协议，在编译阶段就整合到类的数据结构中去的，就是类的一部分
 2.类扩展无单独的@implementation 部分，必须依托对应类的实现部分来实现，所以你无法为系统的类添加extension
 3.定义在 .m 文件中的类扩展方法为私有的，定义在 .h 文件（头文件）中的类扩展方法为公有的
 */
@interface NSObject()<XSProtocol>
-(void)test2;
+(void)test2;
@end







#pragma warning-分类
/*
 1.作用:可以为元类添加新的属性、方法、协议，在运行时动态添加到元类中去的
 
 2.加载原理：
  a.编译阶段:一个分类就是一个 category_t 类型的变量
  b.运行时:循环所有分类，利用运行时机制把分类中的属性、方法、协议列表都添加到类跟元类中去
 
 3.结果:分类跟元类的方法都存在，共存
  
 4.调用:
 a: 通过runtime消息机制调用的方法：分类(多分类看编译顺序) > 本类 > 父类
 b: 通过方法地址调用的方法 是不受分类影响的，比如分类中的load
 
 */
@interface NSObject(Category1)
-(void)test;
+(void)test;
@end
@interface NSObject(Category2)
-(void)test;
+(void)test;
@end

