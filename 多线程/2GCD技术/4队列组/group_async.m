//
//  group_async.m
//  test1
//
//  Created by xs on 2021/3/26.
//

#import "group_async.h"

@implementation group_async
+ (void)load{
//    [self test1];
}
/**
 监听多个队列的任务执行-队列组
 */
+ (void)test1{
    
    //队列组:具体监听 某队列的任务执行情况
    dispatch_group_t group = dispatch_group_create();

    dispatch_queue_t queue1 = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);

    //1.封装任务，添加到队列 2.将任务添加到队列组的监听中
    dispatch_group_async(group, queue1, ^{
        NSLog(@"1.1---%@",[NSThread currentThread]) ;

    });
    dispatch_group_async(group, queue1, ^{
        NSLog(@"1.2---%@",[NSThread currentThread]);

    });
    dispatch_group_async(group, queue2, ^{
        NSLog(@"2.1---%@",[NSThread currentThread]);

    });
    dispatch_group_async(group, queue2, ^{
        NSLog(@"2.2---%@",[NSThread currentThread]);

    });

    //group: group 监听的队列中的所有任务执行完,执行++++操作
    //队列:决定该block在哪个线程中处理(主:主线程 非主队列:子线程)随便一个队列
    //dispatch_group_notify 内部是异步的执行,会在 下面NSLog(@"---end----"); 之后执行
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        // queue:代码块在哪个队列中执行
        NSLog(@"group 监听的队列中的所有任务执行完");
        NSLog(@"end---%@",[NSThread currentThread]);
    });
    NSLog(@"---end----");

}
@end
