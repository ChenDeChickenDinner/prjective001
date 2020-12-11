//
//  NSIndexPath_.m
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSIndexPath_.h"

@implementation NSIndexPath_

#pragma warning -索引路径(创建,加减,比较)
+ (void)load{
    // 没有节点
    NSIndexPath *indexPath1 = [[NSIndexPath alloc]init];
    if (indexPath1) {
        NSLog(@"indexPath1 = %@",indexPath1);
        //NSIndexPath: 0x84376aec323740b1> {length = 0, path = }
    }
    // 一个节点
    NSIndexPath *indexPath2 = [NSIndexPath indexPathWithIndex:0];
    if (indexPath2) {
        NSLog(@"indexPath2 = %@",indexPath2);
        //NSIndexPath: 0x84376aec32374031> {length = 1, path = 0}
    }
    // 一个或多个节点
    const NSUInteger indexes[] = {1,3,4};
    NSIndexPath *indexPath3 = [NSIndexPath indexPathWithIndexes:indexes length:sizeof(indexes)/sizeof(NSUInteger)];
    NSLog(@"indexPath3 = %@",indexPath3);
    //NSIndexPath: 0x2c4b476887255bb1> {length = 3, path = 1 - 3 - 4}
    
    //多少个节点
    NSUInteger count = indexPath3.length;
    
    // 在末端增加一个节点
    indexPath3 = [indexPath3 indexPathByAddingIndex:9];
    NSLog(@"indexPath3 = %@",indexPath3);

    // 删除末端的一个节点
    indexPath3 = [indexPath3 indexPathByRemovingLastIndex];
    NSLog(@"indexPath3 = %@",indexPath3);

    // 没有节点了，还删除不会抛异常
    indexPath3 = [indexPath3 indexPathByRemovingLastIndex];
    indexPath3 = [indexPath3 indexPathByRemovingLastIndex];
    indexPath3 = [indexPath3 indexPathByRemovingLastIndex];
    indexPath3 = [indexPath3 indexPathByRemovingLastIndex];
    indexPath3 = [indexPath3 indexPathByRemovingLastIndex];
    NSLog(@"indexPath3 = %@",indexPath3);
    {
        /* 路径前后比较
         typedef NS_CLOSED_ENUM(NSInteger, NSComparisonResult) {
             NSOrderedAscending = -1L, 前者小于后置
             NSOrderedSame, 二者相等
             NSOrderedDescending 前者大于后者
         };
         */
        const NSUInteger indexes1[] = {1,3,4};
        NSIndexPath *indexPath1 = [NSIndexPath indexPathWithIndexes:indexes1 length:sizeof(indexes1)/sizeof(NSUInteger)];
        
        const NSUInteger indexes2[] = {1,3,5};
        NSIndexPath *indexPath2 = [NSIndexPath indexPathWithIndexes:indexes2 length:sizeof(indexes2)/sizeof(NSUInteger)];
        
        NSComparisonResult result = [indexPath1 compare:indexPath2];
        NSLog(@"");

    }
}
@end
