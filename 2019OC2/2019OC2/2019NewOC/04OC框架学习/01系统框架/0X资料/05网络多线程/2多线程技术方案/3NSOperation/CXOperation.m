//
//  CXOperation.m
//  2019OC
//
//  Created by xs on 2019/2/27.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "CXOperation.h"

@implementation CXOperation

/**
 NSOperation  什么是操作
 1.操作是对任务的封装
 2.一个操作可以添加多个任务
 3.NSOperation不能直接使用 根据封装方式的不同分为三种(方法式封装,block式封装,自定义式封装)
 */
+(void)run{

}
/**
 NSInvocationOperation 操作
 1.  NSInvocationOperation 操作 无追加任务的能力
 */
+(void)test1{
    // 创建一个操作
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(run) object:nil];
    // 创建一个操作
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc]init];
}

/**
 NSBlockOperation 操作
 */
+(void)test2{
    // 创建一个操作
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
    }];

    // 追加一个任务
    [op1 addExecutionBlock:^{
    }];
    // 追加一个任务
    [op1 addExecutionBlock:^{
    }];
}

/**
 基础子NSOperation自定义操作
 1.将会被重复使用的操作(一个任务模块)通过自定义操作封装起来
 */
-(void)main{

    if (self.isCancelled) {
        return;
    }
    NSLog(@"任务一");
    if (self.isCancelled) {
        return;
    }
    NSLog(@"任务二");
}

/**
 操作的状态属性
 1.等待执行
 2.正在执行
 */
+(void)test3{
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"Block1----%@",[NSThread currentThread]);
    }];


    BOOL isReady = op1.isReady;// 是否在等待
    BOOL isExecuting = op1.isExecuting;// 是否在执行
    BOOL isCancelle = op1.isCancelled;// 是否被取消
    BOOL isFinished = op1.isFinished;// 是否执行完
    BOOL isAsynchronous = op1.isAsynchronous;// 是否是异步执行

    NSArray<NSOperation*>*array = op1.dependencies;// 依赖的所以操作
}
/**
 操作的操作
 */
+(void)test4{
/**
操作的执行
0.一旦被start 任务立即执行
1.只要操作被执行了，其里面的任务 不论其数量多少 都会开始执行， 不存在 等待的问题
    a.一个任务就直接执行
    b.多个任务就多线程同步执行
2. 当前线程看 主要看目前是 主线程 还是子线程
*/

    {  //1.在当前线程执行这个操作，并不会开启新的子线程
     NSInvocationOperation *op1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(run) object:nil];

        [op1 start];
    }
    {
        /*
         1.如果只有一个任务，则在当前线程执行这个操作，并不会开启新的子线程
         2.如果只有多个任务，则会开启子线程跟当前线程一起执行这个操作
         */
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"Block1----%@",[NSThread currentThread]);
        }];
        [op1 addExecutionBlock:^{
            NSLog(@"Block2----%@",[NSThread currentThread]);
        }];
        [op1 start];
    }

    {  //1.在当前线程执行这个操作，并不会开启新的子线程
        CXOperation *op2 = [[CXOperation alloc]init];
        //2.在当前线程执行自定义的操作，start会自动调用main方法执行任务，并不会开启新的子线程
        [op2 start];
    }
/**
操作的取消:
1.若操作是正在执行状态则无法取消，处于等待的操作 可以取消
2.正在执行的任务，若像取消，减少代码的执行还是要依靠事先的 任务代码执行前对 isCancelled 的判断
*/
    {
        CXOperation *op2 = [[CXOperation alloc]init];
        [op2 cancel];
    }
/**
 操作的依赖:
 1.操作B可依赖操作A，则B会在A执行完后在执行,操作可以同队列之间依赖，也可不同队列之间依赖
 2.依赖成功的条件
 a.(无队列)被依赖的操作需要在之前被执行,否则会有崩溃风险
 b.(有队列)若被添加到队列中则无顺序要求
 c.不能循环依赖
 3.此操作原本在什么线程中执行就在什么线程中执行，依赖对线程无影响
 */
    {
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"Block1----%@",[NSThread currentThread]);
        }];
        NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"Block2----%@",[NSThread currentThread]);
        }];
        [op2 addDependency:op1];// 添加依赖
        [op1 start];
        [op2 start];

    }
/**
操作的监听
 */
    {
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"Block1----%@",[NSThread currentThread]);
        }];
        [op1 addExecutionBlock:^{
            NSLog(@"Block2----%@",[NSThread currentThread]);
        }];
        [op1 addExecutionBlock:^{
            NSLog(@"Block3----%@",[NSThread currentThread]);
        }];
        // 1,2,3任务执行完后调用
        [op1 setCompletionBlock:^{
            NSLog(@"1,2,3任务执行完后调用");
        }];

    }
/**
 操作阻塞线程:
 1.阻塞当前线程，等待操作任务的执行完毕，在执行后面的代码
 */
    {
        NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
            NSLog(@"Block1----%@",[NSThread currentThread]);
        }];
        [op1 start];
        NSLog(@"线程被阻塞，后面的代码无法执行，等待操作的执行完毕");
        [op1 waitUntilFinished];
        NSLog(@"线程中操作执行完毕");
    }
    
}
@end
