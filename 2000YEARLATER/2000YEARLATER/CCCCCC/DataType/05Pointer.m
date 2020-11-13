//
//  05Pointer.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/11.
//

#import "05Pointer.h"

@implementation _5Pointer
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
 0.　一个表达式的值为0或者为零的表达式被强制转成 (void *)类型，都叫空指针常量

 C中对NULL的预定义有两个：
 　　#define NULL 0  ---->就是数值0
 　　#define NULL ((void *)0)---->指向0的指针
 1.NULL和0的值都是一样的，但是为了目的和用途及容易识别的原因，NULL用于指针和对象，0用于数值
 2.当常量0处于应该作为指针使用的上下文中时，它就作为空指针使用；在指针上下文中“值为0的整型常量表达式”在编译时转换为空指针 int * p = 0;
 
 4.操作空指针 比如取值操作 会造成崩溃 要先判断 p != NULL
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

 */
static void test41(){
    
  
    {
        // 单指向一个字符时候 跟整形指针没有区别 可以修改
        char str  = 'a';
        char *p = &str;
        printf("%p\n",&str);
        printf("%p\n",p);
        printf("%p\n",&p);
        printf("%c\n",*p);

        
        *p = 's';
        printf("%p\n",&str);
        printf("%p\n",p);
        printf("%p\n",&p);
        printf("%c\n",*p);
    }
    {
        /*
         1.把字符数组的首元素字符的地址 赋值给 char * 指针变量p
         2.此字符数组存放于常量区 不可修改，支持修改 字符指针 p的指向
         */
        char *p = "it";
        p = "chen";
        *p = 'A'; // 运行报错 不能修改操作
    }
   
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
    
    
    {
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
