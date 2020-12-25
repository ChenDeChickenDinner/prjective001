//
//  Translater.m
//  Runtime
//
//  Created by xs on 2020/12/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "Translater.h"

@implementation Translater
+ (void)load{
    
    /*typeof
     1.是一个一元运算，放在一个运算数之前，运算数可以是任意类型
     2.它返回值是一个字符串，该字符串说明运算数的类型
     3.个人理解为：可以根据typeof（）括号里面的变量，自动识别变量类型并返回该类型
     */
    
    /* sizeof
     
     */
    unsigned long size = sizeof(void*);
    
    /*
     @encode
     
     */
    NSLog(@"%s",@encode(char));// c
    NSLog(@"%s",@encode(short));// s
    NSLog(@"%s",@encode(int));// i
    NSLog(@"%s",@encode(long));// q
    NSLog(@"%s",@encode(long long));// q
    
    NSLog(@"%s",@encode(unsigned char));// C
    NSLog(@"%s",@encode(unsigned short));// S
    NSLog(@"%s",@encode(unsigned int));// I
    NSLog(@"%s",@encode(unsigned long));// Q
    NSLog(@"%s",@encode(unsigned long long));// Q
    
    NSLog(@"%s",@encode(float));// f
    NSLog(@"%s",@encode(double));// d
    
    NSLog(@"%s",@encode(BOOL));// c
    NSLog(@"%s",@encode(void));// v
    NSLog(@"%s",@encode(char *));// *

    NSLog(@"%s",@encode(id));// @
    NSLog(@"%s",@encode(SEL));// :
    NSLog(@"%s",@encode(IMP));// ^?

    NSLog(@"%s",@encode(Class));// #
    NSLog(@"%s",@encode(CGPoint));// {CGPoint=dd}
    NSLog(@"%s",@encode(CGSize));// {CGSize=dd}
    NSLog(@"%s",@encode(CGRect));// {CGRect={CGPoint=dd}{CGSize=dd}}

    const char *encode = "i";
    if (strcmp(encode, @encode(int)) == 0) {
        NSLog(@"判断2个字符是否相同");
    }

    @selector(init);
    
    @protocol(NSObject);
    

}
@end
