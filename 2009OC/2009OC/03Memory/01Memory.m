//
//  01Memory.m
//  2009OC
//
//  Created by xs on 2019/1/28.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "01Memory.h"

@implementation _1Memory
+ (void)load{


}

@end

// https://www.jianshu.com/p/48665652e4e4


/** 为什么要内存管理
 1.使用 alloc、new、copy、mutableCopy 产生的对象存放的堆上，需要手动释放，不然会造成内存泄漏
 2.精确控制对象的 生成 与释放，避免造成野指针错误
 */

/**内存管理机制:采用的是引用计数式的内存管理方式
 1.retain 计数器主动加1/
 2.release/autorelease 计数器主动减1
 2.当计数器为0时候 会被系统自动回收
 */
/*
 a.retained return value
 b.unretained return value
 */
/**手动引用计数（MRC）
 alloc/new/copy/mutableCopy 实例化对象 系统会自动retain+1

 A.实例化变量的管理

 a.自己生成的对象，自己持有 自己release
 NSObject *obje = [[NSObject alloc]init];
 [obje release];

 b.不是自己生产的对象，无需释放
 id array = [NSMutableArray array];
 [array release];//报错

 c.不是自己生产的对象 可以持有，不用时候需要释放
 id array = [NSMutableArray array];
 [array retain];
 [array release];

 B.引用的变量的管理
 1.对同一个对象retain1次,最后就要release1次【set方法的正确写法】
 2MRC下@property 内存管理相关修饰词:
 1.retain:release1旧对象 ，retain新对象【适用于OC对象】
 2.copy:release1旧对象 ，copy新对象
 3.assign:直接赋值【适用于非OC对象】
 C.循环引用的管理
 1.让其中一方不要做retain操作即可
 */

/** Autorelease Pool
 http://blog.sunnyxx.com/2014/10/15/behind-autorelease/
 A.线程,内存栈,自动释放池,对象之间的关系
 线程与栈
 1.每一个线程（包括主线程）包含一个它自己的自动释放池对象的栈，线程终止的时候，它自动清空与它关联的所有的自动释放池。
 栈与池子
 2.一个新的被创建的池子，它们被添加当前线程栈顶位置。先进后出
 池子与对象
 3.被加入的对象被放在当前线程栈顶的自动释放池

 B.对象添加到池子中
 1.当一个对象收到autorelease消息的时候,它被添加到当前线程的处于栈顶的的自动释放池中
 3.一个对象能够被放到同一个池子中许多次，在这种情况下每放一次都会收到一个 release 消息。

 C.池子中对象的销毁
 1.在没有手加Autorelease Pool的情况下，Autorelease对象是在当前的runloop迭代结束时释放的，而它能够释放的原因是系统在每个runloop迭代中都加入了自动释放池Push和Pop
 2.在手动加入Autorelease Pool的情况下，当自动释放池被回收时,池子就从栈中被删除,并且会给池子里面的所有对象都会做一次release操作

 D.池子的创建于销毁:池子也是对象 也要遵循内存管理原则
 NSAutoreleasePool *pool = [[ NSAutoreleasePool alloc]init ];//创建一个自动释放池
 [pool release];

 E.MRC下的运用总结
 a.延长了变量的销毁，不需要精确担心在什么地方该释放
 b.延长的后果就是 如果使用了大量的比较占内存的变量 则会有内存负担
 */

/** Autorelease Pool 在MRC中的运用
 1.正常不用考虑在什么时候需要手动 release对象
 2.在系统的类方法中 将对象加入 Autorelease Pool 中
 3.疑问？retained return value/unretained return value的由来
 */


/*ARC实现本质
 1.还是遵守引用计数的内存管理原则, LLVM 和 runTime 系统相互协作的一个结果

 retained return value: 在代码块结束的时候进行了 release
 unretained return value:需要在运行时候看情况做处理
 原本:
 + (instancetype)createSark {
 return [self new]; //
 }
 Sark *sark = [Sark createSark];

 被改成:
 + (instancetype)createSark {
 id tmp = [self new];
 return objc_autoreleaseReturnValue(tmp); // 代替我们调用autorelease
 }

 id tmp = objc_retainAutoreleasedReturnValue([Sark createSark]) // 代替我们调用retain
 Sark *sark = tmp;
 objc_storeStrong(&sark, nil); // 相当于代替我们调用了release

 objc_autoreleaseReturnValue函数
 objc_retainAutoreleasedReturnValue函数
 这二个 函数的 核心思想:当返回值被返回之后，紧接着就需要被 retain 的时候，没有必要进行 autorelease + retain，直接什么都不要做就好了
 */


/**
 __strong:强指针
 1.表示强引用,当对象没有任何一个强引用指向它时，它才会被释放
 2.当需要释放强引用指向的对象时，需要保证所有指向对象强引用置为 nil
 3.如果在声明引用时不加修饰符，那么引用将默认是强引用
 */
