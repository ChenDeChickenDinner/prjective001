//
//  Autoreleasepool.m
//  2019OC2
//
//  Created by xs on 2019/3/5.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "Autoreleasepool.h"
/** Autorelease Pool



 A.线程,内存栈,自动释放池
 线程与栈
 1.每一个线程（包括主线程）包含一个它自己的自动释放池对象的栈，线程终止的时候，它自动清空与它关联的所有的自动释放池。
 栈与池子
 2.一个新的被创建的池子，它们被添加当前线程栈顶位置。先进后出

 3.池子的创建销毁
 NSAutoreleasePool *pool = [[ NSAutoreleasePool alloc]init ];//创建一个自动释放池
 [pool release];

 池子与对象
 3.被加入的对象被放在当前线程栈顶的自动释放池

 B.对象添加到池子中
 1.当一个对象收到autorelease消息的时候,它被添加到当前线程的处于栈顶的的自动释放池中
 3.一个对象能够被放到同一个池子中许多次，在这种情况下每放一次都会收到一个 release 消息。

 C.池子中对象的销毁
 1.在没有手加Autorelease Pool的情况下，Autorelease对象是在当前的runloop迭代结束时释放的，而它能够释放的原因是系统在每个runloop迭代中都加入了自动释放池Push和Pop
 2.在手动加入Autorelease Pool的情况下，当自动释放池被回收时,池子就从栈中被删除,并且会给池子里面的所有对象都会做一次release操作



 E.总结
 MRC下的运用
 a.延长了变量的销毁，不需要精确担心在什么地方该释放
 b.延长的后果就是 如果使用了大量的比较占内存的变量 则会有内存负担
 ARC下的运用
 a.使用局部自动释放池块降低最大内存占用率
 */
@implementation Autoreleasepool

/**
 自动释放池与线程
 1.Cocoa应用程序的每个线程都维持它们自己的自动释放池块栈
 2.如果你正在写一个只使用了基础类库的程序，或者当你在分发一个新的线程的时候，你需要创建自己的自动释放池块。
 3.如果你的程序或者线程是长时间活跃的，并且有可能会生成大量自动释放对象，那么你应该使用自动释放池块
 */
- (void)test1{

}
/**
 自动释放池与RunLoop
iOS在(主线程)的Runloop中注册了2个Observer
A.第1个Observer监听了kCFRunLoopEntry事件，会调用objc_autoreleasePoolPush():
1.Runloop一启动就注册一个 自动释放池

第2个Observer
B.监听了kCFRunLoopBeforeWaiting事件，会调用objc_autoreleasePoolPop()、objc_autoreleasePoolPush():
1.Runloop在一次睡眠之前，会先清理销毁上次注册的自动释放池，再注册一个新的
C.监听了kCFRunLoopBeforeExit事件，会调用objc_autoreleasePoolPop():
1.Runloop在退出的时候 会清理销毁上次注册的自动释放池
 */
- (void)test2{

}
@end
