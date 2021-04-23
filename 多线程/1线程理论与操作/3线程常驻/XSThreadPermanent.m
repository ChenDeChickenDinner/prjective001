//
//  XSThreadPermanent.m
//  test
//
//  Created by xs on 2021/3/25.
//

#import "XSThreadPermanent.h"
@interface XSThread : NSThread

@end
@implementation XSThread

@end

@interface XSThreadPermanent()
@property(nonatomic,strong) XSThread *thread;
@property(nonatomic,assign,getter=isStopped) BOOL stop;
@end
@implementation XSThreadPermanent
//细节很多，慢慢体会
- (instancetype)init
{
    self = [super init];
    if (self) {
        _stop = NO;
        __weak typeof(self)weakSelf = self;
        self.thread  = [[XSThread alloc]initWithBlock:^{
            [[NSRunLoop currentRunLoop] addPort:[NSPort new] forMode:NSDefaultRunLoopMode];
            while (weakSelf&& !weakSelf.isStopped) {
                [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
            }
        }];
        [self.thread start];
    }
    return self;
}

- (void)__stop{
    self.stop  = YES;
    CFRunLoopStop(CFRunLoopGetCurrent());
    self.thread = nil;
}
- (void)__executeTask:(void(^)(void))task{
    task();
}
- (void)dealloc
{
    [self __stop];
}

- (void)stop{
    if (!self.thread)return;
    [self performSelector:@selector(__stop) onThread:self.thread withObject:nil waitUntilDone:YES];
}
- (void)executeTask:(void(^)(void))task{
    if (!task || !self.thread)return;
    
    [self performSelector:@selector(__executeTask:) onThread:self.thread withObject:task waitUntilDone:NO];
}
@end
