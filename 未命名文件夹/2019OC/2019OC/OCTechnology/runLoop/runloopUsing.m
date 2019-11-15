//
//  runloopUsing.m
//  2019OC
//
//  Created by xs on 2019/2/28.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "runloopUsing.h"

@implementation runloopUsing

/**
 定时器问题
 1.NSTimer会受到 runloop的影响
 2.GCD中的定时器不受runloop的影响
 */
- (void)test1{
    { // 默认
        //未添加到任何模式，不会执行
        NSTimer *time1 = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {

        }];

        //scheduled:计划(默认已经加入默认模式)
        NSTimer *time2 = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {

        }];
    }

    {
        NSTimer *time1 = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {

        }];
        [[NSRunLoop currentRunLoop] addTimer:time1 forMode:NSRunLoopCommonModes];
    }
}

/**
 线程保活
 1.在需要经常创建子线程做事情的时候 可以让线程不释放，在用到的时候不再创建 直接使用
 2.实现思路:保证子线程不销毁而且不阻塞，跟runloop一样，该休眠休眠 该做事做事
 */
- (void)test2{
    /*
     1.本来线程中是没有RunLoop的，事情一做完 线程就销毁了
     2.添加RunLoop,RunLoop run 之后，线程就被阻塞在那了，不会被释放，同事RunLoop接受事件，处理事件
     */
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]run];//无事情睡觉-->做事情-->无事情睡醒(内部循环监听),线程被阻塞，后面的代码不会被执行
    NSLog(@"RunLoop不退出这一句永远不会执行，这一句执行完了如果线程没有被强引用才会销毁");
}

/**
 监控应用卡顿
 */
- (void)test3{

}
- (void)test4{

}
@end
