//
//  GettingLength.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "GettingLength.h"

@implementation GettingLength
+ (void)load{
    
    NSString *str = @"123456";
    NSUInteger length1 =  str.length;
    //“准确”计算转化为enc编码方式所占的字节大小
    NSUInteger length2 =  [str lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    //“预估”转化为enc编码方式的所占的字节大小(返回以给定编码存储接收器所需的最大字节数)
    NSUInteger length3 =  [str maximumLengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"");
}
@end
