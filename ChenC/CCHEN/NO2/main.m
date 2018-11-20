//
//  main.m
//  NO2
//
//  Created by xs on 2018/10/10.
//  Copyright © 2018年 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
void test1(){
    /*常量变量
常量
     1.整形常量
     a.指定类型:在编译器支持对应的类型前提下，后整数后面添加标识，以指明常量值的类型
     long int a = 33l/33L;
     long long int a = 33ll/33LL;
     unsigned int a = 2u/2U;
     b.自动识别:在没知道类型的前提下，编译器自动根据数的大小识别分配对应类型的存储

     2.浮点常量
     float a1 = 2.33f;
     double a2 = 2.33;
     3.字符常量
     char a1 = 65;
     char a1 = 'a';
     char a1 = '\\';

     4.符号常量
     在C语言中我们还可以用一个与常量相关的标识符( 使用 #define 预处理器、使用 const 关键字)来代替常量出现在程序中，这种相关的标识符称为符号常量

     5.字符串常量


变量
     1.变量声明:用于向程序表明变量的类型和名字，
     2.变量定义:用于为变量分配存储空间，还可为变量指定初始值。程序中，变量有且仅有一个定义。
     3.变量作用域
     1.局部变量
     a.局部变量是存放在栈区的，并且局部变量的生命周期在该语句块执行结束时便结束了
     b.局部变量的声明即是定义
     c.未初始化的话其值是不确定的

     2.全局变量
     a.在静态存储区分配空间
     b.全局变量只能定义一次，可以声明多次，在全局变量不可见的地方但又想使用就得进行声明。
     c.未初始化的话,编译器根据其类型自动初始化值
     d.extern
     1.(定义时候)表明函数和全局变量作用范围（可见性）的关键字，该关键字告诉编译器，其声明的函数和变量可以在本模块或其它模块中使用，默认就是extern的
     2.(声明时候)extern可以置于变量或者函数前，以标示变量或者函数的定义在别的文件中，提示编译器遇到此变量和函数时在其他模块中寻找其定义



     */
}