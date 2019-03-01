//
//  02NSThread.m
//  2019OC
//
//  Created by xs on 2019/2/26.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "02NSThread.h"
@interface ChenThread : NSThread

@end
@implementation ChenThread
- (void)dealloc{
    NSLog(@"%s\n",__func__);
}
@end

@implementation _2NSThread
- (void)test0{
//    [self test2];
}
- (void)test1{

    NSThread *mainThread = [NSThread mainThread];

    NSThread *currentThread = [NSThread currentThread];

    BOOL isMainThread1 = [NSThread isMainThread];
    BOOL isMainThread2 = [currentThread isMainThread];

}

/**
 创建线程对象
 */
- (void)test2{

    {
        ChenThread *thread1  = [[ChenThread alloc]initWithTarget:self selector:@selector(run) object:nil];
        NSThread *thread2  = [[NSThread alloc]initWithBlock:^{

        }];

        //启动线程
        [thread1 start];
    }

    return;
    { //直接分离出一条子线程
        [NSThread detachNewThreadSelector:@selector(run) toTarget:self withObject:nil];
        [NSThread detachNewThreadWithBlock:^{

        }];
    }

    {     //开启后台线程
        [self performSelectorInBackground:@selector(run) withObject:nil];
    }
}


/**
 线程状态的控制
 */
- (void)run{
    NSLog(@"阻塞3秒在执行");
    [NSThread sleepForTimeInterval:3.0];


    for (int i = 0; i < 100; ++i) {
        NSLog(@"%d---%@",i,[NSThread currentThread].name);
    }


    {
        // 强制停止线程,线程立即死亡，后面的代码不再执行
        NSLog(@"[NSThread exit]");
        [NSThread exit];
    }


    {
        // 相当于执行完任务，线路销毁，后面的代码不再执行
        return;
    }

}

/**
 线程的属性
 */
- (void)test3{
    //设置线程的属性
    self.thread.name = @"123";

    //设置线程的优先级  范围 0.0~1.0 默认是0.5  1.0最高的
    //优先级更高的线程,被CPU调度到的概率会更高
    self.thread.threadPriority = 1;

    BOOL iscancel = self.thread.cancelled;
    BOOL isfinished = self.thread.finished;
    BOOL isexecuting = self.thread.executing;

}
/**
 线程的安全
 */
- (void)test4{

    @synchronized(self){

    }
}
- (void)test5{


}

@end
