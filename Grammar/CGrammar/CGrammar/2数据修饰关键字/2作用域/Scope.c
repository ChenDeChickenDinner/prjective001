//
//  Scope.c
//  CGrammar
//
//  Created by xs on 2019/4/19.
//  Copyright © 2019 xs. All rights reserved.
//

#include "Scope.h"
#include <stdbool.h>
#pragma mark 变量的作用域

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


 void test1111(){
    /*
     1.函数退出 自动变量销毁，每次执行都会申请新的内存
     2.编译器不会对布局变量做初始化操作
     */
    auto int value1 = 0;
    printf("value1 = %d\n",value1);
    
    printf("valueX = %d\n",valueX);

    printf("%s",__func__);

}
#pragma mark 函数的作用域
// 声明一个全局函数，声明的时候必须适应 函数原型 声明
extern void test2222(void);
// 定义一个全局函数，函数默认都是全局属性的
// 不允许有同名的全局函数
 void test2222(){
    
}


