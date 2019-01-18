//
//  xiao5.m
//  C2019
//
//  Created by xs on 2019/1/16.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "xiao5.h"
static void test1();
static void test7();
@implementation xiao5
+ (void)load{
//test7();
}
@end

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
 1.空指针常量:一个表示0值的整形常量，具体实现有系统定义
 2.什么空指针:当一个空指针常量被赋值给一个指针，那这个指针就是空指针
 3.空指针关键字:NULL = 【0 (数值0)】或者 【(void *) 0（指向0的指针）】，当数值0 处于指针上下文时，会被转换为空指针
 3.操做空指针:操作空指针不会引起 崩溃
 */


/**
 指针的基本操作
 */
static void test0(){
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
  指针的运算
 前提:可变的指针变量才能运算
 a.指针的加减运算:得一个新地址(跨度单位看指针的类型)
 b.指针的自增自减运算:指向一个新地址(跨度单位看指针的类型)
 */
static void test2(){
    int array[5] = {1,2,3,4,5};
    int *p1 = &array[0];
    printf("*p1  = %d\n",*p1); // *p1  = 1

    int *p2 = p1 + 1;
    printf("*p2  = %d\n",*p2); // *p2  = 2
    p1 ++;
    p1 ++;
    printf("*p1  = %d\n",*p1);// *p1  = 3
}

/**
 指针的逻辑运算
 1.可跟数值0 做判空 判断
 2.同类型的指针 可比大小 是否相等【比较的是各自保存的地址】
 */
static void test3(){
    int value = 10;
    int *p1 = &value;
    int *p2 = &value;

    if (p1 == 0) {
        printf("p1 == 0\n");
    }else if (p1 != 0 ){
        printf("p1 != 0\n");
    }
    if (p1 == p2) {
        printf("p1 == p2\n");
    }
}
/**
 void 类型指针
 1.可以接受任何类型的指针变量，再转换成对应的类型指针
 2.不可进行运算操作
 */
static void test1(){
    int value = 10;
    int *p = &value;
    void *p2 = p;

    int *p3 = (int *)p2;
    *p3 = 20;

    printf("value = %d\n",value);
}
/**
 基本数据类型指针
 */
static void test4(){
    int value = 10;
    int *p = &value;

    float value_float = 10.f;
    float *p2  = &value_float;

    double value_double = 20.0;
    double *p3 = &value_double;
}

/**
 字符指针
 */
static void test5(){
    // 1.单纯的字符指针，其指向的字符是可以修改的
    char value1 = '1';
    char *p = &value1;
    *p = '2';
    printf("value1 = %c\n",value1);

    // 2.指向字符串 首字符的字符指针，其指向的字符是不可以修改的,指针的指向是可以修改的
    char *p2 = "12";
//    *p2 = '1';
    p = "123";

}

/**
 结构体 枚举指针
 */
static void test6(){

    struct person{
        int age;
        char *name;
    };

    struct person value = {18,"chen"};
    printf("value.p = %p\n",&value);
    struct person *p = &value;
    (*p).age = 19;
    p->name = "xiao";

    printf("value.age = %d,value.name = %s\n",value.age,value.name);


    enum man{
        woman,
        man
    };
    enum man value2 = man;
    enum man *p2 = &value2;
    *p2 = woman;
    printf("value2 = %d\n",value2);
}

/**
 数组指针(指向数组的指针)
 */
static void test77(){
    int array[3] = {1,2,3};


    // array :为数组首元素 可被 int *类型的指针 保存
    int *p2 = array;
    *p2 = 9;

    // &array :为数组地址 可被int (*)[3] 类型的指针 保存
    int (*p)[3] = &array;
    (*p)[2] = 6;
    printf("array[2] = %d\n",array[2]);
}

/**
 函数指针
 1.函数也存在地址，函数名即地址
 2.函数指针 格式 返回值类型 (*指针变量名)(形参类型,形参类型,形参类型)
 3.当 无返回值，无形参时候 void 不能少
 */
static void test998(){}
static void test8(){

//   1.声明一个函数指针
    void (*p1)(void);

//    2.函数指针赋值
    p1 = &test998;
    p1 = test998;

//    3.通过函数指针调用函数
    (*p1)();
    p1();
}


