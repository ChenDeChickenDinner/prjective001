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

//声明一个工程内全局共享变量，给予实现,会为其申请内存,但未初始化，默认是0
int valueX;

//声明一个工程内全局共享变量，给予实现,会为其申请内存,并且初始化
int valueX = 10;

//声明一个工程内全局共享变量，但不给予实现,也就是不会为其申请内存
extern int valueX;
/*
 1.如果 这个全局变量 没有初始化则 语法生能编译通过 但实际运行 结果不明确 有风险
 2.如果 这个全局变量 已经初始化则 则编译报错
 extern int valueX = 0;
 */


static void test1(){
    /*
     1.函数退出 自动变量销毁，每次执行都会申请新的内存
     2.未经初始化的局部变量不建议使用
     */
    auto int value1 = 0;
    printf("value1 = %d\n",value1);
    
    printf("valueX = %d\n",valueX);

    printf("%s",__func__);

}
#pragma mark 函数的作用域
static void test2(){
    
}
void ScopeTest(){
    test1();


}
