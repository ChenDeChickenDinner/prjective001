//
//  XSThread_.m
//  test
//
//  Created by xs on 2021/3/25.
//

#import "XSThread_.h"
@interface XSThread_ : NSObject
@property(nonatomic,strong) NSThread *thread;

@end
@implementation XSThread_
// 线程获取 判断 设置
+ (void)load1{

    [NSThread mainThread];
    [NSThread currentThread];
    
    [NSThread isMultiThreaded];
    [NSThread isMainThread];
    
    [NSThread setThreadPriority:5];
    [NSThread threadPriority];

    [NSThread sleepForTimeInterval:5];
    [NSThread sleepUntilDate:[NSDate date]];
    
    [NSThread exit];
}
// 线程的创建设置
- (void)test1{
    NSThread *thread =  [[NSThread alloc]initWithBlock:^{
        
    }];
    thread.name = @"name";
    //设置当前线程栈大小
    thread.stackSize = 4 * 1024;
    //获取当前线程栈大小，默认开辟512K、最小为8K、分配时为4的倍数
    NSLog(@"%tu", [NSThread currentThread].stackSize / 1024);

    //设置线程优先级
    thread.threadPriority = 0.6;
    /*
     由于线程优先级是一个比较抽线的东西，用threadPriority设置没人能知道0.5和0.6到底有多大区别，
     所以iOS8之后新增了qualityOfService枚举属性，大家可以通过枚举值设  置优先级
     NSQualityOfService：
     NSQualityOfServiceUserInteractive：最高优先级，主要用于提供交互UI的操作，比如处理点击事件，绘制图像到屏幕上
     NSQualityOfServiceUserInitiated：次高优先级，主要用于执行需要立即返回的任务
     NSQualityOfServiceDefault：默认优先级，当没有设置优先级的时候，线程默认优先级
     NSQualityOfServiceUtility：普通优先级，主要用于不需要立即返回的任务
     NSQualityOfServiceBackground：后台优先级，用于完全不紧急的任务
     */
    thread.qualityOfService = NSQualityOfServiceUserInteractive;
    self.thread = thread;

}
// 线程的操作
- (void)test2{
    /*
     1.让线程开始执行任务
     2.一个线程只能 start 一次，后续如果线程对象 还存在，仍继续start 会导致崩溃
     3.线程一旦开始执行，则无法主动停止
     */
    [self.thread start];

    /*
     1.可以在任意时刻将线程标记为 Cancelled 状态，多次标记，只有第一次有效，后面的无效果
     2.被标记后，这个状态不可逆，也不受线程是否正常执行任务或者线程是否执行完任务的影响，只是单纯的一个状态
     3.一般用于在执行任务途中，判断这个标记以来决定后续的任务还是否需要执行
     */
    [self.thread cancel];

}
// 线程的状态检测
- (void)test3{
    
    [self.thread  isMainThread];

    /* 检测线程是否正在执行任务
     1.执行之前，与执行完成之后都是未执行状态
     */
    if ([self.thread isExecuting]) {
        NSLog(@"线程正在执行任务");
    }else{
        NSLog(@"线程未执行任务");
    }
    
    
    /* 检测线程是否被标记为 Cancelled 状态
     */
    if ([self.thread isCancelled]) {
        NSLog(@"线程被标志取消");
    }else{
        NSLog(@"线程未被标志取消");
    }
    /* 检测线程的任务是否执行完毕
     1.线程的任务方法执行后，一旦在某种条件下退出，或者全部执行完，都算执行完成；
     2.不受 因标记为 Cancelled 而未执行的代码的影响
     */
    if ([self.thread isFinished]) {
        NSLog(@"线程任务已经执行完");
    }else{
        NSLog(@"线程任务未在执行完");
    }
    
}
// 线程的监控

- (void)test4{
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(threadStateWillChange:) name:NSThreadWillExitNotification object:nil];
}
- (void)threadStateWillChange:(NSNotification *)object{
    
}


// 系统线程相关API
- (void)test5{
    
    // 在主线程执行方法，可以选择runloop的模式
    [self performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:YES];
    [self performSelectorOnMainThread:@selector(run) withObject:nil waitUntilDone:YES modes:@[]];
    
    // 在指定线程执行方法，可以选择runloop的模式
    [self performSelector:@selector(run) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES];
    [self performSelector:@selector(run) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES modes:@[]];
    
    // 后台开启一条子线程执行任务
    [self performSelectorInBackground:@selector(run) withObject:nil];
}
@end
