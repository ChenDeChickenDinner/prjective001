//
//  03Control.m
//  2020COC
//
//  Created by xs on 2019/7/9.
//  Copyright © 2019 xax. All rights reserved.
//

#import "03Control.h"

@implementation _3Control
@end
static void test1(){
    //控制语句
    if (2) {
        printf("x");
    }
    if (2) {
        printf("x");
    } else {
        printf("y");
    }
    int  a = 0;
    if (a > 0) {
        printf("x");
    } else if(a <0) {
        printf("y");
    }else{
        printf("z");
    }
    
    // 当if else后面只有一条语句时, if else后面的大括号可以省略，极其不推荐写法
    int age = 17;
    if (age >= 18)printf("开网卡\n");
    else printf("喊家长来开\n");
    
    /*
     1.计算"表达式"的值, 逐个与其后的"常量表达式"值相比较,当"表达式"的值与某个"常量表达式"的值相等时, 即执行其后的语句, 然后跳出switch语句
     2.如果"表达式"的值与所有case后的"常量表达式"均不相同时,则执行default后的语句
     3.表达式的类型必须是整型, 或者可以被提升为整型的值(char、short)
     4.case的值只能是常量, 并且还必须是整型, 或者可以被提升为整型的值(char、short)
     5.switch中只要任意一个case匹配, 其它所有的case和default都会失效. 所以如果case和default后面没有break就会出现穿透问题
     6.switch中default可以省略
     */
    int valueX = 9;
    switch (valueX) { // 必须为整形
        case 0: // 必须为整形常量
        {
            int value = 0;// case后面要想定义变量,必须给case加上大括号
        }
            break;
        case 1:
            break;
        default:
            break;
    }
}
static void test2(){
    /*
     1.首先会判定"循环控制条件"是否为真, 如果为假直接跳到循环语句后面
     2.如果"循环控制条件"为真, 执行一次循环体, 然后再次判断"循环控制条件"是否为真, 为真继续执行循环体,为假跳出循环
     3.重复以上操作, 直到"循环控制条件"为假为止
     */
    int count = 0;
    while (count < 3) { // 循环控制条件
        printf("发射子弹~哔哔哔哔\n"); // 需要反复执行的语句
        count++; // 能够让循环结束的语句
    }
    printf("循环执行完毕\n");
    
    // 任何数值都有真假性
    while (1) { // 死循环
        printf("发射子弹~哔哔哔哔\n");
        // 没有能够让循环结束的语句
    }
    
    //当while后面只有一条语句时,while后面的大括号可以省略
    while (1)  // 死循环
        printf("发射子弹~哔哔哔哔\n");
    // 没有能够让循环结束的语句
    
    //C语言中分号(;)也是一条语句, 称之为空语句
    int count2 = 0;
    while (count2 < 3);{ // 死循环
        printf("发射子弹~哔哔哔哔\n");
        count++;
    }
    
    // 死循环一般在操作系统级别的应用程序会比较多, 日常开发中很少用(最简单的死循环)
    while (1);
    
    
    /*
     do {
     循环体中的语句;
     能够让循环结束的语句;
     ....
     } while (循环控制条件 );
     1.首先不管while中的条件是否成立, 都会执行一次"循环体"
     2.执行完一次循环体,接着再次判断while中的条件是否为真, 为真继续执行循环体,为假跳出循环
     3.重复以上操作, 直到"循环控制条件"为假为止
     */
    int i = 1;
    do {
        printf("先来一发，哈哈哈\n");
        i++;
    } while (i<=10);
    
    /*
     for(初始化表达式；循环条件表达式；循环后的操作表达式) {
     循环体中的语句;
     }
     1.首先执行"初始化表达式"，而且在整个循环过程中,只会执行一次初始化表达式
     2.接着判断"循环条件表达式"是否为真，为真执行循环体中的语句
     3.循环体执行完毕后，接下来会执行"循环后的操作表达式"，然后再次判断条件是否为真,为真继续执行循环体,为假跳出循环
     4.重复上述过程，直到条件不成立就结束for循环
     
     */
    for (int i = 0; i <= 10; i++) {
        printf("来一发，哈哈哈\n");
    }
    
    for(;;);// 最简单的死循环
    
    /*break、continue return 对选择 循环结构的影响
     break：由于它是用来退出循环或者switch语句
     continue：和break语句相似。所不同的是，它不是退出一个循环，而是开始循环的一次新迭代
     return：直接退出整个函数
     */
    
    
    /*
     goto  语句
     */
    int a = 0;
    comeBack :
    a++;
    if (a<=10) {
        printf("a = %d\n",a);
        goto comeBack;
    }
    
}


