
#import "NSObject_protocol.h"

@implementation NSObject_protocol


#pragma warning -对象信息获取
- (void)test1{

    [self class];
    [self superclass];

    [self hash];
    [self description];

    IMP imp = [self methodForSelector:@selector(description)];

}
#pragma warning -对象自检
- (void)test2{
    
    
    [self isKindOfClass:[NSObject class]]; // YES
    [self isMemberOfClass:[NSObject class]]; // NO
    
    BOOL b1 =  [self conformsToProtocol:@protocol(NSObject)];
    
    BOOL b2 =  [self respondsToSelector:@selector(test)];

}

#pragma warning -执行方法
- (void)test3{
    // @protocol NSObject
    [self performSelector:@selector(hash)];
    [self performSelector:@selector(hash) withObject:nil];
    [self performSelector:@selector(hash) withObject:nil withObject:nil];
    
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
