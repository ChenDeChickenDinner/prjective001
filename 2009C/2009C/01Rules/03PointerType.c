//
//  03PointerType.c
//  2009C
//
//  Created by xs on 2019/1/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#include "03PointerType.h"
/**
指针的定义
1.作用:保存指定类型变量的地址，提供地址直接操作该对象
2.格式: 类型 *变量名;
3.内存:任何类型的指针 都占 8个字节
*/
/**
 野指针
 1.什么是野指针:未经初始化的指针都是野指针
 2.野指针的产生:
 a.未经初始化的局部变量
 b.所指向的变量，提前被释放了
 c.已经被释放的指针
 3.操作野指针:操作野指针可能造成崩溃
 */


/**
 空指针
 1.空指针常量
 1.1:一个表示0值的整数常量，叫做空指针常量【 0、0L 、3 - 3以及 (void)0, 等都是空指针常量】
 1.2.至于系统选取哪种形式作为空指针常量使用，则是实现相关的【一般的 C 系统选择 (void*)0 或者 0 的居多（也有个别的选择 0L）】

 2.空指针
 2.1:如果一个 空指针常量 赋给了一个有类型的指针变量，那么这个指针就叫空指针。
 2.2:空指针不指向任何对象 与函数，其值 = 0;

 3.NUll
 C中对NULL的预定义有两个：
 　　#define NULL 0  ---->就是数值0
 　　#define NULL ((void *)0)---->指向0的指针
 1.NULL和0的值都是一样的，但是为了目的和用途及容易识别的原因，NULL用于指针和对象，0用于数值
 2.当常量0处于应该作为指针使用的上下文中时，它就作为空指针使用；在指针上下文中“值为0的整型常量表达式”在编译时转换为空指针 int * p = 0;
 */
static void test(){
    //a.对指针变量的操作
    int value = 10;
    //1.定义指针变量
    int *p; // 野指针
    //2.指针变量赋值
    p = NULL; //空指针
    p = &value; // 指向一个地址
    int *p2 = p; // 指向另一个指针指向的地址

    //3.指针变量的地址,二级指针
    int **pp = &p;

    //b.对其所指向值的操作
    *p = 20;
    int value2 = *p;
    printf("value2 = %d\n",value2);
}



/**
 指针的运算  int *p; 前提:可变的指针变量才能运算
 p+1:得到一个新地址，向高地址移动一个数据单位
 -::得到一个新地址，向低地址移动一个数据单位
 p++:指针变量p 重新指向 一个 向高地址移动l一个数据单位地址
 p--:指针变量p 重新指向 一个 向低地址移动l一个数据单位地址
 */
static void test3(){
    int array [3] = {1,2,3};
    int *p = array;
    printf("*p = %d\n",*p);// *p = 1
    int *p2 = p + 1;
    printf("*p2 = %d\n",*p2);// *p2 = 2
    p++;
    p++;
    printf("*p = %d\n",*p);// *p = 3

}

/**
 指针的逻辑运算
 1.指针一般不能与基本数据类型的变量之间进行逻辑运算，但可以与0 做 =、！=的运算 判断指针是否为空
 2.不同类型的指针之间不能进行逻辑运算，只有相同类型的指针变量才可以做比较
 3.运算依据:指向地址大的指针 > 指向地址小的指针
 */
static void test4(){
    int value1 = 10;
    int value2 = 10;
    int *p1 = &value1;
    int *p2 = &value2;
    int *p3 = &value1;

    if (p1 > p2) {
        printf("value1 比 value2 先分配内存\n");//value1 比 value2 先分配内存
    }
    if (p1 == p3) {
        printf("指针相等\n");// 指针相等
    }
}
/** void * 无类型的指针
 1.可以接受任何类型的指针变量
 2.在使用前 可以转换长 确定类型的指针
 3.void * 类型的指针不可对其算术运算
 */
static void test40(){
    int value1 = 10;
    double value2 = 10.0;

    void *p1 = &value1;
    void *p2 = &value2;
}

/**
 字符指针_字符串
 1.把字符数组的首元素字符的地址 赋值给 char * 指针变量p
 2.此字符数组存放于常量区 不可修改，支持修改 字符指针 p的指向
 */
static void test41(){
    char *p = "it";
    p = "chen";
    *p = 'A'; // 运行报错 不能修改操作
}


/**
 结构体指针 (指向结构体的指针)
 */
static void test24(){
    struct group {
        int age;
        char *name;
        double height;
    };

    struct group strurtArray = {18,"chen",22.0};

    struct group *p = &strurtArray;
    (*p).age = 15;
    printf("strurtArray.age = %d\n",strurtArray.age);
    p->age = 16;
    printf("strurtArray.age = %d\n",strurtArray.age);

}


/**
 数组指针 (指向整个数组的指针)
 */
static void test32(){
    int array[3] = {1,2,3};
    int array2[3] = {1,2,3};


    // array :为数组首元素 可被 int *类型的指针 保存
    int *p2 = array;
    *p2 = 9;

    // &array :为数组地址 可被int (*)[3] 类型的指针 保存
    int (*p)[3] = &array;
    (*p)[2] = 6;
    printf("array[2] = %d\n",array[2]);

    // 数组指针 的自增自减 跨越的是 整个数组的长度
    p++; // 数组指针+1 后 重新指向高地址的 同类型 数组 array2
    (*p)[0] = 12;
    printf("array2[0] = %d\n",array2[0]); // array2[0] = 12

}

/**
 函数指针 (指向函数的指针)  函数指针的作用？？？？c++ 类的封装
 1.函数作为一段程序，在内存中也要占据部分存储空间，它也有一个起始地址
 2.可以利用一个指针指向一个函数。其中，函数名就代表着函数的地址。
 */
static void test33(){
    //   1.声明一个函数指针 p1 先与 *结合，p1是个指针，再与()结合 ，指向函数
    void (*p1)(void);

    //    2.函数指针赋值
    p1 = &test32;
    p1 = test32;

    //    3.通过函数指针调用函数
    (*p1)();
    p1();
}
/**
 二级指针
 */
static void test6(){
    int value = 10;
    int *p = &value;
    int **pp = &p;
    **pp = 100;
    printf("value = %d\n",**pp);
}

