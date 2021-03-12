//
//  @property.h
//  Runtime
//
//  Created by xs on 2021/3/9.
//

#import <Foundation/Foundation.h>

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
#pragma warning-类的扩展
/*
 1.可以为元类添加新的属性、方法、协议，在编译阶段就整合到类的数据结构中去的，就是类的一部分
 2.类扩展无单独的@implementation 部分，必须依托对应类的实现部分来实现，所以你无法为系统的类添加extension
 3.定义在 .m 文件中的类扩展方法为私有的，定义在 .h 文件（头文件）中的类扩展方法为公有的
 */
@interface Interface : NSObject

#pragma warning- 成员变量的生成与接口
/*
 1.@property的作用
 2.@synthesize的作用
 3.@dynamic的作用
 */

@property  NSString *name1;
@property  NSString *name2;
@property  NSString *name3;
@property  NSString *name4;

#pragma warning- @property的修饰词
/*set/get接口命名与限制
 
 */
@property (setter=writeNme:,getter=isName) NSString *name3;
@property (readonly)  NSString *name4;
@property (readwrite) NSString *name5;

/*编程规范提示
 
 */
@property (nonnull) NSString *name11;
@property (nullable) NSString *name21;

/*线程安全
 atomic和nonatomic区别用来决定编译器生成的setter和getter是否为原子操作，这只是针对 set/get 方法的;

 atomic
 1.默认是有该属性的，这个属性是为了保证程序在多线程情况下，编译器会自动生成一些互斥加锁代码
 2.多线程(单单操作setter或者getter):一个线程操作完之后，下一个线程才能执行（串行）
 3.多线程(setter与getter同时操作):不能保证总是正确的有效值,
 4.如果要真正实现防止多线程修改某属性的值的时候，单单设置atomic是不够的，还需要更完善的防止手法
 
 nonatomic
 1.系统生成的getter/setter方法没有加锁
 2.(单单操作setter或者getter)多线程:同时执行（并行）
 
 */
@property (atomic) NSString *name111;
@property (nonatomic) NSString *name211;

/*内存管理
 
 */
@property (assign) double name13;
@property (weak) NSString *name24;
@property (strong) NSString *name14;
@property (copy) NSString *name25;
@end



@interface Interface2 : NSObject


@end
