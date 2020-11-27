//
//  ReplacingSubstrings.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "ReplacingSubstrings.h"

@implementation ReplacingSubstrings
+ (void)load{
    {
        NSString *str = @"123456789";
        //替换(指定字符串)
        str = [str stringByReplacingOccurrencesOfString:@"a" withString:@"2"];
    }
    {
        NSString *str = @"123456789";
        //替换(指定字符串,条件,范围)
        str = [str stringByReplacingOccurrencesOfString:@"a" withString:@"2" options:NSRegularExpressionSearch range:NSMakeRange(0, str.length)];
    }
    {
        NSString *str = @"123456789";
        //替换(指定字符串)
        str = [str stringByReplacingCharactersInRange:NSMakeRange(0, str.length-2) withString:@"ab"];


    }



}
@end
