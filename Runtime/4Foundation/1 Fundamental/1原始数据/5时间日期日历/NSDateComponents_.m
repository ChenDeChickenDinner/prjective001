//
//  NSDateComponents_.m
//  Runtime
//
//  Created by xs on 2020/12/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSDateComponents_.h"

@implementation NSDateComponents_
+ (void)load{
    /*
     dateComponents = <NSDateComponents: 0x10054b6b0> {
         Calendar: <CFCalendar 0x100714ea0 [0x7fff8784fcc0]>{identifier = 'gregorian'}
         TimeZone: Local Time Zone (Asia/Shanghai (GMT+8) offset 28800)
         Era: 1
         Calendar Year: 2020
         Month: 12
         Day: 24
         Hour: 1
         Minute: 1
         Second: 1
         Nanosecond: 1
         Quarter: 1
         Year for Week of Year: 1
         Week of Year: 1
         Week of Month: 1
         Weekday: 1
         Weekday Ordinal: 1
     */
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    NSLog(@"dateComponents = %@",dateComponents); // <NSDateComponents: 0x1006345e0> {
    dateComponents.calendar = [NSCalendar currentCalendar];
    dateComponents.timeZone = [NSTimeZone localTimeZone];
    dateComponents.era = 1;
    dateComponents.year = 2020;
    dateComponents.month = 12;
    dateComponents.day = 24;

    dateComponents.hour = 1;
    dateComponents.minute = 1;
    dateComponents.second = 1;
    dateComponents.nanosecond = 1;

    dateComponents.weekday = 1;
    dateComponents.weekdayOrdinal = 1;
    dateComponents.quarter = 1;
    dateComponents.weekOfMonth = 1;
    dateComponents.weekOfYear = 1;
    dateComponents.yearForWeekOfYear = 1;
    NSLog(@"dateComponents = %@",dateComponents);
}
@end
