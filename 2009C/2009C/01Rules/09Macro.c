//
//  09Macro.c
//  2009C
//
//  Created by xs on 2019/1/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#include "09Macro.h"
//https://onevcat.com/2014/01/black-magic-in-macro/
/**宏
 1.纯粹的文本替换，替换后的文本最后在编译器前 是 能被识别的 对象 常量 变量 对象 标识符 函数。。。
 2.其作用域 从 定义的那一行 到 文件结尾 或者 主动终止宏的作用域 #undef
 4.空格的处理 运算符包括 基本运算符 以及宏定义操作符#和...前后的空格会被除去，其它空格替换后还是空格
 */
#define CHEN 6

/** 对象宏
 1.通常是一些简单的对象替换，比如 #define M_PI 3.1415，对象宏名 一般大写
 2.后面的值 可以不写，不写则为单纯的定义一个宏
 3. 定义一个宏时可以引用已经定义的宏名
 4. 可用宏定义表示数据类型,使书写方便
 */
#define XIAO
#define HAHA (3 * CHEN)
#define String  char *



/** 函数宏
 1. 可以接受参数如函数调用一样在代码中使用，比如 #define ADD(x,y) （（x） + （y））
 a). 括号与宏名之间不能有空格，否则就成对象宏了，函数宏名 一般小写
 b). 函数式宏定义的参数没有类型，预处理器只负责做形式上的替换，而不做参数类型检查，所以传参时要格外小心。
 c). 函数宏后面的 参数值最好用()括起来 避免，因纯文本替换导致的坑
 */
#define sum1(a1,a2) ((a1)+(a2))
static void test21(){
    int a = sum1(10, 20);
}
/** 宏值的换行
 1) 换行符\: 标识 \ 下面一行也属于 宏定义的 字符串内容，方便解读，\左边要有空格
 2) 如果不加\换行标识符而直接转行，则第二行的内容就不属于宏定义了
 3）一般声明带有参数列表宏定义的时候，如果函数体字符串太长，通常都会使用换行符来增强函数的可读性
 */
#define sum8(a1,a2) \
((a1)+(a2))+((a1)+(a2))


/**函数体形式的 宏值
 1.有缺点 的{}形式
 2.标准的 do{}while(0)形式
 3.带返回值的函数体 ({...}) 形式【函数体中可以做任意的逻辑处理和运算，但最终的返回值则是最后的表达式】
 */

#define sum2(a,b){ \
a++; \
b++; \
a+b;\
}

#define sum3(a,b) do{ \
a++; \
b++; \
a+b; \
}while(0)


#define sum4(a,b) ({ \
a++; \
b++; \
a+b; \
a; \
})

static void test22(){
    int a = 1;
    int b = 2;
    int c = 1;
    int d = 2;
    //if (a > 0) sum2(a, b); else; 报错
    if (a > 0) sum3(a, b); else;
    int e = sum4(c, d); // c = 2,d = 3,e = 2
    printf("c = %d,d = %d,e = %d\n",c,d,e);
}


/** 宏值修饰符
 A:单 #（只能作用与普通字符的开头，不能修饰值为宏 的 宏值）
 1.作用将实参值上加上""双引号，使其转换为C字符串
 2.如果是在ObjC环境下，则可在头部再加上@符号，出来后即是一个NSString类型

 B: 双 ##（只能作用与普通字符的中间，前后可以有空格，不能修饰值为宏 的 宏值）
 1.分割宏值，消除空格，最后链接结果
 */

#define HBSTRING2(value) #value

static void test3(){
    char *str = HBSTRING2(3);
    printf("str = %s\n",str);
}

#define A1(a,b)  _a##a##_b
#define A2(a,b)  a##b##a
static void test4(){
    int a = A2(1, 2);
    printf("a = %d\n",a); // a = 121
}

#define A3(a1,b1,...) do{ \
char *str = __VA_ARGS__ ; \
printf("str = %s\n",str); \
}while(0)

#define XIAOLog(...) do{ \
printf("line:%d %s\n",__LINE__,##__VA_ARGS__); \
}while(0)

static void test5(){
    A3(1, 2,"123");  // str = 123
    XIAOLog("abc");  // line:122 abc

}

//
/** 宏展开规则
 A.从左到右展开，从外到内展开
 B.每次只解开当前层的宏,先看当前宏 的宏值 有没有 #或##，
 1.如果没有，则先将实参的宏展开
 2.如果有，则实参的宏不展开，直接展开当前宏

 C.当遇到# ## 确保每个形参都被展开（对于 #define macroA(a) #a 遇到实参a为宏的优化）
 问题.如果 macroA(a) 形参 a，传入的是一个宏macroB，则macroB因为macroA的宏值带 #或##而不进行展开
 解决.将macroA(a) 包装一次 #define macroC(a)  macroA(a)，则遇到实参是宏的时候，利用 macroC(a) 则能将实参宏展开，而且最后的宏定义本质还是 macroA(a) 的效果
 */
#define number 8
#define numberA(a,b) a + b //
#define numberB(a,b) a##b //


#define numberC(a,b) numberB(a,b) // 对应受#、##影响的形参的展开 解决===》转换

//1.实参包含宏
static void test12(){
    int a = numberA(1, number);
    //    int b = numberB(1, number);
    int C = numberC(1, number);
}

//2.宏定义中 文本部分 包含其他宏
#define numberC1(a) numberA(a,number) + 1 // numberA的形参中带无 ## 则 number会被展开
#define numberC2(a) numberB(a,number) + 1 // numberB的形参中带有 ## 则 number不会被展开
static void test7(){
    int a = numberC1(1);
    //    int B = numberC2(1);
}


/** 系统宏
 1.__LINE__
 2.__FILE__
 3.__COUNTER__
 4.__func__
 */



static void test9(){
#if COUNT == 5
    printf("COUNT == 5\n");
#elif COUNT > 5
    printf("COUNT > 5\n");
#else
    printf("COUNT < 5\n");
#endif


    // 如果定义过某个宏
#if defined(COUNT)
    printf("定义过宏 COUNT\n");
#endif

#ifdef COUNT
    printf("定义过宏 COUNT\n");
#endif

    // 如果没有定义过某个宏

#if !defined(XIAO)
    printf("没有定义过宏 XIAO\n");
#endif

#ifndef XIAO
    printf("没有定义过宏 XIAO\n");
#endif

}

