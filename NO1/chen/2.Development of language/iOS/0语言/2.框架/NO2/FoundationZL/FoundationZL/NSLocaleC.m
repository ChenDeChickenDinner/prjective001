//
//  NSLocaleC.m
//  FoundationZL
//
//  Created by xs on 2017/6/5.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NSLocaleC.h"

@implementation NSLocaleC

@end
/*
 
 NSLocaleLanguageDirection:
 *kCFLocaleLanguageDirectionLeftToRight
 *kCFLocaleLanguageDirectionRightToLeft
 *kCFLocaleLanguageDirectionTopToBottom
 *kCFLocaleLanguageDirectionBottomToTop

 NSNotificationName const NSCurrentLocaleDidChangeNotification // 语言环境发生变化的通知

 typedef NSString * NSLocaleKey:语言相关的key
 NSLocaleKey const NSLocaleIdentifier; 标识
 NSLocaleKey const NSLocaleLanguageCode; 语言码
 NSLocaleKey const NSLocaleCountryCode; 区域码
 NSLocaleKey const NSLocaleScriptCode;
 NSLocaleKey const NSLocaleVariantCode;


 【语言环境对象的创建】
 *根据表示创建语言环境对象
 - (instancetype)initWithLocaleIdentifier:(NSString *)string

 *根据 NSLocaleKey 获取信息
 - (nullable id)objectForKey:(NSLocaleKey)key;

 *根据 NSLocaleKey + value 获取信息
 - (nullable NSString *)displayNameForKey:(NSLocaleKey)key value:(id)value;




 【语言环境对象的属性】
 @property (readonly, copy) NSString *localeIdentifier; 语言的标识符
 @property (readonly, copy) NSString *languageCode 语言码
 @property (nullable, readonly, copy) NSString *countryCode 区域码



 【系统提供的信息】
 @property (class, readonly, copy) NSLocale *systemLocale; 操作系统的,最初始的区域?
 @property (class, readonly, copy) NSLocale *currentLocale; 当前用户设定区域，肯能是缓存的
 @property (class, readonly, strong) NSLocale *autoupdatingCurrentLocale 当前用户的系统区域设置，实时更新的


 @property (class, readonly, copy) NSArray<NSString *> *availableLocaleIdentifiers;设备支持的区域
 @property (class, readonly, copy) NSArray<NSString *> *ISOLanguageCodes;所有ISO定义的语言编码
 @property (class, readonly, copy) NSArray<NSString *> *ISOCountryCodes; 所有的ISO定义的国家地区编码
 @property (class, readonly, copy) NSArray<NSString *> *ISOCurrencyCodes;所有的ISO定义的货币编码
 @property (class, readonly, copy) NSArray<NSString *> *commonISOCurrencyCodes; 通用的货币编码
 @property (class, readonly, copy) NSArray<NSString *> *preferredLanguages;用户可选的语言集

 
 */
