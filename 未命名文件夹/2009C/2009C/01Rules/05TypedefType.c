//
//  05TypedefType.c
//  2009C
//
//  Created by xs on 2019/1/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#include "05TypedefType.h"
/**
 基本数据类型
 1.变量直接与左侧 数据类型结合
 2.当做形参:是值传递
 3.当做返回值:是值传递
 */
int value1;
float value2;
double value3;
char value4;
enum man{man,woman}value5;
static void test1(){

}

/**
 结构体
 */
struct person {int age;char *name;};
static void test2(){

    //    1.变量直接与左侧 数据类型结合
    struct person value1;
    //    2.结构体别名
    typedef struct person myType_struct;
    myType_struct value2;

    //    3.作为形参:
    //    4.作为返回值:

}
/**
 数组
 */
static void test3(){

    //    基本类型数组
    int array1[3];
    enum man array2[3];

    //    结构体数组
    struct person array3[3];

    //    二维数组
    int array4[1][2];
}
/**
 函数
 */
static void test5(){
    void func(void);
}
/**
 指针
 */
static void test4(){
    //    基本类型指针
    int      *p1;
    enum man *p2;

    //    结构体指针
    struct person *p3;

    //    函数指针
    void (*p4)(void);

    //    二级指针
    int*  *p5;



}

/**
 数组，指针，函数
 */
static void test6(){
    //    装指针的数组
    int*             array51[3];
    enum man*        array52[3];
    struct person *  array53[3];
    void           (*array54[3])(void);

    //   B.指向数组的指针
    // 1.数组里面装 基本类型数据
    int           (*p61)[3];
    enum man      (*p71)[3];
    // 2.数组里面装 结构体数据
    struct person (*p81)[3];
    // 3.数组里面装数组(int)
    int           (*p91)[1][2];


    // 数组里面装指针
    int*           (*p62)[3];  // int* 型指针
    enum man*      (*p72)[3];  // enum man* 型指针
    struct person* (*p82)[3];  // struct person* 型指针
    void          (*(*p92)[3])(void); // void(*func)(void)型指针
}

/**
 各种数据类型作为 函数的 参数 返回值
 */
static void test61(){

}
