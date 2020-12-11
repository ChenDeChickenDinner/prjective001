//
//  NSArray_.m
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSArray_.h"

@implementation NSArray_
+ (void)load{
    NSString *path = @"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/2Array/arrayPlist.plist";
    NSURL *url = [NSURL URLWithString:@""];
    NSError *error;
    {   // 有序，不唯一，可重复
        NSNumber *num = [NSNumber numberWithInt:10];
        NSValue *value = [NSValue valueWithSize:NSMakeSize(10, 10)];
        NSString *str = [NSString stringWithFormat:@"123"];
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:500];
        NSData *data = [NSData dataWithContentsOfFile:path];
        NSURL *url = [NSURL URLWithString:@"https://www.jianshu.com"];
        NSObject *ob = [[NSObject alloc]init];
        
        NSMutableArray *array = [NSMutableArray array];
        [array addObject:num];
        [array addObject:value];
        [array addObject:str];
        [array addObject:num];
        [array addObject:value];
        [array addObject:str];
        NSLog(@"array = %@",array);
    }

    
    {
        // 空对象
        NSArray *array  = @[];
        NSLog(@"array = %@",array); // array = ()
        array = [NSArray array];
        NSLog(@"array = %@",array);
        array = [[NSArray alloc]init];
        NSLog(@"array = %@",array);

    }
    {
        NSArray *array;
        {
            id objects[] = {@"hello",@43};
            NSUInteger count = sizeof(objects)/sizeof(id);
            array = [NSArray arrayWithObjects:objects count:count];
        }
        {
            array = [NSArray arrayWithObject:@1];
            array = [NSArray arrayWithObjects:@1,@2, nil];
            
        }
    
        {
            array = [NSArray arrayWithContentsOfFile:path];
            array = [NSArray arrayWithContentsOfURL:url error:&error];
        }
        {
            /*
             1.它将对象添加到数组结尾,返回一个(新数组)
             2.如果anObject为nil，则会引发NSInvalidArgumentException异常
             */
            NSArray *arr2 = [array arrayByAddingObject:@4];
            
            // 加一个数组
            NSArray *arr3 = [array arrayByAddingObjectsFromArray:@[@4,@5]];
        }
   
    }
    
    [self NSMutableArrayDemo];
}
#pragma warning - 可变数组(添加,删除,替换,插入,整体替换,交换位置)
+ (void)NSMutableArrayDemo{
    NSDictionary *dict1 = @{@"key":@"value"};
    NSDictionary *dict2 = @{@"key":@"value"};
    NSMutableIndexSet *set = [NSMutableIndexSet indexSetWithIndex:1];
    [set addIndex:2];
    NSMutableArray *array = [NSMutableArray arrayWithObjects: @"one",@"one",@"two", @"three", @"four", nil];
    {
        [array exchangeObjectAtIndex:0 withObjectAtIndex:2];

    }
    {
        [array addObject:dict1];
        [array addObject:dict2];
        [array addObjectsFromArray:@[@"123"]];
    }

    {
        //    删除 一个 空的或则不存在的对象不会造成崩溃
        
        //只要是值相同的元素都会被删除
        [array removeObject:@"one"]; // 删除了2个元素
        [array removeObject:@"two" inRange:NSMakeRange(0, 3)];// 超出范围会抛异常

        //根据地址删除对象
        [array removeObjectIdenticalTo:dict1]; // 此处只删除了1个
        [array removeObjectIdenticalTo:dict2 inRange:NSMakeRange(0, 0)];// 超出范围会抛异常
        
        // 超出范围会抛异常
        [array removeObjectAtIndex:0];
        [array removeObjectsAtIndexes:[NSIndexSet indexSetWithIndex:0]];
        [array removeObjectsInRange:NSMakeRange(0, 0)];
        
        [array removeObjectsInArray:@[]]; // 删除 与 参数array 中相同的所有元素

        
        [array removeAllObjects];
    }
    
    {
        [array replaceObjectAtIndex:0 withObject:@"1"];
        [array replaceObjectsAtIndexes:set withObjects:@[@"2",@"3"]];
        [array replaceObjectsInRange:NSMakeRange(3, 1) withObjectsFromArray:@[@"4"]];

    }
    {
        //将给定对象插入给定索引处的数组内容。 insert:插入
        [array insertObject:@"123" atIndex:0];
        [array insertObjects:@[@"a", @"b"] atIndexes:set]; // 前面插入的元素也是算位置的
    }
    {
        [array setArray:@[@"123"]]; //    将接收数组的元素设置为另一个给定数组中的元素。
    }
}

