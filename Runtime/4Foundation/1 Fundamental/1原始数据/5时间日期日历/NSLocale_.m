//
//  NSLocale_.m
//  Runtime
//
//  Created by xs on 2020/12/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSLocale_.h"

@implementation NSLocale_
/* 获取国家、货币、语言地区编码
 通常，您使用语言环境来格式化和解释有关用户习惯和偏好的信息，并根据其习惯和偏好进行设置。
 您可以使用initWithLocaleIdentifier初始化任意数量的语言环境实例：使用availableLocaleIdentifiers数组中找到的语言环境标识符之一。但是，通常您使用的语言环境配置为与当前用户的首选项匹配。
 使用currentLocale属性获取与当前用户的首选项匹配的语言环境。如果在用户确实更改区域设置时需要提醒您，请注册NSCurrentLocaleDidChangeNotification通知。另外，您可以使用autoupdatingCurrentLocale属性获取一个语言环境，该语言环境将使用用户的配置设置自动更新：
 */
+ (void)load{
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
    
    NSArray<NSString *> *preferredLanguages = [NSLocale preferredLanguages]; //首选
    NSLog(@"commonISOCurrencyCodes = %@",commonISOCurrencyCodes);
}
+ (void)load1{
    /* 获取用户的语言环境
     .NSCurrentLocaleDidChangeNotification 语言环境切换通知
     */
    NSLocale *locale1  =  [NSLocale systemLocale]; // 表示通用根值的语言环境，几乎没有本地化。
    NSLog(@"locale = %@",locale1);// locale = <__NSCFLocale: 0x100766760>
    
    NSLocale *locale2  =  [NSLocale currentLocale]; // 表示在读取属性时用户的区域设置的语言环境。
    NSLog(@"locale = %@",locale2); // locale = <__NSCFLocale: 0x100462f50>

    
    NSLocale *locale3  =  [NSLocale autoupdatingCurrentLocale];//跟踪用户当前偏好的语言环境。
    NSLog(@"locale = %@",locale3); // locale = Auto-updating Locale <NSAutoLocale: 0x100608b60> [<__NSCFLocale: 0x100462f50>]
}
+ (void)load2{
        
    /* 语言环境 创建
     
     */
    NSLocale *locale =  [NSLocale new];
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
+ (void)load3{
    
}
@end
