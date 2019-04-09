//
//  RunLoopComposition.m
//  2019OC2
//
//  Created by xs on 2019/3/5.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "RunLoopComposition.h"

@implementation RunLoopComposition
/** 事件
 【CFRunLoopSourceRef】:
 Source0
 1.触摸事件处理
 2.performSelector:onThread:
 Source1
 1.系统事件捕捉，比如触摸先由Source1捕捉 再包装成Source0处理
 2.基于Port的线程间通信

 【CFRunLoopTimerRef】:
 1.NSTimer
 2.performSelector:withObject:afterDelay:

 【CFRunLoopObserverRef】:
 1.用于监听RunLoop的状态
 2.UI刷新（BeforeWaiting,睡眠之前刷新UI）
 3.Autorelease pool（BeforeWaiting，睡眠之前清理自动释放池）
 */
- (void)test1{

}
/** 运行模式:【CFRunLoopModeRef】
 typedef struct __CFRunLoopMode * CFRunLoopModeRef;
 struct __CFRunLoopMode{
 CFStringRef _name;
 CFMutableSetRef _sources0;//CFRunLoopSourceRef
 CFMutableSetRef _sources1;//CFRunLoopSourceRef
 CFMutableArrayRef _timers;//CFRunLoopTimerRef
 CFMutableArrayRef _observers;//CFRunLoopObserverRef
 }
 2.:常见的2种Mode
 NSDefaultRunLoopMode：App的默认Mode，通常主线程是在这个Mode下运行
 UITrackingRunLoopMode：界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
 */

- (void)test2{

}

/** RunLoop对象:【CFRunLoopRef】
 typedef struct __CFRunLoop * CFRunLoopRef;
 struct ____CFRunLoop{
 pthread_t _pthread;// 对应的线程
 CFMutableSetRef _commonModes;
 CFMutableSetRef _commonModeItems;
 CFRunLoopModeRef _currentMode;// 当前运行的模式
 CFMutableSetRef _modes;//当前RunLoop 中所有的运行模式
 }
 1.顾名思义，运行循环，在程序运行过程中循环做一些事情
 2.基本作用) 处理App中的各种事件:定时器（Timer）、PerformSelector 事件响应、手势识别、界面刷新
 节省CPU资源，提高程序性能：该做事时做事，该休息时休息
 3.支持的技术)GCD Async Main Queue,网络请求,AutoreleasePool
 */
- (void)test3{

}
/** RunLoop与线程之间的关系
 1.每条线程都有唯一的一个与之对应的RunLoop对象
 2.RunLoop保存在一个全局的Dictionary里，线程作为key，RunLoop作为value
 3.线程刚创建时并没有RunLoop对象，RunLoop会在第一次获取它时创建
 4.RunLoop会在线程结束时销毁
 5.主线程的RunLoop已经自动获取（创建），子线程默认没有开启RunLoop
 */

/**  RunLoop与事件模式之间的关系
 1.一个RunLoop包含若干个Mode，每个Mode又包含若干个Source0/Source1/Timer/Observer
 2.RunLoop启动时只能选择其中一个Mode，作为currentMode
 3.如果Mode里没有任何Source0/Source1/Timer/Observer，RunLoop会立马退出
 4.如果需要切换Mode，只能退出(内部切换)当前Loop，再重新选择一个Mode进入
 多模式好处:不同组的Source0/Source1/Timer/Observer能分隔开来，互不影响
 */
- (void)test4{

}

/**
 RunLoop对象获取
 */
- (void)test5{
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    CFRunLoopRef mainRunLoop2 = CFRunLoopGetMain();
    CFRunLoopRef currentRunLoop2 = CFRunLoopGetCurrent();
}
@end
