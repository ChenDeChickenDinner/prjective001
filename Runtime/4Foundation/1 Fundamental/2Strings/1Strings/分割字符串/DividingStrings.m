//
//  DividingStrings.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "DividingStrings.h"
//Dividing: 分开；划分
@implementation DividingStrings
+ (void)load{
    NSString *str = nil;
    NSArray *array = nil;

    {
        NSString *str = @"hello 123 world 456 nice 987";
        
        //是根据给定的字符串进行分割
        array = [str componentsSeparatedByString:@"1"];
        
        //根据给定的字符集合分割,每遇到字符集里面的一个字符就进行分割(遇到数字就分割)
        array = [str componentsSeparatedByCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
        NSLog(@"%@",array);
    }


    
    { /*
        1.Trimming:修整
        2.whitespaceAndNewlineCharacterSet:空格和换行符集合
        3.(字符首尾二端)过滤掉字符集内的字符，直接的无法过滤
       */
    NSString *testString = @"      This is the string contains whitespace in beginning and ending     ";
    NSString *whitesspaceStr = [testString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSLog(@"%@",whitesspaceStr);
        
    }

    {
         /*
         1. 返回一个新的字符串，其中包含接收者的字符（从给定索引处的字符到末尾）。
         */
        str  = @"123456";
        str = [str substringWithRange:NSMakeRange(0, 2)]; // @"12"
        
        str  = @"123456"; //前面三个
        str = [str substringToIndex:3]; // 从开头到给定索引处(不包括索引位置的那个) @"123"
        
        str  = @"123456";//前面2个之后的
        str = [str substringFromIndex:2];//从给定索引处的字符到末尾(包括索引位置的那个)@"3456"


    }


}
@end
