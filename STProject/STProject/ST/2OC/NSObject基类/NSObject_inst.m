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



#pragma warning -消息机制-消息转发
- (id)forwardingTargetForSelector:(SEL)aSelector{
    return [super forwardingTargetForSelector:aSelector];
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [super methodSignatureForSelector:aSelector];
}

- (void)forwardInvocation:(NSInvocation *)anInvocation{

 
}
#pragma warning -消息机制-方法找不到
- (void)doesNotRecognizeSelector:(SEL)aSelector{
    
}

@end
