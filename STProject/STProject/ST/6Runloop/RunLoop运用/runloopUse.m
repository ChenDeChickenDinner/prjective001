//
//  runloopUse.m
//  test2
//
//  Created by xs on 2021/3/25.
//

#import "runloopUse.h"

@implementation runloopUse
+ (void)load{
    
}
/** 自动释放池
 主线程中RunLoop与AutoreleasePool:
 iOS在(主线程)的Runloop中注册了2个Observer
 A.第1个Observer监听了kCFRunLoopEntry事件，会调用objc_autoreleasePoolPush():
 1.Runloop一启动就注册一个 自动释放池

 第2个Observer
 B.监听了kCFRunLoopBeforeWaiting事件，会调用objc_autoreleasePoolPop()、objc_autoreleasePoolPush():
 1.Runloop在一次睡眠之前，会先清理销毁上次注册的自动释放池，再注册一个新的
 C.监听了kCFRunLoopBeforeExit事件，会调用objc_autoreleasePoolPop():
 1.Runloop在退出的时候 会清理销毁上次注册的自动释放池
 */
+ (void)load1{

}

// GCD
+ (void)load4{
    
    /*
     如当调用了 dispatch_async(dispatch_get_main_queue(), block)时，
     主队列会把该 block 放到对应的线程（恰好是主线程）中，主线程的 RunLoop 会被唤醒，
     从消息中取得这个 block，回调 CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE() 来执行这个 block
     */
    dispatch_async(dispatch_get_main_queue(), ^{

    });
}
/* UI更新
 1.即准备进入睡眠和即将退出 loop 两个时间点，会调用函数更新 UI 界面.
 2.当在操作 UI 时，某个需要变化的 UIView/CALayer 就被标记为待处理，
 3.然后被提交到一个全局的容器去，再在上面的回调执行时才会被取出来进行绘制和调整。
 4.所以如果在一次运行循环中想用如下方法设置一个 view 的两条移动路径是行不通的。
 5.因为它会把视图的属性变化汇总起来，直接让 myView 从起点移动到终点了：

 */
+ (void)load5{
//    CGRect frame = self.myView.frame;
//    // 先向下移动
//    frame.origin.y += 200;
//    [UIView animateWithDuration:1 animations:^{
//    self.myView.frame = frame;
//    [self.myView setNeedsDisplay];
//    }];
//    // 再向右移动
//    frame.origin.x += 200;
//    [UIView animateWithDuration:1 animations:^{
//        self.myView.frame = frame;
//        [self.myView setNeedsDisplay];
//    }];
}
/*
 事件响应

 苹果注册了一个 Source1 (基于 mach port 的) 用来接收系统事件，其回调函数为 __IOHIDEventSystemClientQueueCallback()。
 当一个硬件事件(触摸/锁屏/摇晃等)发生后，首先由 IOKit.framework 生成一个 IOHIDEvent 事件并由 SpringBoard 接收。
 SpringBoard 只接收按键(锁屏/静音等)，触摸，加速，接近传感器等几种 Event，随后用 mach port 转发给需要的App进程。
 随后苹果注册的那个 Source1 就会触发回调，并调用_UIApplicationHandleEventQueue() 进行应用内部的分发。
 _UIApplicationHandleEventQueue() 会把 IOHIDEvent 处理并包装成 UIEvent 进行处理或分发，其中包括识别 UIGesture/处理屏幕旋转/发送给 UIWindow 等。通常事件比如 UIButton 点击、touchesBegin/Move/End/Cancel 事件都是在这个回调中完成的

 */
+ (void)load7{
    
}
/*
 手势识别

 1.当 _UIApplicationHandleEventQueue() 识别了一个手势时，
 2.其首先会调用 Cancel 将当前的 touchesBegin/Move/End 系列回调打断。
 3.随后系统将对应的 UIGestureRecognizer 标记为待处理。
 4.苹果注册了一个 Observer 监测 BeforeWaiting (Loop即将进入休眠) 事件，
 5.这个Observer的回调函数是 _UIGestureRecognizerUpdateObserver()，
 6.其内部会获取所有刚被标记为待处理的 GestureRecognizer，并执行GestureRecognizer的回调。
 7.当有 UIGestureRecognizer 的变化(创建/销毁/状态改变)时，这个回调都会进行相应处理

 */
+ (void)load6{
    
}

// 定时器
+ (void)load2{
    {   /* 1.默认的定时器 需要手动加入runloop，才能运行
         1.使用NSTimer时，timer会保持对target和userInfo参数的强引用。
         2.只有当调取了NSTimer的invalidate方法时，NSTimer才会释放target和userInfo。
         3.生成timer的方法中如果repeats参数为NO，则定时器触发后会自动调取invalidate方法。
         4.如果repeats参数为YES，则需要程序员手动调取invalidate方法才能释放timer对target和userIfo的强引用。
         */
        //repeats:是否循环
        NSTimer *timer =   [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(load2) userInfo:nil repeats:YES];
        [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
        }];
        [NSTimer timerWithTimeInterval:1.0 invocation:[NSInvocation new] repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        
        //关闭定时器
        [timer setFireDate:[NSDate distantFuture]];
        //开启定时器
        [timer setFireDate:[NSDate distantPast]];
        //定时器失效后就不能再启用了 需要手动nil,
        [timer invalidate];
        timer = nil;
    }

    
    {
        // 2.会自动添加到 MainRunLoop 中的 NSDefaultRunLoopMode 的模式中,自动开始执行
        [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
        }];
    }
}

//performSelector
+ (void)load3{
    {
        //@protocol NSObject
        /*
         1.在当前线程执行方法
         2.事件的执行不一定非得要 RunLoop 才能执行，RunLoop 只是让线程有长久循环处理事件的能力
         a.若线程中没有 RunLoop，则直接执行
         b.若线程中有 RunLoop，则是将事件添加到当前运行的模式中，随着原本的事件源 串行执行
         */
        [self performSelector:@selector(hash)];
        [self performSelector:@selector(hash) withObject:nil];
        [self performSelector:@selector(hash) withObject:nil withObject:nil];
    }

    
    {
        //NSObject (NSDelayedPerforming) runloop相关
        /*
         1.在当前线程执行方法
         2.因为底层根本是添加了一个定时器事件，所以强烈依赖runloop，如果没有 runloop 则无效
         3.若有runloop将事件添加到runloop当前运行的模式中，随着原本的事件源 串行执行
         */
        [self performSelector:@selector(hash) withObject:nil afterDelay:0.2];
        // 指定在什么模式下才执行
        [self performSelector:@selector(hash) withObject:nil afterDelay:0.2 inModes:@[]];
        [NSObject cancelPreviousPerformRequestsWithTarget:self]; //取消已设置的延迟执行
        [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hash) object:nil];
    }

}
/** 常驻线程
 */
- (void)test76{
    
}
@end
