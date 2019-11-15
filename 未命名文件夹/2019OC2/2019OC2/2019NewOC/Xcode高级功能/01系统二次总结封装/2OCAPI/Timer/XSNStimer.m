//
//  XSNStimer.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "XSNStimer.h"
/*
 1.与 runloop 有关的细节
 2.与 内存管理  有关的细节
 */
@implementation XSNStimer


/**
 定时器问题
 1.NSTimer会受到 runloop的影响
 */
- (void)test1{
    { // 默认
        //未添加到任何模式，不会执行
        NSTimer *time1 = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {

        }];

        //scheduled:计划(默认已经加入默认模式)
        NSTimer *time2 = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {

        }];
    }

    {
        NSTimer *time1 = [NSTimer timerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {

        }];
        [[NSRunLoop currentRunLoop] addTimer:time1 forMode:NSRunLoopCommonModes];
    }
}
@end
