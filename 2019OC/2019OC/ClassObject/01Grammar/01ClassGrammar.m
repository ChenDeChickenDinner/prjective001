//
//  01ClassGrammar.m
//  2019OC
//
//  Created by xs on 2019/2/21.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "01ClassGrammar.h"

@implementation _1ClassGrammar
/**
 一是如果你没有手动实现setter方法和getter方法，那么编译器会自动为你加上这两个方法。
 二是可以指定与属性对应的实例变量
 */
@synthesize time;
/**
 告诉编译器,属性的setter与getter方法由用户自己实现，不自动生成
 */
@dynamic day;
@end

/** 类扩展(Extension)
 1.可以为某个类扩充一些私有的成员变量 和 方法
 2.类扩展没有名字
 */
@interface NSObject ()
@end

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
@interface NSObject (XS)
@end
@implementation NSObject (XS)
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
@interface ChenXiao :NSObject
@end
@implementation ChenXiao
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

