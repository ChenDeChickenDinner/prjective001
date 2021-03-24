//
//  RunLoopTechnology.m
//  2019OC2
//
//  Created by xs on 2019/3/5.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "RunLoopTechnology.h"

@implementation RunLoopTechnology

/**
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
- (void)test1{

}

/**
 定时器
 */
- (void)test2{

    /*
     1.创建一个定时器添加到当前线程中的Runloop 的默认模式中  (scheduled:计划)
     2.当Runloop每循环一次检查达到时间间隔后，执行一次代码（受RunLoop处理其它事件的影响）
     3.SO:在主线程中可以正常执行，在子线程中需要创建运行起Runloop才能执行
     */
    [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {

    }];
}

/**
 performSelector
 */
- (void)test3{
    /*
     1.添加一个定时器到当前线程中的Runloop 的默认模式中
     */
    [self performSelector:@selector(test2) withObject:nil afterDelay:0.2];

}

/**
 GCD与RunLoop
 */
- (void)test4{

    /*
     1.libDispatch 会向主线程的 RunLoop 发送消息，RunLoop会被唤醒，并从消息中取得这个 block
     2.并在回调 __CFRUNLOOP_IS_SERVICING_THE_MAIN_DISPATCH_QUEUE__() 里执行这个 block
     */
    dispatch_async(dispatch_get_main_queue(), ^{

    });
}

/**
 网络请求与RunLoop
 */
- (void)test5{

}
/**
 1.事件响应
 2.手势识别
 3.界面更新
 */
- (void)test6{

}
@end
