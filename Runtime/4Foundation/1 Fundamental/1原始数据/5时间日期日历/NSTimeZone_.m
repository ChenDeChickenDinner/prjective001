//
//  NSTimeZone_.m
//  Runtime
//
//  Created by xs on 2020/12/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSTimeZone_.h"

@implementation NSTimeZone_


+ (void)load{
    //获取所有已知的时区名称 @"Asia/Shanghai"
    NSArray *timeZoneArray = [NSTimeZone knownTimeZoneNames];
    NSLog(@"timeZoneArray = %@",timeZoneArray);
    
    // 获取所有已知的时区缩写
    NSDictionary *dict = [NSTimeZone abbreviationDictionary];
    NSLog(@"dict = %@",dict);
}
+ (void)load2{
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
    NSTimeZone *timeZone1 = [NSTimeZone systemTimeZone];
    NSLog(@"timeZone = %@",timeZone1); //  timeZone = Asia/Shanghai (GMT+8) offset 28800 {offset:偏移的秒数}

    NSTimeZone *timeZone2 = [NSTimeZone localTimeZone];
    NSLog(@"timeZone = %@",timeZone2); //  timeZone = Local Time Zone (Asia/Shanghai (GMT+8) offset 28800)


    NSTimeZone *timeZone3 = [NSTimeZone defaultTimeZone];
    NSLog(@"timeZone = %@",timeZone3); //  sia/Shanghai (GMT+8) offset 28800
}

+ (void)load3{
    NSTimeZone *timeZone = nil;
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
@end
