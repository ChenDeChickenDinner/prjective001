//
//  DataType.c
//  CGrammar
//
//  Created by xs on 2019/4/19.
//  Copyright © 2019 xs. All rights reserved.
//

#include "DataType.h"
#include <stdbool.h>
#pragma mark 常数
static void test1(){
    int value = 0b1;
    value = 07;
    value = 11;
    value = 0xf;
}

#pragma mark 整形
static void test2(){
    if (sizeof(int)) {
        int value = -10;
        
        short int value2 = 10;
        long int value3 = 100;
        long long int value4 = 1000;
        
        signed int valueS = 10;
        unsigned int valueUns = 10;
    }
    
    if (sizeof(bool)) {
        /* bool
         1.C++ 布尔型变量，真正的逻辑型变量
         2.占1个字节,取值范围:false(0)/true(1)
         3.赋值: 转换后0为false，非0为true
         3.结果真假判断:true 为 真，false为假;
         */
        bool value1  = true;
        /* _Bool
         0.C99之前无布尔类型
         1.C99标准定义了一个新的关键字_Bool(其实是一个宏定义)，提供了布尔类型
         2.占1个字节
         3.结果值：0为false，非0为true
         #define bool _Bool
         #define true 1
         #define false 0
         */
        _Bool value2 = false;
        
        /*
         1.赋值true、false之外的值的时候会进行转换
         2.转换后还是遵守 0为false，非0为true
         */
        value1 = -9;
        value2 = 9;
        if (value1 && value2) {
            printf("true");
        }else{
            printf("false");
        }
        
        
    }
    
    if (sizeof(char)) {
        _Bool value = true;
        if (value) {
            /*
             1.若是signed型[-128,127]；unsigned型[0,255]；
             2.默认是signed 还是 unsigned 由编译器决定
             */
            signed char value1 = '1';
            unsigned char value2 = '1';
        }
        
        if (value) {
            //char value1 = '';
            char value2 = ' '; //空字符
            char value3 = 'a'; //一般字符表示
        }
        if (value) {
            char value1 = '\n';
            
            char value2 = '\\';
            
            char value31 = '\0';
            char value32 = '\012';
            char value33 = '\x12';
            
        }
        
    }
    
    
    
}
#pragma mark 浮点
static void test3(){
    float value_float = 10.123456789f;
    double value_double = 10.123456789; // 默认是 double类型
}
#pragma mark 枚举
static void test4(){
    /**
     枚举
     1.枚举值是当做整形常量处理，称为枚举常量
     2.枚举元素的值取决于定义时各枚举元素排列的先后顺序,默认第一个为0，后面依次+1
     3.可以在定义的 时候 自定义 枚举常量的值
     4.定义类型，枚举值 以,号隔开,可以自定义常量值
     */
    enum book1{ //    1.只定义类型
        one = 0,
        two
    };
    enum book1 value1 = one;
    
    enum book2{ //    2.定义类型的同时定义变量
        one2 = 0,
        two2
    }value2 = one2;
    
    enum{  //    3.定义匿名枚举变量
        one3 = 0,
        two3
    }value3 = one3;
}
#pragma mark 结构体
static void test5(){
    struct person1{// 1.定义类型 ，成员变量 以;号隔开
        int age;char *name;double height;
    };
    struct person1 value1 = {10,"chen",50.5};
    
    struct person2{ //    定义类型的同时定义变量
        int age;char *name;double height;
    }value2;
    value2.age = 18;
    value2.name = "18";
    value2.height = 88.0;
    
    struct { //    匿名结构体变量，不能重复复用
        int age;char *name;double height;
    }value3;
    value3.age = 18;
    value3.name = "18";
    value3.height = 88.0;
    
    // .结构体变量之间 若是相同类型则可以互相赋值，且只做值传递
    struct person1 value4 = value1;
}
#pragma mark 数组
static void test6(){
    _Bool value = true;
    if (value) {
        //1.初始化
        int array_1[6]; // 未初始化的元素 是不确定的
        int array_2[] = {1,2,3,4}; // 元素个数由初始化的元素确定
        int array_3[4] = {1,2,3,4}; // 元素全部初始化
        int array_4[4] = {1,2,3}; // 元素部分初始化，未初始化的元素值 不确定
        int array_5[4] = {[1]=2,[2]=3};// 指定位置初始化
        //2.数组元素个数
        int array_bit = sizeof(array_2)/sizeof(int);
        //3.取元素值
        int value = array_2[1];
        //4.更变元素值
        array_2[1] = 5;
    }
    
    if (value) {
        /**
         字符数组_字符串
         1.C中没有专门的字符串类型，以字符数组代替
         2.字符数组 以\0 空字符为结束标志 代表一个字符串
         3.字符串可以被分配与 栈，堆 或者只读空间中
         */
        // 1.字符数组中 以 \0 空字符结尾
        char array_char1 [] = {'1','2','\0'};
        
        // 2.'\0' 的 ASCII 值 是 0,SO 下面也是字符串
        char array_char2 [] = {'1','2',0};
        
        // 3.双引号字符串常量区申请了存储空间2.在数组结尾加上了\03.返回了地址
        char array_char3[] = "it";
        char array_char32[2] = "it"; // 只是字符数组不是字符串
    }
    
}
