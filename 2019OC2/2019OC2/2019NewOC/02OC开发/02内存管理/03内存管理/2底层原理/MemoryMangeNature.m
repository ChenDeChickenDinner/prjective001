//
//  MemoryMangeNature.m
//  2019OC2
//
//  Created by xs on 2019/3/2.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "MemoryMangeNature.h"

@implementation MemoryMangeNature

@end

/** 为什么要内存管理
 1.使用 alloc、new、copy、mutableCopy 产生的对象存放的堆上，需要手动释放，不然会造成内存泄漏
 2.精确控制对象的 生成 与释放，避免造成野指针错误
 */

/**
 内存管理依据
 1.采用的是引用计数式的内存管理方式
 2.在64bit中，引用计数可以直接存储在优化过的isa指针中，也可能存储在SideTable类中
 struct SideTable {
 spinlock_t slock;
 RefcountMap refcnts;
 weak_table_t weak_table;
 3.refcnts是一个存放着对象引用计数的散列表
 }
 */
static void test1(){

}

/**
 计算器的操作
 1.retain 计数器主动加1
 2.release 计数器主动减1
 2.当计数器为0时候 会被系统自动回收
 */
static void test2(){

}

/**
 指针之间的赋值:
 */
static void test01(){
    /* 一段代码 二块内存
     1.声明(代码块，参数，返回值)指针变量:永远在栈上，出作用域被系统自动销毁
     2.内存分配对象:在堆上，要通过栈上的指针 操作管理其生命周期
     */
    Person *person1 = [[Person alloc]init];
    NSLog(@"person1地址=%p,person1-->地址=%p\n",&person1,person1);

    /*
     操作1指针赋值指向堆上的对象:
     把地址赋值给新指针保存，地址是怎么来的？(a.取指针指向的地址/b.取指针自身的地址)
     */
    Person *person2 = person1;// 取指针指向的地址
    Person **person3 = &person1;// 取指针自身的地址
    NSLog(@"person2地址=%p,person2-->地址=%p\n",&person2,person2);
    NSLog(@"person3地址=%p,person3-->地址=%p\n",&person3,person3);

    /*
     操作2:通过指针查看操作堆上的对象:
     a.操作发起者，栈上的指针变量 b.被操作者，堆上的对象c.信息反馈者，堆上的对象
     b.指针能拿到对象 跟能影响对象的引用计算器 是二码事
     c.如果 栈上所有指向对象的指针，在全部被销毁的时候，没有洽时操作回收对象，就内存泄露了
     */
    NSUInteger count1 =  [person1 retainCount];// 查看的是堆上的对象
    NSUInteger count2 =  [person2 retainCount];// 查看的是堆上的对象
    //NSUInteger count3 =  [person3 retainCount];// 运行报错，他指向的不是对象
}

/**
 指针作为参数返回值流转赋值:
 */
static Person * test021(Person *p){
    /*
     1.p 是新的临时指针变量
     */
    NSLog(@"参数P地址=%p,参数P-->地址=%p\n",&p,p);
    /*
     2.返回p,其实是返回的 p所指向的地址
     */
    return p;
}
static void test022(){
    Person *person1 = [[Person alloc]init];
    NSLog(@"person1地址=%p,person1-->地址=%p\n",&person1,person1);
    Person *person2 = test021(person1);
    NSLog(@"person2地址=%p,person2-->地址=%p\n",&person2,person2);
    [person1 release];
}
/**
 原理性的管理操作
 1.只要指针能操作对象，不管是谁 操作了几次 都无影响，只要能正确管理对象的生命周期(操作:带有内存管理影响的操作)
 */
static void test0(){
    Person *p1 = [[Person alloc]init];
    Person *p2 = p1;
    Person *p3 = p2;
    [p2 retain];
    [p2 retain];

    [p3 release];
    [p3 release];
    [p3 release];//-[Person dealloc]
    NSLog(@"%s\n",__func__);
}
/**
 规范性的管理操作
 1.想拥有某个对象，就让它的引用计数+1；不想再拥有某个对象，就让它的引用计数-1
 */
static void test1(){
    Person *p1 = [[Person alloc]init];
    Person *p2 = p1;
    [p2 retain];

    [p1 release];
    [p2 release];//-[Person dealloc]
    NSLog(@"%s\n",__func__);
}


/**
 函数中 临时变量对对象引用计算器的操作
 */
static void test21(Person *p1){
    NSLog(@"%s-begin\n",__func__);
    Person *p2 = p1;
    NSLog(@"%s-end\n",__func__);
}
static void test22(Person *p1){
    NSLog(@"%s-begin\n",__func__);
    [p1 release];
    NSLog(@"%s-end\n",__func__);
}
static void test23(Person *p1){
    NSLog(@"%s-begin\n",__func__);
    Person *p2 = p1;
    [p2 release];
    NSLog(@"%s-end\n",__func__);
}

/**
 规范性的函数内内存管理
 */
static Person * test24(Person *p1){
    NSLog(@"%s-begin\n",__func__);
    NSLog(@"参数p1的地址 = %p\n",&p1);
    [p1 retain]; // 使用前 先保证对象不会在其他地方销毁 先retain一次

    [p1 release];// 最后不使用了再release一次
    NSLog(@"%s-end\n",__func__);
    return p1;
}

static void test20(){

    {   // 1.参数 传递进去，仅仅赋值操作，对原对象的计数器无影响
        Person *p1 = [[Person alloc]init];
        test21(p1);  // 执行完 无 影响
        [p1 release]; // 执行完 对象被释放
    }

    {   // 1.参数 传递进去，利用指针进行一次 release 操作
        Person *p1 = [[Person alloc]init];
        test22(p1);// 执行完对象被释放
    }
    {   // 1.参数 传递进去，利用指针流转再进行一次 release 操作
        Person *p1 = [[Person alloc]init];
        test23(p1);// 执行完对象被释放
    }

    {   // 1.参数 传递进去，利用指针流转再进行一次 release 操作
        Person *p1 = [[Person alloc]init];
        Person *p2 = test24(p1);
        [p1 release]; // 执行完对象被释放
    }
    NSLog(@"%s-end\n",__func__);

}

/**
指针-对象-引用计数器
 */
static void test3(){

    //指针对堆上对象的引用计算器造成影响的操作:
    /*MRC下的流转内存管理
     1.划重点：只看 指针变量有没有 主动对其retain/release
     2.SO 没有什么指针 内存相关的修饰符
     3.示例解释
     */
    /*ARC下的流转内存管理
     1.划重点：只看 指针变量在引用的时候 是什么类型的，SO 指针 有内存相关的修饰符
     2.在流转过程中 编译器帮 我们做了 retain/release 操作
     3.示例解释
     */

    /*指针操作对象总结:
     a.只要指针能操作对象，不管是谁 操作了几次 都无影响，只要能正确管理对象的生命周期(操作:带有内存管理影响的操作)

     b.为了编写规范，一般遵从以下操作原则
         b1.当调用alloc、new、copy、mutableCopy方法返回了一个对象，在不需要这个对象时，要调用release或者autorelease来释放它
         b2.想拥有某个对象，就让它的引用计数+1；不想再拥有某个对象，就让它的引用计数-1
         a.MRC下，主动retain了才算拥有
         b.ARC下，强引用了就算拥有
     */
}

