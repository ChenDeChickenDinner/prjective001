//
//  allocInit.m
//  StudyChen
//
//  Created by xs on 2017/5/15.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "allocInit.h"

@implementation allocInit

@end
/*
 
 实践:从程序运作【从编译器读项目配置-检测-预编译。。。。。做了什么】

 实践:从程序运作 类-对象-成员变量 这一些列 系统自身做了哪些事情，掉了哪些方法 ，调用时机，调用顺序，调用次数





 内存管理
 【A】基础理论
 1：为什么需要内存管理 NSObject *p = [NSObject alloc]init];
    a:左边的 p 是 局部变量 存在 栈 中 由系统自动管理回收，右边的对象是放在堆里面的 需求开发人员手动管理回收
    b:栈空间的指针 指向 堆空间的某个对象地址
 2:对象回收的依据
    a:每个对象内部 分配 4个字节 给 自己的引用计数器，当计算器为0时候系统就会回收 调用对象的 dealloc 方法
 3:引用计数器
    a:alloc ,new ...对象产生的时候 默认为 1
    b:给对象发一条 retain 消息 计数器 +1;release 消息- 1;
    c:查看 对象的 计数器 retainCount

 4:僵尸对象，野指针，空指针
   a:当一个对象被回收了，此对象就是僵尸对象 ，；
   b:野指针，指针还在，但指向僵尸对象的指针为野指针，野指针本身没有错，野指针发消息会报错；指针在{}结束后由系统回收
   c:空指针，指针还在，且没有指向任何东西的指针，空指针发消息没有问题，指针在{}结束后由系统回收
   d:僵尸对象 检测开关
 
 
 
 【B】实际运用
 1:只要调用了 alloc ，必须release，alloc 出来的对象 最好有指针 可以release
 2:set 方法规范（基本数据类型 直接赋值，对象类型 需要做判断，对旧对象 release ，新对象 retain）
 3:dealloc 方法中 release 自己所持有的对象

 
 
 
 【C】 @property 的修饰关键字
 1:多线程管理
 
 
 
 
 
 
 
 

 


 OC 的数据类型
 
 block

 OC 的关键字
 
 基本函数
    NSLog

 NSObject api 接口整理
 a:加载初始化对象
 
 Foundation框架
 */
