//
//  main.m
//  C2019
//
//  Created by xs on 2019/1/15.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>
void test1();
void test2();
void testPrintf();
int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        testPrintf();
    }
    return 0;
}

/**
 各种进制数据的表示
 */
void test1(){
    int value1 = 22;
    int value2 = -22;

    int value0b1 = 0b01;
    int value01 = 071;
    int value0x1 = 0xabcdef1;
}
/**
 ASCII码字符集
 1.包含：
  非显示字符：0~31以及127，通信字符或控制字符【0空字符 127删除字符】
  显示字符：32~126，数字 字母  符号【32 空格】


 字节，符号位，存储: 占8个字节，分为有符号性（signed）和无符号型（unsigned）两种，以整数的形式存储
 范围：若是signed型[-128,127]；unsigned型[0,255]；
 编译器层:C语言中我们通常直接用类型char，但是它究竟是被当做signed型还是unsigned型，由编译器决定。
 运用层:C语言允许我们在char前面加上关键字signed或者unsigned，这样，无论在编译器中被当做signed还是unsigned，都会按照前面加的这个关键字来决定
 通常运用:通常指用来存储ASCII中的字符

 字符的表达
 a.一般字符（显示字符）: char b = 'a';
 b.转义字符
 1.一般转义字符（非显示以及控制字符）
     1.非显示型 '\n','\t'
     2.二义型 '\'' '\"' '\\' '\?'
 2.进制转义字符（所以的字符都可以展示）
   0.空字符 :\0 = 0 ,ASCII中 0 代表 空字符
   1.八进制 :\ 后面加 三位八进制数，前面的零可以省略
   2.十六进制 :是由反斜杠'\'和字母x(或X)及随后的1～2个十六进制数字构成的字符序列
 */

void test2(){
    // 一般显示字符
    char a = '0';
    char a1 = ' ';
    NSLog(@"a1 = %d\n",a1);// a1 = 32

    // 转义非显示字符
    char b = '\n';
    char b0 = '\'';
    char b1 = '\\';
    char b2 = '\"';
    char b3 = '\?';

    // 进制转义字符
    char c = '\0';
    NSLog(@"c = %d\n",c);// c = 0

    char c1 = '\02';
    char c2 = '\002';
    char c3 = '\2';
    NSLog(@"c1 = %d,c2 = %d,c3 = %d\n",c1,c2,c3);// c1 = 2,c2 = 2,c3 = 2

    char d = '\xa';
    NSLog(@"d = %d\n",d);// d = 10

    signed char vlue = -127;
    NSLog(@"vlue = %d\n",vlue);// vlue = -127

}

void testInt(){
    // 1.符号修饰关键字
    signed int value = -10;
    unsigned int value2 = 10;

    // 2.长短整数修饰关键字
    short int  b1 = 10;
    long int b2 = 10;
    long long int b3 = 10;

}

void testFloat(){

    // 1.单精度
    float value1 = 10.2f;
    // 2.双精度
    double value2 = 10.2;
}
void testPrintf(){
// 占位符
    // 1.整形
     int  b0 = 10;
    short int  b1 = 10;
    long int b2 = 10;
    long long int b3 = 10;
    printf("b0 = %d,b1 = %hd,b2 = %ld,b3 = %lld\n",b0,b1,b2,b3);

    // 浮点
    float value1 = 10.2f;
    double value2 = 10.2;
    printf("value1 = %f,value2 = %f\n",value1,value2);

   // 字符字符串
    char value_char = 'x';
    printf("value_char = %c\n",value_char);

    char *str1 = "123";
    printf("str1 = %s\n",str1);

   // 指针
    char *strP = "1233";
    printf("strP = %p\n",strP);

}
