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


#pragma warning -对象信息获取
- (void)test1{

    [self class];
    [self superclass];

    [self hash];
    [self description];


}
#pragma warning -对象自检
- (void)test2{
    
    
    [self isKindOfClass:[NSObject class]]; // YES
    [self isMemberOfClass:[NSObject class]]; // NO
    
    BOOL b1 =  [self conformsToProtocol:@protocol(NSObject)];
    BOOL b2 =  [self respondsToSelector:@selector(test)];

}
#pragma warning -消息机制
- (void)test3{
    
    IMP imp = [self methodForSelector:@selector(description)];

//    - (id)forwardingTargetForSelector:(SEL)aSelector OBJC_AVAILABLE(10.5, 2.0, 9.0, 1.0, 2.0);
//    - (void)forwardInvocation:(NSInvocation *)anInvocation OBJC_SWIFT_UNAVAILABLE("");
//    - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector OBJC_SWIFT_UNAVAILABLE("")
}
@end
