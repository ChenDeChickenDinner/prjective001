//
//  Runloop.m
//  2019OC
//
//  Created by xs on 2019/2/28.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "Runloop.h"

@implementation Runloop

/**
 什么是RunLoop
 1.顾名思义，运行循环，在程序运行过程中循环做一些事情
 2.基本作用) 处理App中的各种事件:定时器（Timer）、PerformSelector 事件响应、手势识别、界面刷新
 节省CPU资源，提高程序性能：该做事时做事，该休息时休息
 3.支持的技术)GCD Async Main Queue,网络请求,AutoreleasePool
 */
- (void)test1{

}
/**
 RunLoop创建组成
 */
- (void)test2{
    {
        // RunLoop获取
        NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
        NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
        CFRunLoopRef mainRunLoop2 = CFRunLoopGetMain();
        CFRunLoopRef currentRunLoop2 = CFRunLoopGetCurrent();
    }
    {
        /** RunLoop与线程的关系
         1.每条线程都有唯一的一个与之对应的RunLoop对象
         2.RunLoop保存在一个全局的Dictionary里，线程作为key，RunLoop作为value
         3.线程刚创建时并没有RunLoop对象，RunLoop会在第一次获取它时创建
         4.RunLoop会在线程结束时销毁
         5.主线程的RunLoop已经自动获取（创建），子线程默认没有开启RunLoop
         */

    }
    {
        /*事件
         CFRunLoopSourceRef:
         Source0
         1.触摸事件处理
         2.performSelector:onThread:
         Source1
         1.系统事件捕捉，比如触摸先由Source1捕捉 再包装成Source0处理
         2.基于Port的线程间通信

         CFRunLoopTimerRef:
         1.NSTimer
         2.performSelector:withObject:afterDelay:

         CFRunLoopObserverRef:
         1.用于监听RunLoop的状态
         2.UI刷新（BeforeWaiting,睡眠之前刷新UI）
         3.Autorelease pool（BeforeWaiting，睡眠之前清理自动释放池）
         */
        /* 运行模式:CFRunLoopModeRef
         1.组成结构
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

        /*
         typedef struct __CFRunLoop * CFRunLoopRef;
         struct ____CFRunLoop{
         pthread_t _pthread;// 对应的线程
         CFMutableSetRef _commonModes;
         CFMutableSetRef _commonModeItems;
         CFRunLoopModeRef _currentMode;// 当前运行的模式
         CFMutableSetRef _modes;//当前RunLoop 中所有的运行模式
         }
         */

        /* 事件 模式 RunLoop之间的关系
         1.一个RunLoop包含若干个Mode，每个Mode又包含若干个Source0/Source1/Timer/Observer
         2.RunLoop启动时只能选择其中一个Mode，作为currentMode
         3.如果Mode里没有任何Source0/Source1/Timer/Observer，RunLoop会立马退出
         4.如果需要切换Mode，只能退出(内部切换)当前Loop，再重新选择一个Mode进入
         多模式好处:不同组的Source0/Source1/Timer/Observer能分隔开来，互不影响
         */

    }
}

/**
  RunLoop运行状态
 */
- (void)test4{
    // CFRunLoopObserverRef
    /**
     @param allocator#> 分配存储空间 默认 description#>
     @param activities#> 要监听的状态 description#>
     @param repeats#> 是否要持续监听 description#>
     @param order#> 0 description#>
     @param observer 观察者
     @param activity 观察到的状态
     @return
     */
    //01 创建观察者对象
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"runloop进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timer事件");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将进入休眠");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"runloop退出");
                break;

            default:
                break;
        }
    });

    //02 监听当前runloop的运行状态
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);

    [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];

    /*
     2019-02-27 20:23:34.850958+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 被唤醒
     2019-02-27 20:23:34.851165+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 处理收到的事件--timer--RUN
     2019-02-27 20:23:34.851294+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 即将处理timer事件
     2019-02-27 20:23:34.851379+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 即将处理source事件
     2019-02-27 20:23:34.851486+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 即将进入休眠
     */
}
/**
 RunLoop 运行流程
 */
- (void)test5{
    /*
     01、通知Observers：进入Loop
     02、通知Observers：即将处理Timers
     03、通知Observers：即将处理Sources
     04、处理Blocks
     05、处理Source0（可能会再次处理Blocks)
     06、如果存在Source1，就跳转到第8步
     07、通知Observers：开始休眠（等待消息唤醒）
     08、通知Observers：结束休眠（被某个消息唤醒）
     01> 处理Timer
     02> 处理GCD Async To Main Queue
     03> 处理Source1
     09、处理Blocks
     10、根据前面的执行结果，决定如何操作
     01> 回到第02步
     02> 退出Loop
     11、通知Observers：退出Loop
     */
}

/**
 RunLoop底层实现
 */
- (void)test32{

}
- (void)test3{

    //UIApplicationMain(); APP main 方法中会调用UIApplicationMain 函数，其内部会开启一个RunLoop
    { // RunLoop基本实现
        int retVal = 0;
        do {
            // 处理消息
            // 睡眠等待消息
        } while (0 == retVal);
    }
    { // RunLoop睡眠
        /* RunLoop睡眠的实现:睡眠会阻塞线程，后面的代码就不执行了，而且线程是真正的什么事都没有做
         1.while (1); 这种阻塞虽然能保证后面的不执行，但线程还是在不断的运行干活
         2.RunLoop睡眠的实现，利用的是内核底层的API:mach_msg(),一旦调用mach_msg 就让程序进入内核态，一旦有消息就回到用户态
         */
    }

    { //RunLoop的退出
        { // 一次 runMode,当前所有任务执行完后就退出

            NSThread *thread = [[NSThread alloc]initWithBlock:^{
                NSLog(@"1");
                { // 这个RunLoop的睡眠等待 可以让当前线程不立即退出，再执行完一次test32任务后才释放
                    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
                    [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
                }

            }];
            [thread start];
            [self performSelector:@selector(test32) onThread:thread withObject:nil waitUntilDone:NO];

        }
        { //  当前所有任务执行完后，根据条件 是否runMode,否，则RunLoop退出
            /* 能真正让RunLoop退出的 运行写法

             __weak typeof(self) weakSelf = self;
             [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc] init] forMode:NSDefaultRunLoopMode];
             while (weakSelf && !weakSelf.isStoped) {
             [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
             }
             // 这样才能真正让RunLoop退出
             weakSelf.isStoped = YES;
             CFRunLoopStop(CFRunLoopGetCurrent());
             */
        }

        { // 当前所有任务执行完后，无限循环 runMode，NSRunLoop永不退出
            // NSRunLoop的run方法是无法停止的，它专门用于开启一个永不销毁的线程（NSRunLoop）
            /* run内部:在不断的循环调用 runMode 方法
             while (1) {
             [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
             }
             */
            [[NSRunLoop currentRunLoop] run];

            // 停止RunLoop,此停止只是 一次 runMode,因为 原生 run 内部的实现，即使Stop 也只能Stop一次runMode方法，下次还是会继续 runMode
            CFRunLoopStop(CFRunLoopGetCurrent());
        }
    }




}

@end
