//
//  NSObjCRuntime.m
//  Runtime
//
//  Created by xs on 2020/11/26.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSObjCRuntime.h"
/*
 static const NSInteger NSNotFound = NSIntegerMax;

 typedef NS_CLOSED_ENUM(NSInteger, NSComparisonResult) {
     NSOrderedAscending = -1L, 前者小于后置
     NSOrderedSame, 二者相等
     NSOrderedDescending 前者大于后者
 };
 
 typedef NS_OPTIONS(NSUInteger, NSEnumerationOptions) {
     NSEnumerationConcurrent = (1UL << 0),  多线程同时进行，不能保证顺序
     NSEnumerationReverse = (1UL << 1),单线程反顺序进行
 };

 typedef NS_OPTIONS(NSUInteger, NSSortOptions) {
     NSSortConcurrent = (1UL << 0), 同时  是高效的但不稳定的排序算法,例如:快速排序
     NSSortStable = (1UL << 4),稳定 是稳定的排序算法,例如:冒泡排序 插入排序
 };

 
 */


@implementation NSObjCRuntime
+ (void)load{
    

    NSInteger notFound = NSNotFound;
    
    NSComparisonResult resule = NSOrderedAscending;

}
@end
