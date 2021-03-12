//
//  Pretreatment.c
//  CGrammar
//
//  Created by xs on 2019/4/22.
//  Copyright © 2019 xs. All rights reserved.
//

#include "Pretreatment.h"


/*文件包含
 1.使用""引入的是本地工程的文件，而使用<>引入的是系统库的文件。
 2.""会先查找用户目录下文件是否存在，或者说是User Header Search Paths，如果不存在，会继续查找库目录
 3.<>只会查找库目录
 */
#include "Macro.h"
#include <stdbool.h>

/* #include 与#pragma
 1.#include是C 的预处理指令，在文件递归包含时候会出现循环包含问题
 2. #import 确定一个文件只能被导入一次，这使你在递归包含中不会出现问题
 */

/* #pragma 编译指令:
 1.#pragma用于指示编译器完成一些特定的动作
 2.#pragma所定义的很多指示字是编译器特有的
 3.#pragma在不同的编译器间是不可移植的
 4.预处理器将忽视它不认识的#pragma指令
 5.不同的编译器可能以不同的方式解释同一条#pragma指令
 6.用法#pragma parameter:不同的parameter参数语法和意义各不相同
 */


// 给代码分组打标签 带- 的才会生成横线
#pragma mark 标注
#pragma mark - 分组

/* 对一些诊断信息进行局部的限制
 1.#pragma clang diagnostic push:诊断开启
 2.#pragma clang diagnostic ignored "" 设置忽略一些 诊断
    "-Wgnu"
    "-Wassign-enum"
    "-Wunused-function"
    "-Wdeprecated-declarations"
    "-Warc-performSelector-leaks"
    "-Wundeclared-selector"
    "-Wobjc-interface-ivars"
    "-Wobjc-designated-initializers"
 3.#pragma clang diagnostic pop:诊断关闭
 */
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
//www.cnblogs.com/lurenq/p/7709731.html
#pragma clang diagnostic pop

//用于：忽略“声明却没有使用”的变量的编译器警告
int valueT = 10;
#pragma unused(valueT)

//主动产生一个警告信息
#warning 123
#pragma message("123")


//主动产生一个错误信息
#define HAHA
#ifndef HAHA
#error a  error message
#endif
