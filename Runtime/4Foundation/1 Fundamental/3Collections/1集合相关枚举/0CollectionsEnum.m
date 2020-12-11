//
//  0CollectionsEnum.m
//  Runtime
//
//  Created by xs on 2020/12/10.
//  Copyright © 2020 xax. All rights reserved.
//

#import "0CollectionsEnum.h"

@implementation _CollectionsEnum
+ (void)load{
    //special semantic values(特殊语义值)
    /*
     NSNull:单例对象，用于表示不允许使用零值的集合对象中的空值
     */
    NSNull *null = [NSNull null];

    /*
     NSNotFound:一个值，指示找不到或不存在所请求的项目。
     static const NSInteger NSNotFound = NSIntegerMax;
     */
    NSInteger notfound = NSNotFound;
    
    /* 快速枚举协议
     @protocol NSFastEnumeration
     - (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained _Nullable [_Nonnull])buffer count:(NSUInteger)len;
     @end
     1.NSDictionary NSArray NSSet 一般集合类Class都遵循了此协议，实现了其协议方法
     2. for forin 以及 enumerateObjectsUsingBlock 等语法糖的底层就是调用了这个协议的实现
     */
    
    /* 枚举
     Enumeration:枚举 Options:选项 怎么样进行枚举
     typedef NS_OPTIONS(NSUInteger, NSEnumerationOptions) {
         NSEnumerationConcurrent = (1UL << 0), 并发执行
         NSEnumerationReverse = (1UL << 1), 反向执行
     };
     
     1.使用Block进行迭代，在确定元素类型的情况下，可以修改 Block的入参方法名
     2.Block Concurrent 并发执行的时候，对后面代码执行的影响（
     2.1.是否一定会进行多线程迭代：并不一定
     2.2.有可能因为多线程，所以要考虑 可能还没迭代完，就用了数组
     3.3.对后面代码执行的影响，是否一定会等多线程完 才走的后面（待验证）
     
     */
    
    //1.底层貌似使用的是GCD
    NSEnumerationOptions enumOption1 = NSEnumerationConcurrent;
    //1.只有对有序集合才有效
    NSEnumerationOptions enumOption2 = NSEnumerationReverse;
    
    /*排序
     Concurrent:同时 Stable:稳定
     typedef NS_OPTIONS(NSUInteger, NSSortOptions) {
         NSSortConcurrent = (1UL << 0), 高效的但不稳定的排序算法,例如:快速排序,貌似没有使用多线程，一般最好不用
         NSSortStable = (1UL << 4), 是稳定的排序算法,例如:冒泡排序 插入排序
     };
     */
    NSSortOptions sortOption1 = NSSortConcurrent;
    NSSortOptions sortOption2 = NSSortStable;
    
    /* Comparison:比较 Ascending:上升 Descending:下降
     typedef NS_CLOSED_ENUM(NSInteger, NSComparisonResult) {
         NSOrderedAscending = -1L, 前者小于后置
         NSOrderedSame, 二者相等
         NSOrderedDescending 前者大于后者
     };
     typedef NSComparisonResult (^NSComparator)(id obj1, id obj2);
     */
    NSComparisonResult result1 = NSOrderedAscending;
    NSComparisonResult result2 = NSOrderedSame;
    NSComparisonResult result3 = NSOrderedDescending;
    NSComparator black = ^NSComparisonResult(id obj1, id obj2){
        return [obj1 compare:obj2];
    };
    
    
    
    
    
    /*
     typedef NS_OPTIONS(NSUInteger, NSBinarySearchingOptions) {
         NSBinarySearchingFirstEqual = (1UL << 8),
         NSBinarySearchingLastEqual = (1UL << 9),
         NSBinarySearchingInsertionIndex = (1UL << 10),
     };
     */
    
    NSBinarySearchingOptions SearchingOption1 = NSBinarySearchingFirstEqual;
    NSBinarySearchingOptions SearchingOption2 = NSBinarySearchingLastEqual;
    NSBinarySearchingOptions SearchingOption3 = NSBinarySearchingInsertionIndex;

}
@end
