//
//  XSTimer.m
//  2019OC
//
//  Created by xs on 2019/2/27.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "XSTimer.h"

@interface XSTimer()
@property (nonatomic,strong)dispatch_source_t timer;
@end

/*
1.与 runloop 有关的细节
2.与 内存管理  有关的细节
 */
@implementation XSTimer
//NSTimer中的定时器工作会受到runloop运行模式的影响

- (void)test1{
    
}
//GCD中的定时器是精准的,不受影响

- (void)test2{
        //01 创建定时器对象
        /* 参数说明
         *
         * 第一个参数:soure的类型 DISPATCH_SOURCE_TYPE_TIMER 定时器
         * 第二个参数:对第一个参数的描述
         * 第三个参数:更详细的描述
         * 第四个参数:队列(GCD-4) 决定代码块(event_handler)在哪个线程中执行(主队列-主线程|非主队列-子线程)
         */
        dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));

        //02 设置定时器(开始时间|调用间隔|精准度)
        /* 参数说明
         *
         * 第一个参数:定时器对象
         * 第二个参数:开始计时的时间  DISPATCH_TIME_NOW 现在开始
         * 第三个参数:间隔时间
         * 第四个参数:精准度(允许的误差)
         */
        dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);

        //03 事件回调(定时器执行的任务)
        dispatch_source_set_event_handler(timer, ^{
            NSLog(@"GCD---%@",[NSThread currentThread]);
        });

        //04 启动定时器
        dispatch_resume(timer);

        //05 添加一个引用,否则会伴随定时器的释放 为无法正常工作
        self.timer = timer;
}
@end
