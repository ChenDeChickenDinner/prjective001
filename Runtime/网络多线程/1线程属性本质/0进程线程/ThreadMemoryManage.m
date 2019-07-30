//
//  ThreadMemoryManage.m
//  2019OC2
//
//  Created by xs on 2019/3/5.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ThreadMemoryManage.h"
@interface XSThread:NSThread;

@end
@implementation XSThread
- (void)dealloc{
    NSLog(@"%@:%s",[NSThread currentThread],__func__);
}
@end


@implementation ThreadMemoryManage
/**线程的结束-销毁
 1.线程在执行完任务后如果无外部强引用则就会销毁 dealloc
 2.线程在执行完任务后就进入结束状态，结束状态的线程 无法再次执行任务
 */
- (void)test1{
    {
        XSThread *thread1 = [[XSThread alloc]initWithBlock:^{
            NSLog(@"thread1 - %@",[NSThread currentThread]);
            //任务执行完线程对象销毁
        }];
        NSLog(@"thread1 = %@",thread1);
        [thread1 start];
    }

    {
        if (!self.thread) {
            XSThread *thread = [[XSThread alloc]initWithBlock:^{
                NSLog(@"thread - %@",[NSThread currentThread]);
                //任务执行完线程对象销毁
            }];
            self.thread = thread;
            NSLog(@"thread = %@",thread);
        }
        if (![self.thread isFinished]) {
            // 只有线程未结束的时候 才能再次执行任务
            [self.thread start];
        }
    }

}

/**
 线程之间的嵌套(线程A 包含线程B)
 1.A线程不会等待B线程的具体任务执行完才销毁
 2.B线程的执行也不依赖A线程的存在，只要A线程在其任务中启动了B线程
 3.A,B线程之间的生命周期互不影响各自独立
 */
- (void)test2{
    XSThread *thread1 = [[XSThread alloc]initWithBlock:^{
        NSLog(@"thread1执行 - %@",[NSThread currentThread]);
        {
            XSThread *thread2 = [[XSThread alloc]initWithBlock:^{
                NSLog(@"thread2执行 - %@",[NSThread currentThread]);

                NSLog(@"thread2任务执行完");
                // thread2再执行完最后一句就 dealloc
            }];
            NSLog(@"thread2:start = %@",thread2);
            [thread2 start];
        }
        NSLog(@"thread1任务执行完");
        // thread1再执行完最后一句就 dealloc
    }];
    NSLog(@"thread1:start = %@",thread1);
    [thread1 start];
}

/**
 线程的状态
 */
- (void)test3{

    if ([self.thread isExecuting]) {
        NSLog(@"线程正在执行任务");
    }
    if ([self.thread isCancelled]) {
        NSLog(@"线程被标志取消");
    }else{
        NSLog(@"线程未被标志取消");
    }
    if ([self.thread isFinished]) {
        NSLog(@"线程任务已经执行完");
    }else{
        NSLog(@"线程任务未执行完");
    }


}
/**
 线程的操作
 */
- (void)test4{
    // 启动线程
    [self.thread start];

    //给线程添加 cancel 标志
    [self.thread cancel];

    //主动结束当前线程的任务,后面的代码不再执行 线程的 isFinished = YES;无法重新开启
    [NSThread exit];
}

/**
 线程的运行
 1.一旦一个线程开启，其可执行的任务就是固定的
 2.对执行中线程的操作 只能 给其添加 cancel 标志/或者主动结束
 3.不能对执行中的线程进行任务追加(结合RunLoop可以达到这种效果)
 4.不能在执行过程中 主动暂停线程的执行，再在某个时刻开启(只能通过队列多线程结合技术达到类似效果)
 */
- (void)test5{
    if (self.thread&& [self.thread isExecuting]) {
        NSLog(@"线程正在执行给线程继续添加任务:无效的操作");
        [self performSelector:@selector(test5) onThread:self.thread withObject:nil waitUntilDone:NO];
    }
}
@end

