//
//  OCDataType.m
//  OCGrammar
//
//  Created by xs on 2019/4/22.
//  Copyright © 2019 xs. All rights reserved.
//

#import "OCDataType.h"

@implementation OCDataType
+(void)load{
  
}

+ (void)BaseDataType{
    
    {  // 整形的别名
        /* NSObjeCRuntime.h
         #if __LP64__ || 0 || NS_BUILD_32_LIKE_64
         typedef long NSInteger;
         typedef unsigned long NSUInteger;
         #else
         typedef int NSInteger;
         typedef unsigned int NSUInteger;
         #endif
         */
        NSInteger value1 = 10; // 有符号位
        NSUInteger value2 = 10;// 无符号位
        
        NSInteger minValue = NSIntegerMin;
        NSInteger maxValue = NSIntegerMax;
        
        NSUInteger maxUValue = NSUIntegerMax;

    }
    
    { //C++bool的别名
        
        /* BOOL
         typedef bool BOOL; // 处于64位iPhone 或者 iWatch
         typedef signed char BOOL; // 其它平台
         
         #define YES ((BOOL)1)
         #define NO  ((BOOL)0)
         */

    }
}
+ (void)NS_ENUMDataType{
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
@end
