//
//  main.m
//  test1
//
//  Created by xs on 2019/2/21.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>
#import <malloc/malloc.h>
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obje = [[NSObject alloc]init];
        NSLog(@"------");

    }
    return 0;
}
void test2(){
    {

    }

}
void test1(){

    {
         //1.OC代码转C++代码
    }

    {
        /*
         2.NSObject对象C++底层实现
         typedef struct objc_class *Class;

         OC对NSObject的定义
         @interface NSObject <NSObject> {
         Class isa ;
         }
         C++对NSObject的定义
         struct NSObject_IMPL {
         Class isa; isa的地址就是 NSObject_IMPL结构体的地址
         };
         */
    }
    { // 获取 NSObject 对象所占内存大小
        NSObject *obje = [[NSObject alloc]init];

        // 获得NSObject实例对象的成员变量所占用的大小 >> 8
        NSLog(@"%zd", class_getInstanceSize([NSObject class]));

        // 获得obj指针所指向内存的大小 >> 16
        NSLog(@"%zd", malloc_size((__bridge const void *)obje));
    }
    {
        /*
         1.debug workflow ->view memory 查看内地地址的数值

         2.LLDB 命令查看内存
         查看一个地址
         a.print/p  po 对象

         查看一个地址的数值
         1.memory read 地址
         2.x 地址
         从某个地址查看多个地址的数值
         1.memory read/abc
         2.x/abc
         a:一次查看几个单位的
         b:数据的进制 （x是16进制，f是浮点，d是10进制）
         c:每个单位占多少字节(b:1字节，h:2字节 w:4字节，g:8字节)
         */
        NSObject *obje = [[NSObject alloc]init];
        NSLog(@"------");
    }

    {
        /*继承结构的对象本质结构
         1.多继承计算子类实例对象所占内存(底层分配内存的实现)
         */
    }


}
void test3(){
    { // class

    }
    { // meta-class对象（元类对象）


    }
    { // class对象（类对象）



    }
    { // instance对象（实例对象）



    }
    { // NSobject 底层结构


    }

    {
    // 元类对象 类对象 实例对象 的链接关系
    }
    
}

