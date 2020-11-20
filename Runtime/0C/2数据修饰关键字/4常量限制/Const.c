//
//  Const.c
//  CGrammar
//
//  Created by xs on 2019/4/19.
//  Copyright © 2019 xs. All rights reserved.
//

#include "Const.h"
/*const 修饰变量(局部变量 全局变量 函数参数)
 1.现在变量不允许被修改
 2.一般在定义的时候就初始化 不然失去了意义
 */
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
 1.声明一个只读的全部变量（全局常量）
 */
extern const int  value_chen; // 声明一个只读的全局变量
const int  value_chen = 10; // 定义一个只读的全局变量，并初始化


static void test1(){
    
}
