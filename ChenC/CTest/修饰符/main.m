//
//  main.m
//  修饰符
//
//  Created by xs on 2018/11/13.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>
void test_const();
const int test_const2(const int a);


/** 变量作用域

局部变量
1.函数内的变量称之为局部变量，只能在函数内部访问
2.退出函数，则变量销毁，被static修饰的局部变量 其生命周期会延长到同程序的生命周期


全局变量
1.在函数外定义的变量称之为全局变量，可以在本文件跟其他文件访问
2.被static修饰的全部变量，只能被本文件访问 ，限制了其作用域
3.exten 可以用来声明某个全局变量
 */


/**  变量的声明与定义 初始化

 A.声明:
 1.exten type value 声明个全局变量value,声明不会开辟存储空间
 2.只有声明了就可以使用这个变量，但最后要看这个变量有没有定义 才能链接通过
 3.变量可以多次声明

 B.定义:
 1.type value 开辟存储空间给变量 value，定义是特殊的声明
 2.局部变量只能定义一次，全局变量可以定义多次，但不能多次初始化

 C.初始化:在定义的时候赋初值
 1.未初始化的变量，其值不确定
 */

//声明的变量虽然可以用，但找不到定义就会链接出错
//extern int valuex;
//void test_only_exten(){
//    valuex = 10;
//    printf("value = %d,value.p = %p\n",valuex,&valuex);
//}

//正常的声明 定义变量
extern int valuey;
void test_exten_define(){
    valuey = 10;
    printf("value = %d,value.p = %p\n",valuey,&valuey);
}
int valuey;

//声明的时候初始化,虽然能编译链接通过，但不建议这种写法
extern int valuez = 9;
void test_exten_initialize(){
    valuez = 10;
    printf("value = %d,value.p = %p\n",valuez,&valuez);
}

// 全局变量可以重复声明
extern  int valeut;
extern  int valeut;

// 可以定义同名的全局(外部，内部)变量，本质为同一个变量
int valeut;
int valeut;

static int valuew;
static int valuew;




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


/** const
1.const 修饰基本数据类型 整形 浮点 枚举 ，其变量值不可修改
2.const 修饰结构体变量，其本身 与成员变量 都不可被修改
3.const 修饰数组， 数组元素不可被修改
4.const 修饰 *p ，则 *p的值不可被修改，指针变量p可修改
5.const 修饰 p ，则 指针变量p不可修改，*p的值可被修改，
6.const 修饰函数参数，表示对于函数来说，不会在意传入的参数外面是否是只读的，它只会在函数内部，将入参当作只读变量处理
 */

//const https://www.cnblogs.com/icemoon1987/p/3320326.html
void test_const(){

    enum nameType{
        one,
        two
    };
    struct persion {
       int  age;
    };

    int valuex = 10;
    int valuey = 10;

    int const value1 = 10;
    const int value2 = 10;
  //  value1 = 20;
  //  value2 = 20;

    const enum nameType  type = one;
//    type = two;


    const struct persion  man = {18};
    const struct persion  woman = {19};
//    man = woman;
//    man.age = 20;

    const int array[3] = {1,2,3};
  //  array[0] = 4;



    const int *p1 = &valuex;
 // *p1 = 20;
    p1  = &valuey;

    int * const p2 = &valuex;
 // p2 = &valuey;
    *p2 = 20;

    int a = 10;
    a = 30;
    int b = test_const2(a);
    b = 40;

}
//将函数参数声明为 const 类型，表示对于函数来说，不会在意传入的参数外面是否是只读的，它只会在函数内部，将入参当作只读变量处理
const int test_const2(const int a){
//    a = 20;
    return 10;
}
const int test_const3(const int *a){
//  *a = 20;
    a = NULL;
    return 10;
}
const int test_const4( int * const a){
//  a = NULL;
    *a = 20;
    return 10;
}


/** const和static的结合使用
1.声明一个只读的 内部全局变量,一般需要在定义的时候初始化 不然无意义了
 */
static const char *str1 = "chen";
static char * const str2 = "chen";
static const char * const str3 = "chen";

void test_chen(){
//    *str1 = 'a'; // const 修饰 *str1 编译不过
//    str2 = "xiao"; // const 修饰 str2 编译不过

    str1 = "xiao";
    *str2 = 'a'; //编译过，链接不过 常量不允许修改

    printf("str1 = %s\n,str2 = %s\n",str1,str2);

}
/** const和extern的结合使用
1.声明一定一个读者的全部变量
 */
extern const int  value_chen; // 声明一个只读的全局变量
const int  value_chen = 10; // 定义一个只读的全局变量，并初始化




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        test_chen();
    }
    return 0;
}
