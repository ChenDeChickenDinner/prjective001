//
//  OC 基本语法.m
//  StudyChen
//
//  Created by xs on 2017/5/22.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import<Foundation/Foundation.h>

@interface CABC3 : NSObject // 声明一个 CABC3 类型 继承自基类
@end
@interface CABC3 () // 声明一个 CABC3 的匿名分类
@end
@implementation CABC3
@end


@interface CABC3 (CX) //CABC3的分类
@end
@implementation CABC3 (CX)
@end


@protocol PersonLook<NSObject> // 定义一个遵守基协议的 协议
@end

@interface Person2:NSObject<PersonLook> // Person2类遵守 PersonLook协议
@end
@implementation Person2
@end



/*


 类的继承 【类名: 父类】
     继承:当一个类继承自某个类 则拥有它的全部 属性，方法
        *在编译器编码中，父类的声明必须在子类之前，可对重继承
     成员变量
         a:子类拥有父类的全部属性【不论其定义再.h 还是.m 中】,但不允许子类不允许拥有与父类 相同的成员变量
         c:子类可以使用的属性【父类对外提供了 set get 方法的】
     方法
         a:子类拥有父类的方法【不论其定义再.h 还是.m 中】,且子类可以重写父类的方法,调用方法时候 一层一层往上找
         b:子类可以使用的方法【1，父类在.h 中有声明；2:运行过程中直接替换】

 类的分类【类名（分类名）】Category
 
     分类:可以给某一个类扩充一些方法，一个类 可以有多个分类【对原类无影响】
     *:分类也必须有声明 实现，要用分类也必须导入其头文件
     *:分类只能增加方法，不能增加属性，但在方法中可以访问原类的属性
     *:分类中的@property, 只会生成setter/getter方法的声明, 不会生成实现以及私有的成员变量，可自己再.m中实现get 方法 再通过运行时 动态添加属性【实现分类增加成员变量】
     *:原类 + 分类A + 分类B 当三者中都有一个相同的方法 调用的时候优先调【最先编译】的那个分类中的方法【分类会覆盖原类方法】

 类的扩展【类名()】 Extension
    *可以增加 成员变量  方法，方法必须实现
 
 协议
  *协议的定义，在定义的时候最好遵守基协议
   @protocol 协议名<NSObject>
   @end
  *遵守协议 类名:父类名<协议名,协议名>


 多态:有继承关系带来的多重形态【父类指针可以指向子类对象】
     a:好处，当设计一个方法 可以供全部子类对象使用的时候 其参数就可以用父类指针来指向子类对象
     b:局限，父类指针变量不能 调用 子类的方法【类型转换】

泛型
    * 在指针类型名称后在加上<>括号 可限制指针的参数类型
    * 让变量遵守某个协议 NSObject<PersonLook> *p
 */
