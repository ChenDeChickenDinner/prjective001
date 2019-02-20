//
//  07Operator.c
//  2009C
//
//  Created by xs on 2019/1/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#include "07Operator.h"
static void test1(){
    /*  算术运算符 + - * / %  ++ -- (加 减 乘 除 取余 自增 自减)
     1.计算机是以二进制存储数据的，以数据的补码存储，原码作为输出的；
     2.计算机只进行相同类型数据的计算；
     3.若数据类型不相同，计算机内部将进行一个隐式转换：由低精度转换为高精度的数据，即char--》int--》float--》--》double
     */

    // 一元运算符 代数符号
    int value1 = +1;
    int value2 = -1;
    int value3 = 3;

    // 二元符号
    value1 + value2;
    value1 - value2;
    value1 * value2;
    value1 / value3;//被除数 % 除数  = 商 / 余数


    // 1. 参与运算的两个操作数必须都是整数, 不能包含浮点数
    //     int value =  3.0 % 2.0; 编译报错

    // 2.被除数小于除数, 那么结果就是被除数
    int value_1 = 2 % 3;
    printf("value_1 = %d\n",value_1); //value_1 = 2

    // 3.运算结果的正负性取决于被除数,跟除数无关, 被除数是正数结果就是正数,被除数是负数结果就是负数
    int value_2 = -2 % 3;
    printf("value_2 = %d\n",value_2); //value_2 = -2

    // 4.被除数为0, 结果为0
    int value_3 = 0 % 3;
    printf("value_3 = %d\n",value_3); //value_3 = 0

    // 4.除数为0, 没有意义(不要这样写) 编译警告 剩余的零是未定义的
    int value_4 = 2 % 0;
    printf("value_4 = %d\n",value_4); //value_4 = 0

    //自增自减
    int i = 1;
    int i2 = i++; // i先参与赋值，再自身+1

    int y = 1;
    int y2 = ++y;// i先自身+1，再参与赋值
}



static void test2(){
    /*
     赋值运算符
     1.普通的赋值运算符
     int a = 22;
     2.复合运算符
     2./= 除后赋值  如：a/=3;即a=a/3
     3.*= 乘后赋值  如：a*=3;即a=a*3
     4.%= 取模后赋值 如：a%=3;即a=a%3
     5.+= 加后赋值  如：a+=3;即a=a+3
     6.-= 减后赋值  如：a-=3;即a=a-3
     3.类型转换
     1).隐式转换：也叫自动转换，就是编译器自动帮你判断应该转换成什么类型
     int num = 3.333333;
     2).显示转换：就是由程序员告诉编译器应该转换成什么类型
     int num = (int)3.33333;
     */

}
static void test3(){
    /*  关系运算符(运算符的值只能是0或1)
     1.有哪些
     < 小于
     > 大于
     <= 小于等于
     >= 大于等于
     == 等于
     != 不等于
     2.每个底层都是怎么做比对的，怎么比对大小 的 怎么对比相等的
     */
}
static void test4(){
    /* 逻辑运算符(运算符的值只能是0或1)
     && 与
     || 或
     ！ 非
     */
}
static void test5(){
    /* 条件运算符
     1.三目运算符  条件？语句1:语句2(功能分析：如果条件成立，就执行语句1，否则执行语句2。)
     */
    /* 逗号运算符
     1.表达式,表达式,…
     2.是C语言运算符中优先级最低的一种运算符
     3.结合顺序是从左至右，用来顺序求值，每一个表达式都会执行
     4.最后一个逗号后面表达式的值作为整个表达式的值
     */
}
static void printf_int_bit(int number){
    int temp = (sizeof(number)<<3) -1;
    while (temp>=0) {
        int value = number>>temp & 1;
        printf("%d",value);
        temp--;
        if ((temp+1)%4==0) {
            printf(" ");
        }
    }
    printf("\n");
}

static void test6(){
    /*位操作符
     1.位运算就是直接对整数在内存中的二进制位进行操作
     2.C语言提供了6个位操作运算符, 这些运算符只能用于整型操作数
     &    按位与    同1为1,否则为0
     |    按位或    有1为1,否则为0
     ^    按位异或    不同为1,否则为0
     ~    按位取反    0变1,1变0, 包括符号位
     <<    按位左移   各二进位全部左移若干位,高位丢弃，低位补0 (结果值可能会改变正负性)(=乘以2的n次方)
     >>    按位右移   符号位不变，全部右移,右边丢弃，最高位(为正数时补0，为负数时补0或是补1取决于编译系统的规定) (=除以2的n次方)
     */

    printf_int_bit(0); //0000 0000 0000 0000 0000 0000 0000 0000
    printf_int_bit(1); //0000 0000 0000 0000 0000 0000 0000 0001

}


struct person{
    int age;
};
static void sizeof_explain(){
    /*sizeof
     1.【本质】属于C 中的关键字,它是一个操作符
     2.【作用】其作用是取得操作对象占用内存的大小，以 byte 为单位
     3.【返回值】其返回值类型为size_t，这是一个依赖于编译系统的值，一般定义为 typedef unsigned int size_t(无符号整形);
     4.【操作对象】数据类型、变量对象、表达式、函数、当做常量
     */


    /*1.操作数据类型
     1.可以对基本数据类型，自定义的构造类型，指针 做运算
     2.不能对 void 做运算
     */
    int i1 = sizeof(double);
    int i2 = sizeof(int *);
    int i3 = sizeof(double *);
    int i4 = sizeof(struct person);
    printf("i1 = %d\n",i1);
    printf("i2 = %d\n",i2);
    printf("i3 = %d\n",i3);
    printf("i4 = %d\n",i4);

    /*2.操作变量
     1.同种类型的不同对象其sizeof值都是一致的 int/ double
     2.能求得静态分配内存的数组的长度，且是所有元素所占字节的总和，
     3.对指针变量取值永远是固定的，也可以对 void 类型指针取值
     */
    int s = 10;
    double s2 = 10.0;
    int array1[3] = {1,2,3};
    int array2[4] = {1,2,3,4};
    int *p = &s;

    /*3.操作表达式
     1.可以对一个表达式求值，编译器根据表达式的最终结果类型来确定大小
     2.但是它不对表达式求值
     */
    char ch = 1;
    int num=1;
    unsigned int y1 = sizeof(ch+num);//等价于sizeof(int);
    unsigned int y2 = sizeof(ch =ch+num);;//于sizeof(char);

    /*4.操作函数
     1.sizeof也可以对一个函数调用求值，其结果是函数返回类型的大小，函数并不会被调用
     2.C99标准规定，函数、不能确定类型的表达式以及位域（bit-field）成员不能被计算sizeof值
     */
    //调用 确定返回值类型的函数
    //    unsigned int function1 = sizeof(main());

    /*5.sizeof的常量性
     1.sizeof的计算发生在编译时刻，所以它可以被当作常量表达式使用
     2.最新的C99标准规定sizeof也可以在运行时刻进行计算,但在没有完全实现C99标准的编译器中就行不通了
     */
    int g = sizeof(int) + 6;
    printf("g  = %d\n",g);
}
