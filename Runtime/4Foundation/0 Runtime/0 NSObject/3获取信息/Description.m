//
//  Description.m
//  Runtime
//
//  Created by xs on 2020/11/20.
//  Copyright © 2020 xax. All rights reserved.
//

#import "Description.h"

@implementation Description

- (instancetype)init
{
    self = [super init];
    if (self) {
        IMP imp = [self methodForSelector:@selector(hash)];
    }
    return self;
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

@end
