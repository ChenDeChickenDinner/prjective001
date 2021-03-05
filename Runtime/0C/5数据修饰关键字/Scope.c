//
//  Scope.c
//  CGrammar
//
//  Created by xs on 2019/4/19.
//  Copyright © 2019 xs. All rights reserved.
//


#include "Scope.h"
#include <stdbool.h>



#pragma mark 1.auto 局部自动变量)
void test1111(){
   /*
    1.函数退出 自动变量销毁，每次执行都会申请新的内存
    2.编译器不会对布局变量做初始化操作
    */
   auto int value1 = 0;
}

#pragma mark 2.extern 全局变量)

//定义一个工程内全局共享变量，给予实现,会为其申请内存,但未初始化，默认编译器会对布局变量做初始化操作 默认为0；
int valueX;

//定义一个工程内全局共享变量，给予实现,会为其申请内存,并且手动指定初始化值
int valueX = 10;

//声明一个工程内全局共享变量，但不给予实现,也就是不会为其申请内存
extern int valueX;
/*
 1.如果 这个全局变量 没有初始化则 语法生能编译通过 但实际运行 结果不明确 有风险
 2.如果 这个全局变量 已经初始化则 则编译报错
 extern int valueX = 0;
 */


#pragma mark 3.静态变量)
/*static 修饰局部变量
 1.布局变量会被初始化
 2.生命周期会被延长到程序结束
 3.其本质还是局部变量，不同作用域内运行有同名静态局部变量
 */
static void test1(){
    static int value;
    printf("value = %d\n",value);
}

/*static 修饰全局变量
 1.只会限制变量的作用域为本文件
 */
static int valueX2;


#pragma mark 
/*const 修饰变量(局部变量 全局变量 函数参数)
 1.现在变量不允许被修改
 2.一般在定义的时候就初始化 不然失去了意义
 */
/** const https://www.cnblogs.com/icemoon1987/p/3320326.html
 1.const 修饰基本数据类型 整形 浮点 枚举 ，其变量值不可修改
 2.const 修饰结构体变量，其本身 与成员变量 都不可被修改
 3.const 修饰数组， 数组元素不可被修改
 4.const 修饰 *p ，则 *p的值不可被修改，指针变量p可修改
 5.const 修饰 p ，则 指针变量p不可修改，*p的值可被修改，
 6.const 修饰函数参数，表示对于函数来说，不会在意传入的参数外面是否是只读的，它只会在函数内部，将入参当作只读变量处理
 */


/** const和extern的结合使用
 1.声明一个只读的全部变量（全局常量）
 */
extern const int  value_chen; // 声明一个只读的全局变量
const int  value_chen = 10; // 定义一个只读的全局变量，并初始化

/** const和static的结合使用
 1.声明一个只读的 内部全局变量,一般需要在定义的时候初始化 不然无意义了
 */
static const char *str1 = "chen";
static char * const str2 = "chen";
static const char * const str3 = "chen";






#pragma mark 4.函数的作用域
//0.函数的声明
extern void test2222(void);
static void test2(void);

//1. 定义一个全局函数，函数默认都是全局属性的,不允许有同名的全局函数
void test2222(){
    
}

//2.static 静态函数 只会限制函数的作用域为本文件
static void test2(){
    
}









