//
//  xiao2.m
//  C2019
//
//  Created by xs on 2019/1/16.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "xiao2.h"
static void test2();
@implementation xiao2
+ (void)load{
//test2();
}
@end

/**
 选择结构
 */
static void test1(){
    //if else
    if (1) {
    }

    if (1) {
    } else {
    }

    if (1) {
    }else if (2){
    }else{
    }
    int age = 17;
    if(age)printf("xx");
    else printf("else");

    // switch
    int value = 1;
    switch (value) { // 必须为整形
        case 1: // 必须为整形常量

            break; // break 跳出当前循环，不写会造成穿透问题
        case 2:

            break;
        default:
            break;
    }

}
// 循环结构
static void test2(){

    // 1.先判断表达式真假 再根据结果是否执行 循环体
    int value1 = 1;
    while (value1 <= 10) {
        printf("value1 = %d\n",value1);
        value1 ++;
    }

    // 2.先执行一般 循环体代码，再看判断条件
    int value2 = 1;
    do{
        printf("先来一发\n");
    }while (value2 > 10);

    for (int i = 0; i < 10; i++) {
        if (i == 1) {
            continue; // 退出这次循环 开始下一次循环
        }
        if (i == 9) {
            break; // 直接退出循环体
        }
        printf("a  = %d\n",i);
    }
}
