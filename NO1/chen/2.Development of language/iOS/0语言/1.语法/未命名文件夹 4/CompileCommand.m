//
//  CompileCommand.m
//  StudyChen
//
//  Created by xs on 2017/5/9.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "CompileCommand.h"// 编译器指令

@implementation CompileCommand

@end
/*
 
 
 (A)宏定义
 1:#define COUNT 5 定义一个宏;  宏名 一般大写 ,值为(常量值,也可为空）,末尾没有分号
 2:#define COUNT(a,b) ((a) +(b)) 带参数的宏定义 参数跟结果都要括起来
 3:#undef COUNT 结束某个宏定义
 

 (B)条件编译
     #define COUNT 3
     #if (COUNT == 5)
     #elif (COUNT == 3)
     #else
     #endif

     #if defined(COUNT) 如果定义了某个宏   #ifdef COUNT
     #endif

     #if !defined COUNT  如果没有定义某个宏   #ifndef COUNT
     #endif

 (C) 文件包含
 1:#include "文件地址+文件名",将当前文件拷贝到此处，注意文件包含 不允许 循环包含  我包含你 你包含我
 2:利用条件编译 可解决重复 引用 问题
         #ifndef 文件名宏
         #ifdef 文件名宏
         #endif
3:OC 的文件拷贝 #import 比 #inclide 先进，它自身就可以防止重复拷贝


ios 系统自带的常用宏
 1:FOUNDATION_EXPORT / FOUNDATION_IMPORT/ FOUNDATION_EXTERN  前者两个是用来兼容 win32 应用程序的，后者可以兼容 extern 和 extern "C"
    a:总结 涉及到使用 C++ 语言的编程则最好使用：FOUNDATION_EXPORT 和 FOUNDATION_IMPORT，否则，使用 FOUNDATION_EXTERN 这个就可以了
    b:UIKIT_EXTERN 是 UIKIT 框架的宏 相当于 extern
 
 
 ios 预定义标识符
 1:_cmd 在Objective-C的方法中表示当前方法的selector
 2:__func__  打印当前函数名
 __strong __block __unused  NULL __typeof__  __weak  inline  IMP  _Nullable __autoreleasing  __unsafe_unretained __bridge
 
 
__VA_ARGS__  SEL 

 */
