//
//  DataType.m
//  2020COC
//
//  Created by xs on 2019/7/9.
//  Copyright © 2019 xax. All rights reserved.
//

#import "01DataType.h"

@implementation DataType
/**
 各种进制的数
 */
- (void)test1{
    int value1 = 10;
    int value2 = 0b1;
    int value3 = 01;
    int value4 = 0x1;
}
- (void)test2{
    
    {
        /* bool
         1.C++ 布尔型变量，真正的逻辑型变量
         2.占1个字节,取值范围:false(0)/true(1)
         3.赋值: 转换后0为false，非0为true
         4.结果真假判断:true 为 真，false为假;
         */
        bool value1  = -9;
        size_t bit1 = sizeof(value1);
        printf("bit1= %lu\n",bit1);
        
        /* _Bool
         0.C99之前无布尔类型
         1.C99标准定义了一个新的关键字_Bool(其实是一个宏定义)，提供了布尔类型,1个字节
         2.结果值：0为false，非0为true
         #define bool _Bool true 1 false 0
         */
        _Bool value2 = -9;
        size_t bit2 = sizeof(value2);
        printf("bit2= %lu\n",bit2);
        
        
        BOOL value3 = YES;
        Boolean value4 = TRUE;
    }

    
    {
        signed int value1 = -10;
        unsigned int value2 = 10;
        
        short int value3 = 10;
        long int value4 = 10;
        long long int value5 = 10;
    }
    
    {
        NSInteger value1 = 10;
        NSUInteger value2 = 10;
    }
    

    
    
}
/**
 字符型
 1.存储范围:
 a.字节，符号位，存储: 占8个字节，分为有符号性（signed）和无符号型（unsigned）两种，以整数的形式存储
 b.范围：若是signed型[-128,127]；unsigned型[0,255]；
 c.编译器层:C语言中我们通常直接用类型char，但是它究竟是被当做signed型还是unsigned型，由编译器决定。
 d.运用层:C语言允许我们在char前面加上关键字signed或者unsigned，这样，无论在编译器中被当做signed还是unsigned，都会按照前面加的这个关键字来决定
 2.一般用于: 通常指用来存储ASCII中的字符
 3.表示规则:
 a.一般字符:
 char value_char1 = 'a';
 b.转义字符:
 a:一般转义字符
 1.控制非显示字符: \n 换行
 2.二义性字符: \' ; \" ; \? ; \\
 b:进制转义字符
 0.空字符 :\0 = 0 ,ASCII中 0 代表 空字符
 1.八进制转义字符:它是由反斜杠'\'和随后的1～3个八进制数字构成的字符序列，表示八进制的0可以省略
 2.十六进制转义字符:是由反斜杠'\'和字母x(或X)及随后的1～2个十六进制数字构成的字符序列
 */
- (void)test3{
    char value_char1 = 'a';
    char value_char2 = ' ';
    
    char value_char4 = '\'';// '是 字符的表示符号，表示的时候必须转义，不然会造成语法歧义
    char value_char5 = '\\';
    char value_char61 = '\"';
    char value_char62 = '"';// "是 字符串的表示符号，但在此处不会造成语法歧义，故无报错
    char value_char71 = '\?';
    char value_char72 = '?';
    
    char value_char3 = '\0'; // 空字符
    char char_82 = '\012';//八进制
    char char_81 = '\12'; //八进制
    
    char char_16 = '\x12';//十六进制
}
/**
 浮点型
 1. 单精度浮点数有效数字7位，6 位小数
 2.双精度浮点数有效数字16位，15 位小数
 */
- (void)test4{
    float value_float = 10.123456789f;
    double value_double = 10.123456789; // 默认是 double类型
    float valueMax = MAXFLOAT;
}
/**
 枚举
 1.枚举值是当做整形常量处理，称为枚举常量
 2.枚举元素的值取决于定义时各枚举元素排列的先后顺序,默认第一个为0，后面依次+1
 3.可以在定义的 时候 自定义 枚举常量的值
 4.定义类型，枚举值 以,号隔开,可以自定义常量值
 */
- (void)test5{
    
    enum type1{
        type1_0,
        type1_1,
    };
    
    typedef  NS_ENUM(NSInteger,type2){
        type2_0,
        type2_1,
    };
    
    typedef NS_OPTIONS(NSUInteger, type3){
        type3_0 =  0,
        type3_1 = (1 << 0),
        type3_2 = (1 << 1),
        type3_all = (type3_0|type3_1|type3_2)
    };
  
}
/**
 结构体
 1.样式: struct 类型名{成员变量;成员变量;成员变量}变量名;
 类型名:可省略，省略后就成了 匿名 结构体
 {}:这才是结构体类型的精髓
 变量名:可在定义类型的同事定义一个变量
 */
- (void)test6{
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
- (void)test7{
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

/**
 指针的定义
 1.作用:保存指定类型变量的地址，提供地址直接操作该对象
 2.格式: 类型 *变量名;
 3.内存:任何类型的指针 都占 8个字节
 
 
 野指针
 1.什么是野指针:未经初始化的指针都是野指针
 2.野指针的产生:
 a.未经初始化的局部变量
 b.所指向的变量，提前被释放了
 c.已经被释放的指针
 3.操作野指针:操作野指针可能造成崩溃
 
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
- (void)test8{
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

/**
 数组，指针，函数
 */
enum man{man,woman}value5;
struct person {int age;char *name;};
static void test7(){
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

@end
