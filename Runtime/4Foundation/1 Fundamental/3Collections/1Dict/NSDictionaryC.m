//
//  NSDictionaryC.m
//  Runtime
//
//  Created by xs on 2020/12/4.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSDictionaryC.h"

@implementation NSDictionaryC

/*
 1.NSDictionary（字典）是使用 hash表来实现key和value之间的映射和存储的
 2.key:键不能重复，是唯一的键可以是任何对象（前提是它符合NSCopying协议），不能为nil
 2.key:但是请注意，在使用键值编码时，键必须是字符串
 
 
 3.value:
 */
+ (void)load{
    
    [self test4];
    
    [self demoSharedKeySetForKeys];

    [self demoIsEqualToDictionary];
    [self AccessingKeysandValues];
    [self enumeratingDictionaries];

    [self SortingDictionaries];

    [self writeToURL];
    [self MutableDictionary];

    
    
}
/*
 创建并返回一个空的字典。
 该方法主要用于NSDictionary的可变子类。如果不想要临时对象，还可以使用alloc ...和init创建一个空字典。
 */
+ (void)test1{
    NSDictionary *dict = [NSDictionary dictionary];
    NSLog(@"dict = %@", dict);

}
/*
 从数组，或者对象集合创建字典
 */
+ (void)test2{
    NSObject *anObject = [NSObject new];
    NSObject *aValue = [NSObject new];
    NSDictionary *dcict = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
    
    { // 从C数组创建一个包含指定数量对象的字典。
        id objects[] = {anObject, @"Hello, World!", @42, aValue};
        id keys[] = {@"anObject", @"helloString", @"magicNumber", @"aValue"};
        NSUInteger count = sizeof(objects)/sizeof(id);
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:count];
        /*
         1.这种字典文字的快捷创建经过底层编译器会转化为上面的这种方法调用
         2.使用此文字语法时，不应使用nil终止对象列表，实际上nil是无效值,
         */
        NSDictionary *dictionary = @{
               @"anObject" : [NSObject new],
            @"helloString" : @"Hello, World!",
            @"magicNumber" : @42,
                 @"aValue" : [NSObject new]
        };
        
    }
    
    {
        /*
         1.根据数组创建字典
         2.该方法会遍历对象和键数组，并根据其创建字典。 如果对象和键不具有相同数量的元素，
         则会引发NSInvalidArgumentException异常
         */
        NSArray *keys = @[@"anObject", @"helloString", @"magicNumber", @"aValue"];
        NSArray *objects = @[anObject, @"Hello, World!", @42, aValue];
        NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
        NSLog(@"dict = %@",dict);
        
        /*
         1.从指定的值和键集合构造的条目创建字典
         2.该方法类似于dictionaryWithObjects：forKeys：，仅在键值对中指定的方式不同
         3.value,key,value,key,value,key
         */
        NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
        NSLog(@"dict2 = %@",dict2);

    }

    
    
    


}

/*
 创建一个包含来自另一个给定字典的键和值的字典。
 */
+ (void)test3{
    NSDictionary *dict1 = @{};
    NSDictionary *dict2 = [NSDictionary dictionaryWithDictionary:dict1];
    
}

/*
 1.从外部来源创建字典(URL与文件)
 2.或者如果存在错误或资源的内容是字典的无效表示，则为nil。
 3.由路径标识的文件中的字典表示只能包含属性列表对象
 （NSString，NSData，NSDate，NSNumber，NSArray或NSDictionary对象）

 */
+ (void)test4{

    NSDictionary *dict2 = [NSDictionary dictionaryWithContentsOfFile:@"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/1Dict/writeDict.plist"];
    NSLog(@"");
    
}
// 共享键集，节省内存 暂不知是什么用途
+ (void)demoSharedKeySetForKeys{
    NSArray *keys = @[@"One", @"Two", @"Three"];
    id ob =  [NSDictionary sharedKeySetForKeys:keys];
    NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithSharedKeySet:ob];
    NSLog(@"dict = %@", dict);
}
/*
 获取字典中键值对的数目
 */
+ (void)demoCount{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    NSLog(@"dictCount = %ld", dict.count);
}
/*字典比对
 1.数量相等
 2.key相等
 3.key对应的value也相等
 */
+ (void)demoIsEqualToDictionary{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    NSDictionary *dict1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
    BOOL isSame = [dict isEqualToDictionary:dict1];
    NSLog(@"isSame = %d", isSame);
}

