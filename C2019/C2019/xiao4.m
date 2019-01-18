//
//  xiao4.m
//  C2019
//
//  Created by xs on 2019/1/16.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "xiao4.h"

@implementation xiao4
+ (void)load{

}
@end

/**
 数组的定义规则
 1.由元素类型 + 元素个数组成
 2.元素可变 整体不可变
 3.当元素不确定时候，元素标签个数一定要确定
 */
static void test1(){
    int array[3];
    int array2[] = {1,2,3};
}

/**
 数组的操作 初始化 取值 赋值
 */
static void test2(){
//    1.全部初始化
    int array1[3] = {1,2,3};
//    2.部分初始化
    int array2[3] = {1,2};
//    3.指定初始化
    int array3[3] ={[0] = 1,[1] = 2};

//    2 数组长度
    int length  = sizeof(array1)/sizeof(int);

//    3.元素取值
    int value = array1[1];
}

/**
 数组的内存表现
 1.内存分配方式:由高地址到低地址分配
 2.一个变量对象为其分配了一段内存
     a.其代表地址是哪里:最小地址为变量地址
     b.地址内部数据从哪一端开始存储:从高地址开始存储数据
  3.元素的地址怎么分配的:从地址小的位置开始给每个元素分配空间
 */
static void test3(){

}

/**
 各种类型元素的数组
 */
static void test4(){

//    1.整形数组
    int value_int1 = 10;
    int value_int2 = 10;
    int int_array[2] = {value_int1,value_int2};

//    2.浮点数组
    float value_float1 = 10.f;
    float value_float2 = 10.f;

    float float_array[2] = {value_float1,value_float2};
//    3.字符数组
    char value_char1 = '1';
    char value_char2 = '2';
    char value_char3 = '\0';
    // 1.这仅仅是字符数组
    char char_array[2] = {value_char1,value_char2};
    // 2.这不仅是字符数组 ，还是字符串
    char char_array2[3] = {value_char1,value_char2,value_char3};
//    4.结构体数组
    struct person{
        int age;
    };
    struct person value_struct1 = {1};
    struct person value_struct2 = {2};
    struct person struct_array[2] = {value_struct1,value_struct2};
//    5.枚举数组
    enum book{
        chen
    };
    enum book value_enum1 = chen;
    enum book value_enum2 = chen;
    enum book enmu_array[2] = {value_enum1,value_enum2};

//    6.指针数组
    int *p1 = &value_int1;
    int *p2 = &value_int2;
    // [] 比 *的优先级高 ，所以array先与[]结合 array 是一个 int * 指针数组
    int *array[2] = {p1,p2};

}

