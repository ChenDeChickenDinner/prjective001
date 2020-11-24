//
//  XSAlloc.m
//  Runtime
//
//  Created by xs on 2020/11/20.
//  Copyright © 2020 xax. All rights reserved.
//

#import "XSAlloc.h"

@implementation XSAlloc
/** 为新对象分配内存空间, 参数传nil */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
    return [super allocWithZone:zone];
}
/** 为新对象分配内存空间，底层会调用allocWithZone */
+ (instancetype)alloc{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
    return [super alloc];
}
/** 为新对象初始化 */
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
    }
    return self;
}
/** 为新对象分配内存空间并初始化, 等于[[NSObject alloc] init] */
+ (instancetype)new{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
    return [super new];
}
@end
