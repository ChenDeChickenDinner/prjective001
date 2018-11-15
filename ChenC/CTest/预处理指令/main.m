//
//  main.m
//  预处理指令
//
//  Created by xs on 2018/11/13.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

/**宏
1.简单来说就是按预定义的规则来替换相应的文本内容，被替换的文本内容可以是对象也可以是函数
2.其作用域 从 定义的那一行 到 文件结尾 或者 主动终止宏的作用域 #undef
3.参数替换的规则 ？
4.空格的处理 运算符包括 基本运算符 以及宏定义操作符#和...前后的空格会被除去
*/
#define CHEN 6

/** 对象宏
 1.通常是一些简单的对象替换，比如 #define M_PI 3.1415，对象宏名 一般大写
 */
//后面的值 可以不写，不写则为单纯的定义一个宏
#define XIAO

//定义一个宏时可以引用已经定义的宏名
#define HAHA (3*CHEN)

//可用宏定义表示数据类型,使书写方便
#define String  char *

/** 函数宏
 1. 可以接受参数如函数调用一样在代码中使用，比如 #define ADD(x,y) （（x） + （y））
 a). 括号与宏名之间不能有空格，否则就成对象宏了，函数宏名 一般小写
 b). 函数式宏定义的参数没有类型，预处理器只负责做形式上的替换，而不做参数类型检查，所以传参时要格外小心。
 c). 函数宏后面的 参数值最好用()括起来 避免，因纯文本替换导致的坑
 */
#define sum1(a1,a2) ((a1)+(a2))
void test21(){
    int a = sum1(10, 20);
}
//函数宏 函数体的格式
// 1.有缺点 的{}形式
#define sum2(a,b){ \
    a++; \
    b++; \
    a+b;\
}

//2.标准的 do{}while(0)形式
#define sum3(a,b) do{ \
    a++; \
    b++; \
    a+b; \
}while(0)


//3.带返回值的函数体 ({...}) 形式【函数体中可以做任意的逻辑处理和运算，但最终的返回值则是最后的表达式】
#define sum4(a,b) ({ \
    a++; \
    b++; \
    a+b; \
    a; \
})


void test22(){
    int a = 1;
    int b = 2;
    int c = 1;
    int d = 2;
    //if (a > 0) sum2(a, b); else; 报错
    if (a > 0) sum3(a, b); else;
    int e = sum4(c, d); // c = 2,d = 3,e = 2
    printf("c = %d,d = %d,e = %d\n",c,d,e);

}
/**宏定义符号
 1) 换行符\: 标识 \ 下面一行也属于 宏定义的 字符串内容，方便解读，\左边要有空格
 2) 如果不加\换行标识符而直接转行，则第二行的内容就不属于宏定义了
 3）一般声明带有参数列表宏定义的时候，如果函数体字符串太长，通常都会使用换行符来增强函数的可读性
 */
#define sum8(a1,a2) \
((a1)+(a2))+((a1)+(a2))


/** 字符串化
1.单个#号的作用是字符串化，简单来说就是在输入值上加上""双引号，使其转换为C字符串
2.如果是在ObjC环境下，则可在头部再加上@符号，出来后即是一个NSString类型
 */

#define HBSTRING2(value) #value

void test3(){
    char *str = HBSTRING2(3);
    printf("str = %s\n",str);
}

/**链接运算
 1.对于函数宏的 值部分，##的作用为:
 a:把##的前后项分隔开，分隔的作用类似于空格
 b:在分割替换之后将合并项之间的空格去除后完成连接操作
 */
#define A1(name,type) type name_##type##_type
#define A2(name,type) type name##_##type##_type
void test4(){

    A1(a, int);
    A2(a, int);
}
/**  可变参数 函数宏

 */

/**  宏定义展开
A 对于形参包括其他宏

B 对于形参带有 #或##
 1.如果形参不带 #或## 则先展开宏参数，再展开当前宏
 2.形参有#或##则不进行宏参数的展开
 */
#define f(a,b) a##b
#define g(a)   #a
#define h(a)   g(a)
void test7(){
    printf("%s\n", h(f(1,2)) ); // => 12 h(a) 形参不带 #或##，先展开 f(1,2) = 12，在展开 h(a) = g(a) = #12 = 12
    printf("%s\n", g(f(1,2)) ); // => f(1,2) g(a) 带 #或##,则 f(1,2) 不展开
}

/**  系统宏

 */


int main(int argc, const char * argv[]) {
    @autoreleasepool {


    }
    return 0;
}

void test9(){
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
