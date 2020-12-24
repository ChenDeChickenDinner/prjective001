//
//  IsEqual.m
//  Runtime
//
//  Created by xs on 2020/12/7.
//  Copyright © 2020 xax. All rights reserved.
//

#import "IsEqual.h"

@implementation IsEqual
#pragma warning -枚举 排序 比较
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
#pragma warning -空数据
+ (void)NSNumber1{
    
    NSObject *ob = nil;
    NSLog(@"p = %p,ob = %@",ob,ob); // p = 0x0,ob = (null)

    NSNumber *num = [[NSNumber alloc]init];
    NSLog(@"p = %p,num = %@",num,num); //  p = 0x0,num = (null)
    
    NSValue *val = [[NSValue alloc]init];
    NSLog(@"p = %p,num = %@",val,val);// p = 0x0,num = (null)
    
    NSString *str = [[NSString alloc]init];
    NSLog(@"p = %p,num = %@",str,str);// p = 0x7fff85eaa288,num = 空字符串
    
    NSDate *date = [[NSDate alloc]init];
    NSLog(@"p = %p,num = %@",date,date);// p = 0x4d875790d0fff49,num = Mon Dec 21 16:52:54 2020
    
    NSData *data  = [[NSData alloc]init];
    NSLog(@"p = %p,num = %@",data,data);// p = 0x100615cd0,num = {length = 0, bytes = 0x}
    
    NSURL *url = [[NSURL alloc]init];
    NSLog(@"p = %p,num = %@",url,url);// p = 0x10060edc0,num = 空字符串
    
    NSIndexPath *indexPath = [[NSIndexPath alloc]init];
    NSLog(@"p = %p,num = %@",indexPath,indexPath);//p = 0x29f4f1b63faaee3d,num = <NSIndexPath: 0x29f4f1b63faaee3d> {length = 0, path = }
    
    NSIndexSet *indexSet = [[NSIndexSet alloc]init];
    NSLog(@"p = %p,num = %@",indexSet,indexSet);//p = 0x1020549a0,num = <_NSCachedIndexSet: 0x1020549a0>(no indexes)
    
    NSDictionary *dict = [[NSDictionary alloc]init];
    NSLog(@"p = %p,num = %@",dict,dict);//p = 0x7fff858e48e0,num = {}
    
    NSArray *array = [[NSArray alloc]init];
    NSLog(@"p = %p,num = %@",array,array);//p = 0x7fff858dd460,num = ()
}
#pragma warning -空数据真假判断
+ (void)NSNumber2{
    if ([[NSNumber alloc]init]) { //  p = 0x0,num = (null)
        NSLog(@"不成立");
    }
    if ([[NSValue alloc]init]) { //  p = 0x0,val = (null)
        NSLog(@"不成立");
    }
    if ([[NSString alloc]init]) {
        NSLog(@"成立");
    }
    if ([[NSDate alloc]init]) {
        NSLog(@"成立");
    }
    if ([[NSData alloc]init]) {
        NSLog(@"成立");
    }
    if ([[NSURL alloc]init]) {
        NSLog(@"成立");
    }
    if ([[NSIndexPath alloc]init]) {
        NSLog(@"成立");
    }
    if ([[NSIndexSet alloc]init]) {
        NSLog(@"成立");
    }
    if ([[NSDictionary alloc]init]) {
        NSLog(@"成立");
    }
    if ([[NSArray alloc]init]) {
        NSLog(@"成立");
    }
}
#pragma warning -数据表现
+ (void)NSNumber3{
    Byte byteArray[] = {1,22,44};

    NSNumber *num  = [NSNumber numberWithInt:10];
    NSLog(@"p = %p,num = %@",num,num);//   p = 0x29f4f1b63faae473,num = 10
    

    NSValue *val = [NSValue valueWithPoint:NSMakePoint(0, 0)];
    NSLog(@"p = %p,num = %@",val,val);// p = 0x1005749f0,num = NSPoint: {0, 0}
    

    NSString *str = [NSString stringWithFormat:@"123"];
    NSLog(@"p = %p,num = %@",str,str);// p = 0x29f4f1b60c98df61,num = 123
    

    NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
    NSLog(@"p = %p,num = %@",date,date);// p = 0x698e1b553023599d,num = Thu Jan  1 08:00:00 1970
    
  
    NSData *data = [NSData dataWithBytes:byteArray length:sizeof(byteArray)/sizeof(Byte)];
    NSLog(@"p = %p,num = %@",data,data);// p = 0x1020468b0,num = {length = 3, bytes = 0x01162c}
    

    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSLog(@"p = %p,num = %@",url,url);// p = 0x10204c020,num = https://www.baidu.com
    

    NSIndexPath *indexPath = [NSIndexPath indexPathWithIndex:0];
    NSLog(@"p = %p,num = %@",indexPath,indexPath);//p = 0x29f4f1b63faaeebd,num = <NSIndexPath: 0x29f4f1b63faaeebd> {length = 1, path = 0}
    
 
    NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:0];
    NSLog(@"p = %p,num = %@",indexSet,indexSet);//p = 0x102054790,num = <_NSCachedIndexSet: 0x102054790>[number of indexes: 1 (in 1 ranges), indexes: (0)]
    

    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
    NSLog(@"p = %p,num = %@",dict,dict);//p = 0x100575480,num = {key = value;}
    
  
    NSArray *array = [NSArray arrayWithObject:@1];
    NSLog(@"p = %p,num = %@",array,array);//p = 0x10204a940,num = (1)
}
#pragma warning -地址比对
+ (void)NSNumber4{
    { // 数值类的变量比较 比对的完全是数值，以下都成立
        int intValue = 10;
        float  floatValue = 10.0f;
        double  doubleValue = 10.0;
        CGFloat cgfloatValue = 10.0f;

        if (intValue == floatValue) {
            NSLog(@"");
        }
        if (doubleValue == floatValue) {
            NSLog(@"");
        }
        if (cgfloatValue == floatValue) {
            NSLog(@"");
        }
        NSInteger interger = 10;
        NSUInteger uinterger = 10;
        if (interger == uinterger) {
            NSLog(@"");
        }
        if (interger == intValue) {
            NSLog(@"");
        }
        
    }
    NSNumber *numInt1 = [NSNumber numberWithInt:10];
    NSNumber *numInt2 = [NSNumber numberWithInt:10];
    NSLog(@"%p,%p",numInt1,numInt2); // 地址相同
    NSLog(@"%lu,%lu",(unsigned long)numInt1.hash,(unsigned long)numInt2.hash); // hash相同

    NSNumber *numfloat1 = [NSNumber numberWithFloat:10.0f];
    NSNumber *numfloat2 = [NSNumber numberWithFloat:10.0f];
    NSLog(@"%p,%p",numfloat1,numfloat2); // 地址相同
    NSLog(@"%lu,%lu",(unsigned long)numfloat1.hash,(unsigned long)numfloat2.hash); // hash相同
    if (numInt1 == numfloat1) {
        NSLog(@"不成立(地址不相同)");
    }
    
    NSString *str1 = [NSString stringWithFormat:@"123"];
    NSString *str2 = [NSString stringWithFormat:@"123"];
    NSLog(@"%p,%p",str1,str2); // 地址相同
    
    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:500];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:500];
    NSLog(@"%p,%p",date1,date2); // 地址相同
    
    /*
     1.同节点的任意2个NSIndexPath地址相同
     2.同数据包装的IndexSet 其hash相同
     */
    const NSUInteger indexes1[] = {1,3,4};
    NSIndexPath *indexPath1 = [NSIndexPath indexPathWithIndexes:indexes1 length:sizeof(indexes1)/sizeof(NSUInteger)];
    
    const NSUInteger indexes2[] = {1,3,4};
    NSIndexPath *indexPath2 = [NSIndexPath indexPathWithIndexes:indexes2 length:sizeof(indexes2)/sizeof(NSUInteger)];
    NSLog(@"%p,%p",indexPath1,indexPath2); // 地址相同

    
    /*
     1. 任何2个NSValue的地址都不相同
     2. 同类型包装的相同数据，其hash相同
     */
    NSValue *value1 = [NSValue valueWithSize:NSMakeSize(10, 10)];
    NSValue *value2 = [NSValue valueWithSize:NSMakeSize(10, 10)];
    NSLog(@"%p,%p",value1,value2); // 地址不相同
    
    /*
     1.任何2个NSURL的地址都不相同
     2.同数据包装的URL 其hash相同
     */
    NSURL *url1 = [NSURL URLWithString:@"https://www.jianshu.com"];
    NSURL *url2 = [NSURL URLWithString:@"https://www.jianshu.com"];
    NSLog(@"%p,%p",url1,url2); // 地址不相同
    
    /*
     1.任何2个NSData的地址都不相同
     2.同数据包装的Data 其hash相同
     */
    NSString *path = @"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/1Dict/writeDict.plist";
    NSData *data1 = [NSData dataWithContentsOfFile:path];
    NSData *data2 = [NSData dataWithContentsOfFile:path];
    NSLog(@"%p,%p",data1,data2); // 地址不相同
    
    /*
     1.任何2个NSDictionary的地址都不相同
     2.同数据包装的Dictionary 其hash相同
     */
    NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
    NSLog(@"%p,%p",dict1,dict2); // 地址不相同
    
    /*
     1.任何2个NSArray的地址都不相同
     2.同数据包装的Array 其hash相同
     */
    NSArray *array1 = [NSArray arrayWithObjects:@1,@"1",@{@"key":@"value"}, nil];
    NSArray *array2 = [NSArray arrayWithObjects:@1,@"1",@{@"key":@"value"}, nil];
    NSLog(@"%p,%p",array1,array2); // 地址不相同

    /*
     1.任何2个NSIndexSet的地址都不相同
     2.同数据包装的IndexSet 其hash相同
     */
    NSIndexSet *set1 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];
    NSIndexSet *set2 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];
    NSLog(@"%p,%p",set1,set2); // 地址不相同

    
}
#pragma warning -isEqual比对
+ (void)NSNumber5{
    /*
     1.isEqual方法是NSObject中声明的，默认实现就是简单的比较对象地址。
     2.NSObject的子类可以实现自己的isEqual:方法，一般方式如下：
       2.1：对象地址的比较
       2.2: 对象类型的比较
       2.3: 高层比较方法
     */
    
    
 
    NSNumber *numInt1 = [NSNumber numberWithInt:10];
    NSNumber *numfloat1 = [NSNumber numberWithFloat:10.0f];

    if ([numInt1 isEqual:numfloat1]) {
        NSLog(@""); //成立 (hash相同)
    }
    if ([numInt1 isEqualToNumber:numfloat1]) {
        NSLog(@""); //成立 (hash相同)
    }


    NSString *str1 = [NSString stringWithFormat:@"123"];
    NSString *str2 = [NSString stringWithFormat:@"123"];
    if ([str1 isEqual:str2]) {
        NSLog(@""); //成立
    }
    if ([str1 isEqualToString:str2]) {
        NSLog(@""); //成立
    }

    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:500];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:500];
    if ([date1 isEqual:date2]) {
        NSLog(@""); //成立
    }
    if ([date1 isEqualToDate:date2]) {
        NSLog(@""); //成立
    }

    NSValue *value1 = [NSValue valueWithSize:NSMakeSize(10, 10)];
    NSValue *value2 = [NSValue valueWithSize:NSMakeSize(10, 10)];
    NSValue *value3 = [NSValue valueWithPoint:NSMakePoint(10, 10)];
    if ([value1 isEqual:value2]) {
        NSLog(@""); //成立
    }
    if ([value1 isEqualToValue:value2]) {
        NSLog(@""); //成立
    }

    NSURL *url1 = [NSURL URLWithString:@"https://www.jianshu.com"];
    NSURL *url2 = [NSURL URLWithString:@"https://www.jianshu.com"];
    if ([url1 isEqual:url2]) {
        NSLog(@""); //成立
    }
    

    NSString *path = @"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/1Dict/writeDict.plist";
    NSData *data1 = [NSData dataWithContentsOfFile:path];
    NSData *data2 = [NSData dataWithContentsOfFile:path];
    if ([data1 isEqual:data2]) {
        NSLog(@""); //成立
    }
    if ([data1 isEqualToData:data2]) {
        NSLog(@""); //成立
    }

    NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
    NSDictionary *dict2 = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
    if ([dict1 isEqual:dict2]) {
        NSLog(@""); //成立
    }
    if ([dict1 isEqualToDictionary:dict2]) {
        NSLog(@""); //成立
    }

    NSArray *array1 = [NSArray arrayWithObjects:@1,@"1",@{@"key":@"value"}, nil];
    NSArray *array2 = [NSArray arrayWithObjects:@1,@"1",@{@"key":@"value"}, nil];
    if ([array1 isEqual:array2]) {
        NSLog(@""); //成立
    }
    if ([array1 isEqualToArray:array2]) {
        NSLog(@""); //成立
    }
    
    NSSet *set1 = [NSSet setWithObjects:@1,@"123",@{@"key":@"value"},nil];
    NSSet *set2 = [NSSet setWithObjects:@1,@"123",@{@"key":@"value"},nil];
    if ([set1 isEqual:set2]) {
        NSLog(@""); //成立
    }
    if ([set1 isEqualToSet:set2]) {
        NSLog(@""); //成立
    }

    NSIndexSet *IndexSet1 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];
    NSIndexSet *IndexSet2 =  [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];
    if ([IndexSet1 isEqual:IndexSet2]) {
        NSLog(@""); //成立
    }
    if ([IndexSet1 isEqualToIndexSet:IndexSet2]) {
        NSLog(@""); //成立
    }

    const NSUInteger indexes1[] = {1,3,4};
    NSIndexPath *indexPath1 = [NSIndexPath indexPathWithIndexes:indexes1 length:sizeof(indexes1)/sizeof(NSUInteger)];
    
    const NSUInteger indexes2[] = {1,3,4};
    NSIndexPath *indexPath2 = [NSIndexPath indexPathWithIndexes:indexes2 length:sizeof(indexes2)/sizeof(NSUInteger)];

    if ([indexPath1 isEqual:indexPath2]) {
        NSLog(@""); //成立
    }

    if ([indexPath1 compare:indexPath2]) {
        NSLog(@""); //成立
    }
}


