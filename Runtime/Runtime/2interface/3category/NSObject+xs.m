//
//  NSObject+xs.m
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import "NSObject+xs.h"

@implementation NSObject (xs1)
+ (void)load{
    
}
- (void)name{
    NSLog(@"xs1");
}

- (NSString *)nameStr{
    return @"readonly";
}
@end
@implementation NSObject (xs2)
+ (void)load{
    
}
- (void)name{
    NSLog(@"xs2");
}
@end

@implementation XSNSObject
+ (void)load{
    NSObject *instance = [[NSObject alloc]init];
    // xs1 xs2在同一文件，但xs2还是最后编译的
    [instance name];
    
    [instance nameStr];
}
@end
