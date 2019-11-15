//
//  ThreadMemorylifeCycle.m
//  2019OC
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//


/*
 一个线程 按道理是是按顺序执行任务，上一个没完就无法执行下一个 为什么一条线程还有那么多任务一起执行？
 */
#import "ThreadMemorylifeCycle.h"
//1.线程 内存管理以及其状态生命周期，使用情况 理论
//2.多种复杂运用场景下
@implementation ThreadMemorylifeCycle
/*
 1.新建:new
 2.就绪:start,进入可调度线程池
 3.运行中:running,
 4.阻塞中:调用了sleep方法\等待同步锁,退出可调度线程池
 5.死亡:线程任务执行完毕，异常\强制退出

 线程内存管理 ，比如 当一个线程 属于一个对象，当对象提前释放掉了
 子线程里开子线程，第一个挂了

 1.线程在不在 跟能不能使用 是二码事
 */
@end
