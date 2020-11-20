//
//  XSOBject.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/17.
//

#import "NSObject.h"



@implementation XSOBject





- (instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"11111");
    }
    return self;
}



- (id)copy{
    return [super copy];
}
- (id)mutableCopy{
    return [super mutableCopy];
}
- (BOOL)isEqual:(id)object{
    
    return  [super isEqual:object];
}


// 对象的hash值 一般用到特别的场景下
- (NSUInteger)hash{
    NSUInteger hash = [super hash];
    return hash;
}
/*
 1.当对象被%@打印的时候会调用
 2.description方法默认返回对象的描述信息(默认实现是返回类名和对象的内存地址)
 3.可以重写定制输出内容
 */
- (NSString *)description{
    NSString *description = [super description];
    return description;
}



- (void)dealloc{
    
}

//#pragma warning - runtime消息机制
//+ (BOOL)resolveClassMethod:(SEL)sel{
//    return YES;
//}
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    return YES;
//}
//- (void)doesNotRecognizeSelector:(SEL)aSelector{
//
//}
//- (void)forwardInvocation:(NSInvocation *)anInvocation{
//
//}
@end

@implementation XSOBject2
+ (void)load{


        XSOBject *ob = [XSOBject new];
        BOOL obBoo1 =  [ob isKindOfClass:[NSObject class]]; // YES
        BOOL obBoo2 =  [ob isMemberOfClass:[NSObject class]]; // NO
        
        [ob respondsToSelector:@selector(description)];
        [ob conformsToProtocol:@protocol(NSObject)];
        IMP imp =  [ob methodForSelector:@selector(description)];

    NSLog(@"1111");
}
@end







