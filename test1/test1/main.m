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
        Class class1 = Nil;

        /* Class 类型
         1.类对象 以及元类对象的类型 都是 Class
         2.Class 是 struct objc_class * 结构体 指针
         */
        /* struct objc_class 结构体 组成解析
         */


        {1.Class isa;
            a.instance实例对象的isa指向class类对象
            b.class类对象的isa指向meta-class元类对象
            c.所有meta-class元类对象的isa指向基类的meta-class
            d.基类的meta-class元类对象的isa指向基类的class类对象（类方法最后成了对象方法）
        }
        {2.superclass
        1.实例对象的superclass--->父类————>基类(到顶)
        2.类对象的superclass--->父类的类对象————>基类的类对象
        3.元类对象的superclass--->父类的元类对象————>基类的元类对象
        4.基类的类对象的superclass = nil;
        5.基类的元类对象的superclass = 基类的类对象的
        }
    }
    { // meta-class对象（元类对象）
        /*
         每个类在内存中有且只有一个meta-class对象

         */
        NSObject *object1 = [[NSObject alloc] init];
        // 传递实例对象 获取类对象
        Class objectClass1 = object_getClass(object1);
         // 传递类对象 获取元类对象
        Class objectClass2 = object_getClass(objectClass1);
        // 判断是否是元类对象
        BOOL resule = class_isMetaClass(objectClass2);
    }
    { // class对象（类对象）
        /*
         1.每个类在内存中有且只有一个class对象
         */
        NSObject *object1 = [[NSObject alloc] init];
        Class objectClass0 = [NSObject class];
        Class objectClass1 = [object1 class];
        Class objectClass3 = object_getClass(object1);


    }
    {
        /* 1.Class objc_getClass(const char *aClassName)
         1> 传入字符串类名
         2> 返回对应的类对象
         */
        /*  2.object_getClass(id _Nullable obj) 的底层实现（根据参数对象的isa）
         1.如果是 实例对象 返回实例对象 isa 所指向的对象(类对象)
         2.如果是class对象，返回meta-class对象
         3.如果是meta-class对象，返回NSObject（基类）的meta-class对象
         */

        /* - (Class)class、+ (Class)class 的底层实现
         1> 返回的就是类对象
         - (Class) {
         return self->isa;
         }
         + (Class) {
         return self;
         }
         */
    }
    { // instance对象（实例对象）

        // NSobject 底层结构

    }



    
}

