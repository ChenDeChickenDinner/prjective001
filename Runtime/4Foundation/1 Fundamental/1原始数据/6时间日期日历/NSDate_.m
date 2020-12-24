//
//  NSDate_.m
//  Runtime
//
//  Created by xs on 2020/12/24.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSDate_.h"

@implementation NSDate_

/*
 NSDate -- 表示一个绝对的时间点
 NSTimeZone -- 时区信息
 NSLocale -- 本地化信息
 NSDateComponents -- 一个封装了具体年月日、时秒分、周、季度等的类
 NSCalendar -- 日历类，它提供了大部分的日期计算接口，并且允许您在NSDate和NSDateComponents之间转换
 NSDateFormatter -- 用来在日期和字符串之间转换

 */
/*

UTC:
1.协调世界时，又称世界统一时间、世界标准时间、国际协调时间。由于英文（CUT）和法文（TUC）的缩写不同，作为妥协
2.UTC是根据原子钟来计算时间

GMT:是指位于伦敦郊区的皇家格林尼治天文台的标准时间（开发中不常用）
1.在1972年以前，是世界时的计时基准
2.在1972年以后，是零时区，伦敦时间
3.UTC = GMT +/- 0.9 s

CST:北京时间
 
时区 TimeZone
本初子午线
1.即0度经线，亦称格林威治子午线、格林尼治子午线或本初经线，
2.是经过英国格林尼治天文台的一条经线（亦称子午线）。

日期变更线
1.随着标准时计时的区时系统的确立，东西十二区重叠，计时相同但日期不同，为避免混乱，公认180°经线作为日期变更线
2.作为地球上“今天”和“昨天”的分界线

时区划分:
1.正式的时区划分包括24个时区,东、西各12个时区,时间正好是1小时
2.每隔经度15°划分一个时区,最后的东、西第12区各跨经度7.5度
3.地球是自西向东自转，东边比西边先看到太阳，东边的时间也比西边的早
UTC-12:西十二区 (10月-1日-12:00)
UTC-6:西六区    (10月-1日-18:00)
UTC0: 零时区    (10月-2日-00:00)
UTC+1:东一区    (10月-2日-01:00)
UTC+6:东六区    (10月-2日-06:00)
UTC+8:东八区    (10月-2日-08:00)北京时间
UTC+12:东十二区  (10月-2日-12:00)
 
时差的计算公式：
UTC + 时区差 = 本地时间

ISO 8601：
国际标准ISO 8601，是国际标准化组织的日期和时间的表示方法，全称为《数据存储和交换形式·信息交换·日期和时间的表示方法》。

1.年:
年由4位数组成，以公历公元1年为0001年，以公元前1年为0000年，公元前2年为-0001年；
例如2004
月日:
月为2位数，日为2位数；
例如2004年5月3日可写成2004-05-03或20040503

2.时分秒
1.小时、分和秒都用2位数表示，对UTC时间最后加一个大写字母Z，其他时区用实际时间加时差表示
如UTC时间下午2点30分5秒表示为14:30:05Z或143005Z，
当时的北京时间表示为22:30:05+08:00或223005+0800，也可以简化成223005+08

3.日期和时间的组合表示
合并表示时，要在时间前面加一大写字母T
如要表示北京时间2004年5月3日下午5点30分8秒，可以写成2004-05-03T17:30:08+08:00或20040503T173008+08
 
4.时间戳
1.时间戳是指格林威治时间1970年01月01日00时00分00秒(北京时间1970年01月01日08时00分00秒)起至现在的总秒数
2.时间戳应该是10位，如果不巧碰到了13位的，代表着他计算了毫秒，只要删除剪切前十位就行了
 
 */
/*
 厘秒:百分之一（0.01秒）
 毫秒:千分之一（0.001秒）
 微秒:百万分之一秒
 纳秒:10亿分之一秒
 */
