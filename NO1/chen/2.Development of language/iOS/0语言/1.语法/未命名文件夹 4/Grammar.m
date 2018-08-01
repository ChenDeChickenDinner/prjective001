//
//  Grammar.m
//  StudyChen
//
//  Created by xs on 2017/5/15.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "Grammar.h"

@implementation Grammar

@end
/*
 
 【G】其它语法
 继承:当一个类继承自某个类 则拥有它的全部 属性，方法
 a:在编译器编码中，父类的声明必须在子类之前
 b:重复继承
 成员变量
 a:子类拥有父类的全部属性【不论其定义再.h 还是.m 中】,但不允许子类不允许拥有与父类 相同的成员变量
 c:子类可以使用的属性【父类对外提供了 set get 方法的】
 方法
 a:子类拥有父类的方法【不论其定义再.h 还是.m 中】,且子类可以重写父类的方法,调用方法时候 一层一层往上找
 b:子类可以使用的方法【1，父类在.h 中有声明；2:运行过程中直接替换】

 多态:有继承关系带来的多重形态【父类指针可以指向子类对象】
 a:好处，当设计一个方法 可以供全部子类对象使用的时候 其参数就可以用父类指针来指向子类对象
 b:局限，父类指针变量不能 调用 子类的方法【类型转换】

 分类:可以给某一个类扩充一些方法，一个类 可以有多个分类【对原类无影响】
 a:分类也必须有声明 实现，要用分类也必须导入其头文件
 b:分类只能增加方法，不能增加属性，但在方法中可以访问原类的属性
 c:原类 + 分类A + 分类B 当三者中都有一个相同的方法 调用的时候优先调【最先编译】的那个分类中的方法【分类会覆盖原类方法】
 */
