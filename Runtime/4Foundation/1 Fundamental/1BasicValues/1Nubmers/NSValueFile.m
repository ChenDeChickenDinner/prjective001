//
//  NSValueFile.m
//  Runtime
//
//  Created by xs on 2020/11/23.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSValueFile.h"

@implementation NSValueFile
/*
 1.NSValue可以包装任意值
 */
+ (void)load{
    char *myCString = "123456789";
    NSValue *value = [[NSValue alloc]initWithBytes:myCString objCType:@encode(char *)];
    const  char *objCType = value.objCType;
    char *newString = NULL;
    [value getValue:newString size:0];
  
    
}
/*
 1.包装结构体
  */
+ (void)test1{
    NSRange range = NSMakeRange(1, 5);
    
    NSValue *value = [NSValue valueWithRange:range];
    
    NSRange range2 = value.rangeValue;
}
/*
 1.NSNumber包装常用的基本数据类型
  */
+ (void)NSNumberTest{
    
    NSNumber *num1 = [NSNumber numberWithInt:10];
    NSNumber *num2 = [NSNumber numberWithInt:11];

    num1 = nil;
    num1 = @YES;
    num1 = @(12.4);
    // 属于get方法，即使为nil也不会有事
    int valu1 = num1.intValue;
    NSInteger valu2 = num1.integerValue;
    NSString *valu3 = num1.stringValue;
    
    BOOL isEqual = [num1 isEqual:num2];
    
    // 比大小
    NSComparisonResult result =  [num1 compare:num2];
}
@end
