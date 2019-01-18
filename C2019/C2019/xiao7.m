//
//  xiao7.m
//  C2019
//
//  Created by xs on 2019/1/16.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "xiao7.h"

/**
 int float double enmue
 1. 作为形参 都是值传递
 2. 作为返回值 都是值传递
 */



/**
 数组，作为形参
 1.数组作为形参传递的是 指针传递
 2.数组作为形参 不用写数组元素
 3.可另外起一个参数，用于传递数组长度
 数组，作为返回值
 C语言中,不能直接返回数组，但可以通过其他方式实现类似的功能
 */
static void test_array(int array[],int length){

    size_t bit = sizeof(array); // bit =  8,地址传递
    array[0] = 7;
    array[1] = 8;
    array[length -1] = 9;
    /*
     sizeof:关于 对数组与指针的运算
     1.如果非形参，若是数组首地址，则会计算出整个数组所占的空间，如果是指针，则为固定的长度
     2.如果是形参，数组名当形参传递，是指针传递 这时候sizeof会把数组首地址和指针无差别当成是地址
     */
}
static void test_array2(){
    int array[3] = {1,2,3};
    int i = 0;
    int length = sizeof(array)/sizeof(int);
    test_array(array, length);
    while (i < length) {
        printf("array[%d] = %d\n",i,array[i]);
        i++;
    }

}


/********************************************************************************/
struct dnf{
    int age;
    int *number;
    char *symbol;
};
static void test_struct(struct dnf value){

}

@implementation xiao7

@end
