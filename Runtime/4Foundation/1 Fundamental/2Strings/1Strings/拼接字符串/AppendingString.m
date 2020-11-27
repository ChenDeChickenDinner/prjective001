//
//  AppendingString.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "AppendingString.h"

@implementation AppendingString
+ (void)load{
    NSString *str = @"123";
    str = [str stringByAppendingString:@"456"];
    str = [str stringByAppendingFormat:@"%d",66];
}
@end
