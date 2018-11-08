//
//  main.m
//  NO7
//
//  Created by xs on 2018/10/12.
//  Copyright © 2018年 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>
void test11();
int main(int argc, const char * argv[]) {
    @autoreleasepool {

        test11();
    }
    return 0;
}

/**
 指针
 /*指针：指针变量可以 保存 对应类型变量的地址(int* p:)
 1.属性:一个指针变量 占8个字节
 2.作用:只能保存对应类型变量的地址(根据类型 来操作多个字节)


 2.指针变量 的操作
 a1)取指针变量的地址：&p(是一个int类型指针变量的地址，也可以被保存)
 a2)修改指针变量所指向的地址：p = &valuex;
 a2)对所指向的变量的赋值/取值:*p = 22; int value2 = *p;
 */
void test(){
    /*野指针
     1.未被初始化的指针是野指针，野指针可能会导致程序崩溃
     2.野指针指向一个已删除的对象或未申请访问受限内存区域的指针
     3.野指针无法通过简单地判断是否为 NULL
     */
    int *p;

    /* void及void指针类型
     1.void的字面意思是“无类型”
     2.(void *)则为“无类型指针”，(void *)可以指向任何类型的数据。
     3.这两个意思，与void出现的代码位置和修饰变量相关：
     a.函数返回值位置，如: void func(int i) ;  //表示func（）函数没有返回值，void不可省
     b.函数参数位置，如: void func( void ) ;  //表示func（）函数即没有返回值，也没有参数。这里括号中的void可省。
     c.修饰指针变量（一般多用于函数参数）:  int func( void *a, void *b) ; //表示形参a b可以是任意类型指针变量
     d.修饰常量（一般用于宏定义）:  #define NULL  ((void*)0)      //这里NULL从数值上讲就是0，但这样写，可以表明NULL是个（任意）指针类型数据

     */


    /*空指针常量
     1.一个表示0值的整数常量，叫做空指针常量；  0、0L 、3 - 3以及 (void)0, 等都是空指针常量
     2.至于系统选取哪种形式作为空指针常量使用，则是实现相关的。
     3.一般的 C 系统选择 (void*)0 或者 0 的居多（也有个别的选择 0L）；
     */

    /*空指针
     1.如果一个 空指针常量 赋给了一个有类型的指针变量，那么这个指针就叫空指针,它不指向任何的对象或者函数,其值为0.
     3.空指针取决于系统的实现。
     4.为了提高程序的可读性，标准库定义了一个和0等价的符号常量NULL，p=0/p=NULL,将p置为空指针值。
     */

    /*NULL
     1.The macro（ 宏）NULL is defined in <stddef.h> (and other headers) as a null pointer constant （NULL作为一个宏定义为一个空指针常量）
     C中对NULL的预定义有两个：
     　　#define NULL 0  ---->就是数值0
     　　#define NULL ((void *)0)---->指向0的指针
     1.NULL和0的值都是一样的，但是为了目的和用途及容易识别的原因，NULL用于指针和对象，0用于数值
     2.当常量0处于应该作为指针使用的上下文中时，它就作为空指针使用；在指针上下文中“值为0的整型常量表达式”在编译时转换为空指针 int * p = 0;
     */
    int *p1  = NULL;
    int *p2  = 0;

    /*
     指针判空
     1.可以通过与空指针常量或者其它的空指针的比较来实现
     2.注意与空指针的内部表示无关
     */
    int *p3 = NULL;
    if (p3 == 0) {
        printf("p3 =0,为 空指针\n");
    }
    if (p3 == NULL) {
        printf("p3 =NULL,为 空指针\n");
    }
    

    /*针操作空指
     1.我们不能对 空指针 进行 赋值 取值操作
     */
    int *y = NULL;
    *y  = 10; // 运行出错
    int value = *y; // 运行出错



    int  value2 = 10;


    int *ok; // 1.声明一个指针，根据类型 来确定操作多少长度的内存

    ok = &value2;   // 2.直接把一个地址赋值给指针变量保存
    ok = y;         // 2. 把 y保存的地址  赋值给 ok 保存

    int value3 = *ok;  //  3.取指针所保存地址的值


    /*
     1.在同一种编译器环境下,一个指针变量所占用的内存空间是固定的
     2.int *.sizeof = 8
     3.char *.sizeof = 8
     */
    char *str;
    printf("int.sizeof = %lu\nchar.sizeof = %lu\n",sizeof(ok),sizeof(str));
}

/**
 地址的运算、指针的运算
 */
void test11(){

    //变量的地址 在不影响变量自身的地址前提下 可以 在表达式中 对地址进行 + 1运算
    int a = 10;
    int *p = &a +1;
    int *pp = &a -1;

    printf("p = %d,pp = %d\n",*p,*pp); // 乱值

    // 变量的地址不能 ++ --
    int b = 10;
    // 报错 int *ppp1 = &b++;
    // 报错 int *ppp2 = &++b;

     // 指针变量可以 加减
    int array[] = {1,2,3,4};
    int *p1 = &array[0];
    int *p2 = &array[0] + 1;
    printf("p1 = %d,p2 = %d\n",*p1,*p2); // p1 = 1,p2

    p1 = p1 + 1 ;
    printf("p1 + 1 = %d\n",*p1);

    p1 = p1 - 1 ;
    printf("p1 - 1 = %d\n",*p1);

    // 指针变量可以 自增 自减
    p1++;
    printf("p1++ = %d\n",*p1);

    p1--;
    printf("p1-- = %d\n",*p1);

}



/**
 指针与结构体
 */
void test3(){

    struct person{
        int  age;
        char *name;
    };
    struct person my = {18,"chen"};

    struct person *my_p = &my;

    int age1 = (*my_p).age;
    int age2 = my_p->age;
}

/**
 指针数组，数组指针
 */
void test4(){
    /*指针数组
     1.它是一个存放指针的数组
     */
    int value1 = 10,value2 = 20,value3 =30;
    int *p1 = &value1;
    int *p2 = &value2;
    int *p3 = &value3;
    int *array_p[3] ; //由于[]比*的优先级要高，故 array_p 先与[]结合，也就是说 array_p 是一个数组



    /*
     数组名 与指针
     1.a代表数组首元素的首地址，可以看作一个常量指针（指针所指向的内容不能改变）
     2.&a代表数组的首地址
     */
    int array[3] = {1,2,3};
    int *array_pp1 = array; // 把单个元素的 地址 赋值给 int * ,语法正确
    int *array_pp2 = &array; // 把一个指向3个元素数组的地址 赋值给 int *,类型不同 警告


    /*数组指针
     1.指的是数组名的指针，即数组首元素地址的指针。即是指向数组的指针
     2.格式：int (*p)[n]; p即为指向一个(一维数组)的指针，且这个一维数组的长度是n
     3.n,也可以说是p的步长。也就是说执行p+1时，p要跨过n个整型数据的长度。
     */
    int (*array_pp3)[3]  = &array; // 把一个指向3个元素数组的地址 赋值给 int (*p)[3] 数组指针 ，语法正确
    int (*array_pp4)[3]  = array; //类型不同 警告
    // 正确理解(array_pp1 +1) 与  (array_pp3 +1)

    // 这里虽然给出了警告，但由于&a 和a 的值一样，而变量作为右值时编译器只是取变量的值，所以运行并没有什么问题。不过我仍然警告你别这么用。

}
