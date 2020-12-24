//
//  NSIndexSet_.m
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSIndexSet_.h"

@implementation NSIndexSet_
#pragma warning -索引集合创建
+ (void)load{
    
    /*
     1.无序的
     2.只能存放NSUInteger
     3.每个检索值只能出现一次
     */
    NSMutableIndexSet *indexSet = [NSMutableIndexSet indexSet];
    [indexSet addIndex:7];
    [indexSet addIndex:7]; // 添加无效
    NSLog(@"indexSet = %@",indexSet);
    {
        // 空集合<_NSCachedIndexSet: 0x10071dad0>(no indexes)
        NSIndexSet *indexSet;
        indexSet = [NSIndexSet indexSet];
        indexSet = [[NSIndexSet alloc]init];
        NSLog(@"indexSet = %@",indexSet);

        
        /*
         indexes:存在的元素个数
         ranges: 存在的的连续的range的个数
         indexes: (0 2-3 5-6):元素结构展示
         */
        indexSet = [NSIndexSet indexSetWithIndex:0];
        NSLog(@"indexSet = %@",indexSet);//[number of indexes: 1 (in 1 ranges), indexes: (0)]

        
        indexSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];
        NSLog(@"indexSet = %@",indexSet);//[number of indexes: 3 (in 1 ranges), indexes: (0-2)]
        
        NSMutableIndexSet *mIndexSet =  [NSMutableIndexSet indexSet];
        [mIndexSet addIndex:0];
        [mIndexSet addIndexesInRange:NSMakeRange(2, 2)];
        [mIndexSet addIndexesInRange:NSMakeRange(7, 2)];
        NSLog(@"mIndexSet = %@",mIndexSet);//[number of indexes: 5 (in 3 ranges), indexes: (0 2-3 7-8)]

        
    }
}
#pragma warning -可变的 索引集合
+ (void)MutableIndexSet{
    NSMutableIndexSet *mIndexSet = [NSMutableIndexSet indexSet];
    // 添加元素 已经存在的index并不会再次添加(不可重复性)
    [mIndexSet addIndex:0];
    [mIndexSet addIndexesInRange:NSMakeRange(2, 2)];
    [mIndexSet addIndexesInRange:NSMakeRange(5, 2)];

    NSLog(@"mIndexSet = %@",mIndexSet);
    // 删除不存在的index 并不会抛异常
    [mIndexSet removeIndex:9];
    [mIndexSet removeAllIndexes];
    [mIndexSet removeIndexesInRange:NSMakeRange(0, 9)];
}
#pragma warning -索引集合查询(firstIndex,lastIndex,是否包含BOOL)
+ (void)IndexesQuerying{
    NSIndexSet *set2 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];
    NSIndexSet *set3 = [[NSIndexSet alloc]initWithIndexSet:set2];

    NSUInteger count = set2.count;
    NSUInteger indx1 =  set2.firstIndex;
    NSUInteger indx2 =  set2.lastIndex;
    
    //是否包含
    if ([set2 containsIndex:0]) {
        
    }
    //是否包含
    if ([set2 containsIndexes:set3]) {
        
    }
    //是否包含(超出也不会抛异常)
    if ([set2 containsIndexesInRange:NSMakeRange(1, 2)]) {
        
    }
    //是否有交集(超出也不会抛异常)
    if ([set2 intersectsIndexesInRange:NSMakeRange(1, 2)]) {
        
    }
}
#pragma warning -索引集合迭代
+ (void)IndexesEnumerate{
    NSIndexSet *set2 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];

    {  // 枚举索引(一个元素一个元素的迭代)
        [set2 enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"idx = %ld",idx);
        }];
        
        [set2 enumerateIndexesWithOptions:NSEnumerationConcurrent usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                    
        }];
        
        [set2 enumerateIndexesInRange:NSMakeRange(1, 2) options:NSEnumerationConcurrent usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
                    
        }];
       
    }
    {
        // 枚举索引(一个range一个range的迭代)
        [set2 enumerateRangesUsingBlock:^(NSRange range, BOOL * _Nonnull stop) {
                    
        }];
        
        [set2 enumerateRangesWithOptions:NSEnumerationConcurrent usingBlock:^(NSRange range, BOOL * _Nonnull stop) {
                    
        }];
        
        [set2 enumerateRangesInRange:NSMakeRange(1, 2) options:NSEnumerationConcurrent usingBlock:^(NSRange range, BOOL * _Nonnull stop) {
                    
        }];
    }
}
#pragma warning -索引集合筛选(出多少个NSUInteger,有哪些NSIndexSet)
+ (void)IndexSetfilter{

    NSIndexSet *set = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];

    
    // 指定范围内(超出也不会抛异常) 元素的个数
    NSUInteger count2 = [set countOfIndexesInRange:NSMakeRange(0, 5)];

    // 1.通过测试的元素个数
    NSUInteger count3 = [set indexPassingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
        return YES;
    }];
    // 1.通过测试的元素集合
    NSIndexSet *testSet = [set indexesPassingTest:^BOOL(NSUInteger idx, BOOL * _Nonnull stop) {
        return YES;

    }];


}

@end
