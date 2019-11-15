//
//  XSPerformSelector.m
//  2019OC
//
//  Created by xs on 2019/2/28.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "XSPerformSelector.h"

@implementation XSPerformSelector

/*
performSelector系列方法的底层原理 受什么影响，先看这个方法是哪个分类下的
 */
- (void)test1{
    // 实现原理 在当前线程中的runloop中添加一个定时器(如果是在子线程中且没有runloop则无法执行)
    // 内部即使获取了runloop(没有则创建了），但没有启动
    [self performSelector:@selector(run) withObject:nil afterDelay:3.0];
}
- (void)run{

}
@end
