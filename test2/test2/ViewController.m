//
//  ViewController.m
//  test2
//
//  Created by xs on 2021/3/24.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
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

/* RunLoop与运行模式之间的关系
1.一个RunLoop包含若干个Mode，多模式好处:不同组的Source0/Source1/Timer/Observer能分隔开来，互不影响
2.RunLoop运行时只能选择其中一个Mode，作为currentMode,不在当前模式内的事件源不会处理
3.如果需要切换Mode，只能退出(内部切换)当前Loop，再重新选择一个Mode进入

*/
- (void)test4{
//    系统为我们提供了多种模式,下面列一些比较常遇到的：

//    在刚启动 App 时第进入的第一个 Mode，启动完成后就不再使用。
//    NSRunLoopMode defmode1 = UIInitializationRunLoopMode;
//    App的默认 Mode，通常主线程是在这个 Mode 下运行的
    NSRunLoopMode defmode2 =  NSDefaultRunLoopMode;
//    界面跟踪 Mode，用于 ScrollView 追踪触摸滑动，保证界面滑动时不受其他 Mode 影响
    NSRunLoopMode defmode3 = UITrackingRunLoopMode;
//    包含了多种模式：default modal, 和tracking modes,不是一种真的模式，是一种标记
    NSRunLoopMode defmode4 = NSRunLoopCommonModes;

}
/* 运行模式 与Source之间的关系
 struct __CFRunLoopMode{
 CFStringRef _name;
 CFMutableSetRef _sources0;//CFRunLoopSourceRef
 CFMutableSetRef _sources1;//CFRunLoopSourceRef
 CFMutableArrayRef _timers;//CFRunLoopTimerRef
 CFMutableArrayRef _observers;//CFRunLoopObserverRef
 }
1.每种模式中又包含若干个Source0/Source1/Timer/Observer，以来处理这些事件源
2.当前运行的Mode中没有任何Source0/Source1/Timer/Observer，RunLoop会立马退出
 */
- (void)test5{
    
}
/* 各种事件源
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
/* RunLoop的获取

*/
- (void)test71{
    NSRunLoop *mainRunLoop = [NSRunLoop mainRunLoop];
    NSRunLoop *currentRunLoop = [NSRunLoop currentRunLoop];
    NSRunLoopMode currentMode = currentRunLoop.currentMode;
    NSLog(@"currentMode = %@",currentMode);
}
/* RunLoop 状态的监听
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

/* RunLoop的 运用 NSTimer
 https://www.jianshu.com/p/ac05ac8428ac
*/
- (void)test74{
    /* 只能在当前模式下运行
     1.创建一个定时器添加到当前线程中的Runloop 的默认模式中  (scheduled:计划)
     2.当Runloop每循环一次检查达到时间间隔后，执行一次代码（受RunLoop处理其它事件的影响）
     3.SO:在主线程中可以正常执行，在子线程中需要创建运行起Runloop才能执行
     */
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {

    }];
    
    // 可以在所有模式下运行
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

/**RunLoop的 运用
 performSelector
 */
- (void)test75{

    //@protocol NSObject
    [self performSelector:@selector(hash)];
    [self performSelector:@selector(hash) withObject:nil];
    [self performSelector:@selector(hash) withObject:nil withObject:nil];
    
    
    //NSObject (NSDelayedPerforming) runloop相关
    [self performSelector:@selector(hash) withObject:nil afterDelay:0.2];
    [self performSelector:@selector(hash) withObject:nil afterDelay:0.2 inModes:@[]];
    [NSObject cancelPreviousPerformRequestsWithTarget:self]; //取消已设置的延迟执行
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hash) object:nil];
    
    //NSObject (NSThreadPerformAdditions)线程
    [self performSelectorInBackground:@selector(hash) withObject:nil];
    [self performSelectorOnMainThread:@selector(hash) withObject:nil waitUntilDone:YES];
    [self performSelectorOnMainThread:@selector(hash) withObject:nil waitUntilDone:YES modes:nil];
    [self performSelector:@selector(hash) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES];
    [self performSelector:@selector(hash) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES modes:nil];

}
/**RunLoop的 运用
 常驻线程
 */
- (void)test76{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self test72];
}



@end
