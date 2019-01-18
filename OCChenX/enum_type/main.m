//
//  main.m
//  enum_type
//
//  Created by xs on 2018/11/27.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>


enum PersonType{
    man,
    woman
};

enum PersonType1{
    man1,
    woman1
}Chen1;

enum {
    man2,
    woman2
}Chen2;

typedef enum PersonType3{
    man3,
    woman3
}myPersonType3;

typedef enum PersonType4{
    man4 ,
    woman4
}myPersonType4;

//显示约定枚举值的类型
typedef enum PersonType5:NSUInteger{
    haha1  = 0,      // 0000 0
    haha2  = 1 << 0, // 0001 1
    haha3  = 1 << 1, // 0010 2
    haha4  = 1 << 2, // 0100 4
}myPersonType5;


void test_enum_type2(){

    myPersonType5 value1 = haha2|haha3; // 按位或    有1为1,否则为0 (0001 | 0010) => 0011 => 3

    // 按位与 同1为1,否则为0
    if (value1 & haha2) {  // 0011 & 0001 = 0001 真

        NSLog(@"value1 == haha2");
    }else if (value1 & haha3){ // 0011 & 0010 = 0010 真

        NSLog(@"value1 == haha3");
    }else{

    }

}
//NS_ENUM 与 NS_OPTIONS 宏都可以定义枚举 (枚举值类型，枚举类型)
//1.NS_ENUM  一般用来声明基于整形的枚举
//2.NS_OPTIONS  一般用来声明基于位掩码的声明

//#define NS_ENUM(...) CF_ENUM(__VA_ARGS__)
//#define NS_OPTIONS(_type, _name) CF_OPTIONS(_type, _name)

typedef NS_ENUM(NSInteger,PersonType6) {
    man6 ,
    woman6
};

typedef NS_OPTIONS(NSUInteger, PersonType7) {
    man7  = 1 << 0,
    woman7= 1 << 1
};


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
