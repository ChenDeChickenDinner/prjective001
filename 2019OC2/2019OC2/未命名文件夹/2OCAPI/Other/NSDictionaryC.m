//
//  NSDictionaryC.m
//  FoundationZL
//
//  Created by xs on 2017/6/9.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NSDictionaryC.h"

@implementation NSDictionaryC

@end
/*

 NSDictionary __unused *dict1 = [NSDictionary dictionary];
 NSDictionary __unused *dict2 = [NSDictionary dictionaryWithObject:@"1" forKey:@"a"];
 NSDictionary __unused *dict3 = [NSDictionary dictionaryWithObjects:@[@"1",@"2",@"3"] forKeys:@[@"a",@"b",@"c"]];
 NSDictionary __unused *dict4 = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"a",@"2",@"b", nil];
 NSDictionary __unused *dict5 = [NSDictionary dictionaryWithDictionary:dict4];
 NSLog(@"dict = %@",dict3);

 NSDictionary __unused *filedict = [NSDictionary dictionaryWithContentsOfFile:@"123.text"];
 NSDictionary __unused *urldict = [NSDictionary dictionaryWithContentsOfURL:@"xxxxx"];

 id __unused obje = [dict2 objectForKey:@"a"];
 NSLog(@"obje = %@",obje);

 NSEnumerator __unused *keyenumerator = [dict3 keyEnumerator];
 NSLog(@"keyEnumerator = %@",keyenumerator);

 NSEnumerator __unused *objectenumerator = [dict3 objectEnumerator];
 NSLog(@"objectenumerator = %@",objectenumerator);

 // 所有的key
 NSArray __unused *allKeys = dict3.allKeys;
 NSLog(@"allKeys = %@",allKeys);

 // 所有的values
 NSArray __unused *allValues = dict3.allValues;
 NSLog(@"allValues = %@",allValues);



 //通过value找对应多个key
 NSArray __unused *KeysByObje = [dict3 allKeysForObject:@"1"];;
 NSLog(@"KeysByObje = %@",KeysByObje);

 //通过一组key 取一组values
 NSArray __unused *objectsForKeys = [dict3 objectsForKeys:dict2.allKeys notFoundMarker:[NSNull class]];
 NSLog(@"objectsForKeys = %@",objectsForKeys);




 //通过value排序，返回key集合
 NSArray __unused *keyCompare1 = [dict3 keysSortedByValueUsingSelector:@selector(compare:)];
 NSLog(@"keyCompare1 = %@",keyCompare1);

 //用 value 通过 block 排序，返回key集合
 NSArray __unused *keyCompare2 = [dict3  keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
 return NSOrderedAscending;
 }];

 NSArray __unused *keyCompare3 = [dict3  keysSortedByValueWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
 return NSOrderedAscending;

 }];



 // 遍历字典
 [dict3 enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {

 }];

 [dict3 enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {

 }];

 // 写入文件 url
 BOOL __unused writeFile = [dict3 writeToFile:@"123.txt" atomically:YES];
 BOOL __unused writeUrl = [dict3 writeToURL:@"xxxx" atomically:YES];



 NSMutableDictionary __unused *mDict = [NSMutableDictionary dictionary];

 //如果新增加的key存在 会将之前的value覆盖 如果key不存在 会使字典增加一个键值对1
 [mDict setObject:@"1" forKey:@"a"];

 [mDict removeObjectForKey:@"b"];
 [mDict removeObjectsForKeys:@[@"a",@"b"]];
 [mDict removeAllObjects];

 //    共享键
 //    从iOS 6和OS X 10.8开始，字典可以使用一个事先生成好的键集，使用sharedKeySetForKeys:从一个数组中创建键集，用dictionaryWithSharedKeySet:创建字典。共享键集会复用对象，以节省内存。根据Foundation Release Notes，sharedKeySetForKeys:中会计算一个最小最完美的哈希值，这个哈希值丢弃了字典查找过程中探索循环的需要，因此使键的访问更快。

 //+ (id)sharedKeySetForKeys:(NSArray<KeyType <NSCopying>> *)keys NS_AVAILABLE(10_8, 6_0);
 //+ (NSMutableDictionary<KeyType, ObjectType> *)dictionaryWithSharedKeySet:(id)keyset NS_AVAILABLE(10_8, 6_0);
 
 
 
 */
