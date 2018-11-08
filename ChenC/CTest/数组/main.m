//
//  main.m
//  数组
//
//  Created by xs on 2018/11/8.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
void test(){
    /*数组的定义规则
     1.数组的类型 由 元素类型 + 元素个数共同 组成
     2.元素个数，必须是整形常量，当未指定元素的时候 元素个数是必须的
     */

    //1.初始化
    int array_1[6]; // 未初始化的元素 是不确定的

    int array_2[] = {1,2,3,4}; // 元素个数由初始化的元素确定

    int array_3[4] = {1,2,3,4}; // 元素全部初始化
    int array_4[4] = {1,2,3} // 元素部分初始化，未初始化的元素值 不确定
    int array_5[4] = {[1]=2,[2]=3};// 指定位置初始化

    //2.数组元素个数
    int array_bit = sizeof(array_2)/sizeof(int);

    //3.取元素值
    int value = array_2[1];

    //4.更变元素值
    array_2[1] = 5;


    //5.数组在内存中存储细节
}
