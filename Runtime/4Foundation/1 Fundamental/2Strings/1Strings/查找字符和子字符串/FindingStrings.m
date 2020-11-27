//
//  FindingStrings.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "FindingStrings.h"

@implementation FindingStrings
+ (void)load{
    NSString *str = @"abcdefg12345";
    BOOL contain = NO;
    NSRange range = NSMakeRange(0, 0);
    {
     /*
      区分大小写，
      不区分语言环境的搜索来指示字符串是否包含给定的字符串。
     */
        contain = [str containsString:@"a"];
        contain = [str containsString:@"A"];

     /*
      不区分大小写，
      可识别区域设置的搜索来指示字符串是否包含给定的字符串。
     */
        contain = [str localizedCaseInsensitiveContainsString:@"A"];

     /*
      区分大小写和变音符号
      不区分语言环境的搜索来指示字符串是否包含给定的字符串。
     */
        contain = [str localizedStandardContainsString:@"a"];
        contain = [str localizedStandardContainsString:@"A"];

    }
    
    {
        /*
         查找并返回给定字符串在字符串中首次出现的范围。
         */
        NSString *testStr = @"2AasdWAI3U";
        NSRange range = [testStr rangeOfString:@"as"];
        
        NSRange range2 = [testStr rangeOfString:@"2" options:NSNumericSearch];

        NSRange range3 = [testStr rangeOfString:@"3" options:NSNumericSearch range:NSMakeRange(0, 4)];

        // 不区分大小写字母的比较
        NSString *testStr2 = @"2AasdWAI3U";

        NSRange range4 = [testStr2 localizedStandardRangeOfString:@"aa"];//{1,2}
        
    }
    {
        /*
         查找并返回给定字符集中第一个字符的字符串范围。
         */
           NSString *testStr = @"AAAasdWIU";
           NSCharacterSet *characterSet = [NSCharacterSet lowercaseLetterCharacterSet]; //小写字母
           NSCharacterSet *characterSet1 = [NSCharacterSet uppercaseLetterCharacterSet];//大写字母

        {
            NSRange range = [testStr rangeOfCharacterFromSet:characterSet];
            NSRange range1 = [testStr rangeOfCharacterFromSet:characterSet1];
        }
        {
            NSRange range = [testStr rangeOfCharacterFromSet:characterSet options:NSBackwardsSearch];
            NSRange range1 = [testStr rangeOfCharacterFromSet:characterSet1 options:NSLiteralSearch];
        }
  
        {
            NSRange range = [testStr rangeOfCharacterFromSet:characterSet options:NSBackwardsSearch range:NSMakeRange(0, 4)];
        }
        
    }
    {
        /*
         1,读取字符串，一般用来读取来自文件的字符串
         */
        NSString *testStr = @"AAAasdWIU";
        //一行一行的读取
        [testStr enumerateLinesUsingBlock:^(NSString * _Nonnull line, BOOL * _Nonnull stop) {
                    
        }];
        //提取单词
        NSString *popo = @"Lorem __ ! @ () "" ipsum "" dolar ?~  * # $  % ^ & < >{}\\ |;:sit  amet.";
        [popo enumerateSubstringsInRange:NSMakeRange(0, popo.length) options:NSStringEnumerationByWords usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
                    
        }];

    }
}
@end
