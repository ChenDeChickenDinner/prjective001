//
//  NSObject_inst.m
//  1231231
//
//  Created by xs on 2021/3/11.
//

#import "NSObject_inst.h"

@implementation NSObject_inst
/** 为新对象初始化 */
- (instancetype)init
{
    self = [super init];
    if (self) {
 
    }
    return self;
}


- (void)dealloc{
    NSLog(@"%s",__func__);
}
#pragma warning -类信息获取
- (void)test{
    IMP imp = [self methodForSelector:@selector(description)];
    NSMethodSignature *sig = [self methodSignatureForSelector:@selector(description)];
}


- (void)test2{
    //NSObject (NSDelayedPerforming) runloop相关
    [self performSelector:@selector(hash) withObject:nil afterDelay:0.2];
    [self performSelector:@selector(hash) withObject:nil afterDelay:0.2 inModes:@[]];
    [NSObject cancelPreviousPerformRequestsWithTarget:self]; //取消已设置的延迟执行
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hash) object:nil];
    
    //NSObject (NSThreadPerformAdditions)线程
    [self performSelectorInBackground:@selector(hash) withObject:nil];
    [self performSelector:@selector(hash) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES];
    [self performSelector:@selector(hash) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES modes:nil];
    [self performSelectorOnMainThread:@selector(hash) withObject:nil waitUntilDone:YES];
    [self performSelectorOnMainThread:@selector(hash) withObject:nil waitUntilDone:YES modes:nil];
}


@end