#pragma warning -compare比对
+ (void)NSNumber6{
  
    NSObject *ob1 = [[NSObject alloc]init]; // 基类没有


    NSNumber *num1 = [NSNumber numberWithInt:10];
    NSNumber *num2 = [NSNumber numberWithInt:10];
    [num1 compare:num2];
    
    NSDecimalNumber *decNum1 = [NSDecimalNumber decimalNumberWithString:@"23412"];
    NSDecimalNumber *decNum2 = [NSDecimalNumber decimalNumberWithString:@"965822"];
    [decNum1 compare:decNum2];

    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:500];
    NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:600];
    [date1 compare:date2];
    
    NSDateInterval *dateInterval1 =  [[NSDateInterval alloc]initWithStartDate:date1 duration:24*60*60];
    NSDateInterval *dateInterval2 =  [[NSDateInterval alloc]initWithStartDate:date1 duration:48*60*60];
    [dateInterval1 compare:dateInterval2];

    NSCalendar *calendar =  [NSCalendar currentCalendar];
    [calendar compareDate:date1 toDate:date2 toUnitGranularity:NSCalendarUnitDay];
    
    NSIndexPath *indexPath1 = [NSIndexPath indexPathWithIndex:5];
    NSIndexPath *indexPath2 = [NSIndexPath indexPathWithIndex:5];
    [indexPath1 compare:indexPath2];


    NSString *str1 = [NSString stringWithFormat:@"123"];
    NSString *str2 = [NSString stringWithFormat:@"123"];
    [str1 compare:str2];
       
    
}

@end
