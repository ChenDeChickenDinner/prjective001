//
//  NSValue(Number).m
//  FoundationZL
//
//  Created by xs on 2017/6/5.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NSValue(Number).h"

@implementation NSValue_Number_

@end
/*
 **************** NSValue: NSObject <NSCopying, NSSecureCoding>  *****************

 NSValue:是用来存储一个C或者Objective－C数据的简单容器。它可以保存任意类型的数据

 *包装原生自定义的数据结构
 valueWithBytes:接收一个地址 objCType：用来描述这个数据类型的字符串, 用@encode指令来生成
 NSValue *pValue = [NSValue valueWithBytes:&p objCType:@encode(Person)];


 *包装Range Values
 + (NSValue *)valueWithRange:(NSRange)range;
 @property (readonly) NSRange rangeValue;

 *包装CoreGraphics  Geometry Values
 + (NSValue *)valueWithCGPoint:(CGPoint)point;
 + (NSValue *)valueWithCGVector:(CGVector)vector;
 + (NSValue *)valueWithCGSize:(CGSize)size;
 + (NSValue *)valueWithCGRect:(CGRect)rect;
 + (NSValue *)valueWithCGAffineTransform:(CGAffineTransform)transform;

 *包装UIKit Geometry Values
 + (NSValue *)valueWithUIEdgeInsets:(UIEdgeInsets)insets;
 + (NSValue *)valueWithUIOffset:(UIOffset)insets NS_AVAILABLE_IOS(5_0);


 *包装CoreAnimation Transform Values
 + (NSValue *)valueWithCATransform3D:(CATransform3D)t;
 @property(readonly) CATransform3D CATransform3DValue;

 *取对应值
 - (void)getValue:(void *)value;


 **************** NSNumber : NSValue *****************
 NSNumber:将基本数据类型包装成对象
 *NSNumber:initWithInt（char short int long float double BOOL NSInteger NSUInteger）
 *快速创建简写如果传入的是变量，那么必须使用@()，如果传入的是常量，那么@后面的括号可以省略




 ****************  NSDecimalNumber : NSNumber  *****************
 NSDecimalNumber:这个类为OC程序提供了定点算法功能,它被设计为了不会损失精度并且可预先设置凑整规则的10进制计算


 NSRoundingMode:表示舍入进位方式的枚举
 *NSRoundPlain:四舍五入
 *NSRoundDown:超过的位数都舍弃
 *NSRoundUp:超过的位数向前进1
 *NSRoundBankers:四舍六入五成双

 NSCalculationError:C的 NSDecimal 运算函数的返回值表明成功或者失败
 *NSCalculationNoError = 0, // 操作成功
 *NSCalculationLossOfPrecision, // 操作造成的精度损失
 *NSCalculationUnderflow,       // 操作导致下溢
 *NSCalculationOverflow,        // 操作导致溢出
 *NSCalculationDivideByZero // 试图除以零

 NSExceptionName:表示十进制数运算过程中出现错误的全局常量
 NSExceptionName const NSDecimalNumberExactnessException;:出现一个精确的错误
 NSExceptionName const NSDecimalNumberOverflowException;溢出
 NSExceptionName const NSDecimalNumberUnderflowException;下溢
 NSExceptionName const NSDecimalNumberDivideByZeroException;除数为0

 NSDecimalNumberBehaviors:描述运算行为的协议（算术的方法) Behaviors行为
 *- (NSRoundingMode)roundingMode;舍入进位方式
 *-- (short)scale;保留的小数位


 NSDecimalNumberHandler:遵守了NSDecimalNumberBehaviors协议的对象
 *scale:保留的小数位
 *raiseOnExactness: 如果设置为YES，当精确度发生错误的时候会抛出异常，否则就直接返回NAN
 *raiseOnOverflow: 如果设置为YES，当发生溢出时会抛出异常，否则就直接返回NAN
 *raiseOnU/Users/xs/Desktop/TEXTCHEN/TEXTCHEN.xcodeprojnderflow: 如果设置为YES，当发生下溢时会抛出异常，否则就直接返回NAN
 *raiseOnDivideByZero:如果设置为YES，当除以0时会抛出异常，否则就直接返回NAN

 NSDecimalNumberHandler *handle = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];


 // *根据指数自生成
 NSDecimalNumber *number1 = [[NSDecimalNumber alloc]initWithMantissa:1275 exponent:2 isNegative:YES];
 NSDecimalNumber *number2 = [[NSDecimalNumber alloc]initWithMantissa:1275 exponent:-2 isNegative:YES];

 // *根据 NSDecimal 转换
 NSDecimal decimal = number2.decimalValue;
 NSDecimalNumber *number3 = [[NSDecimalNumber alloc]initWithDecimal:decimal];

 //    NSLog(@"number1 = %@,number2 = %@,number3 = %@",number1,number2,number3);
 // *根据字符串转换，注意当字符串为空或者包含非数字都会转换出错 NaN
 NSDecimalNumber *number4 = [[NSDecimalNumber alloc]initWithString:@"123"];
 NSDecimalNumber *number5 = [[NSDecimalNumber alloc]initWithString:@"12,33" locale:locale1];



 // *类对象的属性方法？
 NSDecimalNumber *zero =  NSDecimalNumber.zero;
 NSDecimalNumber *one =  NSDecimalNumber.one;
 NSDecimalNumber *notANumber =  NSDecimalNumber.notANumber;

 // *计算
 //- (NSDecimalNumber *)decimalNumberByAdding:(NSDecimalNumber *)decimalNumber;
 //- (NSDecimalNumber *)decimalNumberBySubtracting:(NSDecimalNumber *)decimalNumber;
 //- (NSDecimalNumber *)decimalNumberByMultiplyingBy:(NSDecimalNumber *)decimalNumber;
 //- (NSDecimalNumber *)decimalNumberByDividingBy:(NSDecimalNumber *)decimalNumber;


 //:NSValue
 - (BOOL)isEqualToValue:(NSValue *)value;


 //:NSNumber
 @property (readonly) NSDecimal decimalValue;
 @property (readonly) char charValue,shortValue,intValue,floatValue,doubleValue,boolValue,integerValue,unsignedIntegerValue;
 @property (readonly, copy) NSString *stringValue;

 - (NSComparisonResult)compare:(NSNumber *)otherNumber; 比对关系
 - (BOOL)isEqualToNumber:(NSNumber *)number; 比对是否相同
 - (NSString *)descriptionWithLocale:(nullable id)locale;



 //:NSDecimalNumber
 @property (readonly) NSDecimal decimalValue;
 @property (readonly) double doubleValue;
 @property (readonly, copy) NSString *stringValue;继承
 @property (class, strong) id <NSDecimalNumberBehaviors> defaultBehavior;

 - (NSComparisonResult)compare:(NSNumber *)decimalNumber;比对关系
 - (NSString *)descriptionWithLocale:(nullable id)locale;
 
 */
