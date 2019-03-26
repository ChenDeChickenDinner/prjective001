//
//  NSStringC.m
//  FoundationZL
//
//  Created by xs on 2017/6/5.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NSStringC.h"

@implementation NSStringC

@end
//NSCharacterSet:字符集合
//*创建字符集合方法根基字符串，范围，data,文件名
//+ (NSCharacterSet *)characterSetWithCharactersInString:(NSString *)aString;
//+ (NSCharacterSet *)characterSetWithRange:(NSRange)aRange;
//+ (NSCharacterSet *)characterSetWithBitmapRepresentation:(NSData *)data;
//+ (nullable NSCharacterSet *)characterSetWithContentsOfFile:(NSString *)fName;
//
//*获取此字符集的相反集
//@property (readonly, copy) NSCharacterSet *invertedSet;//相反集
//
//*系统自带的字符集
//NSCharacterSet *set = NSCharacterSet.controlCharacterSet;
//
//
//
//
//
////NSStringEncoding:编码方式
//*NSASCIIStringEncoding
//*NSNEXTSTEPStringEncoding
//*NSJapaneseEUCStringEncoding
//*NSUTF8StringEncoding
//*CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);不在上面编码列表中的编码规范用CFString中的
//
////typedef NSString *NSStringTransform: 字符串对象新别名
//*:字符转换方式
//
////typedef NSString * NSStringEncodingDetectionOptionsKey
//
//
////NSStringEncodingConversionOptions:字符号编码转换选项
//*NSStringEncodingConversionAllowLossy //允许文件丢失
//*NSStringEncodingConversionExternalRepresentation //不允许文件丢失
//
////NSStringCompareOptions:用于字符串的对比搜索查找的方式枚举
//*NSCaseInsensch //itiveSearch  //不区分大小写比较
//*NSLiteralSearch  //逐字节比较 区分大小写
//*NSBackwardsSearch  //从字符串末尾开始搜索
//*NSAnchoredSearch    //搜索限制范围的字符串
//*NSNumericSearch   //按照字符串里的数字为依据，算出顺序。例如 Foo2.txt < Foo7.txt < Foo25.txt
//*NSDiacriticInsensitiveSearch//忽略 "-" 符号的比较
//*NSWidthInsensitiveSearch //忽略字符串的长度，比较出结果
//*NSForcedOrderingSearch   //忽略不区分大小写比较的选项，并强制返回 NSOrderedAscending 或者 NSOrderedDescending
//*NSRegularExpressionSear
//
//
////NSStringEnumerationOptions:遍历字符串的规则枚举
//*NSStringEnumerationByLines //按行
//*NSStringEnumerationByParagraphs //按段落
//*NSStringEnumerationByComposedCharacterSequences //按字符顺序
//*NSStringEnumerationByWords //按单词字
//*NSStringEnumerationBySentences //按句子
//*NSStringEnumerationReverse //反向遍历
//*NSStringEnumerationSubstringNotRequired //不需要子字符串
//*NSStringEnumerationLocalized //本地化
//
//
//
//
//
//【字符串创建】
//指定编码和字节数初始化NSString对象
//- (instancetype)initWithBytes:(const void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding;
//
//指定unichar字符，字节长度初始化NSSting 对象
//- (instancetype)initWithCharacters:(const unichar *)characters length:(NSUInteger)length;
//
//指定编码初始化C字符串
//- (instancetype)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding;
//
//char 转化为NSString对象
//- (instancetype)initWithUTF8String:(const char *)nullTerminatedCString;
//
//
//- (instancetype)initWithString:(NSString *)aString;
//- (instancetype)initWithFormat:(NSString *)format, ...
//
//- (nullable instancetype)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding;
//
//- (nullable instancetype)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError **)error;
//- (nullable instancetype)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError **)error;
//
//
//- (nullable instancetype)initWithContentsOfURL:(NSURL *)url usedEncoding:(nullable NSStringEncoding *)enc error:(NSError **)error;
//- (nullable instancetype)initWithContentsOfFile:(NSString *)path usedEncoding:(nullable NSStringEncoding *)enc error:(NSError **)error;
//
//
//
//
//【字符串属性】
////@property (readonly) NSUInteger length;
//
//
//
//【提取字符串的numeric values】
//@property (readonly) double doubleValue;
//@property (readonly) float floatValue;
//@property (readonly) int intValue;
//@property (readonly) NSInteger integerValue NS_AVAILABLE(10_5, 2_0);
//@property (readonly) long long longLongValue NS_AVAILABLE(10_5, 2_0);
//@property (readonly) BOOL boolValue
//
//【获取子字符串】
//- (unichar)characterAtIndex:(NSUInteger)index;获取某个位置的字符，并返回其 shot 类型的值
//- (NSString *)substringFromIndex:(NSUInteger)from;从某个位置开始到结尾
//- (NSString *)substringToIndex:(NSUInteger)to;从第0个到某个位置
//- (NSString *)substringWithRange:(NSRange)range;获取某个范围内的
//
//
//【字符串大小转换】
//@property (readonly, copy) NSString *uppercaseString;
//@property (readonly, copy) NSString *lowercaseString;
//@property (readonly, copy) NSString *capitalizedString; 所有单词的首字母转化成大写
//@property (readonly, copy) NSString *localizedUppercaseString NS_AVAILABLE(10_11, 9_0);
//@property (readonly, copy) NSString *localizedLowercaseString NS_AVAILABLE(10_11, 9_0);
//@property (readonly, copy) NSString *localizedCapitalizedString NS_AVAILABLE(10_11, 9_0);
//- (NSString *)uppercaseStringWithLocale:(nullable NSLocale *)locale NS_AVAILABLE(10_8, 6_0);
//- (NSString *)lowercaseStringWithLocale:(nullable NSLocale *)locale NS_AVAILABLE(10_8, 6_0);
//- (NSString *)capitalizedStringWithLocale:(nullable NSLocale *)locale
//
//
//
//【添加字符串】
//将一个或者多个字符加到字符串后面
//- (NSString *)stringByAppendingString:(NSString *)aString;
//- (NSString *)stringByAppendingFormat:(NSString *)format,
//
//【修剪字符串】
//- (NSString *)stringByTrimmingCharactersInSet:(NSCharacterSet *)set;
//
//
//【字符串替换】
//将字符串的指定区域段字符串被替换掉
//- (NSString *)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement;
//
//将字符串的特定字符串被替换掉
//- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;
//
//将字符串的指定区域段被有条件的替换掉
//- (NSString *)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
//
//
//【分割字符串为数组】
//将字符串根据传进来的字符串参数separator进行分割，并转化成数组
//- (NSArray<NSString *> *)componentsSeparatedByString:(NSString *)separator;
//
//.将字符串根据传进来的字符编码separator进行分割，并拆分成数组返回
//- (NSArray<NSString *> *)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separator
//
//
//
//
//
//
//本地化字符串折叠
//- (NSString *)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(nullable NSLocale *)locale
//
//
//
//
//
//
//【字符串转换】
//把其中一种语言的字符变换成另一种语言的字符
//- (nullable NSString *)stringByApplyingTransform:(NSStringTransform)transform reverse:(BOOL)reverse NS_AVAILABLE(10_11, 9_0);
//
//
//对一份data数据进行转换为字符串，有可选option字典，另外还有是否允许有损失，最终转换之后返回一个编码种类
//+ (NSStringEncoding)stringEncodingForData:(NSData *)data
//encodingOptions:(nullable NSDictionary<NSStringEncodingDetectionOptionsKey, id> *)opts
//convertedString:(NSString * _Nullable * _Nullable)string
//usedLossyConversion:(nullable BOOL *)usedLossyConversion NS_AVAILABLE(10_10, 8_0);
//
//
//【写入URL 或者文件】
//
////    将数据写入URL并且指定编码
//- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;
//
////    将数据写入文件并且指定编码
//- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError **)error;
//
//
//
//【字符串排序比较】
//比较二个字符串（升序降序相等） 还可以加上 条件 范围 语言环境
//- (NSComparisonResult)compare:(NSString *)string;
//- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask;
//- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare;
//- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare locale:(nullable id)locale;
//
//特殊化比较（升序降序相等）
//- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string;不区分大小写比较字符串
//- (NSComparisonResult)localizedCompare:(NSString *)string; 本地化比较字符串
//- (NSComparisonResult)localizedCaseInsensitiveCompare:(NSString *)string;不区分大小写以及本地化比较字符串
//- (NSComparisonResult)localizedStandardCompare:(NSString *)string ;本地化标准字符串比较
//
//比较两个字符串是否相等
//- (BOOL)isEqualToString:(NSString *)aString;
//
//
//
//
//【搜索字符串，判断，查找范围】
//测试字符串是否以aString开头
//- (BOOL)hasPrefix:(NSString *)str;
//
//测试字符串是否以aString结尾
//- (BOOL)hasSuffix:(NSString *)str;
//
//判断字符串A是否包含aString字符串B
//- (BOOL)containsString:(NSString *)str
//
//这是iOS8的新特性API 判断字符串A是否包含字符串B，不区分大小写
//- (BOOL)localizedCaseInsensitiveContainsString:(NSString *)str
//
//搜索是否包含某个字符串并返回其范围，还可以加上条件
//- (NSRange)rangeOfString:(NSString *)searchString;
//- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask;
//- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch;
//- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(nullable NSLocale *)locale
//
//搜索是否包含某个字符集并返回其范围，还可以加上条件
//- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet;
//- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask;
//- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch;
//
//检查是否在指定范围内是否有匹配的字符串
//- (void)enumerateSubstringsInRange:(NSRange)range options:(NSStringEnumerationOptions)opts usingBlock:(void (^)(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop))block
//- (void)enumerateLinesUsingBlock:(void (^)(NSString *line, BOOL *stop))block
//
//
//字符串编码 转换 成 C字符
//@property (class, readonly) NSStringEncoding defaultCStringEncoding // 默认C字符串编码
//@property (class, readonly) const NSStringEncoding *availableStringEncodings; // 可用的字符串编码
//@property (nullable, readonly) const char *UTF8String //将字符串转化为char类型
//@property (readonly) NSStringEncoding fastestEncoding;//字符串最快编码值
//@property (readonly) NSStringEncoding smallestEncoding;//字符串最小编码值
//
//判断是否可以无损化转码
//- (BOOL)canBeConvertedToEncoding:(NSStringEncoding)encoding;
//
//
//返回指定编码的NSData对象
//- (nullable NSData *)dataUsingEncoding:(NSStringEncoding)encoding;
//
//
//返回指定编码的char
//- (nullable const char *)cStringUsingEncoding:(NSStringEncoding)encoding
//
//
//字符串编码时需要用的字节长度
//- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc;
//
//字符串编码时需要用到最大字节长度
//- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc;
//
//+ (NSString *)localizedNameOfStringEncoding:(NSStringEncoding)encoding;


