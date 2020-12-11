//
//  IsEqual.m
//  Runtime
//
//  Created by xs on 2020/12/7.
//  Copyright © 2020 xax. All rights reserved.
//

#import "IsEqual.h"

@implementation IsEqual
+ (void)load{
    [self axax];
    
    /*数据类型
     1.值类型
     2.包装值的对象类型
     3.不含值的纯粹对象类型
     */
    
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

    {
        
        
        /*
         1.同类型包装的相同数据，其地址相同，hash相同
         2.不同类型包装的相同数据，其地址不同，但hash相同
         */
        NSNumber *numInt1 = [NSNumber numberWithInt:10];
        NSNumber *numInt2 = [NSNumber numberWithInt:10];
        NSLog(@"%p,%p",numInt1,numInt2); // 地址相同
        NSLog(@"%lu,%lu",(unsigned long)numInt1.hash,(unsigned long)numInt2.hash); // hash相同

        if (numInt1 == numInt2) {
            NSLog(@""); //成立
        }

        NSNumber *numfloat1 = [NSNumber numberWithFloat:10.0f];
        NSNumber *numfloat2 = [NSNumber numberWithFloat:10.0f];
        NSLog(@"%p,%p",numfloat1,numfloat2); // 地址相同 但与 numInt1 numInt2 不相同
        NSLog(@"%lu,%lu",(unsigned long)numfloat1.hash,(unsigned long)numfloat2.hash); // hash相同

        if (numfloat1 == numfloat2) {
            NSLog(@"");//成立
        }
        
        
        NSNumber *numDouble1 = [NSNumber numberWithDouble:10.0];
        NSNumber *numDouble2 = [NSNumber numberWithDouble:10.0];
        NSLog(@"%p,%p",numDouble1,numDouble2); // 地址相同 但与 numInt1 numInt2 不相同
        NSLog(@"%lu,%lu",(unsigned long)numDouble1.hash,(unsigned long)numDouble2.hash); // hash相同

        if (numDouble1 == numDouble2) {
            NSLog(@"");//成立
        }
        
        
        if (numInt1 == numfloat1) {
            NSLog(@"");//不成立(地址不相同)
        }
        if (numfloat1 == numDouble1) {
            NSLog(@"");//不成立(地址不相同)
        }
        
        if ([numInt1 isEqual:numInt2]) {
            NSLog(@""); //成立 (hash相同)
        }
        if ([numInt1 isEqualTo:numInt2]) {
            NSLog(@""); //成立 (hash相同)
        }
        if ([numInt1 isEqualToNumber:numInt2]) {
            NSLog(@""); //成立 (hash相同)
        }
        if ([numInt1 isEqual:numfloat1]) {
            NSLog(@""); //成立 (hash相同)
        }
        if ([numInt1 isEqualTo:numfloat1]) {
            NSLog(@""); //成立 (hash相同)
        }
        if ([numInt1 isEqualToNumber:numfloat1]) {
            NSLog(@""); //成立 (hash相同)
        }
    }
    {
        /*
         1. 字符串相同的2个字符串对象，地址相同，hash相同
         */
        NSString *str1 = [NSString stringWithFormat:@"123"];
        NSString *str2 = [NSString stringWithFormat:@"123"];
        NSLog(@"%p,%p",str1,str2); // 地址相同

        if (str1 == str2) {
            NSLog(@""); //成立
        }
        if ([str1 isEqual:str2]) {
            NSLog(@""); //成立
        }
        if ([str1 isEqualToString:str2]) {
            NSLog(@""); //成立
        }
    }
    {
        /*
         1. 时间相同的2个时间对象，地址相同，hash相同
         */
        NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:500];
        NSDate *date2 = [NSDate dateWithTimeIntervalSince1970:500];
        NSLog(@"%p,%p",date1,date2); // 地址相同

        if (date1 == date2) {
            NSLog(@""); //成立

        }
        if ([date1 isEqual:date2]) {
            NSLog(@""); //成立
        }
        if ([date1 isEqualToDate:date2]) {
            NSLog(@""); //成立
        }
    }

    {
        /*
         1. 任何2个NSValue的地址都不相同
         2. 同类型包装的相同数据，其hash相同
         3. 不同类型包装的数据，其hash不同
         */
        NSValue *value1 = [NSValue valueWithSize:NSMakeSize(10, 10)];
        NSValue *value2 = [NSValue valueWithSize:NSMakeSize(10, 10)];
        NSValue *value3 = [NSValue valueWithPoint:NSMakePoint(10, 10)];
        NSLog(@"%p,%p",value1,value2); // 地址不相同

        if (value1 == value2) {
            NSLog(@"");//不成立
        }
 
        if ([value1 isEqual:value2]) {
            NSLog(@""); //成立
        }
        if ([value1 isEqualTo:value2]) {
            NSLog(@""); //成立
        }
        if ([value1 isEqualToValue:value2]) {
            NSLog(@""); //成立
        }
        if ([value1 isEqual:value3]) {
            NSLog(@""); //不成立
        }
        if ([value1 isEqualToValue:value3]) {
            NSLog(@""); //不成立
        }
    
    
    }
    {
        /*
         1.任何2个NSURL的地址都不相同
         2.同数据包装的URL 其hash相同
         */
        NSURL *url1 = [NSURL URLWithString:@"https://www.jianshu.com"];
        NSURL *url2 = [NSURL URLWithString:@"https://www.jianshu.com"];
        NSLog(@"%p,%p",url1,url2); // 地址不相同

        if (url1 == url2) {
            NSLog(@""); //不成立

        }
        if ([url1 isEqual:url2]) {
            NSLog(@""); //成立
        }
        
    }
    {
        /*
         1.任何2个NSData的地址都不相同
         2.同数据包装的Data 其hash相同
         */
        NSString *path = @"/Users/xs/Desktop/Git/Runtime/4Foundation/1 Fundamental/3Collections/1Dict/writeDict.plist";
        NSData *data1 = [NSData dataWithContentsOfFile:path];
        NSData *data2 = [NSData dataWithContentsOfFile:path];
        NSLog(@"%p,%p",data1,data2); // 地址不相同

        if (data1 == data2) {
            NSLog(@""); //不成立

        }
        if ([data1 isEqual:data2]) {
            NSLog(@""); //成立
        }
        if ([data1 isEqualToData:data2]) {
            NSLog(@""); //成立
        }
    }

    {
        /*
         1.任何2个NSDictionary的地址都不相同
         2.同数据包装的Dictionary 其hash相同
         */
        NSDictionary *dict1 = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
        NSDictionary *dict2 = [NSDictionary dictionaryWithObject:@"value" forKey:@"key"];
        NSLog(@"dict1.p = %p",dict1);
        NSLog(@"dict2.p = %p",dict2);

        if (dict1 == dict2) {
            NSLog(@""); //不成立

        }
        if ([dict1 isEqual:dict2]) {
            NSLog(@""); //成立
        }
        if ([dict1 isEqualToDictionary:dict2]) {
            NSLog(@""); //成立
        }
    }
    {
        /*
         1.任何2个NSArray的地址都不相同
         2.同数据包装的Array 其hash相同
         */
        NSArray *array1 = [NSArray arrayWithObjects:@1,@"1",@{@"key":@"value"}, nil];
        NSArray *array2 = [NSArray arrayWithObjects:@1,@"1",@{@"key":@"value"}, nil];
        if (array1 == array2) {
            NSLog(@""); //不成立

        }
        if ([array1 isEqual:array2]) {
            NSLog(@""); //成立
        }
        if ([array1 isEqualToArray:array2]) {
            NSLog(@""); //成立
        }
        
        NSSet *set1 = [NSSet setWithObjects:@1,@"123",@{@"key":@"value"},nil];
        NSSet *set2 = [NSSet setWithObjects:@1,@"123",@{@"key":@"value"},nil];
        if (set1 == set2) {
            NSLog(@""); //不成立
        }
        if ([set1 isEqual:set2]) {
            NSLog(@""); //成立
        }
        if ([set1 isEqualToSet:set2]) {
            NSLog(@""); //成立
        }
    }
    {
        /*
         1.任何2个NSIndexSet的地址都不相同
         2.同数据包装的IndexSet 其hash相同
         */
        NSIndexSet *set1 = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];
        NSIndexSet *set2 =  [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)];
        if (set1 == set2) {
            NSLog(@""); //不成立
        }
        if ([set1 isEqual:set2]) {
            NSLog(@""); //成立
        }
        if ([set1 isEqualToIndexSet:set2]) {
            NSLog(@""); //成立
        }
    }
    {
        /*
         1.同节点的任意2个NSIndexPath地址相同
         2.同数据包装的IndexSet 其hash相同
         */
        const NSUInteger indexes1[] = {1,3,4};
        NSIndexPath *indexPath1 = [NSIndexPath indexPathWithIndexes:indexes1 length:sizeof(indexes1)/sizeof(NSUInteger)];
        
        const NSUInteger indexes2[] = {1,3,4};
        NSIndexPath *indexPath2 = [NSIndexPath indexPathWithIndexes:indexes2 length:sizeof(indexes2)/sizeof(NSUInteger)];
        
        const NSUInteger indexes3[] = {1,3};
        NSIndexPath *indexPath3 = [NSIndexPath indexPathWithIndexes:indexes3 length:sizeof(indexes3)/sizeof(NSUInteger)];
        NSIndexPath *indexPath4 = [indexPath3 indexPathByAddingIndex:4];
        if (indexPath1 == indexPath2) {
            NSLog(@""); //成立
        }
        if (indexPath1 == indexPath4) {
            NSLog(@""); //成立
        }
        
        if ([indexPath1 isEqual:indexPath2]) {
            NSLog(@""); //成立
        }
        if ([indexPath1 isEqual:indexPath4]) {
            NSLog(@""); //成立
        }
        if ([indexPath1 compare:indexPath2]) {
            NSLog(@""); //成立
        }
       
    }
    
}
+ (void)axax{
    NSNumber *num = [[NSNumber alloc]init];
    NSValue *value = [[NSValue alloc]init];
    
    
    NSString *str = [[NSString alloc]init];
    NSDate *date = [[NSDate alloc]init];
    NSData *data = [[NSData alloc]init];
    NSURL *url = [[NSURL alloc]init];
    
    NSDictionary *dict = [[NSDictionary alloc]init];
    NSArray *array = [[NSArray alloc]init];
    NSIndexSet *indexSet = [[NSIndexSet alloc]init];
    NSIndexPath *indexPath = [[NSIndexPath alloc]init];

    if (num) {
        NSLog(@"%@",num);
    }
    if (str) {
        NSLog(@"%@",str);
    }
    if (value) {
        NSLog(@"%@",value);
    }
    if (date) {
        NSLog(@"%@",date);
    }
    if (data) {
        NSLog(@"%@",data);
    }
    if (url) {
        NSLog(@"%@",url);
    }
    if (array) {
        NSLog(@"%@",array);
    }
    if (indexSet) {
        NSLog(@"%@",indexSet);
    }
    if (indexPath) {
        NSLog(@"%@",indexPath);
    }

 
}
@end
