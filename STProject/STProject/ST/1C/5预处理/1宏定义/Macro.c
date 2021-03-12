//
//  Macro.c
//  CGrammar
//
//  Created by xs on 2019/4/22.
//  Copyright © 2019 xs. All rights reserved.
//

#include "Macro.h"





//对象宏
#define CHEN1

#define CHEN2 6

#define CHEN3 (3*9)

//结束宏定义
#undef CHEN1




/** 函数宏
 1. 可以接受参数如函数调用一样在代码中使用，比如 #define ADD(x,y) （（x） + （y））
 a). 括号与宏名之间不能有空格，否则就成对象宏了，函数宏名 一般小写
 b). 函数式宏定义的参数没有类型，预处理器只负责做形式上的替换，而不做参数类型检查，所以传参时要格外小心。
 c). 函数宏后面的 参数值最好用()括起来 避免，因纯文本替换导致的坑
 */
#define sum(a,b) ((a)+(b))


/**函数宏的形式
 1.有缺点 的{}形式
 2.标准的 do{}while(0)形式
 3.带返回值的函数体 ({...}) 形式【函数体中可以做任意的逻辑处理和运算，但最终的返回值则是最后的表达式】
 */

#define sum21(a,b){ \
a++; \
b++; \
a+b;\
}

#define sum31(a,b) do{ \
a++; \
b++; \
a+b; \
}while(0)


#define sum41(a,b) ({ \
a++; \
b++; \
a+b; \
a; \
})













/*宏定义符号
 1.在宏定义中，有四个特殊的符号：
 1)\  换行
 2)#  字符串化
 3)## 连接运算
 4)...可变多参数
 */



/** 宏值的换行
 1) 换行符\: 标识 \ 下面一行也属于 宏定义的 字符串内容，方便解读，\左边要有空格
 2) 如果不加\换行标识符而直接转行，则第二行的内容就不属于宏定义了
 3）一般声明带有参数列表宏定义的时候，如果函数体字符串太长，通常都会使用换行符来增强函数的可读性
 */
#define sum1(a1,a2) \
((a1)+(a2))+((a1)+(a2))

/*宏值的字符串化
 0.单 #（只能作用与普通字符的开头，不能修饰值为宏 的 宏值）
 1.作用将实参值上加上""双引号，使其转换为C字符串
 2.如果是在ObjC环境下，则可在头部再加上@符号，出来后即是一个NSString类型
 */

#define STR1 "123"
#define STR2 #123
#define STR3 @123

/*字符串对参数空格的处理
a). 忽略传入参数名前面和后面的空格
b). 当传入参数之间存在空格时，忽略其中多于一个的空格
 */
#define STR4(x) #x

static void test1(){
    char *str1 = STR4( 123 ); // str1 = 123
    char *str2 = STR4(abc   def); // str2 = abc def
    
    printf("str1 = %s\n",str1);
    printf("str2 = %s\n",str2);
    
 // This is Ryan!

}

/* 连接运算
 1.先分隔，像常见的运算符比如+,-, *, /, ++以及宏定义操作符#和...也是分隔标志
 2.分隔完之后的看情况替换，相同的就被替换
 3.最后链接在一起，前后项之间的空格都去除
 */
#define A1(name, type) type name_##type##_type
#define A2(name, type) type name##_##type##_type

/*可变多参数
 1.系统保留的:  ... 与 __VA_ARGS__ 配对
 2.自定义的:format2...与format2 配对
 3.最后加##的意义是处理为0个参数时候的编译器报错
 */

#define NSlog1(format,...) printf("%s [line %d]"format,__func__,__LINE__,##__VA_ARGS__);
#define NSlog2(format,format2...) printf("%s [line %d]"format,__func__,__LINE__,##format2);

void macroFunc(){

    int value = 10;
    printf("%d\n""%d\n",value,value);
    NSlog1("value1 = %d\n",value);
    NSlog2("value2 = %d\n",value);
    NSlog2("value3 = \n");

}


static void test2(){
    
    printf("文件名:%s,行数:%d,函数名:%s\n",__FILE__,__LINE__,__func__);
    
}



