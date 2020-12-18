//
//  NSSet_.m
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSSet_.h"

@implementation NSSet_
#pragma warning - 集合创建
+ (void)load{
    
    
    {    //数据存储的探究
         NSString *path = @"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/2Array/arrayPlist.plist";
         NSNumber *num = [NSNumber numberWithInt:10];
         NSValue *value = [NSValue valueWithSize:NSMakeSize(10, 10)];
         NSString *str = [NSString stringWithFormat:@"123"];
         NSDate *date = [NSDate dateWithTimeIntervalSince1970:500];
         NSData *data = [NSData dataWithContentsOfFile:path];
         NSURL *url = [NSURL URLWithString:@"https://www.jianshu.com"];
         NSObject *ob = [[NSObject alloc]init];

         NSValue *value2 = [NSValue valueWithSize:NSMakeSize(10, 10)];
         NSData *data2 = [NSData dataWithContentsOfFile:path];
         NSURL *url2 = [NSURL URLWithString:@"https://www.jianshu.com"];
         
         NSMutableSet *set = [NSMutableSet set];
         
         for (int i = 0; i< 2; i++) {
             [set addObject:num];
             [set addObject:value];
             [set addObject:str];
             [set addObject:date];
//             [set addObject:data];
             [set addObject:url];
             [set addObject:ob];
         }
         NSLog(@"set = %@",set); // 同一对象只能添加一次
         
         
         [set addObject:value2];
//         [set addObject:data2];
         [set addObject:url2];
         NSLog(@"set = %@",set);// 虽然地址不同，但构造数据相同 仍然会添加无效 还是 7个，下面的三个好像都没添加进去

         /*
          1.无效的添加到底是覆盖，还是没添加？结论:是无效添加，并不是覆盖
          2.containsObject:根据(对象值)搜索出是否包含值相同的对象
          3.member:根据(对象值)搜索出是否包含值相同的对象 返回包含的那个对象
          */
         bool contain1 =  [set containsObject:value]; // YES
         bool contain2 =  [set containsObject:value2];// YES
         NSLog(@"contain1 = %d,contain2 = %d",contain1,contain2);

         id ob1 =  [set member:value];// ob1 =  value;
         id ob2 =  [set member:value2];// ob1 =  value;
         NSLog(@"value = %p,value2 = %p",value,value2);
         NSLog(@"ob1 = %p,ob2 = %p",ob1,ob2);
     }
     {
         // 空集合
         NSSet *set = [NSSet set];
         set = [[NSSet alloc]init];
         NSLog(@"set = %@",set);// set = {()}
     }
     {   // 创建
         NSSet *set;
         set = [NSSet setWithObject:@1];
         set = [NSSet setWithObjects:@1,@2, nil];
         set = [NSSet setWithArray:@[@"1",@"2"]];
     }

   
}
#pragma warning - 可变集合
+ (void)NSMutableSetDemo{
        NSMutableSet *set1 = [NSMutableSet set];
        NSMutableSet *set2 = [NSMutableSet set];

    
        [set1 addObject:@1];
        [set1 addObjectsFromArray:@[@1,@2,@"123"]];
        NSLog(@"set = %@",set1); // {(3,1,2)}

        [set1 removeObject:@2];
        [set1 removeAllObjects];
        
        [set1 setSet:set2];

    
        { // 合并重组
            [set1 addObject:@1];
            [set2 addObject:@2];
            [set1 unionSet:set2]; // 把2中有的添加到1中去
            NSLog(@"set1 = %@",set1);
            NSLog(@"set2 = %@",set2);
            [set1 minusSet:set2];
            NSLog(@"set1 = %@",set1);// 把2中有的从1中删除
            NSLog(@"set2 = %@",set2);
        }

}
#pragma warning - 集合查询(allObjects(array),id,BOOL)
+ (void)NSSetQuerying{
    NSSet *set = [NSSet setWithObject:@3];
    NSSet *set2 = [NSSet setWithObject:@3];

    NSUInteger count = set.count;
    NSArray *array = set.allObjects; // 数组中对象的顺序是不确定的。

    id ob1 = [set anyObject]; //返回集合中的对象之一；如果集合不包含任何对象，则返回nil。
    id ob2 =  [set member:@1]; //确定给定对象是否存在于集合中，如果存在则返回该对象

    BOOL contain1 =  [set containsObject:@1]; //是否包含 (值检测)
    BOOL contain2 =  [set isSubsetOfSet:set2];// set 是否在 set2中
    BOOL contain3 =  [set intersectsSet:set2];// 是否有交集
}
#pragma warning -集合迭代
+ (void)NSSetEnumerator{
    NSSet *set = [NSSet setWithObject:@3];

    NSEnumerator *enumerator =   [set objectEnumerator]; // 枚举器
    
   
    [set enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
            
    }];
    
    [set enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
            
    }];
}
#pragma warning -集合筛选(出NSSet)
+ (void)NSSetPassingTest{
    NSSet *set = [NSSet setWithObject:@3];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF in %@",set];

    NSSet *set1 = [set objectsPassingTest:^BOOL(id  _Nonnull obj, BOOL * _Nonnull stop) {
        return  YES;
    }];
    
    NSSet *set2 = [set objectsWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull obj, BOOL * _Nonnull stop) {
        return  YES;

    }];

    NSSet *set3 = [set filteredSetUsingPredicate:predicate];

}
@end
