//
//  StringNumericValues.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "StringNumericValues.h"
/*
 @property (readonly) double doubleValue;
 @property (readonly) float floatValue;
 @property (readonly) int intValue;
 @property (readonly) NSInteger integerValue;
 @property (readonly) long long longLongValue;
 @property (readonly) BOOL boolValue
 */
@implementation StringNumericValues


// 当字符串为空 或者 无不包含数字的时候 ，其数值化结果 为 0 或者 0.000 或者NO
+ (void)load{
    NSString *str = nil;
    int value =  str.intValue;
    BOOL ob = str.boolValue;
    
    {
         NSString *str1 = @"中国helloChina";
         int intStr1 = [str1 intValue];
         NSLog(@"intStr1 = %d",intStr1);
         
         NSString *str2 = @"12";
         int intStr2 = [str2 intValue];
         NSLog(@"intStr2 = %d",intStr2);
    }
    {
          NSString *str1 = @"中国helloChina";
          NSInteger intStr1 = [str1 integerValue];
          NSLog(@"intStr1 = %ld",(long)intStr1);
          
          NSString *str2 = @"12";
          NSInteger intStr2 = [str2 integerValue];
          NSLog(@"intStr2 = %ld",(long)intStr2);
    }
    {
        NSString *str1 = @"中国helloChina";
        CGFloat doubleStr1 = [str1 doubleValue];
        NSLog(@"doubleStr1 = %lf",doubleStr1);

        NSString *str2 = @"12.3455";
        CGFloat doubleStr2 = [str2 doubleValue];
        NSLog(@"doubleStr2 = %lf",doubleStr2);
    }

    {
        NSString *str1 = @"中国helloChina";
        CGFloat floatStr1 = [str1 floatValue];
        NSLog(@"floatStr1 = %lf",floatStr1);
        
        NSString *str2 = @"12.3455";
        CGFloat floatStr2 = [str2 floatValue];
        NSLog(@"floatStr2 = %lf",floatStr2);
    }
    {
        NSString *str1 = @"T";
        BOOL  boolStr1 = [str1 boolValue];
        NSLog(@"boolStr1 = %d",boolStr1);
        
        NSString *str2 = @"mmnnn";
        BOOL  boolStr2 = [str2 boolValue];
        NSLog(@"boolStr2 = %d",boolStr2);
    }
}
@end
