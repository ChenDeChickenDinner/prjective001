//
//  04Funcation.c
//  2009C
//
//  Created by xs on 2019/1/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#include "04Funcation.h"
/**函数
 1.格式:返回值类型 函数名(参数类型 形式参数1，参数类型 形式参数2，…) {函数体;返回值;}
 2.类型:函数的类型由它的返回值类型以及形参列表确定，和函数名无关
 */


/**函数名
 1.函数名是代码段的指针,跟数组名是数据段的指针差不多的意思
 func = test;
 func = &test;
 sizeof(test);
 sizeof(&test);
 */
static void test(){
    size_t bit1 =  sizeof(test);
    size_t bit2 =  sizeof(&test);
    printf("bit1 = %lu,bit2 = %lu\n",bit1,bit2);// bit1 = 1,bit2 = 8
}

/**
 形参、实参
 1.调用函数时传递的实参个数必须和函数的形参个数必须保持一致
 2.形参实参类型不一致, 会自动转换为形参类型
 */

/**
 返回值
 1.如果没有写返回值类型，默认是int
 2.函数返回值的类型和return实际返回的值类型应保持一致。如果两者不一致,则以返回值类型为准,自动进行类型转换
 */
static void test7(){

}