+ (void)load{
//    [self NSCalendar];
    [self NSDateFormatter];

    
    return;
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
        
        date = [NSDate now];
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
//    [self NSDateInterval];
//    [self NSTimeZone];
//    [self NSLocale];

    
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

+ (void)NSTimeZone{
    NSTimeZone *timeZone = nil;
    {
        /*
         
         systemTimeZone:手机设置里面设置的时区(用户手动设置，取到的不一定是当前的系统时区) readonly
         1.如果访问systemTimeZone类属性，则其值由应用程序缓存，并且如果用户随后更改系统时区，则该值不会更新
         2.为了使systemTimeZone属性反映新的时区，必须首先调用resetSystemTimeZone方法以清除缓存的值。
        然后，下次访问systemTimeZone属性时，它将返回当前系统时区，并缓存该值
         3.如果访问systemTimeZone类属性，将其值分配给变量，
        然后通过调用resetSystemTimeZone方法清除该属性的缓存值，则该变量中存储的对象不会更新以反映新的系统时区
         
         localTimeZone: 跟踪监听systemTimeZone并且能够实时的变化(取到的肯定是当前的系统时区) readonly
         1.当您需要一个始终反映当前系统时区的对象时，请使用此属性
         2.尽管此处获取的时区会随系统自动更新，但是当系统设置更改时，它不会提供任何指示
         3.请使用addObserver：selector：name：object：将观察者添加到NSSystemTimeZoneDidChangeNotification通知中。
         
         defaultTimeZone:APP内部运行 依靠的时区(开发者可是更改)
         1.未设置:则使用当前系统时区。如果无法确定当前系统时区，则改用GMT时区。
         2.设置后:设置之前读取的局部时区变量，不会随着设置后的变化而变化，应该再次读取
         */
        // 清空APP对硬件时区的缓存
        [NSTimeZone resetSystemTimeZone];
        
        timeZone = [NSTimeZone systemTimeZone];
        NSLog(@"timeZone = %@",timeZone); //  timeZone = Asia/Shanghai (GMT+8) offset 28800 {offset:偏移的秒数}

        timeZone = [NSTimeZone localTimeZone];
        NSLog(@"timeZone = %@",timeZone); //  timeZone = Local Time Zone (Asia/Shanghai (GMT+8) offset 28800)


        timeZone = [NSTimeZone defaultTimeZone];
        NSLog(@"timeZone = %@",timeZone); //  sia/Shanghai (GMT+8) offset 28800
        
         
    }
    {
        //获取所有已知的时区名称
        NSArray *timeZoneArray = [NSTimeZone knownTimeZoneNames];
        NSLog(@"timeZoneArray = %@",timeZoneArray);
        
        // 获取所有已知的时区缩写
        NSDictionary *dict = [NSTimeZone abbreviationDictionary];
        NSLog(@"dict = %@",dict);
    }
    {
        timeZone = [[NSTimeZone alloc]init];
        NSLog(@"timeZone = %@",timeZone); // timeZone = (null)
        
        timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
        NSLog(@"timeZone = %@",timeZone); //
        
        timeZone = [NSTimeZone timeZoneWithAbbreviation:@"WIT"];
        NSLog(@"timeZone = %@",timeZone); //
        
        timeZone = [NSTimeZone timeZoneForSecondsFromGMT:0];//新时区从GMT偏移的秒数。
        NSLog(@"timeZone = %@",timeZone); //
        timeZone = [NSTimeZone timeZoneForSecondsFromGMT:3600*8];//新时区从GMT偏移的秒数。
        NSLog(@"timeZone = %@",timeZone); //
    }
    
    {
        timeZone = [NSTimeZone localTimeZone];
        NSString *name = [timeZone name]; //名称
        NSLog(@"name = %@",name); // name = Asia/Shanghai
        
        NSString *abbreviation = [timeZone abbreviation];//简拼
        NSLog(@"abbreviation = %@",abbreviation); // abbreviation = GMT+8
        NSInteger seconds = [timeZone secondsFromGMT]; //与零时区 相隔的秒数
        NSLog(@"seconds = %ld",(long)seconds); //seconds = 28800


        // 获取指定时间所在时区与零时区的间隔秒数
        NSInteger seconds2 = [timeZone secondsFromGMTForDate:[NSDate date]];
        NSLog(@"seconds2 = %ld",(long)seconds); //seconds2 = 28800


    }

}
/* 获取国家、货币、语言地区编码
 通常，您使用语言环境来格式化和解释有关用户习惯和偏好的信息，并根据其习惯和偏好进行设置。
 您可以使用initWithLocaleIdentifier初始化任意数量的语言环境实例：使用availableLocaleIdentifiers数组中找到的语言环境标识符之一。但是，通常您使用的语言环境配置为与当前用户的首选项匹配。
 使用currentLocale属性获取与当前用户的首选项匹配的语言环境。如果在用户确实更改区域设置时需要提醒您，请注册NSCurrentLocaleDidChangeNotification通知。另外，您可以使用autoupdatingCurrentLocale属性获取一个语言环境，该语言环境将使用用户的配置设置自动更新：
 */
+ (void)NSLocale{
  
    {
        /*获取已知的标识符和代码
         
         */
        NSArray<NSString *> *availableLocaleIdentifiers = [NSLocale availableLocaleIdentifiers]; //系统上可用的语言环境标识符列表。
        NSLog(@"availableLocaleIdentifiers = %@",availableLocaleIdentifiers);

        NSArray<NSString *> *ISOLanguageCodes = [NSLocale ISOLanguageCodes]; //所有ISO定义的语言编码
        NSLog(@"ISOLanguageCodes = %@",ISOLanguageCodes);

        NSArray<NSString *> *ISOCountryCodes = [NSLocale ISOCountryCodes]; //所有的ISO定义的国家地区编码
        NSLog(@"ISOCountryCodes = %@",ISOCountryCodes);

        NSArray<NSString *> *ISOCurrencyCodes = [NSLocale ISOCurrencyCodes]; //所有的ISO定义的货币编码
        NSLog(@"ISOCurrencyCodes = %@",ISOCurrencyCodes);

        NSArray<NSString *> *commonISOCurrencyCodes = [NSLocale commonISOCurrencyCodes]; // 常用货币代码列表
        NSLog(@"commonISOCurrencyCodes = %@",commonISOCurrencyCodes);
        
    }
    NSLocale *locale =  nil;
    {
        
        /* 获取用户的语言环境
         1.获取用户的语言环境
         2.NSCurrentLocaleDidChangeNotification 语言环境切换通知
         */
        locale =  [NSLocale systemLocale]; // 表示通用根值的语言环境，几乎没有本地化。
        NSLog(@"locale = %@",locale);// locale = <__NSCFLocale: 0x100766760>
        
        locale =  [NSLocale currentLocale]; // 表示在读取属性时用户的区域设置的语言环境。
        NSLog(@"locale = %@",locale); // locale = <__NSCFLocale: 0x100462f50>

        
        locale =  [NSLocale autoupdatingCurrentLocale];//跟踪用户当前偏好的语言环境。
        NSLog(@"locale = %@",locale); // locale = Auto-updating Locale <NSAutoLocale: 0x100608b60> [<__NSCFLocale: 0x100462f50>]
        
        /* 语言环境 创建
         
         */
        locale =  [NSLocale new];
        NSLog(@"locale = %@",locale); // locale = (null)
        
        locale = [[NSLocale alloc]initWithLocaleIdentifier:[NSLocale currentLocale].localeIdentifier];
        
        
        // 语言环境 标识符
        NSString *localeIdentifier = locale.localeIdentifier;
        NSLog(@"localeIdentifier = %@",localeIdentifier); // localeIdentifier = zh_CN

        
        // 语言环境 国家地区编码
        NSString *countryCode = locale.countryCode;
        NSLog(@"countryCode = %@",countryCode); // countryCode = CN
        

        // 语言环境 语言编码
        NSString *languageCode = locale.languageCode;
        NSLog(@"languageCode = %@",languageCode); // languageCode = zh
        
        // 语言环境 货币编码
        NSString *currencyCode = locale.currencyCode;
        NSLog(@"currencyCode = %@",currencyCode); // currencyCode = CNY
    }

}
/* 日期组件  Components:组件
 */
+ (void)NSDateComponents{
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

}
/* 日历  Calendar:日历
 1.NSCalendar可以很方便的用来表示日期，获取日期的各种信息，包括年、月、日，时分秒。
 2.可以很方便的计算两个日期之前的关系。也可以很方便的根据一个日期获取另一个日期
 3.NSCalendar中有一个重要的概念NSCalendarUnit，这是一个位枚举，意味着作为参数可以采用位运算的方式传参
 4.大多数语言环境使用最广泛使用的民用日历，称为公历（NSCalendarIdentifierGregorian），但这种趋势仍然存在例外。例如：
 5. NSCalendarUnit 日历单位，例如年，月，日和小时。
  NSCalendarUnitEra                 -- 纪元单位。对于 NSGregorianCalendar (公历)来说，只有公元前(BC)和公元(AD)；
                                       而对于其它历法可能有很多，例如日本和历是以每一代君王统治来做计算。
  NSCalendarUnitYear                -- 年单位。值很大，相当于经历了多少年，未来多少年。
  NSCalendarUnitMonth               -- 月单位。范围为1-12
  NSCalendarUnitDay                 -- 天单位。范围为1-31
  NSCalendarUnitHour                -- 小时单位。范围为0-24
  NSCalendarUnitMinute              -- 分钟单位。范围为0-60
  NSCalendarUnitSecond              -- 秒单位。范围为0-60
  NSCalendarUnitWeekOfMonth / NSCalendarUnitWeekOfYear -- 周单位。范围为1-53
  NSCalendarUnitWeekday             -- 星期单位，每周的7天。范围为1-7
  NSCalendarUnitWeekdayOrdinal      -- 没完全搞清楚
  NSCalendarUnitQuarter             -- 几刻钟，也就是15分钟。范围为1-4
  NSCalendarUnitWeekOfMonth         -- 月包含的周数。最多为6个周
  NSCalendarUnitWeekOfYear          -- 年包含的周数。最多为53个周
  NSCalendarUnitYearForWeekOfYear   -- 没完全搞清楚
  NSCalendarUnitTimeZone            -- 没完全搞清楚
 
6.NSCalendarOptions
 }
 
 */
+ (void)NSCalendar{
    
    
    
    
    NSCalendar *calendar = nil;
    NSDateComponents *comA = [[NSDateComponents alloc]init];;
    NSDateComponents *comB = [[NSDateComponents alloc]init];;
    {
        // 使用用户手机设置的日期信息，有缓存，用户手机日历改变后不会变
        calendar = [NSCalendar currentCalendar];
        NSLog(@"calendar = %@",calendar); // calendar = <_NSCopyOnWriteCalendarWrapper: 0x100508540>

        // 使用用户手机设置的日期信息，并且用户改变之后会跟着改变
        calendar = [NSCalendar autoupdatingCurrentCalendar];
        NSLog(@"calendar = %@",calendar); // calendar = <_NSCopyOnWriteCalendarWrapper: 0x100508540>
    }
 
    
    { // 创建日历
        calendar = [NSCalendar new];
        NSLog(@"calendar = %@",calendar); // calendar = (null)
     
        // 使用指定的标识获取日期，比如农历、佛历，常用的是格里高利历（NSCalendarIdentifierGregorian）公历
        calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
        NSLog(@"calendar = %@",calendar); // calendar = <_NSCopyOnWriteCalendarWrapper: 0x1007060a0>
    }

    {
        // 设置/获取日历信息

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



            
        // 获取标示符 readonly
        NSCalendarIdentifier calendarIdentifier = calendar.calendarIdentifier;
        NSLog(@"calendarIdentifier = %@",calendarIdentifier);
        
        // 设置/获取地区信息
        NSLocale *locale = calendar.locale;
        
        // 设置/获取每周的第一天从星期几开始
        NSUInteger firstWeekday = calendar.firstWeekday;

        // 设置/获取第一周必须包含的最少天数
        NSUInteger minimumDaysInFirstWeek = calendar.minimumDaysInFirstWeek;
        

        NSInteger eraValuePointer; //时代
        NSInteger year;//年份
        NSInteger month;//月
        NSInteger day;//日

        NSInteger yearValuePointer; //
        NSInteger weekValuePointer; //
        NSInteger weekdayValuePointer; //星期
        
        NSInteger hourValuePointer;//小时
        NSInteger minuteValuePointer;//分钟
        NSInteger secondValuePointer;//秒
        NSInteger nanosecondValuePointer;//纳秒

        [calendar getEra:&eraValuePointer year:&year month:&month day:&day fromDate:[NSDate date]];
        
        [calendar getEra:&eraValuePointer yearForWeekOfYear:&yearValuePointer weekOfYear:&weekValuePointer weekday:&weekdayValuePointer fromDate:[NSDate date]];
        
        [calendar getHour:&hourValuePointer minute:&minuteValuePointer second:&secondValuePointer nanosecond:&nanosecondValuePointer fromDate:[NSDate date]];
        
        
  
        
        
    
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
        

        NSDate *data11 = [calendar dateFromComponents:comA];
        NSDate *data41 = [calendar dateByAddingComponents:comA toDate:[NSDate date] options:NSCalendarWrapComponents];
        NSDate *data22 = [calendar nextDateAfterDate:[NSDate date] matchingComponents:comA options:NSCalendarWrapComponents];
        [calendar enumerateDatesStartingAfterDate:[NSDate date] matchingComponents:comA options:NSCalendarWrapComponents usingBlock:^(NSDate * _Nullable date, BOOL exactMatch, BOOL * _Nonnull stop) {
                    
        }];
        

    }

    {

        NSDateComponents *com1 = [calendar components:NSCalendarUnitDay fromDate:[NSDate date]];
        NSDateComponents *com2 = [calendar componentsInTimeZone:[NSTimeZone localTimeZone] fromDate:[NSDate date]];
        NSDateComponents *com3 = [calendar components:NSCalendarUnitDay fromDate:[NSDate date] toDate:[NSDate date] options:NSCalendarWrapComponents];
        
        
        NSDateComponents *com4 = [calendar components:NSCalendarUnitDay fromDateComponents:comA toDateComponents:comB options:NSCalendarWrapComponents];
 
     
    }


}


+ (void)NSDateFormatter{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    NSLog(@"formatter = %@",formatter); // formatter = <NSDateFormatter: 0x100662d70>
}
@end
