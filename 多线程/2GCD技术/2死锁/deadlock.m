//
//  deadlock.m
//  test1
//
//  Created by xs on 2021/3/26.
//

#import "deadlock.h"

@implementation deadlock
/* 死锁产生的根本原因分析
 
1.串行队列：串行队列是先进先出，一条条任务顺序执行的
2.同步函数：要求立即在当前线程执行任务
 
3.将一个【同步函数】往【当前】【串行】队列中添加任务，会卡住当前的串行队列（产生死锁）
 
 
当前线程中：【环境任务中包括sys任务】
 -（void)func{
 任务1
 sys任务2
 任务3
 }

 
当前串行队列中：【sys排在环境任务之后】
 func任务
 sys任务
 
1.环境任务想执行完得先将sys执行完，因为sys是属于他的任务的一部分
2.sys想马上执行必须等，前面的环境任务执行完成，因为它在队列的最后面

 */
+ (void)load{
    
}
// 主队列，同步函数死锁
+ (void)test1{
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        NSLog(@"1-----%@",[NSThread currentThread]);
    });
}
// 串行队列，同步函数死锁
+ (void)test2{
    dispatch_queue_t queue  = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"block1，可以执行");
        dispatch_sync(queue, ^{
            NSLog(@"block2，不可以执行，发生死锁");
        });
        /* 首先这是一个串行队列，遵守先进先出原则
         1.block1先被添加到队列，block2后添加到队列
         2.block1内部有block2,block1想执行完需要 block2执行完，但block2的队列中在block1后面,block2想执行必须等block1执行完
         */
    });
    NSLog(@"这里也可以执行");
}
@end
