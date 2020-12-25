//
//  ChangingCase.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "ChangingCase.h"

@implementation ChangingCase
+ (void)load{
    NSString *str = @"asdfc";
/*
 1.这个属性直接可以将大写字母变换为小写字母
 2.该属性进行的是非区域性的映射，它适用于需要稳定结果，且不依赖于当前地区和环境的情况。
 3.大小写的转换不能保证是对称的，也不能保证产生的字符串和原字符串具有相同的长度，比如
 */
    str = str.lowercaseString; // 小写  [[str uppercaseString] lowercaseString]; 二者可能不一样
   
    //这个方法同样是返回小写字母，与方法一中不同的是这里考虑了地域的影响。当需要呈现给用户时需要使用这个方法
    str = str.localizedLowercaseString;
    
    //这个是地区参数，当需要呈现给用户的时候，需要传[NSLocale currentLocale]，如果需要使用系统地域的，就传入nil
    str = [str lowercaseStringWithLocale:nil];
    
    str = str.uppercaseString; // 大写
    str = str.localizedUppercaseString;
    str = [str uppercaseStringWithLocale:nil];

    str = str.capitalizedString; // 首字母大写
    str = str.localizedCapitalizedString;
    str = [str capitalizedStringWithLocale:nil];
}
@end
