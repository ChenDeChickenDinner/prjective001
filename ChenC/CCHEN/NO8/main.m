//
//  main.m
//  NO8
//
//  Created by xs on 2018/10/16.
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
/**
 特殊关键字---->static
 */
void test(){


    /*

     */

    /*
     static(静态):分配内存的时候, 存储在静态区,不存储在栈上面.
     1.修饰局部变量(静态局部变量):数据保存在静态区，且生命周期到程序结束
     2.修饰全局变量(静态全局变量):让此变量只能被本文件访问，即使两个不同的源文件都定义了相同名字的静态全局变量，它们也是不同的变量
     3.为什么 static 修饰全局变量或者函数后 只在当前源文件内有效（ static 修饰全局变量后，该变量符号在符号表中的 Bind 属性变为 local ，对于符号解析原则，当遇到了一个local符合立即解析，并不会继续再去后续的其他源文件中对相应的同名全局符号进行解析绑定 ）



     定义数组类型

     C语言中通过typedef为数组类型重命名
     typedef type(name)[size];
     数组类型(重命名了一种一个数组类型）：
     typedef int(AINT5)[5];
     typedef float(AFLOAT10)[10];
     数组定义：
     AINT5 i
     AFLOAT10 f

     */

}
