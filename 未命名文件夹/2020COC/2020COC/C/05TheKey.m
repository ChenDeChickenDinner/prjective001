//
//  05TheKey.m
//  2020COC
//
//  Created by xs on 2019/7/9.
//  Copyright © 2019 xax. All rights reserved.
//

#import "05TheKey.h"

@implementation _5TheKey

@end
/**局部变量
 1.函数内的变量称之为局部变量，只能在函数内部访问
 2.其关键字auto(可以省略)
 3.函数退出后，则变量销毁
 4.被static修饰的局部变量 其生命周期会延长到同程序的生命周期
 */
/**全局变量
 1.在函数外定义的变量称之为全局变量，可以在本文件跟其他文件访问
 2.其关键字exten(可以省略)
 3.一直存在，程序退出才销毁
 4.被static修饰的全部变量，只能被本文件访问 ，限制了其作用域，
 */
/**变量声明:
 1.变量的声明向编译器保证变量以指定的类型和名称存在(不会开辟存储空间)，编译只需要知道其声明。
 2.变量 可以 重复声明
 3.声明格式:
 a.局部变量 没有声明
 b.全局变量 exten type value
 */

/**变量定义
 1.定义就是告诉编译器在何处创建变量的存储，变量定义指定一个数据类型, 链接需要知道其定义
 2.定义 附带声明属性
 3.局部变量只能定义一次，全局变量可以定义多次(同一个)
 */


//全局变量
extern int value; // 声明 全局变量
extern int value; // 重复声明 全局变量
int value; // 定义全局变量（附带声明属性）
int value; // 重复定义全局变量（与上为同一个变量）
//静态全局变量
static int value2; // 定义（附带声明属性） 静态全局 变量

/**static 与 extern
 1.static表示是本文件内的变量（在函数中的是静态变量）
 2.extern表示是其他文件定义的变量，显然两者是矛盾的
 3.static要求去除符号表名称，extern要求通过符号名称链接
 */


/**外部函数
 1.能被本文件 跟 其它文件访问的函数
 2.其关键字extern(可以省略)
 */
/**内部函数
 1.只能被本文件访问的函数
 2.其关键字static(不可以省略)
 */
/**函数声明
 1.函数 可以 重复声明,当无形参时，声明的时候也要加 void 增加严谨性
 2.声明格式:
 a.外部函数的声明:extern type funcX(void);
 b.内部函数的声明:static type funcX(void);
 c. extern 与 static 在声明的时候要带上;
 */
/**函数定义
 1.函数只能定义一次
 2.不同文件的外部函数 不能同名
 3.不同文件的内部函数 可以同名
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


typedef int  myInt;
