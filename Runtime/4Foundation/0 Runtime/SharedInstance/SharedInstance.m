//
//  SharedInstance.m
//  Runtime
//
//  Created by xs on 2020/11/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "SharedInstance.h"

@implementation SharedInstance
+(SharedInstance *)sharedInstance{
    static SharedInstance *__singleton;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        __singleton = [[super alloc]init];
    });
    return __singleton;
}
@end
