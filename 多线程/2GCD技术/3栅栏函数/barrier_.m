//
//  barrier_.m
//  test1
//
//  Created by xs on 2021/3/26.
//

#import "barrier_.h"

@implementation barrier_
+ (void)load{
//    [self test1];
}
/**
 栅栏函数：限制一个队列中异步函数的执行顺序，注意不能使用全局并发队列
 */
+ (void)test1{

    dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"1---%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2---%@",[NSThread currentThread]);
    });

    //
    dispatch_barrier_async(queue, ^{
        NSLog(@"--------");
    });
    dispatch_async(queue, ^{
        NSLog(@"4---%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"5---%@",[NSThread currentThread]);
    });
}
@end
