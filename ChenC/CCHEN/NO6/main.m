//
//  main.m
//  NO6
//
//  Created by xs on 2018/10/12.
//  Copyright © 2018年 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
/**
 字符串
 */
void test2(){

    // 字符串本质
    /*
     1.从概念上讲，C语言中没有字符串数据类型
     2.在C语言中使用字符数组来模拟字符串
     3.C语言中的字符串是以'\0'结束的字符数组
     4.C语言中的字符串可以分配于栈空间，堆空间或者只读存储区（不能被改变）
     */

    // 字符串的二种表现形式【 数组形式字符串】
    char number1[] = {'1','2','\0'}; //  \0 结尾是字符串
    char number2[] = {'1','2',0}; //
    printf("number1 = %s,sizeof = %lu\n",number1,sizeof(number1)); // number1 = 12,sizeof = 3
    printf("number2 = %s,sizeof = %lu\n",number2,sizeof(number2)); // number2 = 12,sizeof = 3


    char number3[3] = {'1','2'}; // 有多余的位置全部 自动补'\0'
    char number4[4] = {'1','2'}; // 有多余的位置全部 自动补'\0'
    printf("number3 = %s,sizeof = %lu\n",number3,sizeof(number3)); // number3 = 12,sizeof = 3
    printf("number4 = %s,sizeof = %lu\n",number4,sizeof(number4)); // number4 = 12,sizeof = 4

    char number5[3] = {'1','2','3'}; // 无多余的位置不会 自动补'\0' 不是字符串
    char number6[] = {'1','2'}; // 无多余的位置不会 自动补'\0' 不是字符串
    printf("number5 = %s,sizeof = %lu\n",number5,sizeof(number5)); // number5 = 12312,sizeof = 3
    printf("number6 = %s,sizeof = %lu\n",number6,sizeof(number6)); // number6 = 1212312,sizeof = 2


    /*
     双引号做了3件事：
     1.申请了空间(在常量区)，存放了字符串;  2. 在字符串尾加上了'/0';3.返回地址
     */
    char value1[]="it"; //是字符串
    char value2[2]="it"; // 不是字符串 是字符数组


    // 字符串的二种表现形式【 指针形式字符串 】
    char* s1= "Hello World1";




    // 数组字符串 与 指针字符串的区别
    char str_array[]="I love lnj!";
    char *str_P = "lnj";
    /*
     a.【变量本质】str_array 是字符数组,str_P 是一个指向字符地址的指针变量
     b.【字符串本质】 str_array对应的字符串是，存储于栈中的字符数组，str_P对应的字符串是存储于静态常量区的字符数组
     c.【变量作用域】str_array 作为 函数中的局部变量，在函数结束后就销毁了，不能作为函数返回值，除非 声明用了static，str_P可以作为函数返回值
     d.【变量对右边字符串的操作】str_array 可以修改右边字符串的内容，str_P不能修改，只能重新指向别的字符地址
     */



    
    /*
     `%s`表示输出一个字符串，给出字符指针变量名`str`（对于第一种表示方法，字符数组名即是字符数组的首地址，与第二种中的指针意义是一致的），则系统先输出它所指向的一个字符数据，然后自动使`str`自动加1，使之指向下一个字符...，如此，直到遇到字符串结束标识符 `" \0 "`。
     */
}







