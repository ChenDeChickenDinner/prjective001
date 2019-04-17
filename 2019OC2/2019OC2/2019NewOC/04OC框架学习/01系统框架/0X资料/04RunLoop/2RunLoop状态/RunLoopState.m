//
//  RunLoopState.m
//  2019OC2
//
//  Created by xs on 2019/3/5.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "RunLoopState.h"

@implementation RunLoopState
/**
 RunLoop运行状态
 */
- (void)test1{
    // CFRunLoopObserverRef
    /**
     @param allocator#> 分配存储空间 默认 description#>
     @param activities#> 要监听的状态 description#>
     @param repeats#> 是否要持续监听 description#>
     @param order#> 0 description#>
     @param observer 观察者
     @param activity 观察到的状态
     @return
     */
    //01 创建观察者对象
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"runloop进入");
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timer事件");
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理source事件");
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将进入休眠");
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                break;
            case kCFRunLoopExit:
                NSLog(@"runloop退出");
                break;

            default:
                break;
        }
    });

    //02 监听当前runloop的运行状态
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);

    [NSTimer scheduledTimerWithTimeInterval:4.0 target:self selector:@selector(timerRun) userInfo:nil repeats:YES];

    /*
     2019-02-27 20:23:34.850958+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 被唤醒
     2019-02-27 20:23:34.851165+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 处理收到的事件--timer--RUN
     2019-02-27 20:23:34.851294+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 即将处理timer事件
     2019-02-27 20:23:34.851379+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 即将处理source事件
     2019-02-27 20:23:34.851486+0800 01-掌握-RunloopObserver简单说明[78311:14506564] 即将进入休眠
     */
}
@end
