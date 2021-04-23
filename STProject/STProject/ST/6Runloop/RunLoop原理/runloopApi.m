//
//  runloopApi.m
//  test2
//
//  Created by xs on 2021/3/25.
//

#import "runloopApi.h"

@implementation runloopApi
/*什么是Runloop
 1.保持程序的持续运行;
 2.处理App中的各种事件;
 3.节省CPU资源，提高程序性能;
 */
- (void)test1{
 
}
/*Runloop的数据结构
 struct ____CFRunLoop{
 pthread_t _pthread;// 对应的线程
 CFMutableSetRef _commonModes;
 CFMutableSetRef _commonModeItems;
 CFRunLoopModeRef _currentMode;// 当前运行的模式
 CFMutableSetRef _modes;//当前RunLoop 中所有的运行模式
 }
 */
- (void)test2{
    
}
/*RunLoop与线程之间的关系
 1.每条线程都有唯一的一个与之对应的RunLoop对象
 2.RunLoop保存在一个全局的Dictionary里，线程作为key，RunLoop作为value
 3.线程刚创建时并没有RunLoop对象，RunLoop会在第一次获取它时创建
 4.RunLoop会在线程结束时销毁
 5.主线程的RunLoop已经自动获取（创建），子线程默认没有开启RunLoop
 */
- (void)test3{
    
}
/* 程序中的各种事件源
【CFRunLoopSourceRef】:输入源/事件源
 Source0
     1.触摸事件处理
     2.performSelector:onThread:
 Source1
     1.系统事件捕捉，比如触摸先由Source1捕捉 再包装成Source0处理
     2.基于Port的线程间通信

【CFRunLoopTimerRef】: 定时源
     1.NSTimer
     2.performSelector:withObject:afterDelay:
 
【CFRunLoopObserverRef】:观察者
     1.用于监听RunLoop的状态
     2.UI刷新（BeforeWaiting,睡眠之前刷新UI）
     3.Autorelease pool（BeforeWaiting，睡眠之前清理自动释放池）
 */
- (void)test6{
 
}
/* RunLoop运行模式
 struct __CFRunLoopMode{
 CFStringRef _name;
 CFMutableSetRef _sources0;//CFRunLoopSourceRef
 CFMutableSetRef _sources1;//CFRunLoopSourceRef
 CFMutableArrayRef _timers;//CFRunLoopTimerRef
 CFMutableArrayRef _observers;//CFRunLoopObserverRef
 }
 
 系统为我们提供了多种模式,下面列一些比较常遇到的：
 UIInitializationRunLoopMode:在刚启动 App 时第进入的第一个 Mode，启动完成后就不再使用
 NSDefaultRunLoopMode :App的默认模式 ，通常主线程是在这个 Mode 下运行的
 UITrackingRunLoopMode:界面跟踪模式 ，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
 NSRunLoopCommonModes:占位模式，包含了多种模式：default modal, 和tracking modes,不是一种真的模式，是一种标记
 
 RunLoop与运行模式之间的关系
 1.一个RunLoop包含若干个Mode，不同的事件源由不同的模式来处理
 2.RunLoop运行时只能选择其中一个Mode，作为currentMode,不在当前模式内的事件源不会处理
 3.如果需要切换Mode，只能退出(内部切换)当前Loop，再重新选择一个Mode进入

 
 
 运行模式 与 Source的关系
0.app内的所以事件都是默认会添加到一种模式中；
1.我们也可以将一些Source主动的添加到指定的模式中，所以一种模式中可能存在多个多种事件源
2.当前运行的Mode中没有任何Source0/Source1/Timer/Observer，RunLoop会立马退出
 */
- (void)test5{
        

 
}
/* RunLoop处理事件
1.RunLoop处理事件 是看模式的，串行的，根据情况自动切换模式
 串行:在当前运行的模式中的事件源都是一个个串行执行的
 看模式:当来了一个属于当前运行模式的事件，且自己本身有任务执行 则会丢弃不响应
 模式切换:
 比如:当前正常默认模式下处理一个耗时操作：
 a.来一个触摸滑动事件，滑动是属于另外一个模式，此时是无法响应的
 b.来了一个点击事件，此时也是无法立即响应的，可能会加入到下一个循环中，当之前的事件处理完再处理这个，可能也会直接丢失
 b.来了一个定时器事件，则要看这个定时器是否在当前这个模式中
*/

- (void)test4{


}


/* RunLoop的获取

*/
- (void)test71{
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    NSRunLoopMode currentMode = currentRunLoop.currentMode;
    NSLog(@"currentMode = %@",currentMode);
}

- (void)test72{
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

    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];
}
- (void)timerRun{
    NSLog(@"执行任务");
}
/* RunLoop的创建 添加事件源 运行 睡眠 中断 销毁 ---生命周期

*/
- (void)test73{
    static BOOL shouldKeepRunning = YES;

    [[NSThread alloc]initWithBlock:^{
        // 1.获取当前线程的RunLoop对象，无自自动创建
        NSRunLoop *loop = [NSRunLoop currentRunLoop];
        
        {
            // 2.添加事件源到 RunLoop 中，保证RunLoop启动后不退出
            [loop addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
            
            NSTimer *timer =  [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
                NSLog(@"定时器执行任务");
            }];
            // 2.添加事件源到 RunLoop 中，保证RunLoop启动后不退出
            [loop addTimer:timer forMode:NSRunLoopCommonModes];
        }
 
        {  //3.启动RunLoop的三种情况
           

           // 1.以某个模式运行一个循环后就退出（1次）
           [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];

           //2.以某个模式根据条件决定是否一直循环运行
           while (shouldKeepRunning) {
               [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
           }

           /*3是无限循环 runMode，NSRunLoop永不退出，它专门用于开启一个永不销毁的线程
            run 的内部实现就是
            while (1) {
            [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
            */
           [loop run];
           // 到某个时间 退出无限循环
            [loop runUntilDate:[NSDate distantFuture]];

        }
        { // 4.睡眠
            // 当RunLoop在一次循环中执行完所有的事件，就会进入睡眠状态，直到被新消息唤醒
        }
        { // 5.停止
            // 仅仅只能主动中断一次 runMode:  的运行，SO:通过 run 启动的RunLoop是中断不掉的
            CFRunLoopStop(CFRunLoopGetCurrent());
        }
        { // 6.销毁退出

            /*
             1.设置最大时间到期：推荐使用这种方式
             2.modeItem(事件源)为空：但并不推荐这样退出，因为一些系统的Item我们并不知道
             3.调用CFRunLoopStop，退出runloop并将程序控制权交给调用者（如果runloop有嵌套，则只退出最内层runloop），
               一些情况下，CFRunLoopStop并不能真正的退出runloop
             */
        }
        
    }];
}

@end
