//
//  GettingCharactersandBytes.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "GettingCharactersandBytes.h"

@implementation GettingCharactersandBytes
+ (void)load{
    /*
     unichar类型表示NSString中的单个UTF-16代码单元。
     尽管许多人类可读字符可以用单个unichar表示，但是某些字符（例如Emoji）可能跨越多个unichar。见上面的讨论
     */
    NSString *str = @"123456";

    /*
     若字符串是以给定的编码格式(ASCII、UTF8、UTF6等)来编码的，则返回其字节数组的长度
     */
    unichar charC =   [str characterAtIndex:0];
    /*
     1.获取字符串中给定范围内的字符
     2.要在其首个参数中传入数组，而该方法所获取的字符正是要放到这个数组里面
     */
    unichar *buffer = malloc(sizeof(str));;
    [str getCharacters:buffer range:NSMakeRange(0, 2)];
}
@end
