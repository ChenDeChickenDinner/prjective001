//
//  ThreadSecurity.m
//  2019OC
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ThreadSecurity.h"
//线程安全,
//线程同步本质，让多个线程 不同事访问资源
//技术1.子线程串行队列
//技术2.加锁
@implementation ThreadSecurity

@end
/*
 //线程安全,
 //线程同步本质，让多个线程 不同事访问资源
 //技术1.子线程串行队列
 //技术2.加锁
 
 1.一个访问量，一个方法
 2.一个访问量，多个方法，

 3.多度单写
 1.访问对数据无影响，可多线程同时
 2.同时只能一个线程写
 3.写的时候不能读
 */
