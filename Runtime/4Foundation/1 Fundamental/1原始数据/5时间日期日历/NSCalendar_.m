//
//  NSCalendar_.m
//  Runtime
//
//  Created by xs on 2020/12/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSCalendar_.h"

@implementation NSCalendar_
/* 日历  Calendar:日历
 1.NSCalendar可以很方便的用来表示日期，获取日期的各种信息，包括年、月、日，时分秒。
 2.可以很方便的计算两个日期之前的关系。也可以很方便的根据一个日期获取另一个日期
 3.NSCalendar中有一个重要的概念NSCalendarUnit，这是一个位枚举，意味着作为参数可以采用位运算的方式传参
 4.大多数语言环境使用最广泛使用的民用日历，称为公历（NSCalendarIdentifierGregorian），但这种趋势仍然存在例外。例如：
 */
+ (void)load{
    NSCalendarIdentifier iden = NSCalendarIdentifierGregorian;
    NSCalendarUnit unit = NSCalendarUnitDay;
    NSCalendarOptions options =  NSCalendarWrapComponents;
    
    // 使用用户手机设置的日期信息，有缓存，用户手机日历改变后不会变
    NSCalendar *calendar1 = [NSCalendar currentCalendar];
    NSLog(@"calendar = %@",calendar1); // calendar = <_NSCopyOnWriteCalendarWrapper: 0x100508540>

    // 使用用户手机设置的日期信息，并且用户改变之后会跟着改变
    NSCalendar *calendar2 = [NSCalendar autoupdatingCurrentCalendar];
    NSLog(@"calendar = %@",calendar2); // calendar = <_NSCopyOnWriteCalendarWrapper: 0x100508540>
}
// 创建日历
+ (void)load1{
    
    

    NSCalendar *calendar1 = [NSCalendar new];
    NSLog(@"calendar = %@",calendar1); // calendar = (null)

    // 使用指定的标识获取日期，比如农历、佛历，常用的是格里高利历（NSCalendarIdentifierGregorian）公历
    NSCalendar *calendar2 = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar2.locale = [NSLocale currentLocale];
    calendar2.timeZone = [NSTimeZone localTimeZone];
    calendar2.firstWeekday = 1; // 设置/获取每周的第一天从星期几开始
    calendar2.minimumDaysInFirstWeek = 1; // 设置/获取第一周必须包含的最少天数

}
+ (void)load2With:(NSCalendar *)calendar{
    
    // 获取标示符 readonly
    NSCalendarIdentifier calendarIdentifier = calendar.calendarIdentifier;
    
    // 获取地区信息
    NSLocale *locale = calendar.locale;
    
    // 获取每周的第一天从星期几开始
    NSUInteger firstWeekday = calendar.firstWeekday;

    // 获取第一周必须包含的最少天数
    NSUInteger minimumDaysInFirstWeek = calendar.minimumDaysInFirstWeek;
    
    
    NSArray<NSString *> *eraSymbols = [calendar eraSymbols];
    NSArray<NSString *> *longEraSymbols = [calendar longEraSymbols];
    
    NSArray<NSString *> *quarterSymbols = [calendar quarterSymbols];
    NSArray<NSString *> *shortQuarterSymbols = [calendar shortQuarterSymbols];
    NSArray<NSString *> *standaloneQuarterSymbols = [calendar standaloneQuarterSymbols];
    NSArray<NSString *> *shortStandaloneQuarterSymbols = [calendar shortStandaloneQuarterSymbols];
    
    NSArray<NSString *> *monthSymbols = [calendar monthSymbols];
    NSArray<NSString *> *shortMonthSymbols = [calendar shortMonthSymbols];
    NSArray<NSString *> *veryShortMonthSymbols = [calendar veryShortMonthSymbols];
    NSArray<NSString *> *standaloneMonthSymbols = [calendar standaloneMonthSymbols];
    NSArray<NSString *> *shortStandaloneMonthSymbols = [calendar shortStandaloneMonthSymbols];
    NSArray<NSString *> *veryShortStandaloneMonthSymbols = [calendar veryShortStandaloneMonthSymbols];
    
    NSArray<NSString *> *weekdaySymbols = [calendar weekdaySymbols];
    NSArray<NSString *> *shortWeekdaySymbols = [calendar shortWeekdaySymbols];
    NSArray<NSString *> *veryShortWeekdaySymbols = [calendar veryShortWeekdaySymbols];
    NSArray<NSString *> *standaloneWeekdaySymbols = [calendar standaloneWeekdaySymbols];
    NSArray<NSString *> *shortStandaloneWeekdaySymbols = [calendar shortStandaloneWeekdaySymbols];
    NSArray<NSString *> *veryShortStandaloneWeekdaySymbols = [calendar veryShortStandaloneWeekdaySymbols];
    
    NSString *AMSymbol = [calendar AMSymbol];
    NSString *PMSymbol = [calendar PMSymbol];

}

