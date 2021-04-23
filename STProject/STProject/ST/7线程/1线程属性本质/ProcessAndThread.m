//
//  ProcessAndThread.m
//  2019OC2
//
//  Created by xs on 2019/3/5.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ProcessAndThread.h"

@implementation ProcessAndThread






/**线程的生命周期
1.进程开启默认开启一条主线程，直到程序退出

2.APP项目中所有UI操作必须在主线程中执行

3.子线程需要手动创建

4.线程的生命周期以及状态
 a.线程对象创建:刚被创建出来，只能进入可运行态或者死亡态
 b.就绪状态:让入线程可调度池等待被执行
 c.运行状态:执行任务
 d.阻塞状态:在执行过程中需要等待某个事件发生，则被阻塞
 e.死亡状态:任务执行完毕，它的寄存器上下文以及堆栈内容等将被释放，不可重新被唤醒
 f.线程对象销毁:内存被回收
 */



@end
