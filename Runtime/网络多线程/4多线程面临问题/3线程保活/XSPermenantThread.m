//
//  XSPermenantThread.m
//  2019OC
//
//  Created by xs on 2019/2/28.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "XSPermenantThread.h"

/*
1.线程对象 在不在
2.线程的状态，能不能使用
3.线程保活:线程在 而且能够使用
 */
/*
 SO1:问题 线程一旦其任务执行完 就会推出
 SO2:线程保活:线程在 而且能够使用

 线程保活实现基本思路
 1.在需要经常创建子线程做事情的时候 可以让线程不释放，在用到的时候不再创建 直接使用
 2.保证子线程不销毁而且不阻塞，跟runloop一样，该休眠休眠 该做事做事
- (void)test2{

     1.本来线程中是没有RunLoop的，事情一做完 线程就销毁了
     2.添加RunLoop,RunLoop run 之后，线程就被阻塞在那了，不会被释放，同事RunLoop接受事件，处理事件
    [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop]run];//无事情睡觉-->做事情-->无事情睡醒(内部循环监听),线程被阻塞，后面的代码不会被执行
    NSLog(@"RunLoop不退出这一句永远不会执行，这一句执行完了如果线程没有被强引用才会销毁");
}

 */


/*线程与RunLoop的分工(到底是谁在执行任务）
 1.在线程中什么事情是不需要RunLoop支持就可以做的
 2.在线程中什么事情是需要RunLoop支持就可以做的
 */
@interface XSPermenantThread()
@property(nonatomic,strong) NSThread *thread;
@property(nonatomic,assign,getter=isStopped) BOOL stopped;
@end

@implementation XSPermenantThread
- (instancetype)init{
    if (self = [super init]) {
        self.stopped = NO;
        __weak typeof(self) weakSelf = self;
        self.thread = [[NSThread alloc]initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[[NSPort alloc]init] forMode:NSDefaultRunLoopMode];
            while (weakSelf && !self.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
        [self.thread start];
    }
    return self;
}
- (void)dealloc{
    [self stop];
}
- (void)stop{
    if (!self.thread) return ;

    [self performSelector:@selector(__stop) onThread:self.thread withObject:nil waitUntilDone:YES];
}

- (void)__stop{
    self.stopped = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
}

- (void)executeTask:(void(^)(void))task{
    if (!task ||!self.thread) {
        return;
    }
    [self performSelector:@selector(__executeTask:) onThread:self.thread withObject:task waitUntilDone:NO];
}
- (void)__executeTask:(void(^)(void))task{
    task();
}

@end