+ (void)load3With:(NSCalendar *)calendar{
    
    NSDate *date;
    NSTimeInterval time;
    NSRange range1 =  [calendar maximumRangeOfUnit:NSCalendarUnitYear];
    NSRange range2 =  [calendar minimumRangeOfUnit:NSCalendarUnitYear];
    NSRange range3 =  [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];
    
    NSInteger  num1 = [calendar component:NSCalendarUnitDay fromDate:[NSDate date]];
    NSUInteger num2 = [calendar ordinalityOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:[NSDate date]];

    BOOL is1 = [calendar isDateInWeekend:[NSDate date]];
    BOOL is2 = [calendar isDateInYesterday:[NSDate date]];
    BOOL is3 = [calendar isDateInToday:[NSDate date]];
    BOOL is4 = [calendar isDateInTomorrow:[NSDate date]];
    BOOL is5 = [calendar  isDate:[NSDate date] inSameDayAsDate:[NSDate date]]; // 是否是同一天
    BOOL is6 = [calendar rangeOfUnit:NSCalendarUnitYear startDate:&date interval:&time forDate:[NSDate date]];
    BOOL is7 = [calendar rangeOfWeekendStartDate:&date interval:&time containingDate:[NSDate date]];
    BOOL is8 = [calendar date:[NSDate date] matchesComponents:comA];
    
    NSComparisonResult reslut = [calendar compareDate:[NSDate date] toDate:[NSDate date] toUnitGranularity:NSCalendarUnitDay];
}
+ (void)load4With:(NSCalendar *)calendar{
    /* 筛选出时间 计算时间
     */
 
    
    NSDate *data61 = [calendar dateWithEra:1 year:2020 month:1 day:1 hour:1 minute:1 second:1 nanosecond:1];
    NSDate *data71 = [calendar dateWithEra:1 yearForWeekOfYear:1 weekOfYear:1 weekday:1 hour:1 minute:1 second:1 nanosecond:1];
    
    NSDate *data12 = [calendar startOfDayForDate:[NSDate date]];
    NSDate *data32 = [calendar nextDateAfterDate:[NSDate date] matchingHour:8 minute:8 second:8 options:NSCalendarWrapComponents];
    NSDate *data42 = [calendar nextDateAfterDate:[NSDate date] matchingUnit:NSCalendarUnitDay value:1 options:NSCalendarWrapComponents];
    
    
    NSDate *data21 = [calendar dateBySettingUnit:NSCalendarUnitDay value:8 ofDate:[NSDate date] options:NSCalendarWrapComponents];
    NSDate *data31 = [calendar dateBySettingHour:8 minute:8 second:8 ofDate:[NSDate date] options:NSCalendarWrapComponents];
    NSDate *data51 = [calendar dateByAddingUnit:NSCalendarUnitDay value:8 toDate:[NSDate date] options:NSCalendarWrapComponents];
    
    NSDateComponents *comA = [[NSDateComponents alloc]init];;
    NSDateComponents *comB = [[NSDateComponents alloc]init];;
    NSDate *data11 = [calendar dateFromComponents:comA];
    NSDate *data41 = [calendar dateByAddingComponents:comA toDate:[NSDate date] options:NSCalendarWrapComponents];
    NSDate *data22 = [calendar nextDateAfterDate:[NSDate date] matchingComponents:comA options:NSCalendarWrapComponents];
    [calendar enumerateDatesStartingAfterDate:[NSDate date] matchingComponents:comA options:NSCalendarWrapComponents usingBlock:^(NSDate * _Nullable date, BOOL exactMatch, BOOL * _Nonnull stop) {
                
    }];
}
+ (void)load5With:(NSCalendar *)calendar{
    NSDateComponents *com1 = [calendar components:NSCalendarUnitDay fromDate:[NSDate date]];
    NSDateComponents *com2 = [calendar componentsInTimeZone:[NSTimeZone localTimeZone] fromDate:[NSDate date]];
    NSDateComponents *com3 = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:[NSDate date] options:NSCalendarWrapComponents];
    
    NSDateComponents *comA = [[NSDateComponents alloc]init];;
    NSDateComponents *comB = [[NSDateComponents alloc]init];;
    NSDateComponents *com4 = [calendar components:NSCalendarUnitDay fromDateComponents:comA toDateComponents:comB options:NSCalendarWrapComponents];

}
@end
