//
//  xiao3.m
//  C2019
//
//  Created by xs on 2019/1/16.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "xiao3.h"
static void test1();
static void test2();
static void test4();
@implementation xiao3
+ (void)load{
//    test4();
}
@end

/**
 结构体定义
 1.样式: struct 类型名{成员变量;成员变量;成员变量}变量名;
 类型名:可省略，省略后就成了 匿名 结构体
 {}:这才是结构体类型的精髓
 变量名:可在定义类型的同事定义一个变量
 */
static void test1(){

//    1.只定义类型
    struct person1{
        int a;
    };
    struct person1 value1 = {1};

//    2.定义类型的同时定义变量
    struct person2{
        int a;
    }value2;
    value2.a = 10;

//    3.定义匿名结构体变量
    struct {
        int a;
    }value3;
    value3.a = 20;
}

/**
 结构体初始化，赋值，取值
 */
static void test2(){
    struct book{
        int age;
        char *name;
    };

    struct book value = {22};
    value.age = 223;
    value.name = "123";
    printf("value.age = %d\n",value.age);

    struct book value2;
    value2 = value;
    value2.age = 11;
    value2.name = "456";
    printf("value2.age = %d\n",value2.age);
    printf("value.name = %s\n",value.name);

}

/**
 枚举的定义
 */
static void test3(){
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

/**
 枚举的操作
 */
static void test4(){
    enum book{
        chen,
        xiao
    };
    enum book value = chen;
    value = xiao;
    printf("value = %d\n",value);
}
