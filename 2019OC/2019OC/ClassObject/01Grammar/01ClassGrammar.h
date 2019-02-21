//
//  01ClassGrammar.h
//  2019OC
//
//  Created by xs on 2019/2/21.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _1ClassGrammar : NSObject
{
@public // 公共的:任何地方都可以直接访问
    int _age;
@protected // 受保护的:可以在当前类以及子类的对象方法中直接访问
    double height;
@private // 有的:私有，只能在当前类的对象方法中直接访问。
    char * name;
@package // 包:同一个“体系内”（框架）可以访问，介于@private和@public之间
    NSString *oldName;
}
/*
 A).公开的成员变量的访问

 1.自己直接访问 修改  NSLog(@"car->speed = %d\n",speed);
 2.可以通过指针 P->speed 方式 访问 修改

 B).私有成员变量的封装
 1.可以通过 方法 间接访问修改

 @property 可以同时生成setter和getter的声明
 1.setter和getter方法中的实现，会去访问下划线 _ 开头的成员变量(若没有就会自动生成)
 2.如果同时 手动实现了 set get 的实现，则不会生成_ 开头的成员变量（so，若property了，则不同同时重写 set get 方法）
 3.利用点语法替换set方法和get方法,本质还是方法调用,编译器会自动展开成相应的方法

  @property修饰符详解
 1.内存管理:strong,weak,copy,assign
 2.线程安全:nonatomic,atomic
 3.读写限制:readonly,readwrite
 4.命名自定义:setter=xxx getter=xxx
 */
@property(nonatomic,readonly,getter=isDay) NSString *day;
@property(nonatomic,copy) NSString *time;
@end