/*
 键和值的获取
 */
+ (void)AccessingKeysandValues{
    
    {
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value1", @"key1", @"value2", @"key2", nil];
        
        /*
         1.如果是一个空字典，那么会返回一个空数组
         2.数组中元素的顺序未定义
         */
        NSArray *allKeys =  dict.allKeys;
        NSArray *allValues =  dict.allValues;

    }

    
    {
        /* 多个key映射着同一个对象，返回这些key的集合数组
         1. 如果没有找到与Object匹配的对象，则返回一个空数组
         2.字典中的每个对象都发送一个isEqual：消息，以确定它是否等于anObject
         */
        NSDictionary *dict = @{@"One" : @"number1", @"Three" : @"number1", @"Two" : @"2"};
        NSArray *arr =  [dict allKeysForObject:@"number1"];
        NSLog(@"arr = %@", arr);
    }
    {
        /*
         1.获取给定键对应的值。
         2.如果aKey对应的值不存在，那么会返回nil
         3.valueForKey:是KVC的方法，没有找到会提供valueForUndefinedKey抛出异常。
         */
        NSDictionary *dict = @{@"one" : @"number1"};
        NSDictionary *dict2 = @{@"@one" : @"number1"};
        
        
        //编译器处理
        id obj = dict[@"one"];//[dict objectForKeyedSubscript:@"one"];


        id obj1 = [dict objectForKey:@"one"];//顺利取值
        id obj2 = [dict2 objectForKey:@"@one"];//顺利取值

        id obj3 = [dict valueForKey:@"one"]; //顺利取值
        
        /*
         1.遇到以@开头的key,会把 key 里的 @ 去掉，也就变成了 [dict valueForKey:@"one"];
         2.而 dict 不存在 one 这样的 property
         3.转而执行 [dict valueForUndefinedKey:@"one"];
         4.抛出 NSUndefinedKeyException 异常后 crash 掉。
         */
//        id obj4 = [dict2 valueForKey:@"@one"];//崩溃


    }

}
/*
 所有创建方法都在集合类中定义，例如NSArray，NSSet和NSDictionary，它们提供了特殊的NSEnumerator对象来枚举其内容。
 例如，NSArray有两个返回NSEnumerator对象的方法：objectEnumerator和reverseObjectEnumerator。
 NSDictionary还具有两个返回NSEnumerator对象的方法：keyEnumerator和objectEnumerator。
 这些方法使您可以分别通过键或值来枚举字典的内容。
 您将nextObject重复发送到新创建的NSEnumerator对象，以使其返回原始集合中的下一个对象。
 收集用完后，将返回nil。枚举器用完其集合后，您无法对其进行“重置”。要再次枚举集合，您需要一个新的枚举器。
 NSArray，NSDictionary和NSSet使用的枚举器子类在枚举期间保留集合。枚举用尽时，将释放集合。
 */
/*
 字典的遍历
 */
+ (void)enumeratingDictionaries{


    NSDictionary *dict = @{@"One" : @"number1", @"Three" : @"number1", @"Two" : @"number3"};
    //使用for-in循环枚举NSDictionary条目。
    for (NSString *key in dict) {
        id value = dict[key];
        NSLog(@"Value: %@ for key: %@", value, key);
    }
    
    {//    1.NSEnumerator 枚举对象，
        /*
         1.提供一个枚举器来访问字典中的每一个键或者值。
         2.枚举器每次遍历完都无法再次使用,需要重新创建一个
         3.若打算用可变子类来枚举，不应在枚举期间修改条目，应该用allKeys属性创建字典键的“快照”。然后使用此快照遍历条目的
         */
        NSEnumerator *keysEnumerator = [dict keyEnumerator];
        NSEnumerator *ObjectsEnumerator = [dict objectEnumerator];

        {
            NSEnumerator *enumerator = [dict keyEnumerator];
            id ob1 = [enumerator nextObject];
            id ob2 = [enumerator nextObject];
            id ob3 = [enumerator nextObject];
        }
        {
            NSEnumerator *enumerator = [dict keyEnumerator];
            id key;
            while ((key = [enumerator nextObject])) {
                NSLog(@"key = %@",key);
            }
        }
        {
            NSEnumerator *enumerator = [dict keyEnumerator];
            NSArray *keys = enumerator.allObjects;
            NSLog(@"keys = %@",keys);
        }

    }
    {
        /*
         1.一个对字典中的条目进行操作的Block对象。
         2.当stop被设置为YES，那么遍历就结束了
         */
        [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"key = %@,obj = %@", key,obj);
        }];
        
        // 带条件的对字典进行遍历
        [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"thread = %@,key = %@,obj = %@",[NSThread currentThread], key,obj);
        }];
        [dict enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"thread = %@,key = %@,obj = %@",[NSThread currentThread], key,obj);
        }];
    }

  
}
/*
 字典key的排序
 1.如果字典按其值排序，则返回字典键的数组，按照它们的顺序返回
 */
