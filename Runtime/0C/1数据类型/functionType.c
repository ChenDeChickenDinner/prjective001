//
//  functionType.c
//  CGrammar
//
//  Created by xs on 2019/4/19.
//  Copyright © 2019 xs. All rights reserved.
//

#include "functionType.h"
/*
a.函数也是一种数据类型
    1.函数名 function():function之后跟一个() 表面  function 是一个函数

 
b.函数类型
    1.函数的返回值类型 就是函数的类型
    2.若没有声明函数的返回值 则默认是 int类型

c.函数声明
 1.在ANSI C标准之前:
     a.声明函数，只需要声明函数的类型即返回值类型[void function()]
     b.因为只要求声明了函数类型，即在调用过程中编译器不会对个数以及类型做检测，校验
     c.导致因处理机制不同会出现各种不同的问题
 
 2.在ANSI C标准之后:
 a.声明函数,不仅需要函数类型 还需要函数参数的类个数以及类型
 b.函数原型,包含 函数类型，参数个数 以及类型
 c.So即使无参数，也得表明[void function(void)]
 
3.在支持 ANSI C的编译器下 void function()
a. void function() 会做出警告
b.void function(void) 严谨的写法
c.最终的处理结果是编译器会当做无参处理
 
4.使用部分原型
 a. printf(const char *restrict, ...)
 */
void function(void){
    printf("123");
}
