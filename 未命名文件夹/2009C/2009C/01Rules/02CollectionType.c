//
//  02CollectionType.c
//  2009C
//
//  Created by xs on 2019/1/21.
//  Copyright © 2019 Touker. All rights reserved.
//

#include "02CollectionType.h"
static void runFunc(){
    printf("aaa");
}


/**
 结构体
 1.样式: struct 类型名{成员变量;成员变量;成员变量}变量名;
 类型名:可省略，省略后就成了 匿名 结构体
 {}:这才是结构体类型的精髓
 变量名:可在定义类型的同事定义一个变量

 */
static void test6(){
    // 1.定义类型 ，成员变量 以;号隔开
    struct person{
        int age; // 成员变量的类型 可以是任何类型 但，不能嵌套自身类型的变量
        char *name;
        double height;
    };

    //    定义类型的同时定义变量
    struct chen{
        int age;
    }value;
    value.age = 10;

    //    匿名结构体变量，不能重复复用
    struct {
        int age;
    }value2;
    value2.age = 20;

    // 2.初始化
    struct person man = {18,"chen",55.0};
    struct person woman = {18,"chen",55.0};

    // 3.成员变量的 访问 修改
    man.age = 17;
    man.name = "xiao";
    man.height = 88.0;

    // 4.结构体变量之间 若是相同类型则可以互相赋值，且只做值传递
    man = woman;
}

/**数组
 1.数组的类型 由 元素类型 + 元素个数共同 组成
 2.元素个数，必须是整形常量，当未指定元素的时候 元素个数是必须的
 */
static void test7(){

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


    //    1.整形数组
    int value_int1 = 10;
    int value_int2 = 10;
    int int_array[2] = {value_int1,value_int2};

    //    2.浮点数组
    float value_float1 = 10.f;
    float value_float2 = 10.f;
    float float_array[2] = {value_float1,value_float2};

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


    //    5.枚举数组
    enum book{
        chen
    };
    enum book value_enum1 = chen;
    enum book value_enum2 = chen;
    enum book enmu_array[2] = {value_enum1,value_enum2};

    //    6.结构体数组
    struct person{
        int age;
    };
    struct person value_struct1 = {1};
    struct person value_struct2 = {2};
    struct person struct_array[2] = {value_struct1,value_struct2};

    /**二维数组
     1.数据类型 数组名[一维数组的个数][一维数组的元素个数]
     2.其中"一维数组的个数"表示当前二维数组中包含多少个一维数组
     3.其中"一维数组的元素个数"表示当前前二维数组中每个一维数组元素的个数
     */
    // 1.初始化
    int array_wei1[2][3] = {{1,2,3},{4,5,6}};
    int array_wei2[2][3];
    // 2.赋值 取值
    array_wei2[0][0] = 1;
    array_wei2[0][1] = 2;
    array_wei2[0][2] = 3;

    /**
     指针数组
     1.一个数组，各元素都是指针变量，每元素保存一个地址，这样的数组称为指针数组。
     2.由于[]比*的优先级要高，故 array_p 先与[]结合，也就是说 array_p 是一个数组
     */
    int value1 = 10,value2 = 20,value3 =30;
    int *p1 = &value1;
    int *p2 = &value2;
    int *p3 = &value3;
    int *array_p[3] ={p1,p2,p3};

}