+ (void)SortingDictionaries{
    NSDictionary *dict = @{@"One" : @1, @"Two" : @2, @"Three" : @3};
    {
 
        NSArray *keys1 =  [dict keysSortedByValueUsingSelector:@selector(intValue)];
        NSLog(@"keys1 = %@",keys1);
        
        NSArray *keys2 =  [dict keysSortedByValueUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return NSOrderedAscending;
        }];
        NSLog(@"keys2 = %@",keys2);

        NSArray *keys3 =  [dict keysSortedByValueWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return NSOrderedAscending;
        }];
        NSLog(@"keys3 = %@",keys3);

    }
}
- (NSComparisonResult)intValue{
    return NSOrderedDescending;
}
/*
 根据条件进行键的过滤,则返回字典键的数组
 */
+ (void)demoKeysOfEntriesWithOptions{
    NSDictionary *dict = @{@"One" : @1, @"Two" : @2, @"Three" : @3};
    NSSet *set = [dict keysOfEntriesWithOptions:NSEnumerationReverse passingTest:^BOOL(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key isEqualToString:@"Two"]) {
            return NO;
        }
        return YES;
    }];

    NSLog(@"set = %@", set);
    
}
/*
 将字典写入到plist文件中
 useAuxiliaryFile：一个指定文件是否应该被原子地写入的标志。如果标志为YES，则将字典写入辅助文件，然后将辅助文件重命名为路径。 如果标志为NO，则字典直接写入路径。 YES选项保证路径（如果存在）将不会被破坏，即使系统在写入时应该崩溃。

 */
+ (void)writeToURL{
    NSDictionary *dict = @{@"One" : @1, @"Two" : @2, @"Three" : @3};
    BOOL wr =  [dict writeToFile:@"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/1Dict/writeDict.plist" atomically:YES];
    NSLog(@"");
    

}
/*
 访问文件属性
 这些便捷方法可用于NSFileManager方法attributeOfItemAtPath：error：返回的词典，
 并允许您访问文件和目录的POSIX和HFS属性。
 */
+ (void)AccessingFileAttributes{
    NSFileManager *manage = [[NSFileManager alloc]init];
}


+ (void)MutableDictionary{
    {
        
        // 从文件创建 可变字典，
        [NSMutableDictionary dictionaryWithContentsOfFile:@""];
        [NSMutableDictionary dictionaryWithContentsOfURL:[NSURL new]];
        // 从文件创建 不可变字典，
        [NSDictionary dictionaryWithContentsOfFile:@""];
        [NSDictionary dictionaryWithContentsOfURL:[NSURL new]];
    }
 
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"key1"] = @1; //[dict setObject:@1 forKeyedSubscript:@"key1"];
    [dict setObject:@2 forKeyedSubscript:@"key2"];
    [dict setObject:@3 forKey:@"key3"];
    
    [dict setValue:@4 forKey:@"key4"];
    [dict setValue:@4 forKey:@"@key4"];
    {
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        [dictM setObject:@1 forKey:@"One"];
        [dictM setObject:@3 forKey:@"three"];
        [dictM setObject:@3 forKey:@"888"];
        NSDictionary *givenDict = @{@"One" : @100, @"Two" : @2, @"Three" : @3};
        
        // 所有条目从接收字典中删除（使用removeAllObjects），然后将来自otherDictionary的每个条目添加到接收字典中
        [dictM setDictionary:givenDict];
        NSLog(@"dictM = %@", dictM);
    }

    
    //移除指定的key和与key相对的value,如果key为nil，那么会抛出异常NSInvalidArgumentException
    [dict removeObjectForKey:@"key1"];
    [dict removeObjectsForKeys:@[@"key2",@"key3"]];
    [dict removeAllObjects];
}

@end
