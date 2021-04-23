//
//  GDCThread.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "GDCThread.h"

@implementation GDCThread
+ (void)load{
    //    [self test3];
}
/*

 




 任务 + 队列 执行
 1.创建队列
 2.封装任务
 3.把任务添加到队列

 */

/**
 DCG的队列
 */
+(void)test1{

 
}
/**
 DCG的任务封装
 */
+(void)test2{
    // async 异步
    dispatch_async(dispatch_get_global_queue(0, 0), ^{

    });
    // async 同步
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{

    });
    // 函数方式
    dispatch_async_f(dispatch_get_global_queue(0, 0), NULL, test11);
}
void test11(){

}
/**
 DCG的执行

 */
//同步函数:不管是什么队列，都不会开启子线程,所有的任务在【当前线程】中【串行】执行
- (void)dispatch_sync{
    //串行队列
    dispatch_queue_t queue_serial = dispatch_queue_create("name1", DISPATCH_QUEUE_SERIAL);
    //并发队列
    dispatch_queue_t queue_concurrent = dispatch_queue_create("name2", DISPATCH_QUEUE_CONCURRENT);

    dispatch_queue_t queue = queue_serial;
//    queue = queue_concurrent;

    //同步函数（只能在当前线程执行
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"任务1：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"任务2：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"任务3：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_sync(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"任务4：%@-%d",[NSThread currentThread],i);
        }
    });
}
/* 异步函数：一定会开启子线程
 串行队列：开启一条子线程，串行执行
 并发队列：开启多条子线程，并发执行
 */
- (void)dispatch_async{
    //串行队列
    dispatch_queue_t queue_serial = dispatch_queue_create("name1", DISPATCH_QUEUE_SERIAL);
    //并发队列
    dispatch_queue_t queue_concurrent = dispatch_queue_create("name1", DISPATCH_QUEUE_CONCURRENT);

    dispatch_queue_t queue = queue_serial;
    queue = queue_concurrent;

    //异步函数（可以开启子线程执行
    dispatch_async(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"任务1：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"任务2：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"任务3：%@-%d",[NSThread currentThread],i);
        }
    });
    dispatch_async(queue, ^{
        for (int i = 0; i<10; i++) {
            NSLog(@"任务4：%@-%d",[NSThread currentThread],i);
        }
    });
}
/**
 DCG的主队列
 1.放在主队列中的任务，都会放到主线程中执行
 */
+(void)test4{
    // 串行主队列

    dispatch_queue_t queue = dispatch_get_main_queue();
    { // 同步函数 + 串行主队列:死锁，相互等待
        /*
         1.主线程在在忙，在同步封装任务
         2.主队列有任务，安排主线程执行任务，如果主线线程在忙则停止调度，等待主线程忙完
         */
        dispatch_sync(queue, ^{
            NSLog(@"1-----%@",[NSThread currentThread]);
        });
        dispatch_sync(queue, ^{
            NSLog(@"2-----%@",[NSThread currentThread]);
        });
        dispatch_sync(queue, ^{
            NSLog(@"3-----%@",[NSThread currentThread]);
        });
    }
    { // 异步函数 + 串行主队列:不会开启线程，所有任务在主线程中串行执行
        /*
         1.主线程在在忙，在异步封装任务，不用等第一个任务执行完 就可以封装后面的任务
         2.主队列等主线程把所以的任务添加到队列中后，再开始依次顺序执行任务
         */
        dispatch_async(queue, ^{
            NSLog(@"1-----%@",[NSThread currentThread]);
        });
        dispatch_async(queue, ^{
            NSLog(@"2-----%@",[NSThread currentThread]);
        });
        dispatch_async(queue, ^{
            NSLog(@"3-----%@",[NSThread currentThread]);
        });
    }
    
    {

    }
    // 死锁的发生的条件:使用sync函数往当前串行队列中添加任务，会卡住当前的串行队列（产生死锁）




}

/**
 GCD线程间通信
 */
+(void)test5{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{

        dispatch_sync(dispatch_get_main_queue(), ^{

        });
    });
}

/**
 栅栏函数：限制一个队列中异步函数的执行顺序，注意不能使用全局并发队列
 */
+(void)test7{

    dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSLog(@"1---%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2---%@",[NSThread currentThread]);
    });

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

/**
 监听多个队列的任务执行-队列组
 */
+(void)test8{

}

/**
 GCD常用函数
 */
+(void)test6{



    /**
     快速迭代
     @param iterations#> 遍历次数 description#>
     //并发队列:会开启多条子线程和主线程一起并发的执行任务
     //主队列:死锁
     //普通的串行的队列:和for循环一样
     @param queue#> 队列description#>
     @param size_t 执行的任务
     */
    dispatch_apply(10, dispatch_get_global_queue(0, 0), ^(size_t i) {
        NSLog(@"%zd----%@",i,[NSThread currentThread]);
    });

}
@end
