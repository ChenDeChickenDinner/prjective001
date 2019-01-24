//
//  01ClassExtension.m
//  2009OC
//
//  Created by xs on 2019/1/24.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "01ClassExtension.h"

@implementation _1ClassExtension

@end
/**
 A.类的继承
 1.当B类继承A类, 那么B类就拥有A类所有的属性和方法(类方法\对象方法)

 2.属性
 1.子类不能访问下划线成员变量，只能通过 set get 方法访问修改，so 子类不能 重写set get 方法

 2.方法重写
 1.如果 子类中 有和 父类中 同名的方法, 那么我们称之为方法重写
 2.继承中的方法调用顺序, 如果直接邮 就调用自己的, 如果自己没有 就调用 父类的
 3.在子类重新的方法 中 可以 提供super 调用父类方法

 3.多态
 1. 父类指针 指向 子类对象
 2. 如果 父类指针 指向 子类对象, 如果需要调用子类特有的方法, 必须先强制类型 转换
 >1.在编译的时候 编译器只会检查 当前类型对应的类中 有没有需要调用的方法
 >2.在运行时, 系统会自动判断 对象的真实类型

 */


/**  分类 (Catepory)
 A.成员变量
 1.分类不能添加属性(成员变量)
 2.分类中的@property,只会生成setter/getter方法的声明,不会生成实现以及私有的所有变量
 3.分类可以访问原来类中的成员变量（分类就是自己）

 B.方法
 1.只能新增方法
 2.如果分类中和原有类同名的方法,会调用 分类的方法
 3.如果多个分类中有同名的方法，会执行最后一个编译分类的方法
 */

/** 类扩展(Extension)
 1.可以为某个类扩充一些私有的成员变量 和 方法
 2.类扩展没有名字
 */
