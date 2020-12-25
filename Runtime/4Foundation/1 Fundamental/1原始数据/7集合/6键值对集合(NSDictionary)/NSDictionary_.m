//
//  NSDictionary_.m
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSDictionary_.h"

@implementation NSDictionary_

#pragma warning -NSDictionary的创建
+ (void)load{
    NSString *path = @"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/1Dict/writeDict.plist";
    NSURL *url = [NSURL URLWithString:@""];
    NSError *error;

    {
        // 只要遵守 NSCopying 协议的对象都可以作为key
        NSNumber *num = [NSNumber numberWithInt:10];               // NSCopying
        NSValue *value = [NSValue valueWithSize:NSMakeSize(10, 10)]; // NSCopying
        NSString *str = [NSString stringWithFormat:@"123"];        // NSCopying
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:500];  // NSCopying
        NSData *data = [NSData dataWithContentsOfFile:path];        // NSCopying
        NSURL *url = [NSURL URLWithString:@"https://www.jianshu.com"]; // NSCopying
        NSObject *ob = [[NSObject alloc]init]; // 未 NSCopying
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        [dict setObject:@"num" forKey:num];
        [dict setObject:@"value" forKey:value];
        [dict setObject:@"str" forKey:str];
        [dict setObject:@"date" forKey:date];
//        [dict setObject:@"data" forKey:data];
        [dict setObject:@"url" forKey:url];
        [dict setObject:@"" forKey:@""]; // 空字符串也是key

        NSLog(@"dict = %@",dict);
    }
    {
        // 空对象
        NSDictionary *dict = @{};
        NSLog(@"dict = %@",dict);//dict = {}
        dict = [[NSDictionary alloc]init];
        NSLog(@"dict = %@",dict);//dict = {}
        dict = [NSDictionary dictionary];
        NSLog(@"dict = %@",dict);//dict = {}
    }
    {
        NSDictionary *dict;

   
        {
            id objects[] = {[NSObject new], @"Hello, World!", @42, [NSObject new]};
            id keys[] = {@"anObject", @"helloString", @"magicNumber", @"aValue"};
            NSUInteger count = sizeof(objects)/sizeof(id);
            dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys count:count];
        }
        {
            // from Objects and Keys
            dict = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
            
            dict = [NSDictionary dictionaryWithObjects:@[@1] forKeys:@[@"1"]];
            
            dict = [NSDictionary dictionaryWithObjectsAndKeys:@"value",@"key", nil];
        }
        {
            // from Another Dictionary
            NSDictionary *formDict = @{};
            dict = [NSDictionary dictionaryWithDictionary:formDict];
        }
        
        {
            // from an External Source
            NSDictionary *dict1 = [NSDictionary dictionaryWithContentsOfFile:path];
            NSDictionary *dict2 = [NSDictionary dictionaryWithContentsOfURL:url error:&error];
            
            // 从文件创建 可变字典，
            NSMutableDictionary *mDiat1 = [NSMutableDictionary dictionaryWithContentsOfFile:@""];
            NSMutableDictionary *mDiat2 = [NSMutableDictionary dictionaryWithContentsOfURL:[NSURL new]];
            
            {
                // 写入到plist文件中
                NSDictionary *dict = @{@"One" : @1, @"Two" : @2, @"Three" : @3};
                BOOL wr =  [dict writeToFile:@"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/1Dict/writeDict.plist" atomically:YES];
            }
            {
                //  访问文件属性
                NSFileManager *manage = [[NSFileManager alloc]init];

            }
        }
    }

}
#pragma warning - 可变字典(添加,删除,整体替换)
+ (void)NSMutableDictionaryDemo{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"key1"] = @1; //[dict setObject:@1 forKeyedSubscript:@"key1"];
    [dict setObject:@2 forKeyedSubscript:@"key2"];
    [dict setObject:@3 forKey:@"key3"];

    [dict removeObjectForKey:@"key1"];
    [dict removeObjectsForKeys:@[@"key2",@"key3"]];
    [dict removeAllObjects];
    
    [dict setDictionary:@{}];//把dict中的全部删除，添加参数字典中的

    
}

#pragma warning -获取key
+ (void)keys{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value", @"key1", @"value", @"key2", nil];

    NSArray *allKeys1 =  dict.allKeys;
    NSArray *allKeys2 = [dict allKeysForObject:@"value"]; //底层调用 isEqual

}
#pragma warning -获取value
+ (void)values{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value", @"key1", @"value", @"key2", nil];
    NSArray *values1 =  dict.allValues;
    id obj1 = [dict objectForKey:@"key1"];  //底层调用 isEqual
    id obj2 = [dict objectForKeyedSubscript:@"key2"];
}
#pragma warning -字典的key枚举器
+ (void)keysEnumerating{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value", @"key1", @"value", @"key2", nil];
    NSEnumerator *keyEnumerator = dict.keyEnumerator;
}

#pragma warning - 字典的value枚举器
+ (void)valuesEnumerating{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value", @"key1", @"value", @"key2", nil];
    NSEnumerator *objectEnumerator = dict.objectEnumerator;

}

#pragma warning - 根基value对key进行排序(array)
+ (void)keysSorting{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 20; i < 30; i++) {
        [dict setValue:[NSNumber numberWithInt:i] forKey:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 0; i < 10; i++) {
        [dict setValue:[NSNumber numberWithInt:i] forKey:[NSString stringWithFormat:@"%d",i]];
    }
    for (int i = 10; i < 20; i++) {
        [dict setValue:[NSNumber numberWithInt:i] forKey:[NSString stringWithFormat:@"%d",i]];
    }
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

#pragma warning - 根据条件筛选出key的集合(set)
+ (void)KeysFilters{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    for (int i = 0; i < 30; i++) {
        [dict setValue:[NSNumber numberWithInt:i] forKey:[NSString stringWithFormat:@"%d",i]];
    }

    NSSet *set1 =  [dict keysOfEntriesPassingTest:^BOOL(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        return NO;
    }];
    NSSet *set2 =  [dict keysOfEntriesWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {

        return NO;
    }];
    
}
#pragma warning - 字典迭代
+ (void)dictEnumerating{
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"value", @"key1", @"value", @"key2", nil];
    //使用for-in循环枚举NSDictionary条目。
    for (NSString *key in dict) {
        id value = dict[key];
        NSLog(@"Value: %@ for key: %@", value, key);
    }
    
    NSLog(@"");// 1.无序单线程迭代
    [dict enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull key, NSString *  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"Thread = %@,key = %@,obj = %@",[NSThread currentThread],key,obj);
    }];
    
    NSLog(@"无序多线程迭代--开始");// 1.无序多线程迭代
    [dict enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"Thread = %@,key = %@,obj = %@",[NSThread currentThread],key,obj);
    }];
    NSLog(@"无序多线程迭代--结束");

    
    NSLog(@"");// 1.无序单线程迭代
    [dict enumerateKeysAndObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"Thread = %@,key = %@,obj = %@",[NSThread currentThread],key,obj);
    }];
    NSLog(@"");
}
@end
