//
//  CreatingStrings.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "CreatingStrings.h"

@implementation CreatingStrings
+ (void)load{
    [self load1];
    [self load2];
    [self load3];

}
#pragma warning -Creating and Initializing Strings
+ (void)load1{
    NSString *str = nil;
    {
        const void *bytes = "123456";
        str = [[NSString alloc]initWithBytes:bytes length:6 encoding:NSUTF8StringEncoding];
        [self logStr:str];
    }
    {
        const char *bytes = "123456";
        str = [[NSString alloc]initWithCString:bytes encoding:NSUTF8StringEncoding];
        [self logStr:str];
    }
    {
        const char *cStr = "aabbcc";
        str = [[NSString alloc]initWithUTF8String:cStr];
    }
    {
        const void *bytes = "123456";
        NSData *data = [NSData dataWithBytes:bytes length:6];
        str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        [self logStr:str];
    }
    {
        str = [[NSString alloc]initWithFormat:@"%d",1];
        str = [[NSString alloc]initWithFormat:@"%d" locale:nil,1];
    }
 
   
}
#pragma warning -Creating and Initializing a String from a File
+ (void)load2{
    NSString *str = nil;
    NSError *error;
    NSStringEncoding encoding;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test.txt" ofType:nil];
    str = [[NSString alloc]initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    //自动判断encode，如果打开成功，就把encode放在enc里面，返回给调用者
    str = [[NSString alloc]initWithContentsOfFile:path usedEncoding:&encoding error:&error];
    [self logStr:str];

    NSError *error2;
    [str writeToFile:path atomically:YES encoding:NSUTF8StringEncoding error:&error2];
}
#pragma warning -Creating and Initializing a String from an URL
+ (void)load3{
    NSString *str = nil;
    NSError *error;
    NSStringEncoding encoding;
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
    str = [[NSString alloc]initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    str = [[NSString alloc]initWithContentsOfURL:url usedEncoding:&encoding error:&error];
    [self logStr:str];

    NSError *error2;
    NSURL *url2 = nil;
    [str writeToURL:url2 atomically:YES encoding:NSUTF8StringEncoding error:&error2];
}
+ (void)logStr:(NSString *)str{
    NSLog(@"str=%@",str);
}
@end
