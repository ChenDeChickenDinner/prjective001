//
//  main.m
//  指针
//
//  Created by xs on 2018/11/9.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
1.作用）指针变量能保存 对应类型 变量的 内存地址，提供该地址可以操作此变量
2.定义) 类型 *指针变量名  int *p;
3.内存）任何类型的指针变量 都占 8个字节
 */
void test(){
 /**定义指针变量
a.野指针
  1.未经初始化的指针变量都是野指针
  2.操作野指针是一件危险的事情，可能造成系统崩溃
  3.不同通过野指针来判此指针变量是否未空
b.空指针
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

    int *p;// 野指针

    int *p2 = NULL; // 空指针
}

/**
操作指针变量
 */
void test2(){
    int value = 10;

    int *p;
    printf("bit_P = %lu\n",sizeof(p)); //bit_P = 8

    p = &value; // & 取地址 操作符
    *p = 20; // 通过指针操作其指向的变量
    printf("*p = %d,value = %d\n",*p,value);//*p = 20,value = 20
}

/**
 二级指针
 */
void test6(){
    int value = 10;
    int *p = &value;
    int **pp = &p;
    **pp = 100;
    printf("value = %d\n",**pp);
}
/**
 指针的运算  int *p;
p+1:得到一个新地址，向高地址移动一个数据单位
-::得到一个新地址，向低地址移动一个数据单位
p++:指针变量p 重新指向 一个 向高地址移动l一个数据单位地址
p--:指针变量p 重新指向 一个 向低地址移动l一个数据单位地址
 */
void test3(){
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
void test4(){
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
/** void
 A:void 无类型,
1.不可定义无类型的变量
2.只作用于2处，函数返回值(无返回值，不写默认返回int类型) ，参数参数(无参数，可以不写)
B:void * 无类型的指针
1.可以接受任何类型的指针变量
2.在使用前 可以转换长 确定类型的指针
3.void * 类型的指针不可对其算术运算
 */
void test40(){
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
void test41(){
    char *p = "it";
    p = "chen";
    *p = 'A'; // 运行报错 不能修改操作
}
/**
 数组名指针
 */
void test0(){
    /*数组名的意义
     1.int a[]; a 代表数组首元素的地址,此地址 存储的是 int 类型的数据，因此可以把他 赋值给一个 （int *)类型的指针
     2.通过这个指向首元素的指针 可以操作其它元素
     */
    int value [] = {1,2,3};
    int *p = value; // p  指向首元素
    *p = 4; // 修改第一个元素的值
    *(p+1) = 5;
    printf("*p = %d,value[0] = %d\n",*p,value[0]); // *p = 4,value[0] = 4
    printf("value[1] = %d\n",value[1]); // value[1] = 5
}

/**
结构体指针 (指向结构体的指针)
 */
void test24(){
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
void test32(){
    int array3[4] = {1,2,3,4};
    int array2[3] = {4,5,6};
    int array1[3] = {1,2,3};

    int (*p)[3] = &array1;

    //通过数组指针操作 元素 (*p) = 数组
    (*p)[0] = 7;
    printf("array1[0] = %d\n",array1[0]); //array1[0] = 7

    // 数组指针 的自增自减 跨越的是 整个数组的长度
    p++; // 数组指针+1 后 重新指向高地址的 同类型 数组 array2
    (*p)[0] = 12;
    printf("array2[0] = %d\n",array2[0]); // array2[0] = 12

}
void testChen(){

    printf("testChen\n");
}
int testXiao(int a,double b){
    printf("testXiao\n");
    return 0;
}
/**
 函数指针 (指向函数的指针)
 */
void test33(){
/* 函数类型:  返回值类型 (*p)(形参类型,形参类型)
 1.返回值类型:函数的 返回值类型
 2.(*p):函数指针的固定写法 p为指针变量
 3.(形参类型,形参类型):函数的形参列表
 4.函数名 即等于 函数地址
 */

    //1.定义函数变量
    void (*p1)(void) = testChen;

    int (*p2)(int,double) = testXiao;
    //2.函数指针的调用
    (*p1)();
    p1();

    p2(1,2);
}






















int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test33();
    }
    return 0;
}
