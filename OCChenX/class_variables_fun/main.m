//
//  main.m
//  class_variables_fun
//
//  Created by xs on 2018/11/27.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
/*

 类
 A).类的声明实现
 @interface
 @end

 @implementation
 @end


 B).类的继承
 1.当B类继承A类, 那么B类就拥有A类所有的属性和方法(类方法\对象方法)

 2.方法重写
 1.如果 子类中 有和 父类中 同名的方法, 那么我们称之为方法重写
 2. 继承中的方法调用顺序, 如果直接邮 就调用自己的, 如果自己没有 就调用 父类的
 3.在子类重新的方法 中 可以 提供super 调用父类方法


 C).类的多态
 1. 父类指针 指向 子类对象
 2. 如果 父类指针 指向 子类对象, 如果需要调用子类特有的方法, 必须先强制类型 转换
 >1.在编译的时候 编译器只会检查 当前类型对应的类中 有没有需要调用的方法
 >2.在运行时, 系统会自动判断 对象的真实类型

 D).分类 (Catepory)

 成员变量
 1.分类不能添加属性(成员变量)
 2.分类中的@property,只会生成setter/getter方法的声明,不会生成实现以及私有的所有变量
 3.分类可以访问原来类中的成员变量（分类就是自己）

 方法
 1.只能新增方法
 2.如果分类中和原有类同名的方法,会调用 分类的方法
 3.如果多个分类中有同名的方法，会执行最后一个编译分类的方法

 E).类扩展(Extension)
 1.可以为某个类扩充一些私有的成员变量 和 方法
 2.类扩展没有名字


 */

/*

 1.成员变量的修饰
 @private 私有的:私有，只能在当前类的对象方法中直接访问。

 @protected 受保护的:可以在当前类以及子类的对象方法中直接访问

 @public 公共的:任何地方都可以直接访问

 @package 包:同一个“体系内”（框架）可以访问，介于@private和@public之间


 A).公开的成员变量的访问

 1.自己直接访问 修改  NSLog(@"car->speed = %d\n",speed);
 2.可以通过指针 P->speed 方式 访问 修改


 B).私有成员变量的封装
 1.可以通过 成员变量的封装（set get方法） 间接访问修改

 2.下划线成员变量,
 b1.让成员变量和get方法的名称区分开
 b2.可以跟局部变量区分开，一看到下划线开头的变量，一般都是成员变量
 3.利用点语法替换set方法和get方法
 c1.其实点语法的本质还是方法调用
 c2.当使用点语法时，编译器会自动展开成相应的方法
 4.@property可以同时生成setter和getter的声明和实现
 d1.setter和getter方法中的实现，会去访问下划线 _ 开头的成员变量(若没有就会自动生成)
 d2.如果同时 手动实现了 set get 的实现，则不会生成_ 开头的成员变量（so，若property了，则不同同时重写 set get 方法）
 d3.@property 生成的成员变量 属性




 */

/*
 方法
 1.OC中定义一个方法, 也分为声明和实现, 声明写在interface中, 实现写在@implmentation中
 2.要求.确定函数名称 2.确定形参 3.确定返回值 4.确定返回值类型
 3.OC中方法分,类方法和对象方法,类方法只能用类名调用, 对象方法只能用对象调用
 4.格式)  -/+ （返回值类型）方法名:(形参类型)形参名称 方法名:(形参类型)形参名称;

 函数和方法的区别
 1. 函数属于整个文件, 方法属于某一个类，方法如果离开类就不行
 2. 函数可以直接调用, 方法 必须用 对象 或者类来调用(虽然 函数 属于整个文件, 但是如果把函数 写在类的声明中 会不识别)
 3.方法可以只有声明没有实现, 编译不会报错,但是运行会报错
 */
/*方法在内存的实际表现
 1.每个类的方法列表 都存储在类对象中
 2.每个方法 都有一个与之 对应的SEL类型的对象
 3.根据一个SEL 就 可以找到方法的地址, 进而调用方法
 4.发消息就是发送一个 SEL 类型数据
 */
/*sel类型数据
 1.SEL 是一种 数据类型，typedef struct objc_selector *SEL;
 2.调用方法就是 将方法 包装成 一个 SEL 类型的数据，
 */

/*sel类型数据的运用
 */
void test1(){
    SEL sel = @selector(run);
    SEL sel2 = NSSelectorFromString(@"run");
    NSObject *obje = [NSObject new];
    [obje performSelector:sel2 withObject:nil];

}
