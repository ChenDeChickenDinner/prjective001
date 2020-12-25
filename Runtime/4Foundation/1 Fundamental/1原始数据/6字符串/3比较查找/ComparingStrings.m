//
//  IdentifyingandComparingStrings.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "ComparingStrings.h"

@implementation ComparingStrings
//https://www.jianshu.com/p/64fbd9b62495
+ (void)load{
    

    NSString *str1 = @"";
    NSString *str2 = @"";

    NSStringCompareOptions comPareOptions = NSCaseInsensitiveSearch;

    [str1 compare:str2];
    [str1 compare:str2 options:comPareOptions];
    [str1 compare:str2 options:comPareOptions range:NSMakeRange(0, 1)];
    // locale 使用用户的语言环境
    [str1 compare:str2 options:comPareOptions range:NSMakeRange(0, 1) locale:nil];
    
    // 以NSCaseInsensitiveSearch 为参数调用 compare: options:
    [str1 caseInsensitiveCompare:str2];
    
    //根据目前系统语言决定的排序方法，在中文简体时可以进行多音字的排序
    [str1 localizedCompare:str2];

    [str1 localizedStandardCompare:str2];

    [str1 localizedCaseInsensitiveCompare:str2];
    
    //字符串内容是否以某个字符开头
    [str1 hasPrefix:str2];
    //字符串内容是否以某个字符结尾
    [str1 hasSuffix:str2];

    [str1 isEqualToString:str2];
    
}
@end
