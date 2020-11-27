//
//  NSNumber(Wrappers).m
//  Runtime
//
//  Created by xs on 2020/11/26.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSNumber(Wrappers).h"

@implementation NSNumber_Wrappers_
+ (void)load{
    [self test1];
}
#pragma warning -Creating an NSNumber Object
+ (void)test1{
    

    {
        NSNumber *num1 = @(10);
        NSNumber *num2 = @(10.10);
        NSNumber *num3 = @(YES);
    }
    {
        NSNumber *num1 = [NSNumber numberWithInt:10];
        NSNumber *num2 = [NSNumber numberWithFloat:10.10f];
        NSNumber *num3 = [NSNumber numberWithChar:'a'];
        NSNumber *num4 = [NSNumber numberWithInteger:100];
        NSNumber *num5 = [NSNumber numberWithBool:NO];
    }
}
#pragma warning -Accessing Numeric Values
+ (void)test2{
        /*
         1.nil空值:其Value值,基本数据类型的 是 0 ，对象值是nil
         2.alloc init无包装：其Value值,基本数据类型的 是 0 ，对象值是nil
         3.有包装:其Value值,会进行类型转换输出
         */
        {
            NSNumber *num = nil;
            int intValue = num.intValue; // 0
            NSInteger integerValue = num.integerValue; // 0
            float floatValue = num.floatValue; // 0
            char charValue = num.charValue; // '\0' 0
            BOOL boolValue = num.boolValue; // NO
            NSString *stringValue = num.stringValue; // nil
        }
 
        {
            NSNumber *num = [[NSNumber alloc]init];
            int intValue = num.intValue; // 0
            NSInteger integerValue = num.integerValue; // 0
            float floatValue = num.floatValue; // 0
            char charValue = num.charValue; // '\0' 0
            BOOL boolValue = num.boolValue; // NO
            NSString *stringValue = num.stringValue; // nil
  
        }
        {
            NSNumber *num = [NSNumber numberWithBool:YES];
            int intValue = num.intValue; // 1
            NSInteger integerValue = num.integerValue; // 1
            float floatValue = num.floatValue; // 1
            char charValue = num.charValue; // '\x01' 1
            BOOL boolValue = num.boolValue; // YES
            NSString *stringValue = num.stringValue; // @"1"
            NSLog(@"%@",num);

        }
        {
            NSNumber *num = [[NSNumber alloc]init];
            if (num) {
                NSLog(@"%@",num);
            }
            
            NSObject *ob = [[NSObject alloc]init];
            if (ob) {
                NSLog(@"%@",ob);
            }
            /*num = nil的思考
             1.if()的真假判断 其根本判断的是 指针指向的内存是否有值
             2.num = nil，这个是为什么
             */
            
        }
 
        

}
#pragma warning -Comparing NSNumber Objects
+ (void)test3{
    {
        NSNumber *num1 = [NSNumber numberWithInt:10];
        NSNumber *num2 = [[NSNumber alloc]init];
        
        /*
         1.2个Number做比较 大小还是一样，2个对象不能为空否则会崩溃
         */
        NSComparisonResult  result  = [num1 compare:num2];
        
        /*
         1.比较2个对象是否相同，值相同，内部会调用上面的compare
         */
        BOOL  isEqual  = [num1 isEqualToNumber:num2];
    }
}

#pragma warning - NSNumberFormatter
/*
 NSNumberFormatterNoStyle = 98764
 NSNumberFormatterCurrencyStyle = US$98,764.12
 NSNumberFormatterDecimalStyle = 98,764.123
 NSNumberFormatterPercentStyle = 9,876,412%
 NSNumberFormatterScientificStyle = 9.876412345E4
 NSNumberFormatterSpellOutStyle = 九万八千七百六十四点一二三四五
 NSNumberFormatterOrdinalStyle = 第9,8764
 NSNumberFormatterCurrencyISOCodeStyle = USD98,764.12end
 NSNumberFormatterCurrencyPluralStyle = 98,764.12美元
 NSNumberFormatterCurrencyAccountingStyle = US$98,764.12
 */
+ (void)test4{
    //https://www.jianshu.com/p/29ef372c65d3 样式 前后缀 更改原始符号 分割尺寸 格式宽度 舍入
    NSNumberFormatter *formatter =  [[NSNumberFormatter alloc]init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *numStr = [formatter stringFromNumber:@(98764.12345)];
    NSNumber *num = [formatter numberFromString:numStr];
}
@end

#pragma warning - NSNumber安全扩展
@interface NSNumber (safe)

- (BOOL)safeIsEqualToNumber:(NSNumber *)number;

- (NSComparisonResult)safeCompare:(NSNumber *)otherNumber;

@end
@implementation NSNumber (safe)

- (NSComparisonResult)safeCompare:(NSNumber *)otherNumber{
    if (otherNumber == nil) {
        return NSOrderedDescending;
    } else {
        return [self compare:otherNumber];
    }
}
- (BOOL)safeIsEqualToNumber:(NSNumber *)number{
    if (number == nil) {
        return NO;
    } else {
        return [self isEqualToNumber:number];
    }
}


@end
