//
//  Compare_.m
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import "Compare_.h"

@implementation Compare_
+ (void)load{
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
    
    //        NSSortDescriptor *des =  [[NSSortDescriptor alloc]initWithKey:@"1" ascending:YES];
    //        [des compareObject:@1 toObject:@3];
}
@end
