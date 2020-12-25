//
//  NSDate_.m
//  Runtime
//
//  Created by xs on 2020/12/24.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSDate_.h"

@implementation NSDate_

+ (void)load{

    NSDate *date = nil;
    
    {
        /*NSTimeInterval  Interval:间隔
         1. typedef double NSTimeInterval; 小数点后6未
         2.值始终以秒为单位；在10,000年的时间范围内，其精度可达到亚毫秒级。
         */
        NSTimeInterval  timeInterval = 0.000001; // 6位
        double doubleTime = 0.0000001; // 7位
        NSLog(@"timeInterval = %f",timeInterval); // imeInterval = 0.000001
        NSLog(@"doubleTime = %f",doubleTime); // oubleTime = 0.000000

    }
    {
        /*
         1.默认是零时区此刻的时间
         2.打印的时候 自动 经过了 时区的处理
         */
        date = [[NSDate alloc]init];
        NSLog(@"date = %@",date); //date = Tue Dec 22 15:18:30 2020

        date = [NSDate date];// 底层就是调用的 init
        NSLog(@"date = %@",date); // date = Tue Dec 22 15:18:30 2020
    }
    {
        //遥远的过去
        date =  [NSDate distantPast];
        NSLog(@"date = %@",date); // past = Sat Dec 30 08:05:43 0000

        //遥远的将来
        date = [NSDate distantFuture];
        NSLog(@"date = %@",date); // uture = Mon Jan  1 08:00:00 4001
    }
    
    {
        // 00:00:00 UTC on 1 January 1970
        date = [NSDate dateWithTimeIntervalSince1970:0];
        NSLog(@"date = %@",date);// date = Thu Jan  1 08:00:00 1970
        date = [NSDate dateWithTimeIntervalSince1970:3600];
        NSLog(@"date = %@",date);// date = Thu Jan  1 09:00:00 1970
        
        // 00:00:00 UTC on 1 January 2001.
        date = [NSDate dateWithTimeIntervalSinceReferenceDate:0];
        NSLog(@"date = %@",date);// date = Mon Jan  1 08:00:00 2001
        date = [NSDate dateWithTimeIntervalSinceReferenceDate:3600];
        NSLog(@"date = %@",date);// date = Mon Jan  1 09:00:00 2001
        
        //获取一个距离当前时间点特定时间间隔的日期
        date = [NSDate dateWithTimeIntervalSinceNow:3600];
        NSLog(@"date = %@",date); // date = Tue Dec 22 16:18:30 2020
        date = [NSDate dateWithTimeIntervalSinceNow:-3600];
        NSLog(@"date = %@",date); // date = Tue Dec 22 14:18:30 2020

        //获取一个距离特定时间点特定时间间隔的日期
        date = [NSDate dateWithTimeInterval:3600 sinceDate:[NSDate date]];
    }
    
    {
        //在当前时间上 发生偏移
        date =  [date dateByAddingTimeInterval:3600];
    }
    {
        // 距离 目标时间的 间隔
        NSDate *date = [[NSDate alloc]init];
        NSTimeInterval interval1 =  date.timeIntervalSinceNow;
        NSTimeInterval interval2 =  date.timeIntervalSince1970;
        NSTimeInterval interval3 =  date.timeIntervalSinceReferenceDate;
        
        NSLog(@"interval1 = %f",interval1); // -0.000001
        NSLog(@"interval2 = %f",interval2); // 1608622647.364374
        NSLog(@"interval3 = %f",interval3); // 630315447.364374

        //距离 目标时间的 间隔
        NSTimeInterval interval =  [date timeIntervalSinceDate:[NSDate date]];
        NSLog(@"interval = %f",interval); // -0.000000 或者  -0.000001
        
    }
    {
        // 时间比较
        NSDate *date1 = [[NSDate alloc]init];
        NSDate *date2 = [[NSDate alloc]init];
        if (date1 == date2) {
            NSLog(@"时间不相等");
        }
        if ([date1 isEqual:date2]) {
            NSLog(@"时间不相等");
        }
        if ([date1 isEqualToDate:date2]) { // 亚秒级别，实际中还是用 timeIntervalSinceDate 得出秒来比较吧
            NSLog(@"时间不相等");
        }
    

        NSComparisonResult result = [date1 compare:date2]; // NSOrderedAscending
        NSLog(@"");
        
        NSDate *earlierDate = [date1 earlierDate:date2]; // 2个中较早的
        NSDate *laterDate = [date1 laterDate:date2]; // 2个中较晚的

        
    }


    
}
/*
 时间间隔:表示特定开始日期和结束日期之间的时间跨度的对象。
 1.NSDateInterval对象由startDate和endDate组成。
 2.日期间隔的startDate和endDate可以相等，在这种情况下，其持续时间为0。
 3.但是，endDate不能早于startDate发生。
 4.您可以使用NSDateIntervalFormatter类创建适合于在当前语言环境中显示的NSDateInterval对象的字符串表示形式。
 */
+ (void)NSDateInterval{
    /* Duration 持续时间
     interval = <_NSConcreteDateInterval: 0x10055d230> 开始时间+持续时间(NSTimeInterval) = 结束时间
     (Start Date) 2020-12-23 01:31:10 +0000 + (Duration) 0.000000 = (End   Date) 2020-12-23 01:31:10 +0000
     */
    NSDateInterval *interval = [[NSDateInterval alloc]init];
    NSLog(@"interval = %@",interval);
    
    // 开始时间与结束时间 之间的间隔
    interval = [[NSDateInterval alloc]initWithStartDate:[NSDate date] endDate:[NSDate date]];
    // 开始时间与之相隔持续时间 之间的间隔
    interval = [[NSDateInterval alloc]initWithStartDate:[NSDate date] duration:3600];
    
    // 间隔对象的 开始时间 结束时间
   NSDate *startDate = interval.startDate;
   NSDate *endDate = interval.endDate;
    
    {
        NSDateInterval *interval1 = [[NSDateInterval alloc]initWithStartDate:[NSDate date] endDate:[NSDate date]];
        NSDateInterval *interval2 = [[NSDateInterval alloc]initWithStartDate:[NSDate date] endDate:[NSDate date]];

        if ([interval1 isEqual:interval2]) {
            NSLog(@"不成立");
        }
        
        // 开始时间 跟间隔 都要相同才YES
        if ([interval1 isEqualToDateInterval:interval2]) {
            NSLog(@"不成立");
        }
        NSComparisonResult result = [interval1 compare:interval2];
        NSLog(@"NSOrderedAscending"); // 上升

    }
    {
        NSDateInterval *interval1 = [[NSDateInterval alloc]initWithStartDate:[NSDate date] endDate:[NSDate date]];
        NSDateInterval *interval2 = [[NSDateInterval alloc]initWithStartDate:[NSDate date] endDate:[NSDate date]];
        // 交集
        NSDateInterval *intersection = [interval1 intersectionWithDateInterval:interval2];
        NSLog(@"interval = %@",interval);

        // 是否包含
        BOOL  intersects = [interval1 intersectsDateInterval:intersection];
        NSLog(@"");

    }
}




@end