#pragma warning - 获取对象(单个,多个)
+ (void)getObjects{
    NSArray *array = @[@1,@2,@3];
    
    
    id firstObject = array.firstObject;
    id lastObject = array.lastObject;
    
    // 取某个位置的对象，不能越界，越界会抛异常
    id object1 = [array objectAtIndex:1];
    id object2 = [array objectAtIndexedSubscript:1]; // array[1];
    
    NSArray *objects = [array objectsAtIndexes:[NSIndexSet indexSetWithIndex:0]];

}
#pragma warning - 查找对象的索引(单个,多个)
/*
 1.根据对象的值查询index  index
 2.根据对象的地址值查询index index
 3.根据自定义条件(TestBlock)来查询 index
 4.根据自定义条件(TestBlock)来查询多个index集合 NSIndexSet
 */
+ (void)getIndex{
    NSDictionary *dict1 = @{@"key":@"value"};
    NSDictionary *dict2 = @{@"key":@"value"};
    NSArray *array = [NSArray arrayWithObjects: @"one",@"one",@"two", @"three", @"four",dict1, nil];
    
    /*
     1.判断给定的对象是否在数组中
     2.从索引0开始，数组的每个元素作为参数传递给发送到aObject的isEqual：，直到找到匹配或达到数组的结尾
     */
    BOOL contains = [array containsObject:@"one"];

 
    { //根据对象的值查询index
        /*
         1.返回其对应数组值等于给定对象的最低索引(多次被添加到数组的)
         2.从索引0开始，数组的每个元素作为参数传递给发送到aObject的isEqual：，直到找到匹配或达到数组的结尾
         3.查找不到就抛 NSNotFound
         */
        NSUInteger index1 = [array indexOfObject:dict2]; // 值查找
        NSUInteger index2 = [array indexOfObject:dict2 inRange:NSMakeRange(3, 1)];
    }
    
    {//根据对象的地址值查询index
        // 根据地址查询, NSNumber NSString  NSDate 数值相同的对象 地址也相同
        NSUInteger index3 = [array indexOfObjectIdenticalTo:dict1];
        NSUInteger index4 = [array indexOfObjectIdenticalTo:dict2]; //NSNotFound
        NSUInteger index5 = [array indexOfObjectIdenticalTo:dict1 inRange:NSMakeRange(3, 1)];

    }

    
    {//根据自定义条件(TestBlock)来查询
        
        NSUInteger index1 =  [array indexOfObjectPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"obj = %@,inx = %ld",obj,idx);
            if ([obj isEqual:dict2]) {
                return YES;
            }
            return NO;
        }];
        
        NSUInteger index2 =  [array indexOfObjectWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return NO;
        }];
        
        NSUInteger index3 =  [array indexOfObjectAtIndexes:[NSIndexSet indexSetWithIndex:3] options:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            return NO;

        }];
    }
    {//根据自定义条件(TestBlock)来查询多个index集合
        NSIndexSet *set =  [array indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj isEqual:dict2]) {
                return YES;
            }
            return NO;
        }];
    }
    
}

#pragma warning - 数组迭代
+ (void)EnumeratorArray{
    NSArray *array = [NSArray arrayWithObjects:@32,@"123",[NSData data],@[],@{},nil];
    //1.单纯的枚举器
    {
        //顺序枚举
        NSEnumerator *enumerator = array.objectEnumerator;
        id objec;
        while ((objec = [enumerator nextObject])) {
            NSLog(@"objec = %@",objec);
        }
        
        //倒叙枚举 reverse:逆转
        NSEnumerator *enumerator2 = array.reverseObjectEnumerator;
        id objec2;
        while ((objec2 = [enumerator2 nextObject])) {
            NSLog(@"objec2 = %@",objec2);
        }
        //当您使用此方法与NSArray的可变子类时，您不能在枚举期间修改数组。使用快速枚举协议（参见NSFastEnumeration）更为有效
        NSLog(@"enumerator- end");
    }
    //2.枚举数组，让元素执行block块
    {
        /*
         1.使用数组中的每个对象执行给定的块，默认情况下，枚举从第一个对象开始，并通过数组连续地继续到最后一个对象
         2.对布尔值的引用。 该块可以将值设置为YES以停止对数组的进一步枚举
         3.如果block参数为nil，此方法将引发异常
         */
        [array enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"Thread = %@,idx = %ld,obj = %@",[NSThread currentThread],idx,obj);

        }];
        // 带操作方式的执行 并行或者以相反的顺序执行
        [array enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"Thread = %@,idx = %ld,obj = %@",[NSThread currentThread],idx,obj);

        }];
        // 指定IndexSet的，带操作方式的执行 并行或者以相反的顺序执行
        NSIndexSet *set =  [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 5)];
        [array enumerateObjectsAtIndexes:set options:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"Thread = %@,idx = %ld,obj = %@",[NSThread currentThread],idx,obj);

        }];
    }
    

}
#pragma warning - 数组排序(得到的是新数组)
/*
 1.利用 ComparatorBlcok排序
 2.利用 NSSortDescriptor
 3.利用 @selector
 4.可变数组的排序是自身,的不产生新数组
 */
