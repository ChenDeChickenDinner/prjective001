//
//  Static.c
//  CGrammar
//
//  Created by xs on 2019/4/22.
//  Copyright © 2019 xs. All rights reserved.
//

#include "Static.h"
/*static 修饰局部变量
 1.布局变量会被初始化
 2.生命周期会被延长到程序结束
 3.其本质还是局部变量，不同作用域内运行有同名静态局部变量
 */
static void test1(){
    static int value;
    printf("value = %d\n",value);
}
/*static 修饰全局变量
 1.只会限制变量的作用域为本文件
 */
static int valueX;

/*static 修饰函数
 1.只会限制函数的作用域为本文件
 */
static void test2(){
    
}
