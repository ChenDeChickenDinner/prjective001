//
//  BaseType_chen.m
//  Foundation
//
//  Created by xs on 2018/12/7.
//  Copyright © 2018 Touker. All rights reserved.
//

#import "BaseType_chen.h"

@implementation BaseType_chen
+ (void)load{
    [self test1];
}
/**

 https://www.jianshu.com/p/9b81da51a4af
 在64位系统中
 int 占4个字节
 long 占8个字节
 long long 占8个字节

 int          -2147483648～2147483647
 unsigned int 0～4294967295


 unsigned long 和 unsigned long long一样
 long 和long long一样
 long long的最大值：9223372036854775807
 long long的最小值：-9223372036854775808
 unsigned long long的最大值：1844674407370955161
 __int64的最大值：9223372036854775807
 __int64的最小值：-9223372036854775808
 unsigned __int64的最大值：18446744073709551615



 int32_t 是int的别名
 NSInteger 是long的别名
 int64_t 是long long的别名


 */
/**
@()代表NSNumber对象
@""代表NSString对象
@[]代表NSArray对象
@{}代表NSDictionary对象
 */
/** OC中的基本数据类型  NSInteger NSUInteger  CGFloat
 1. NSInteger = int/long
 2. NSUInteger = unsigned int/ unsigned long
 3. static const NSInteger NSNotFound = NSIntegerMax;
 3. CGFloat = float/double;也就是说在64位系统下,CGFLOAT是double类型,32位系统下是float类型.
 */
+ (void)test1{


    // NSInteger = long/int
    /**
     #if __LP64__ || (TARGET_OS_EMBEDDED && !TARGET_OS_IPHONE) || TARGET_OS_WIN32 || NS_BUILD_32_LIKE_64
     typedef long NSInteger;
     #else
     typedef int NSInteger;
     #endif
     */
    NSInteger value1 = 10;

    // NSInteger = 8
    NSLog(@"NSInteger = %lu\n",sizeof(value1));

    /**
     #define NSIntegerMax    LONG_MAX
     #define NSIntegerMin    LONG_MIN
     */
    NSInteger integerMax = NSIntegerMax;
    NSLog(@"NSIntegerMax = %ld\n",integerMax);

    NSInteger intergerMin = NSIntegerMin;
    NSLog(@"intergerMin = %ld\n",intergerMin);


}
@end
