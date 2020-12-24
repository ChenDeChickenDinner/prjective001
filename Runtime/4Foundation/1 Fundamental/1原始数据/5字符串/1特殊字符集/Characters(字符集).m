//
//  Characters(字符集).m
//  Runtime
//
//  Created by xs on 2020/11/30.
//  Copyright © 2020 xax. All rights reserved.
//

#import "Characters(字符集).h"

@implementation Characters_____
/*
 
 */
+ (void)load{
    [NSCharacterSet controlCharacterSet]; //控制符的字符集
    [NSCharacterSet whitespaceCharacterSet]; //空格的字符集
    [NSCharacterSet whitespaceAndNewlineCharacterSet]; //空格和换行符的字符集
    [NSCharacterSet decimalDigitCharacterSet]; //十进制数字的字符集
    [NSCharacterSet letterCharacterSet]; //字母的字符集
    [NSCharacterSet lowercaseLetterCharacterSet]; //小写字母的字符集
    [NSCharacterSet uppercaseLetterCharacterSet]; //大写字母的字符集
    [NSCharacterSet nonBaseCharacterSet]; //非基础的字符集
    [NSCharacterSet alphanumericCharacterSet]; //字母和数字的字符集
    [NSCharacterSet decomposableCharacterSet]; //可分解
    [NSCharacterSet illegalCharacterSet]; //非法的字符集
    [NSCharacterSet punctuationCharacterSet]; //标点的字符集
    [NSCharacterSet capitalizedLetterCharacterSet]; //首字母大写的字符集
    [NSCharacterSet symbolCharacterSet]; //符号的字符集
    [NSCharacterSet newlineCharacterSet]; //换行符的字符集
    
    
        NSString *str = @"一个 (ABC) #@!#^#G@#Dd21e12d!E@!212s012yhsn 汉0932字#@!中..文//>?输~~~@#$#@%#^#^%&^*&(*)入";
        NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
        [set formUnionWithCharacterSet:[NSCharacterSet lowercaseLetterCharacterSet]];//小写字母
        NSLog(@"1 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet uppercaseLetterCharacterSet]];//大写字母
        NSLog(@"2 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet symbolCharacterSet]];//符号
        NSLog(@"3 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet punctuationCharacterSet]];//标点
        NSLog(@"4 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet controlCharacterSet]];//控制符
        NSLog(@"5 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet decimalDigitCharacterSet]];//小数
        NSLog(@"6 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet letterCharacterSet]];//文字
        NSLog(@"7 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet nonBaseCharacterSet]];//非基础
        NSLog(@"8 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet alphanumericCharacterSet]];//字母数字
        NSLog(@"9 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet decomposableCharacterSet]];//可分解
        NSLog(@"10 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet illegalCharacterSet]];//非法
        NSLog(@"11 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet capitalizedLetterCharacterSet]];//大写
        NSLog(@"12 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet newlineCharacterSet]];//换行符
        NSLog(@"13 %@",[str stringByTrimmingCharactersInSet:set]);
        [set formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//空格换行
        NSLog(@"14 %@",[str stringByTrimmingCharactersInSet:set]);
}
@end
