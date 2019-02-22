//
//  runtime.h
//  test1
//
//  Created by xs on 2019/2/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface runtime : NSObject

@end
/*
 什么是Runtime
 1.OC是一门动态性比较强的编程语言，允许很多操作推迟到程序运行时再进行
 2.OC的动态性就是由Runtime来支撑和实现的，Runtime是一套C语言的API，封装了很多动态性相关的函数
 3.平时编写的OC代码，底层都是转换成了Runtime API进行调用

Runtime支撑的技术
 1.msgSend
 2.AssociatedObject
 3.KVO，KVC
Runtime 常用的API
 1.字典转模型
 a.利用Runtime遍历所有的属性或者成员变量
 b.利用KVC设值

 2.替换方法实现
 */
