//
//  NSArrayC.m
//  FoundationZL
//
//  Created by xs on 2017/6/7.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NSArrayC.h"

@implementation NSArrayC

@end
/*
 
 //NSInteger sortType(id st,id str,void cha){
 //
 //    NSString *s1 = (NSString *)st;
 //    NSString *s2 = (NSString *)str;
 //
 //    if(s1.length > s2.length){
 //        return NSOrderedAscending;
 //    }else if(s1.length < s2.length){
 //        return NSOrderedDescending;
 //    }
 //    return NSOrderedSame;
 //}



 - (void)text1{





 NSBinarySearchingOptions:二分查找的相关枚举
 *NSBinarySearchingFirstEqual = (1UL << 8),
 *NSBinarySearchingLastEqual = (1UL << 9),
 *NSBinarySearchingInsertionIndex = (1UL << 10),



 NSEnumerator:NSArray、NSSet、NSDictionary等集合类均可获取到NSEnumerator, 该类是一个抽象类，没有用来创建实例的公有接口
 - (nullable ObjectType)nextObject; // 集合中的下一个对象
 @property (readonly, copy) NSArray<ObjectType> *allObjects;// 此集合对应的原始集合

//:与数组结合使用
NSArray *array = @[@"hehe",@"xixi",@"heihei",@"wuwu",@"lala",@"haha"];
NSEnumerator *enumerator = [array objectEnumerator];
NSString *obj;
while (obj = [enumerator nextObject]) {
    NSLog(@"数组正序值开始打印：%@\n",obj);
}
NSEnumerator *reverseEnumerator = [array reverseObjectEnumerator];
id reverseObj;
while (reverseObj = [reverseEnumerator nextObject]) {
    NSLog(@"数组逆序值开始打印：%@\n",reverseObj);
}
//:与字典结合使用

 - (NSEnumerator<KeyType> *)keyEnumerator;//获取所有key值
 - (NSEnumerator<ObjectType> *)objectEnumerator;//获取所有value值

NSDictionary *dict = @{@"name":@"zhangsan",@"age":@(18),@"height":@(173.5)};
NSEnumerator *keyEnumerator = [dict keyEnumerator];
NSString *key;
while (key = [keyEnumerator nextObject]) {
    NSLog(@"字典key值开始打印：%@\n",key);
}
NSEnumerator *objEnumerator = [dict objectEnumerator];
id obj2;
while (obj2 = [objEnumerator nextObject]) {
    NSLog(@"字典value值开始打印：%@\n",obj2);
}
//:与集合结合使用

 - (NSEnumerator<ObjectType> *)objectEnumerator; //获取所有元素的值，并且是无序的

NSSet *set = [[NSSet alloc]initWithObjects:@"hehe",@"xixi",@"heihei",@"wuwu",@"lala",@"haha",nil];
NSEnumerator *enumerator2 = [set objectEnumerator];

id obj3;
while (obj3 = [enumerator2 nextObject]) {
    NSLog(@"NSSet中value值开始打印：%@\n",obj3);
}

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // 此数组永远是空的，可以把此指针指向别的数组 则当代码块过完之后此空数组释放
    NSArray __unused *array = [NSArray array];
    // 根据一个OC对象创建一个数组
    NSArray __unused *array2 = [NSArray arrayWithObject:@"123"];

    // nil 是数值元素结束的标志 不能少,@[]编译器特性的快捷生成
    NSArray __unused *array3 = [NSArray arrayWithObjects:@"123",@"456",@"789", nil];
    NSArray __unused *array33 = [NSArray arrayWithObjects:@"222",@"456",@"222", nil];

    // 数组的元素个数,第一个，最后一个对象
    NSUInteger __unused integer = array3.count;
    NSString __unused *s1 = array3.firstObject;
    NSString __unused *s2 = array3.lastObject;

    // 取出某个位置的元素, array3[2]编译器特性的快捷生成
    NSString __unused *str = [array3 objectAtIndex:1];


    // 提供一个数组添加一个对象或者另外一个数组来生成新数组
    NSArray __unused *array4 = [array3 arrayByAddingObject:@"7"];
    NSArray __unused *array5 = [array3 arrayByAddingObjectsFromArray:array2];
    NSLog(@"array= %@",array5);


    // 将NSArray根据分隔符转换为NSString
    NSString *str2 = [array3 componentsJoinedByString:@":"];
    NSLog(@"str2= %@",str2);//str2= 123:456:789

    // 检测是否包含某个元素
    BOOL __unused isHave = [array3 containsObject:@"123"];

    // 检测是否相同
    BOOL __unused isEqual = [array3 isEqualToArray:array2];

    // 与另外一个数组的第一个交集元素
    id someone = [array3 firstObjectCommonWithArray:array33];
    NSLog(@"someone= %@",someone);//someone= 456

    //获取某个指定元素的序号，若不存在则 -1，若有多个相同则返回第一个，
    NSUInteger  __unused integer2 = [array33 indexOfObject:@"222"];
    NSLog(@"integer2 = %ld",integer2);

    //获取某个指定元素的序号,在某个范围内
    NSUInteger  __unused integer3 = [array33 indexOfObject:@"222" inRange:NSMakeRange(2, 1)];
    NSLog(@"integer3 = %ld",integer3);

    //获取某个指针元素的序号
    NSUInteger  __unused integer4 = [array3 indexOfObjectIdenticalTo:@"123"];
    NSLog(@"integer4 = %ld",integer4);
    //获取某个指针元素的序号,在某个范围内
    NSUInteger  __unused integer5 = [array3 indexOfObjectIdenticalTo:@"123" inRange:NSMakeRange(0, 3)];
    NSLog(@"integer5 = %ld",integer5);

    // 二分查找
    NSUInteger  __unused integer6 = [array3 indexOfObject:@"123" inSortedRange:NSMakeRange(0, 22) options:NSBinarySearchingFirstEqual usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedAscending;

    }];


    // 数组的正序集合
    NSEnumerator __unused *enumerator = [array objectEnumerator];

    // 数组的倒序集合
    NSEnumerator __unused *reverseEnumerator = [array reverseObjectEnumerator];

    // 数组的排序
    NSArray __unused *newArray = [array3 sortedArrayUsingFunction:nil context:nil];

    // 使用一个方法来排序数组
    NSArray __unused *newArray2 = [array3 sortedArrayUsingSelector:@selector(compare:)];

    // 数组排序
    NSArray __unused *newArray22 = [array3 sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedAscending;
    }];

    NSArray __unused *newArray223 = [array3 sortedArrayWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedAscending;

    }];

    // 取得某个范围内的元素组成新数组
    NSArray __unused *newArray3 = [array3 subarrayWithRange:NSMakeRange(0, 2)];

    // 根据一个索引集合来组成新数组
    NSArray __unused *newArray4 = [array3 objectsAtIndexes:[NSIndexSet indexSetWithIndex:3]];


    // 枚举数组
    [array3 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    }];

    [array3 enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    }];

    [array3 enumerateObjectsAtIndexes:[NSIndexSet indexSetWithIndex:3] options:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    }];
    // 枚举数组 根据条件来获取一个NSUIndex对象
    NSUInteger __unused integer11 = [array3 indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        return YES;
    }];



    //写入数组中的数据，到指定path 的目录中
    BOOL write = [array3 writeToFile:@"123.tet" atomically:YES];

    //写入数组中的内容到 网上指定的路径
    BOOL write2 = [array3 writeToURL:@"http:www.baidu.cou" atomically:YES];



    NSMutableArray *mArray = [NSMutableArray array];

    [mArray addObject:@"123"];

    [mArray insertObject:@"456" atIndex:1];
    [mArray replaceObjectAtIndex:2 withObject:@"1"];

    [mArray removeObject:@"456"];
    [mArray removeLastObject];
    [mArray removeAllObjects];

    [mArray removeObjectAtIndex:1];
    [mArray removeObjectsInRange:NSMakeRange(0, 2)];
    [mArray removeObjectsAtIndexes:nil];
 
 
 */
