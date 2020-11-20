//
//  XSInstance.m
//  Runtime
//
//  Created by xs on 2020/11/20.
//  Copyright © 2020 xax. All rights reserved.
//

#import "XSInstance.h"

@implementation XSInstance
+(XSInstance *)sharedInstance{
    static XSInstance *__singleton;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        __singleton = [[super alloc]init];
    });
    return __singleton;
}
//+ (instancetype)allocWithZone:(struct _NSZone *)zone{
//    return [XSInstance sharedInstance];
//}


@end
