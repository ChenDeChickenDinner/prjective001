//
//  BasicType.m
//  2019OC
//
//  Created by xs on 2019/2/21.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "BasicType.h"
#import <UIKit/UIKit.h>
/**
 基本数据类型
 */
static void test1(){

    /* OC中的基本数据类型  NSInteger NSUInteger  CGFloat
     1. NSInteger = int/long
     2. NSUInteger = unsigned int/ unsigned long
     3. CGFloat = float/double;也就是说在64位系统下,CGFLOAT是double类型,32位系统下是float类型.
     */
    {
        NSInteger value1 = 10;
        NSUInteger value2 = 10;
        CGFloat value3 = 10.0f;
    }

    /*
     #define NSIntegerMax    LONG_MAX
     #define NSIntegerMin    LONG_MIN
     #define NSUIntegerMax   ULONG_MAX
     static const NSInteger NSNotFound = NSIntegerMax;

     */
    {
        NSInteger value1 = NSIntegerMax;
        NSInteger value2 = NSIntegerMin;
        NSInteger valie3 = NSNotFound;
    }

    /* BOOL
     typedef bool BOOL; // 处于64位iPhone 或者 iWatch
     typedef signed char BOOL; // 其它平台
     */
    {
        BOOL value_mac = -19;
        if (value_mac == YES) {
            NSLog(@"value_mac == YES");
        }else{
            NSLog(@"value_mac != YES");// 输出
        }
        if (value_mac) {
            NSLog(@"value_mac 为真");
        }
        BOOL value_iOS = -19;
        if (value_iOS == YES) {
            NSLog(@"value_iOS == YES");// 输出
        }else{
            NSLog(@"value_iOS != YES");
        }
        if (value_iOS) {
            NSLog(@"value_mac 为真");
        }

    }

    {   // typedef unsigned char                   Boolean;
       //  char能表示-128~127, unsigned char没有符号位，因此能表示0~255
        Boolean value = 255;
        unsigned char value2 = 255;
        NSLog(@"value = %d\n",value);
    }


}
static void test2(){
    //1.显示约定枚举值的类型
    typedef enum PersonType5:NSUInteger{
        haha1  = 0,      // 0000 0
        haha2  = 1 << 0, // 0001 1
        haha3  = 1 << 1, // 0010 2
        haha4  = 1 << 2, // 0100 4
    }myPersonType5;

    //2.位掩码的用处原理
    myPersonType5 value1 = haha2|haha3; // 按位或    有1为1,否则为0 (0001 | 0010) => 0011 => 3
    // 按位与 同1为1,否则为0
    if (value1 & haha2) {  // 0011 & 0001 = 0001 真
        NSLog(@"value1 == haha2");
    }else if (value1 & haha3){ // 0011 & 0010 = 0010 真
        NSLog(@"value1 == haha3");
    }else{
    }

    //3.NS_ENUM 与 NS_OPTIONS 宏都可以定义枚举 (枚举值类型，枚举类型)
    /*
     1.NS_ENUM  一般用来声明基于整形的枚举
     2.NS_OPTIONS  一般用来声明基于位掩码的声明
     */
    typedef NS_ENUM(NSInteger,PersonType6) {
        man6 ,
        woman6
    };
    typedef NS_OPTIONS(NSUInteger, PersonType7) {
        man7  = 1 << 0,
        woman7= 1 << 1
    };

}
@implementation BasicType
+ (void)load{
    test1();
}
@end
