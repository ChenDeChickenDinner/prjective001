//
//  dispatch1.m
//  test1
//
//  Created by xs on 2021/3/26.
//

#import "dispatch1.h"

@implementation dispatch1


+ (void)load{
}

/*
 什么是GCD
 1.全称是Grand Central Dispatch，可译为“牛逼的中枢调度器”
 2.纯C语言，提供了非常多强大的函数
 3.ios6.0 后 GCD 被纳入ARC的管理范围内

 GCD的优势
 1.GCD是苹果公司为多核的并行运算提出的解决方案
 2.GCD会自动利用更多的CPU内核（比如双核、四核）
 3.GCD会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
 4.程序员只需要告诉GCD想要执行什么任务，不需要编写任何线程管理代码

 

 

 队列
 1.队列是什么:一直类似栈的数据结构，先进先出，后进后出，队列存放任务
 2.DCG的队列【决定任务怎么执行】
     a.串行队列,将队列中顺序任务顺序的拿出来，放到某一条线程执行，上个任务执行完了 才能取出下一个任务执行
     b.并发队列,将队列中顺序任务顺序的拿出来，放到一条或者多条线程执行，允许多个任务并发（同时）执行
 
 */
+ (void)load1{
    /* 参数说明
     *
     * 第一个参数:C语言的字符串 给队列起个名字(建议:com.520it.www.DownloadQueue)
     * 第二个参数:类型
     *          DISPATCH_QUEUE_SERIAL      串行队列
     *          DISPATCH_QUEUE_CONCURRENT  并发队列
     */
    dispatch_queue_t queue1 = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);

    /** 全局的主队列
     */
    dispatch_queue_t queue = dispatch_get_main_queue();

    /** 全局的并发队列
     * identifier:队列的优先级  // 默认（中） 0
     * flags: 此参数暂时无用，用0即可
     */
    dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT , 0);
}
/*
 同步函数:
 1.不能开启新线程
 2.要求在当前线程立即执行任务
 */
+ (void)dispatch_sync{
    //不论在什么队列 上下文+队列任务 都是顺序执行
    dispatch_queue_t queue_serial = dispatch_queue_create("name1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue_concurrent = dispatch_queue_create("name2", DISPATCH_QUEUE_CONCURRENT);

    dispatch_queue_t queue = queue_serial;
    queue = queue_concurrent;
    NSLog(@"11111");
    dispatch_sync(queue, ^{
        for (int i = 0; i<5; i++) {
            NSLog(@"任务1：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<5; i++) {
            NSLog(@"任务2：%@-%d",[NSThread currentThread],i);
        }
    });
    NSLog(@"222222");

}

/*
 异步函数:
 1.具体开启新线程的能力
 2.不要求立即执行队列任务
     串行队列：开启一条子线程，任务串行执行
     并发队列：开启多条子线程，任务并发执行
 */
+ (void)dispatch_async{
    //不论在什么队列 队列任务 与下文之间 的调用顺序 是不确定的
    
    dispatch_queue_t queue_serial = dispatch_queue_create("name1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue_concurrent = dispatch_queue_create("name2", DISPATCH_QUEUE_CONCURRENT);

    dispatch_queue_t queue = queue_serial;
//    queue = queue_concurrent;
    NSLog(@"11111");
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            NSLog(@"任务1：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            NSLog(@"任务2：%@-%d",[NSThread currentThread],i);
        }
    });
    NSLog(@"222222");

}
/*
 
 */
+ (void)dispatch_get_main_queue{
    NSLog(@"环境：%@",[NSThread currentThread]);

    // 先执行上下文，再执行队列任务
    dispatch_queue_t queue = dispatch_get_main_queue();
    NSLog(@"11111");
    //异步函数添加到主队列，无法开启子线程；
    //异步函数不会要求立即执行任务，后面的任务 先与 队列任务执行
    //因为是主队列，所以队列任务是串行执行
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            NSLog(@"任务1：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<5; i++) {
            NSLog(@"任务2：%@-%d",[NSThread currentThread],i);
        }
    });
    NSLog(@"222222");
}
@end
