//
//  xiao1.m
//  C2019
//
//  Created by xs on 2019/1/15.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "xiao1.h"
static void test1();
static void test6();
@implementation xiao1
+ (void)load{
//    test6();
}
@end

/**
 算术运算符
 1.只进行同类型数据之间的运算
 2.非同类的 会自动 提升精度
 */
static void test1(){
    int a = 10;
    int b = 10;

//     1.除 与 取余，除数不能为0

//     2.自增自减

    int c = a++;
    printf("c = %d\n",c);

    int d = ++b;
    printf("d = %d\n",d);

}
/**
 位运算符
 1.只能对正数运算
 */
static void test4(){
    int a = 10;
    int b = 10;

//  按位与，同1为1，否则为0
    int value1 = a&b ;
//    按位或，有1为1，否则为0
    int value2 = a|b;

//    按位异或，不同为1，否则为0
    int value3 = a^b;

//    按位取反，不同为1，否则为0（一元运算符）
    int value4 = ~b;

//    按位左移，各二进制位左移若干位，高位丢弃，低位补0
    int value5 = a<<b;

//    按位右移，符号位不变，其余各二进制为右移若干位，右边丢弃 左边 补0/1看操作系统
    int value6 = a>>b;

}

/**
 赋值运算符
 1.只能同类型数值之间赋值
 2.不同类型数据赋值会进行隐式自动类型转换
 */
static void test5(){
    int a = 10;
    a +=1;  //a = a +1;
    a -= 1; //a = a- 1;
    a *= 1; //a = a * 1;
    a /= 1; //a = a / 1

    a &= 1; // a = a & 1;
    a |= 1; // a = a | 1;
    a ^= 1; // a = a ^ 1;
    //a ~= 1; // 无这个操作

    a <<= 1; // a = a << 1;
    a >>= 1; // a = a >> 1;
}
/**
 关系运算符
 */
static void test2(){
//> < == != >= < =
}
/**
 逻辑运算符
 */
static void test3(){
//&& || ! 与或非
}


/**
杂项运算符 ↦ sizeof & 三元
 */
static void test6(){
//  取地址 &a
//  指向成员变量 p->x
//  取指针值 *a
//  条件表达式 表达式？表达式:表达式

//    sizeof(<#expression-or-type#>)
/*
1.求操作对象所占内存大小（以位为单位）
2.返回值 是 typedef unsigned int size_t(无符号整形)
3.操作对象范围（数据类型，变量，表达式，函数）
 */
    size_t value1 = sizeof(int);
    printf("value1 = %zu\n",value1);

    double a = 10;
    int b = 10;

    size_t value2 = sizeof(a);
    printf("value2 = %zu\n",value2);

    // 取表达式最终结果值的类型，且不会对表达式运算
    size_t value3 = sizeof(a + b);
    printf("value3 = %zu\n",value3);

    // 取函数返回值类型的大小，并不会调用函数
    size_t value4 = sizeof(test1());
    printf("value4 = %zu\n",value4);

}
