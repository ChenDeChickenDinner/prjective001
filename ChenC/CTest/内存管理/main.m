//
//  main.m
//  内存管理
//
//  Created by xs on 2018/11/20.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark - 内存组成
/**
1.编译期间由编译器分配空间
 BSS段:存放程序中(未初始化)的全局变量和静态变量
 数据段:存放程序中(已初始化)的全局变量和静态变量以及字符串常量
 代码段:通常是指用来存放程序执行代码的一块内存区域

2.运行中由系统分配空间
 栈、
1.栈是高地址向低地址扩展的数据结构，具有先进后出的特点
2.存放程序临时创建的局部变量，即函数括大括号 “{ }” 中定义的变量，其中还包括函数调用时其形参，调用后的返回值，函数调用上下文等
4.小内存:栈顶的地址和栈的最大容量一般是系统预先规定好的，通常不会太大，可能会溢出
5.自动化：变量由系统回收重新利用，所以栈的空间是循环利用自动管理的，一般不需要人为操
 堆
1.堆是低地址向高地址扩展的数据结构，是一块不连续的内存区域
2.堆内存是操作系统划分给堆管理器来管理的，管理器向使用者提供API（malloc和free等）,需要程序员手动分配释放

 栈、与  堆
A.为什么有了栈还需要堆？
 1.栈上的数据在函数返回后就会被释放掉，无法传递到函数外部，如局部变量
 2.SO 在 函数中 从堆 上申请的内存 需求手动管理
 */


/**
 malloc
 【函数原型】: void *malloc(size_t __size)
 【参数说明】: size 需要分配的内存空间的大小，单位是字节。
 【返回值类型】void* 类型表示未确定类型的指针。C,C++规定，void* 类型可以通过类型转换强制转换为任何其它类型的指针。
 【函数功能】 表示向系统申请分配指定 size 个字节的内存空间
 1.成功 void * 类型可以强制转换为任何其它类型的指,一般需和free函数配对使用。
 2.失败则返回NULL,调用malloc（）函数的时候，一定要判断它的返回值是否为NULL。

 calloc
 【函数原型】void *calloc(size_t __count, size_t __size)
 【参数说明】count 表示个数，size 单位个需要分配的内存空间的大小，单位是字节。
 【返回值类型】void * 表示未确定类型的指针。例如：
 【函数功能】 表示向系统申请分配 count 个长度为 size 一共为 count 乘以 size 个字节长度的连续内存空间，并将每一个字节都初始化为 0。

 realloc
 【函数原型】void *realloc(void *__ptr, size_t __size)
 【参数说明】ptr 表示需要修改的内存空间的地址，size 表示需要重写分配的内存空间的大小，单位是字节。
 【返回值类型】void * 表示未确定类型的指针。
 【函数功能】 表示更改已经配置好的内存空间到指定的大小。例如：

 free
 【函数原型】void free(void *)
 【参数说明】void * 表示需要释放的内存空间对应的内存地址。
 【返回值类型】返回值为空。
 【函数功能】 表示用来释放已经动态分配的内存空间。free() 可以释放由 malloc()、calloc()、realloc() 分配的内存空间，以便其他程序再次使用。需要注意的是：free() 不会改变 传入的指针的值，调用 free() 后它仍然会指向相同的内存空间，但是此时该内存已无效，不能被使用。所以建议将释放完的指针设置为 NULL。例如：

 内存泄漏
 内存泄漏（Memory Leak）是指程序中己动态分配的堆内存由于某种原因程序未释放或无法释放，造成系统内存的浪费，导致程序运行速度减慢甚至系统崩溃等严重后果。

 */

