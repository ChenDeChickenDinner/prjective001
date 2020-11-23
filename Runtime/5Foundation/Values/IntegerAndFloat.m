//
//  CGFloatFile.m
//  Runtime
//
//  Created by xs on 2020/11/23.
//  Copyright © 2020 xax. All rights reserved.
//

#import "IntegerAndFloat.h"

@implementation CGFloatFile
/*
 1. NSInteger = int/long
 2. NSUInteger = unsigned int/ unsigned long
 */
+ (void)test{

    NSInteger value_integer = 10;
    NSUInteger value_uinteger = 10;
}

/**
3. CGFloat = float/double;也就是说在64位系统下,CGFLOAT是double类型,32位系统下是float类型.
 */
+ (void)test1{
    CGFloat value_CGfloat = 10.0;
    CGFloat value_Min = CGFLOAT_MIN;
    CGFloat value_Max = CGFLOAT_MAX;
    
    
}
@end
