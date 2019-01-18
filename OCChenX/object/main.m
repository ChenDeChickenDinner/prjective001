//
//  main.m
//  object
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
 A)类对象
 1.类也是个对象，且只有一份，在第一次被使用的时候 被创建
 2.里面包含（类大小,类名称,类的版本，继承层次，以及消息与函数的映射表等）

 B)类对象的类型
 1.类对象的类型 Class ，所有类对象的类型都是 Class （Class本身已经包含了*）
 2.获取类对象 类的 class 方法 以及 实例对象的 class 方法都可以获取类对象

 C)类对象空指针
 1.Nil
 */
void test44(){
    NSObject *obje = [NSObject new];
    Class obje_clsaa1 = [NSObject class];
    Class obje_clsaa2 = [obje class];
    obje_clsaa1  = Nil;
    obje_clsaa2  = Nil;
//Objective-C中nullable、__nullable、_Nullable、_Nonnull的用法
}
/*
 A)实例对象
 1.所有类的实例都由类对象生成
 2.每一个对象 都有一个名为isa的指针,指向该对象的类(类对象)
 3.给对象发消息，对象会顺着isa指针，从类对象中调用对应的方法

 B)实例对象的类型
 a.静态数据类型
 1.在编译时就知道变量的类型，以及其有哪些属性和方法.
 2.如果通过静态数据类型 定义变量, 如果访问了 不属于静态数据类型的属性 和 方法 , 编译就会报错
 3.默认情况下 所有的数据类型 都是静态数据类型,NSObject * 是一个静态数据类型

 b.动态数据类型
 1. 在编译的时候 编译器并不知道 变量的真实类型 , 只有在运行的时候 才知道它的真实类型
 2. 如果通过动态数据类型 定义变量, 如果访问了 不属于动态数据类型的属性 和 方法 , 编译不会报错，运行会出错
 id objc = [NSObject new];
 [objc test]; (可以调用任何方法，即使没有这个方法也可以编译通过)
 例如: 父类 A 子类 B,C 若用父类指针指向的子类B对象，调用了子类 C并未实现的一个父类方法，则编译不会报错，运行会出错
 解决: 在调用方法之前，先做一层 方法判断 看其真是类型是否实现了这个方法

 C)实例对象的万能指针
 A.id
 1.id == 万能指针，可以指向任何类型的实例对象
 2.id 是动态数据类型 在编译阶段不能进行类型检测

 B.instancetype
 1.instancetype == id == 万能指针 == 指向一个对象
 2.instancetype 在编译的时候 可以判断对象的真实类型
 3.instancetype 只能用于作为返回值
 4.但凡自定义构造方法, 返回值尽量使用instancetype,不要使用id(id不能判断对象的真实类型)
 D)实例对象的空指针
 1.nil
 */


/*对象关键字

 self
 1.如果self在 对象方法中, 那么self就是 代表 调用当前对象方法 的 那个对象
 2.如果self在 类方法中, 那么 self 就 代表 调用当前类方法 的那个类
 >  self会自定区分 类方法 和 对象方法, 如果在类方法中 使用self调用对象方法, 那么会直接报错
 >  不能在 对象方法 或者 类方法中利用 self 调用当前的self 所在的方法(查看#warning 死循环)

 super
 1.super在类方法中(父类类对象), 一定会调用父类的类方法
 2.super在对象方法中(父类对象), 一定会调用父类的对象方法
 3.可以利用super 在任意方法中 调用父类中的方法
 */
