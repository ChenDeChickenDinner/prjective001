//
//  01ValueType.c
//  2009C
//
//  Created by xs on 2019/1/21.
//  Copyright © 2019 Touker. All rights reserved.
//

#include "01ValueType.h"

#include <stdbool.h>
static void test1(void);
static void runFunc(){
    test1();
}
/**
 各种进制的数
 */
static void test0(){
    int value1 = 10;
    int value2 = 0b1;
    int value3 = 01;
    int value4 = 0x1;
}

/**
 布尔
 1.逻辑型变量的定义符
 2.占 一个 字节
 3.取值  true / false
 */
static void test1(){
    /* bool
     1.C++ 布尔型变量，真正的逻辑型变量
     2.占1个字节,取值范围:false(0)/true(1)
     3.赋值: 转换后0为false，非0为true
     3.结果真假判断:true 为 真，false为假;
     */

    bool value1  = -9;
    size_t bit1 = sizeof(value1);
    printf("bit1= %lu\n",bit1);

    /* _Bool
     0.C99之前无布尔类型
     1.C99标准定义了一个新的关键字_Bool(其实是一个宏定义)，提供了布尔类型
     2.占1个字节
     3.结果值：0为false，非0为true
     #define bool _Bool
     #define true 1
     #define false 0
     */
    _Bool value2 = -9;
    size_t bit2 = sizeof(value2);
    printf("bit2= %lu\n",bit2);

}
/**
 整形
 */
static void test2(){
    signed int value1 = -10;
    unsigned int value2 = 10;

    short int value3 = 10;
    long int value4 = 10;
    long long int value5 = 10;
}


/**
 字符型
 1.存储范围:
 a.字节，符号位，存储: 占8个字节，分为有符号性（signed）和无符号型（unsigned）两种，以整数的形式存储
 b.范围：若是signed型[-128,127]；unsigned型[0,255]；
 c.编译器层:C语言中我们通常直接用类型char，但是它究竟是被当做signed型还是unsigned型，由编译器决定。
 d.运用层:C语言允许我们在char前面加上关键字signed或者unsigned，这样，无论在编译器中被当做signed还是unsigned，都会按照前面加的这个关键字来决定
 2.一般用于: 通常指用来存储ASCII中的字符
 3.表示规则:
 a.一般字符:
 char value_char1 = 'a';
 b.转义字符:
 a:一般转义字符
 1.控制非显示字符: \n 换行
 2.二义性字符: \' ; \" ; \? ; \\
 b:进制转义字符
 0.空字符 :\0 = 0 ,ASCII中 0 代表 空字符
 1.八进制转义字符:它是由反斜杠'\'和随后的1～3个八进制数字构成的字符序列，表示八进制的0可以省略
 2.十六进制转义字符:是由反斜杠'\'和字母x(或X)及随后的1～2个十六进制数字构成的字符序列
 */
static void test3(){

    char value_char1 = 'a';
    char value_char2 = ' ';

    char value_char4 = '\'';// '是 字符的表示符号，表示的时候必须转义，不然会造成语法歧义
    char value_char5 = '\\';
    char value_char61 = '\"';
    char value_char62 = '"';// "是 字符串的表示符号，但在此处不会造成语法歧义，故无报错
    char value_char71 = '\?';
    char value_char72 = '?';

    char value_char3 = '\0'; // 空字符
    char char_82 = '\012';//八进制
    char char_81 = '\12'; //八进制

    char char_16 = '\x12';//十六进制
}

/**
 浮点型
 1. 单精度浮点数有效数字7位，6 位小数
 2.双精度浮点数有效数字16位，15 位小数
 */
static void test4(){
    float value_float = 10.123456789f;
    double value_double = 10.123456789; // 默认是 double类型
}

/**
 枚举
 1.枚举值是当做整形常量处理，称为枚举常量
 2.枚举元素的值取决于定义时各枚举元素排列的先后顺序,默认第一个为0，后面依次+1
 3.可以在定义的 时候 自定义 枚举常量的值
 4.定义类型，枚举值 以,号隔开,可以自定义常量值
 */
static void test5(){
    //    1.只定义类型
    enum book1{
        chen1 = 0,
        xiao1,
        wei1
    };
    enum book1 value1 = chen1;

    //    2.定义类型的同时定义变量
    enum book2{
        chen2 = 0,
        xiao2,
        wei2
    }value2;
    value2 = chen2;
    //    3.定义匿名枚举变量
    enum {
        chen3,
        xiao3,
        wei3
    }value3;

    value3 = chen3;
}

