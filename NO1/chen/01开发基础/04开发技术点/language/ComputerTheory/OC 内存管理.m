//
//  OC 内存管理.m
//  StudyChen
//
//  Created by xs on 2017/5/22.
//  Copyright © 2017年 Touker. All rights reserved.
//
#import<Foundation/Foundation.h>

@interface CABC4 : NSObject

@end

@implementation CABC4

@end
/*
 
 内存管理
 【A】基础理论(为什么需要内存管理 )
 *NSObject *p = [NSObject alloc]init];
 a:左边的 p 是 局部变量 存在 栈 中 由系统自动管理回收，右边的对象是放在堆里面的 需求开发人员手动管理回收
 b:栈空间的指针 指向 堆空间的某个对象地址

 【B】:僵尸对象，野指针，空指针（开发注意）
 a:当一个对象被回收了，此对象就是僵尸对象 ，；
 b:野指针，指针还在，但指向僵尸对象的指针为野指针，野指针本身没有错，野指针发消息会报错；指针在{}结束后由系统回收
 c:空指针，指针还在，且没有指向任何东西的指针，空指针发消息没有问题，指针在{}结束后由系统回收





 【 MRC 】下内存管理的对象回收的依据
 *:当计数器为0时候系统就会回收 调用对象的 dealloc 方法


 1:引用计数器
 *a:每个对象内部 分配 4个字节 给 自己的引用计数器，alloc ,new ...对象产生的时候 默认为 1
 *:给对象发一条 retain 消息 计数器 +1;release 消息- 1;
 *:查看 对象的 计数器 retainCount


 2:自动释放池@autoreleasepool
 *在对象创建的时候就将其放入自动释放池中
 *好处 不用关心 什么时候 release
 *坏处 不能精确控制对象的及时释放，适合占用内存小的对象
 *系统自动的创建方法中没有包含alloc new copy，说明返回的对象都是 autorelease的



 3:实际运用
 *生成 只要调用了 alloc new copy
 *release  必须在对象使用完之后 再 release，若在 release 之后还使用对象，会造成野指针错误
 *autorelease  将对象 放到 自动释放池，在池子销毁的时候对对象做一次release操作
 *持有 当一个对象 持有另一个对象时候
 * 在 set 方法规范（需要做判断，对旧对象 release ，新对象 retain）【d:对象循环引用问题，一边用 retain 一边用assign】
 * 在 dealloc 方法中 release 自己所持有的对象






 【 ARC 】下内存管理的对象回收的依据，
 *当一个对象无强指针指向他的时候 就会被系统回收

 1:强指针，弱指针
 * __strong /strong 默认情况下，所以的指针都是强指针
 * __weak  / weak 只要弱指针 指向的对象被回收 则系统会自动把指针置空

 2:alloc 后 不用releaes 对象，retain---strong，不用在dealloc 中对持有的对象releaes


 3:本质 是编译器功能 在编译阶段帮我们生成了对应的代码




 【内存管理总结】
 *及时 回收 不用的对象、
 *小心循环引用
 *小心野指针错误



 */
