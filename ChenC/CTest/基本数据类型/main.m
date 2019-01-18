//
//  main.m
//  基本数据类型
//
//  Created by xs on 2018/11/8.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        int value_int = 10;

        /*一般字符
         1.字节，符号位，存储: 占8个字节，分为有符号性（signed）和无符号型（unsigned）两种，以整数的形式存储
         2.范围：若是signed型[-128,127]；unsigned型[0,255]；
         3.编译器层:C语言中我们通常直接用类型char，但是它究竟是被当做signed型还是unsigned型，由编译器决定。
         4.运用层:C语言允许我们在char前面加上关键字signed或者unsigned，这样，无论在编译器中被当做signed还是unsigned，都会按照前面加的这个关键字来决定
         5.通常运用:通常指用来存储ASCII中的字符
         */
        char value_char1 = 'a';
        char value_char2 = ' ';
        /*转义字符
         a:一般转义字符
         1.控制非显示字符: \n 换行
         2.二义性字符: \' ; \" ; \? ; \\
         b:进制转义字符
         0.空字符 :\0 = 0 ,ASCII中 0 代表 空字符
         1.八进制转义字符:它是由反斜杠'\'和随后的1～3个八进制数字构成的字符序列，表示八进制的0可以省略
         2.十六进制转义字符:是由反斜杠'\'和字母x(或X)及随后的1～2个十六进制数字构成的字符序列
         */
        char value_char4 = '\'';// '是 字符的表示符号，表示的时候必须转义，不然会造成语法歧义
        char value_char5 = '\\';
        char value_char61 = '\"';
        char value_char62 = '"';// "是 字符串的表示符号，但在此处不会造成语法歧义，故无报错
        char value_char71 = '\?';
        char value_char72 = '?';

        char value_char3 = '\0'; // 空字符
        char char_82 = '\012';//八进制
        char char_81 = '\12'; //八进制

        char char_16 = '\x12';//十六进制


        /*有无符号
         1. signed 有符号，unsigned无符号
         2. signed 只能修饰 整形
         3. int 默认是有符号的 char 默认是 无符号的
         */
        signed int value_signed_int = 10;
        unsigned int value_unsigned_int = 10;

        /*长短
         1.shotr 短,long 长 long long 长长
         2.只能修饰 整形
         */
        short int value_short_int = 10;
        long int value_long_int = 10;
        long long int value_longlong_int = 10;

        /*浮点
         1. 单精度浮点数有效数字7位，6 位小数
         2.双精度浮点数有效数字16位，15 位小数
         */
        float value_float = 10.123456789f;
        double value_double = 10.123456789; // 默认是 double类型

        /*打印输出
         1.如果不在输入格式中做精度控制，二者默认都是输出 6位小数
         value_float = 10.123457
         value_double = 10.123457
         */
        printf("value_float = %f\nvalue_double = %f\n",value_float,value_double);


    }
    return 0;
}
void printf_explain(){

    /*Format 参数是包含三种对象类型的一个字符串
     1.一部分是正常字符,这些字符将按原样输出
     2.一部分是格式化规定字符,以"%"开始,后跟一个或几个规定字符,用来确定输出内容格式
     3.一部分是转义字符
     4.  %[flags][width][.prec][F|N|h|l]type[%[标志][最小宽度][.精度][类型长度]类型。]
     */

    /*输出最小宽度（width）
     1.用十进制整数来表示输出的最少位数。若实际位数多于指定的宽度，则按实际位数输出，若实际位数少于定义的宽度则以空格填充
     2.*星号。不显示指明输出最小宽度，而是以星号代替，在printf的输出参数列表中给出
     */
    printf("指定最小位宽，其余空格代替:%5d\n",10);
    printf("参数指定最小位宽，其余空格代替:%*d\n",6,10);

    // 对其方式,(默认右对齐) - 减号 设置左对齐，右边填充空格
    printf("默认右对其，指定位宽:%5d\n",10);
    printf("减号设置左对齐，指定位宽，:%-5d\n",10);

    // 0 数字零  将输出的前面补上0，直到占满指定列宽为止（不可以搭配使用“-”）
    printf("数字零，指定位宽:%05d\n",10);



    //+ 加号    在数字前增加符号 +或-
    printf("加号(在数据前面添加+-号)正数:%+d\n",10);
    printf("加号(在数据前面添加+-号)负数:%+d\n",-10);

    //空格   在正数前增加空格，为负时加上负号
    printf("空格(正数加上空格，负数加上负号)正数:% d\n",10);
    printf("空格(正数加上空格，负数加上负号)负数:% d\n",-10);

    //   显示进制的格式
    printf("显示出八进制的前缀%#o\n",8);
    printf("显示出十六进制的前缀%#x\n",17);
    printf("显示出十六进制的前缀%#X\n",17);


    // 精度
    //小数点与 整形:表示输出的最小的数字个数，不足补前导零，超过不截断
    printf("小数点与 整形:%.8d\n",1000); // 等效于 %08d
    printf("小数点与 整形:%.8d\n",100010001);

    //小数点与浮点数:表示小数点后数值位数，默认为六位，不足补后置0，超过则(四舍五入后)截断。
    printf("小数点与 浮点数:%.8f\n",10.12345);
    printf("小数点与 浮点数:%.8f\n",10.123456784); // 小数点与 浮点数:10.12345678
    printf("小数点与 浮点数:%.8f\n",10.123456785); // 小数点与 浮点数:10.12345679
    printf("小数点与 浮点数:%.8f\n",10.123456786); // 小数点与 浮点数:10.12345679

    //小数点与浮点数的有效位数：表示可输出的最大有效数字
    printf("小数点与 g式浮点数%.8g\n",1000.123456);    //小数点与 g式浮点数1000.1235

    //小数点与字符串:表示最大可输出字符数，不足正常输出，超过则截断。
    printf("%.8s\n","abcdefghij");    //超过指定长度截断

    //以星号代替数值，类似于width中的*，在输出参数列表中指定精度。
    printf("参数小数点与 浮点数:%.*f\n",8,10.12345);

    /*
     输出数据的类型
     整形
     %d/i : int 接受整数值并将它表示为有符号的十进制整数，i是老式写法
     %o: unsigned int 无符号8进制整数(不输出前缀0）
     %u: unsigned int 无符号10进制整数
     %x/X: unsigned int 无符号16进制整数，x对应的是abcdef，X对应的是ABCDEF（不输出前缀0x)

     浮点型
     %f/lf double 单精度浮点数和双精度浮点数用f(lf 在C99开始加入标准，意思和 f 相同)
     %e/E double 科学计数法表示的数，此处"e"的大小写代表在输出时用的“e”的大小写
     %g/G  double  有效位数，如：%.8g表示单精度浮点数保留8位有效数字。

     字符型
     %c char 字符型。可以把输入的数字按照ASCII码相应转换为对应的字符
     %s/S char* 字符串。输出字符串中的字符直至字符串中的空字符

     指针
     %p void *    以16进制形式输出指针

     % 不进行转换，输出字符‘%’（百分号）本身
     m    无    打印errno值对应的出错内容,(例: printf("%m\n"); )
     */
    signed int a = 520;
    unsigned int b = 520;
    printf("a = %d\n",a);
    printf("a = %o\n",a);
    printf("a = %u\n",a);
    printf("a = %x\n",a);

    printf("b = %d\n",b);
    printf("b = %o\n",b);
    printf("b = %u\n",b);
    printf("b = %x\n",b);

    //表示指针是否是远指针,或整数是否是长整数
    /*
     F 远指针
     N 近指针
     h 短整数(short int)
     l 长整数(long int)
     */
    short int  h = 10;
    long int  h2 = 10;
    long long int h3 = 10;
    printf("h = %d\n",h);
    printf("h = %hd\n",h);

    printf("h = %d\n",h2);
    printf("h = %ld\n",h2);
    printf("h = %lld\n",h3);


}