static void test4(){

    //A.理解基础使用
    //1.__strong 浅显的理解会让对象引用计数器+1
    //2.__strong 修饰的指针可以对自己生成的对象自己持有和非自己生成的对象自己也能持有的效果
    //3.__strong 指针的重新赋值 或者 清空 或者 退出作用域 都能销毁原本持有的对象
    {
        NSObject __strong *obje = [[NSObject alloc]init];;
        NSArray __strong *obje2 = [NSArray array];

        NSLog(@"obje = %@\n",obje);

        obje = [[NSObject alloc]init];//重新赋值
        obje = nil;//清空
    }//退出作用域


    //B.与自动释放池
    // 1.体现上的作用是提前释放了局部产生的对象
    // 2.思考加入自动释放池的 强引用 什么时候释放的
    NSObject __weak *value ;
    @autoreleasepool{
        NSObject __strong *obje = [[NSObject alloc]init];;
        NSLog(@"@autoreleasepool.obje = %@",obje);
        value = obje;
        obje = nil; // 此时上面的对象被销毁了吗
        NSLog(@"value = %@",value);
    }

    //    强指针对指向的对象 到底做了什么（自身生成的 非自己生成的）
}

/**
 __weak
 A.属性
 1.表示弱引用,弱引用不会影响对象的释放，
 2.而当对象被释放时，所有指向它的弱引用都会自定被置为 nil，这样可以防止野指针。
 B.底层原理
 程序运行时将弱引用存到一个哈希表中，
 当对象obj要销毁的时候，哈希函数根据obj地址获取到索引，
 然后从哈希表中取出obj对应的弱引用集合weak_entries，遍历weak_entries并一一清空
 */
static void test41(){

    //A.基础使用
    //1.一个自己生成的对象实例化后就会被销毁
    NSObject __weak *obje = [[NSObject alloc]init];;

    //2.一个非自己生成的对象实例化后不会被销毁，被注册到 AutoreleasePool 中
    NSNumber __weak *number = [NSNumber numberWithInt:100];
    NSLog(@"number = %@", number);

    //2.运用地方 在 Block 中防止循环引用


    //B.与自动释放池
    //当我们访问weak修饰指针指向的对象时，实际上是访问注册到自动释放池的对象
    //在我们去访问weak修饰的对象时，会有大量对象注册到自动释放池,这会影响程序的性能
    //要访问weak修饰的变量时，先将其赋给一个strong变量，然后进行访问

}

/**
 __unsafe_unretained:
 1.iOS4以下没有 弱引用，__unsafe_unretained 修饰的指针纯粹只是指向对象，没有任何额外的操作
 2.当指向的对象被销毁时候不会被自动置为 nil，有成为野指针的风险
 3.在 ARC 环境下但是要兼容 iOS4.x 的版本，用__unsafe_unretained 替代 __weak 解决强循环循环的问题。
 */
static void test43(){

}

/**
 __autoreleasing
 1.将对象赋值给附有__autoreleasing修饰符的变量等同于MRC时调用对象的autorelease方法
 */
static void test44(){

}

/**
 @property 内存管理相关修饰词
 strong(OC对象):对应的所有权类型是 __strong
 copy(OC对象):对应的所有权类型是 __strong
 weak(OC对象):对应的所有权类型是 __weak
 assign(非OC对象):对应的所有权类型是 __unsafe_unretained
 */
static void test45(){
    /*
     copy与strong的区别(NSString,NSArray,NSDictionary):
     前提知识
     1.可不可变: copy 出来的都是不可变的，mutableCopy 出来的都是可变的，
     2.是不是新对象: NSArray copy 是浅拷贝，其余都是 深拷贝
     3.元素内容: 深拷贝 元素内容还是浅拷贝

     使用区别
     a.父类指针可以指向子类对象，使用copy的目的是为了对象有更好的封装性，不受外部影响。
     无论外部传入可变或不可变对象，本身持有一个不可变的副本。
     b.使用strong，属性可能指向可变对象，如果这个对象被外部更改，则该属性也会受到影响。
     c.最后是使用哪个，看是赋值之的时候 是希望 还是同一个 还是拷贝一份 不受 后续可变子类的影响


     weak的使用类型
     1.用来修饰指向由 Interface Builder 创建的控件
     2.在 Delegate 关系中防止循环引用
     3.给给他人使用 缺不想被他人强引用 需要用weak
     */

}


/**
 内存修饰符 修饰方法参数
 */
static void test46(){

}
/**
 self
 */
static void test49(){

}
/**
 block
 */
static void test29(){

}
/**
 GCD
 */
static void test99(){

}
/**
 非ARC管理的对象的内存管理、交叉转换注意、参数修饰
 */
static void test19(){
    /*
     ARC的有效范围
     a.有三种类型是ARC适用的：
     1.objective 对象，id, Class, NSError*等
     2.由attribute((NSObject))标记的类型
     3.block

     ARC的无效范围
     1.像double *,CFStringRef等不是ARC适用的，仍然需要手动管理内存。
     2.以CF开头的（Core Foundation）的对象往往需要手动管理内存



     Core Foundation 对象的内存管理
     1.// 创建一个 CTFontRef 对象
     CTFontRef fontRef = CTFontCreateWithName((CFStringRef)@"ArialMT", fontSize, NULL);
     2.// 引用计数加 1
     CFRetain(fontRef);
     3.// 引用计数减 1
     CFRelease(fontRef);

     Core Foundation 对象转换成一个 Objective-C 对象
     __bridge: 只做类型转换，不修改相关对象的引用计数，原来的 Core Foundation 对象在不用时，需要调用 CFRelease 方法。
     __bridge_retained：类型转换后，将相关对象的引用计数加 1，原来的 Core Foundation 对象在不用时，需要调用 CFRelease 方法。
     __bridge_transfer：类型转换后，将该对象的引用计数交给 ARC 管理，Core Foundation 对象在不用时，不再需要调用 CFRelease 方法。
     */
}
