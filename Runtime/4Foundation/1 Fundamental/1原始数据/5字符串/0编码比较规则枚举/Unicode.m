//
//  Unicode.m
//  Runtime
//
//  Created by xs on 2020/11/26.
//  Copyright © 2020 xax. All rights reserved.
//

#import "Unicode.h"
/*
 Unicode（ 统一码、万国码、单一码）是计算机科学领域里的一项业界标准,包括字符集、编码方案等。Unicode 是为了解决传统的字符编码方案的局限而产生的，它为每种语言中的每个字符设定了统一并且唯一的 二进制编码，以满足跨语言、跨平台进行文本转换、处理的要求
 */

/*
 1.创建和处理Unicode字符的字符串，
 2.使用正则表达式查找模式，
 3.并对文本进行自然语言分析。
 
 NSString:一个静态的纯文本Unicode字符串对象。
 NSMutableString:一个动态的纯文本Unicode字符串对象。
 String Encodings:字符编码
 */

/*
 typedef NS_OPTIONS(NSUInteger, NSStringCompareOptions) {
     NSCaseInsensitiveSearch = 1,//不区分大小写比较
     NSLiteralSearch = 2,//区分大小写比较
     NSBackwardsSearch = 4,//从字符串末尾开始搜索
     NSAnchoredSearch = 8,//搜索限制范围的字符串
     NSNumbericSearch = 64//按照字符串里的数字为依据，算出顺序。例如 Foo2.txt < Foo7.txt < Foo25.txt
 //以下定义高于 mac os 10.5 或者高于 iphone 2.0 可用
     ,
     NSDiacriticInsensitiveSearch = 128,//忽略 "-" 符号的比较
     NSWidthInsensitiveSearch = 256,//忽略字符串的长度，比较出结果
     NSForcedOrderingSearch = 512//忽略不区分大小写比较的选项，并强制返回 NSOrderedAscending 或者 NSOrderedDescending
 //以下定义高于 iphone 3.2 可用
     ,
     NSRegularExpressionSearch = 1024//只能应用于 rangeOfString:..., stringByReplacingOccurrencesOfString:...和 replaceOccurrencesOfString:... 方法。使用通用兼容的比较方法，如果设置此项，可以去掉 NSCaseInsensitiveSearch 和 NSAnchoredSearch
 };
 
 typedef NS_OPTIONS(NSUInteger, NSStringEnumerationOptions) {
     // Pass in one of the "By" options:
     NSStringEnumerationByLines = 0,                       // 按行
     NSStringEnumerationByParagraphs = 1,                  // Equivalent to paragraphRangeForRange:
     NSStringEnumerationByComposedCharacterSequences = 2,  // Equivalent to rangeOfComposedCharacterSequencesForRange:
     NSStringEnumerationByWords = 3,
     NSStringEnumerationBySentences = 4,
     // ...and combine any of the desired additional options:
     NSStringEnumerationReverse = 1UL << 8,
     NSStringEnumerationSubstringNotRequired = 1UL << 9,
     NSStringEnumerationLocalized = 1UL << 10              // User's default locale
 };
 */
@implementation Unicode
+ (void)load{
    NSString *str = nil;

}
@end
