//
//  CXQueue.m
//  2019OC
//
//  Created by xs on 2019/2/27.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "CXQueue.h"

@implementation CXQueue

/**
 什么是队列:管理执行多个操作
 主队列:串行队列,和主线程相关(凡是放在主队列中的任务的都在主线程中执行)
 自定义队列:默认是并发队列,但是可以控制让它变成一个串行队列
 */
+(void)test1{
    // 自定义队列
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];

    // 主队列
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
}

/**
 队列的状态 属性
 */
+(void)test2{
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];

    // 队列的操作数 数量
    NSArray *array = queue.operations;
    NSUInteger count = queue.operationCount;

    // 是否被暂停
    BOOL suspended = queue.isSuspended;

    /**
     自定义队列的控制，最大并发数(线程数量)
     1.最大并发数: 同一时间最多有多少条线程在执行
     2.maxConcurrentOperationCount == 0 不能执行任务
     3.maxConcurrentOperationCount == 1 一条子线程 同步执行
     4.NSOperationQueueDefaultMaxConcurrentOperationCount = -1 -1指的是一个最大的值(表示不受限制)
     5.注意 最大并发数 对 任务数量>1的 操作 是无效的
     */
    queue.maxConcurrentOperationCount = 1;


}

/**
 队列的操作
 */
+(void)test3{

    { /**
       添加操作
       1.当所有的操作添加完成之后 就 开始执行操作，自动调用操作的 start 方法
       */
        NSOperationQueue *queue = [[NSOperationQueue alloc]init];
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"queue1-Block1----%@",[NSThread currentThread]);
        }];
        [queue addOperation:op1];
        [queue addOperationWithBlock:^{
            NSLog(@"queue1-Block2----%@",[NSThread currentThread]);
        }];
        NSLog(@"添加完毕开始执行");
    }

    {
        NSOperationQueue *queue = [[NSOperationQueue alloc]init];

        //:正在执行的操作是不能暂停的，还是会继续执行，只能暂停 处于等待状态的操作
        [queue setSuspended:YES];
        //:恢复:
        [queue setSuspended:NO];

    }
    {
        /**
         队列的取消
         1.会调用所有操作的cancel 方法
         2.正在执行的操作无法取消，处于等待的操作则会被取消 不会被执行
         */
        NSOperationQueue *queue = [[NSOperationQueue alloc]init];
        [queue cancelAllOperations];
    }

    {
        /**
         1.阻塞当前线程，等待队列中所有操作任务的执行完毕，在执行后面的代码
         */
        NSOperationQueue *queue = [[NSOperationQueue alloc]init];
        [queue waitUntilAllOperationsAreFinished];
    }

}

/**
 线程间通信
 */
+(void)test4{
    NSOperationQueue *queue  =[[NSOperationQueue alloc]init];

    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{

        // 在主线程中执行
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{

        }];
    }];
    [queue addOperation:op1];
}
@end
