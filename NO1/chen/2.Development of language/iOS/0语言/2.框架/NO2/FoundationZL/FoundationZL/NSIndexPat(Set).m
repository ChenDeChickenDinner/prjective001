//
//  NSIndexPat(Set).m
//  FoundationZL
//
//  Created by xs on 2017/6/5.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NSIndexPat(Set).h"

@implementation NSIndexPat_Set_

@end

/*
**************** NSIndexPath *****************
//    * NSIndexPath 是一个对象，表示某个节点的索引路径。（节点，路径）
//    * length 表示这个索引搜索的长度，当length<indexs.count的话路径准确。
//     *path 表示根据length搜索的每个节点的值

//    * 根据一个节点，创建一个路径  {length = 1, path = 9}
NSIndexPath __unused *index  = [NSIndexPath indexPathWithIndex:9];

//     *根据多个节点以及长度，创建一个路径 {length = 4, path = 1 - 2 - 3 - 4}
NSUInteger integer4[] = {1,2,3,4};
NSIndexPath __unused *index4 = [NSIndexPath indexPathWithIndexes:integer4 length:4];

//    *在当前路径上添加一个节点生成新的路径对象
NSIndexPath __unused *index5 =  [index4 indexPathByAddingIndex:1];

//    *在当前路径上删除最后一个节点生成新的路径对象
NSIndexPath __unused *index6 =  [index4 indexPathByRemovingLastIndex];

//    *取当前路径对象中 某个位置的 节点值
NSUInteger integer = [index4 indexAtPosition:3];
NSLog(@"integer = %ld",integer);

//    *二个路径对象做对比
NSComparisonResult __unused result = [index4 compare:index5];


****************   NSIndexPath (UITableView)  *****************

//    *根据组号，行号 创建一个路径对象  {length = 2, path = 1 - 3},section = 1,row = 3
NSIndexPath __unused *index7 = [NSIndexPath indexPathForRow:3 inSection:1];
NSLog(@"index7 = %@,section = %ld,row = %ld",index7,index7.section,index7.row);






//NSIndexSet:是个唯一的(元素不可重复)，有序的，无符号整数集合 俗称索引集合
//    *通过一个值/范围/索引 来创建一个索引对象
NSIndexSet __unused *set = [[NSIndexSet alloc]init];
NSIndexSet __unused *set2 = [[NSIndexSet alloc]initWithIndex:999];
NSIndexSet __unused *set3 = [[NSIndexSet alloc]initWithIndexesInRange:NSMakeRange(1, 15)];
NSIndexSet __unused *set4 = [[NSIndexSet alloc]initWithIndexSet:set3];

//    *count /firstIndex/lastIndex 数量，第一个，最后一个
//    NSLog(@"set = %@,count  = %ld,firstInde = %ld,lastIndex = %ld",set4,set4.count,set4.firstIndex,set4.lastIndex);

//    *根据一个范围计算某个索引集合中所包含的索引数量
NSUInteger __unused countOfRange = [set4 countOfIndexesInRange:NSMakeRange(4, 19)];

//    *判断某个集合中是否包含 某个索引/范围内的/集合
BOOL __unused bool1 = [set4 containsIndex:2];
BOOL __unused bool2 = [set4 containsIndexesInRange:NSMakeRange(2, 2)];
BOOL __unused bool3 = [set4 containsIndexes:set3];
//    NSLog(@"bool1 = %d,bool2 = %d,bool3 = %d,",bool1,bool2,bool3);


//    *枚举这个集合
[set4 enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
    //        NSLog(@"idx1 = %ld,stop1 = %d",idx,*stop);
}];

//    *根据某个指令枚举这个集合
[set4 enumerateIndexesWithOptions:NSEnumerationReverse usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
    //        NSLog(@"idx2 = %ld,stop2 = %d",idx,*stop);

}];
//    *在某个范围根据某个指令枚举这个集合
[set4 enumerateIndexesInRange:NSMakeRange(0, 5) options:NSEnumerationReverse usingBlock:^(NSUInteger idx, BOOL * _Nonnull stop) {
    //        NSLog(@"idx = %ld,stop = %d",idx,*stop);

}];



[set4 enumerateRangesUsingBlock:^(NSRange range, BOOL * _Nonnull stop) {
    //        NSLog(@"range = %@",NSStringFromRange(range));
}];

[set4 enumerateRangesWithOptions:NSEnumerationReverse usingBlock:^(NSRange range, BOOL * _Nonnull stop) {
    //        NSLog(@"range = %@",NSStringFromRange(range));

}];

[set4 enumerateRangesInRange:NSMakeRange(0, 2) options:NSEnumerationConcurrent usingBlock:^(NSRange range, BOOL * _Nonnull stop) {

}];

//    *可变集合，当添加的是（重复的或者空的元素/集合）时候不会引用崩溃，但是无效的
//      * 移除的时候，若被移除的是无效的元素则无影响
NSMutableIndexSet *seta = [NSMutableIndexSet indexSet];
[seta addIndex:5];
[seta addIndex:5];
[seta addIndexesInRange:NSMakeRange(0, 3)];
[seta addIndexes:seta];
[seta addIndexes:set3];
[seta removeIndex:5];
[seta removeIndex:3];
[seta removeIndexes:set3];
NSLog(@"seta = %@,count  = %ld,firstInde = %ld,lastIndex = %ld",seta,seta.count,seta.firstIndex,seta.lastIndex);
*/