+ (void)ArraySortedUsingComparator{
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i <= 50; i++) {
        [array addObject:[NSNumber numberWithInt:i]];
    }
    
    {
        // 1. 单线程执行
        NSArray *array2 = [array sortedArrayUsingComparator:^NSComparisonResult(NSNumber *  _Nonnull obj1, NSNumber *  _Nonnull obj2) {
            NSLog(@"Thread = %@,obj1 = %@,obj2 = %@",[NSThread currentThread],obj1,obj2);

            //1.方式1，一般用于对象之间属性的比较，排序的结果是元素(从低到高)
            if (obj1.integerValue < obj2.integerValue) {
                return NSOrderedAscending; // 上升
            }else if(obj1.integerValue > obj2.integerValue){
                return NSOrderedDescending; // 下降
            }else{
                return NSOrderedSame;
            }
            
            //2.方式1，根据比较结果却反着给枚举，排序的结果是元素(从高到低)
            if (obj1.integerValue < obj2.integerValue) {
                return NSOrderedDescending; // 下降
            }else if(obj1.integerValue > obj2.integerValue){
                return NSOrderedAscending; // 上升
            }else{
                return NSOrderedSame;
            }
            
            
            //3.方式2，如拿出来的对象直接又现成的compare(从低到高)
            return [obj1 compare:obj2];
        }];
        NSLog(@"sortedArrayWithOptions -start");
        NSArray *array3 = [array sortedArrayWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSLog(@"Thread = %@,obj1 = %@,obj2 = %@",[NSThread currentThread],obj1,obj2);
            return [obj1 compare:obj2];
        }];
        NSLog(@"sortedArrayWithOptions -end");
        
        NSArray *array4 = [array sortedArrayWithOptions:NSSortStable usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSLog(@"Thread = %@,obj1 = %@,obj2 = %@",[NSThread currentThread],obj1,obj2);
            return [obj1 compare:obj2];
        }];
    }
    {
        NSSortDescriptor *descripor = [NSSortDescriptor sortDescriptorWithKey:@"year" ascending:NO];
        NSSortDescriptor *descripor2 = [NSSortDescriptor sortDescriptorWithKey:@"month" ascending:NO];
        NSArray *resultArr = [array sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descripor, descripor2, nil]];
    }

    {

        NSArray *arr = @[@"hello", @"how", @"are", @"you"];
        NSArray *resultArr = [arr sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)];
        NSLog(@"resultArr = %@", resultArr);
    }
    { //可变数组的排序是不会重新生成数组的，方法名上与不可变数组 只有一个 array的区别
        NSArray *array = [NSArray array];
        NSMutableArray *marray = [NSMutableArray array];
        
        [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return NSOrderedSame;
        }];
        
        [marray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return NSOrderedSame;

        }];
    }
}

#pragma warning - 向数组中元素发送消息
+ (void)SendingMessagestoElements{
    NSArray *arr = @[@1, @2, @3];
    /*
     1.向数组中的每个对象发送由给定选择器标识的消息
     2.如果aSelector为NULL，则此方法会引发NSInvalidArgumentException异常
     3.一般这么用  [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
     */
    [arr makeObjectsPerformSelector:@selector(floatValue)];
    
  
}
#pragma warning - 数组与字符串的转换
+ (void)StringAndArrays{
    
    //components:组件 Joined:加入 Separated:分开的
    NSArray *arr = @[@"6", @"9", @"2", @"1"];
    NSString *str  = [arr componentsJoinedByString:@"-"];
    NSLog(@""); //6-9-2-1
    
    NSArray *array = [str componentsSeparatedByString:@"-"];
}

#pragma warning - 收集路径（文件扩展名的过滤）
+ (void)demoPathsMatchingExtensions{
    NSArray *arr = @[@"6.txt", @"9.plist", @"2.pdf", @"1.word"];
    NSArray *resultArr = [arr pathsMatchingExtensions:@[@"txt", @"word"]];
    NSLog(@"resultArr = %@", resultArr);//筛选出符合指定扩展面的元素
}

@end
