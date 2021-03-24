//
//  memoryLayout.m
//  MRC
//
//  Created by xs on 2021/3/22.
//

#import "memoryLayout.h"
/*
 内存分布:从高到低 依次
 内核区：命令行参数，环境变量等。
 栈：编译的时候能确定好的。函数内部使用的变量、函数的参数以及返回值；由编译器自动分配和释放；后进先出；从高往低分配。

 堆：编译时不能提前确定，通常堆中的对象都是以指针来访问的，指针从线程栈中来，但不独属于某个线程。它的大小并不固定，可动态扩张或缩减。一般由程序员分配和释放。动态调用malloc和free来分配和释放内存；从低往高分配。
 数据：.BSS(未初始化的全局变量、静态变量，系统初始化为0)；RW data(已初始化的全局变量、静态变量)；RO data(常量) 。
 代码：程序编译后的机器码；这部分区域的大小在程序执行前就已经确定，而且内存区域属于只读。
 
 */
@implementation memoryLayout

@end
