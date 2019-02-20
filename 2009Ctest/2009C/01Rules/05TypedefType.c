//
//  05TypedefType.c
//  2009C
//
//  Created by xs on 2019/1/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#include "05TypedefType.h"
/**
 基本数据类型的别名
 */
static void test1(){

}

/**
 结构体别名
 */
static void test2(){


}
/**
 数组别名
 */
static void test3(){

    //    基本类型数组
    //    结构体数组
    //    二维数组
    //    指针数组

}
}
/**
 指针别名
 */
static void test4(){
    //    基本类型指针


    //    结构体指针

    //    函数指针

    //    二级指针


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

