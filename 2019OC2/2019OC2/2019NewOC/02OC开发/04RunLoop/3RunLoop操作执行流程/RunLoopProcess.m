//
//  RunLoopProcess.m
//  2019OC2
//
//  Created by xs on 2019/3/5.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "RunLoopProcess.h"

@implementation RunLoopProcess


/**
 RunLoop的创建启动
 */
- (void)test0{

    static BOOL shouldKeepRunning = YES;
    // 1.获取当前线程的RunLoop对象，无自自动创建
    NSRunLoop *loop = [NSRunLoop currentRunLoop];

    // 2.添加事件到 RunLoop 中，保证RunLoop启动后不退出
    [loop addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];


     //3.启动RunLoop的三种情况

    // 1.当运行模式中的事件处理完成之后 loop就退出
    [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];

    //2.当前所有任务执行完后，根据条件 是否继续runMode,可控制的loop
    while (shouldKeepRunning) {
        [loop runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
    }

    /*
    1.run 的内部实现就是
     while (1) {
     [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
     }
     2.是无限循环 runMode，NSRunLoop永不退出，它专门用于开启一个永不销毁的线程
     */
    [loop run];

}
/**
 RunLoop的睡眠
 */
- (void)test1{
    /*线程阻塞方案
     1.通过不断运行一句代码，而不运行后面的代码，达到线程的阻塞效果(在不断的消耗CPU资源)
     2.利用内核底层的API:mach_msg(),一旦调用mach_msg 就让程序进入内核态，一旦有消息就回到用户态(正在的阻塞睡眠)
     3.RunLoop的睡眠就是内核底层的API:mach_msg();
     */
}
/**
 RunLoop的退出
 */
- (void)test2{
    // 仅仅只能主动中断一次 runMode:  的运行，SO:通过 run 启动的RunLoop是中断不掉的
    CFRunLoopStop(CFRunLoopGetCurrent());

}
/**
 RunLoop的运行流程
 */
- (void)test3{
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
@end
