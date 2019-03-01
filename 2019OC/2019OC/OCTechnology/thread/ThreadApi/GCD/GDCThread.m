//
//  GDCThread.m
//  2019OC
//
//  Created by xs on 2019/2/27.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "GDCThread.h"

@implementation GDCThread
+ (void)load{
//    [self test3];
}
/*
 什么是GCD
 1.全称是Grand Central Dispatch，可译为“牛逼的中枢调度器”
 2.纯C语言，提供了非常多强大的函数
 3.ios6.0 后 GCD 被纳入ARC的管理范围内

 GCD的优势
 1.GCD是苹果公司为多核的并行运算提出的解决方案
 2.GCD会自动利用更多的CPU内核（比如双核、四核）
 3.GCD会自动管理线程的生命周期（创建线程、调度任务、销毁线程）
 4.程序员只需要告诉GCD想要执行什么任务，不需要编写任何线程管理代码


 任务
 1.需要执行的操作
 2.DCG的任务封装
 a.用同步的函数封装任务(只能在当前线程中执行任务，不具备开启新线程的能力)
 b.用异步的函数封装任务(可以在新的线程中执行任务，具备开启新线程的能力)

 队列
 1.队列是什么:一直类似栈的数据结构，先进先出，后进后出，队列存放任务
 2.DCG的队列
 a.串行队列,将队列中顺序任务顺序的拿出来，放到某一条线程执行，上个任务执行完了 才能取出下一个任务执行
 b.并发队列,将队列中顺序任务顺序的拿出来，放到多条线程执行，允许多个任务并发（同时）执行


 任务 + 队列 执行
 1.创建队列
 2.封装任务
 3.把任务添加到队列

 */

/**
 DCG的队列
 */
+(void)test1{

    /* 参数说明
     *
     * 第一个参数:C语言的字符串 给队列起个名字(建议:com.520it.www.DownloadQueue)
     * 第二个参数:类型
     *          DISPATCH_QUEUE_SERIAL      串行队列
     *          DISPATCH_QUEUE_CONCURRENT  并发队列
     */
    dispatch_queue_t queue1 = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);

    /** 全局的并发队列
     * identifier:队列的优先级  // 默认（中） 0
     * flags: 此参数暂时无用，用0即可
     */
    dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT , 0);
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
 1.是否会开启新的子线程 看是否是异步函数
 2.是否开多条线程 看是否是异步队列
 3.异步函数+ 异步队列:开几条线程并不是由任务的数量决定的,是有GCD内部自动决定的

 // 同步函数 + 串行队列:不会开启子线程,所有的任务在当前线程中串行执行
 // 同步函数 + 并发队列:不会开启子线程,所有的任务在当前线程中串行执行

 // 异步函数 + 串行队列:会开启1条子线程,所有的任务在当前线程中串行执行
 // 异步函数 + 并发队列:会开启多条子线程,所有的任务并发执行

 // 同步函数 + 串行主队列:死锁(主线程本身就有任务,同步函数又要求在当前线程执行，需要从队列取任务，主线程后面的不执行完，取不出任务)
 // 异步函数 + 串发主队列:不会开启线程，所有任务在主线程中串行执行
 */
+(void)test3{

    { // 同步函数 + 串行队列:不会开启子线程,所有的任务在当前线程中串行执行
        dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
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
    { // 同步函数 + 并发队列: 不会开启子线程,所有的任务在当前线程中串行执行
        dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);
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
    { // 异步函数 + 串行队列:会开启1条子线程,所有的任务在当前线程中串行执行
        dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
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

    { // 异步函数 + 并发队列:会开启多条子线程,所有的任务并发执行
        dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);
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
}

/**
 DCG的主队列
 */
+(void)test4{
     // 串行主队列
        /*
         1.放在主队列中的任务，都会放到主线程中执行
         */
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
        {
            dispatch_queue_t queue  = dispatch_queue_create("123", DISPATCH_QUEUE_SERIAL);
            dispatch_async(queue, ^{
                NSLog(@"执行block1，可以执行");
                dispatch_sync(queue, ^{
                    NSLog(@"执行block2，不可以执行，发生死锁");
                });
                /* 首先这是一个串行队列，遵守先进先出原则
                 1.block1先被添加到队列，block2后添加到队列
                 2.block1内部有block2,block1想执行完需要 block2执行完，但block2在队列中在block1后面,block2想执行必须等block1执行完
                 */
            });
            NSLog(@"这里也可以执行");
        }
    // 死锁的发生的条件:使用sync函数往当前串行队列中添加任务，会卡住当前的串行队列（产生死锁）

        { // 异步函数 + 串行主队列:不会开启线程，所有任务在主线程中串行执行
            /*
             1.主线程在在忙，在异步封装任务，不同等第一个任务执行完 就可以封装后面的任务
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

/**
 GCD常用函数
 */
+(void)test6{

    //一次性代码:整个程序运行过程中只会执行一次 + 本身是线程安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

    });

    //GCD中的延迟执行
    /* 参数说明
     *
     * 第一个参数:设置时间(GCD中的时间单位是纳秒)
     * 第二个参数:队列(决定block中的任务在哪个线程中执行,如果是主队列就是主线程,否在就在子线程)
     * 第三个参数:设置任务
     * 原理:(哪个简单)
     * A 先把任务提交到队列,然后等两秒再执行 错误
     * B 先等两秒,再把任务提交到队列        正确
     */
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{

    });

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