void test(){
    int *a = malloc(1); //申请4个字节的空间用于存放一个int类型的值
    printf("*a.size = %lu\n",sizeof(*a));

    int *b = calloc(10, sizeof(int)); // 申请10个sizeof(int) 字节的空间
    printf("b.p = %p,*b.p = %p,*b.size = %lu\n",&b,&(*b),sizeof(*b));
    int *c = realloc(b, 5 * sizeof(int)); // 将原来b指向的地址空间大小 修改成  5 * sizeof(int) 并重新由c指向
    printf("b.p = %p,*b.p = %p,*b.size = %lu\n",&b,&(*b),sizeof(*b));
    printf("c.p = %p,*c.p = %p,*c.size = %lu\n",&c,&(*c),sizeof(*c));

    free(a);
    free(b);
    free(c);
    a = b = c =NULL;
}
#pragma mark - 变量的存储类别
/** auto（自动的）、extern（外部的）、static（静态的）、register（寄存器的）
1.C的存储类别包括4种,据变量的存储类别可以得知其作用域和生命周期。
2.register 现在不用了
 变量作用域
 局部变量
 1.函数内的变量称之为局部变量，只能在函数内部访问，
 2.如不专门声明为static存储类别，默认就是自动变量，用关键字auto(可以省略)，退出函数，则变量销毁，
 3.被static修饰的局部变量 其生命周期会延长到同程序的生命周期


 全局变量
 1.在函数外定义的变量称之为全局变量，可以在本文件跟其他文件访问
 2.如不专门声明为static存储类别，默认就是外部全局变量，用关键字exten(可以省略)
 3.被static修饰的全部变量，只能被本文件访问 ，限制了其作用域，



 变量的声明与定义 初始化

 A.声明:
 1.exten type value 声明个全局变量value,声明不会开辟存储空间
 2.只有声明了就可以使用这个变量，但最后要看这个变量有没有定义 才能链接通过
 3.变量可以多次声明

 B.定义:
 1.type value 开辟存储空间给变量 value，定义是特殊的声明
 2.局部变量只能定义一次，全局变量可以定义多次，但不能多次初始化

 C.初始化:在定义的时候赋初值
 1.未初始化的变量，其值不确定

 //声明全局外部变量
 extern int valuey; // 声明的变量虽然可以用，但找不到定义就会链接出错

 //声明的时候初始化,虽然能编译链接通过，但不建议这种写法
 extern int valuez = 9;

 // 全局变量可以重复声明
 extern  int valeut;
 extern  int valeut;

 // 可以定义同名的全局(外部，内部)变量，本质为同一个变量
 int valeut;
 int valeut;

 static int valuew;
 static int valuew;

 */


/** 函数的作用域

 A:外部函数
 1.能被本文件 跟 其它文件访问的函数
 2.不同文件的外部函数 不能同名
 3.被 extern 修饰的函数就是外部函数，可以用来 声明 定义函数 默认可以不写
 B:内部函数
 1.只能被本文件访问的函数
 2.不同文件的内部函数，可以同名
 3.被 static 修饰的函数就是内部函数，可以用来 声明 定义函数
 */
extern void chenxiaowe1();
extern void chenxiaowe1(){
    printf("这是一个外部函数，不同文件不能有同名外部函数");
};
static void chenxiaowe2();
static void chenxiaowe2(){
    printf("这是一个内部函数，不同文件可以有同名内部函数，互不影响");

};

/** const https://www.cnblogs.com/icemoon1987/p/3320326.html
 1.const 修饰基本数据类型 整形 浮点 枚举 ，其变量值不可修改
 2.const 修饰结构体变量，其本身 与成员变量 都不可被修改
 3.const 修饰数组， 数组元素不可被修改
 4.const 修饰 *p ，则 *p的值不可被修改，指针变量p可修改
 5.const 修饰 p ，则 指针变量p不可修改，*p的值可被修改，
 6.const 修饰函数参数，表示对于函数来说，不会在意传入的参数外面是否是只读的，它只会在函数内部，将入参当作只读变量处理
 */

/** const和static的结合使用
 1.声明一个只读的 内部全局变量,一般需要在定义的时候初始化 不然无意义了
 */
static const char *str1 = "chen";
static char * const str2 = "chen";
static const char * const str3 = "chen";
/** const和extern的结合使用
 1.声明一定一个读者的全部变量
 */
extern const int  value_chen; // 声明一个只读的全局变量
const int  value_chen = 10; // 定义一个只读的全局变量，并初始化
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test();
    }
    return 0;
}
