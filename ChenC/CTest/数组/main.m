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
/**数组的定义规则
 1.数组的类型 由 元素类型 + 元素个数共同 组成
 2.元素个数，必须是整形常量，当未指定元素的时候 元素个数是必须的
 */
void test(){

    //1.初始化
    int array_1[6]; // 未初始化的元素 是不确定的
    int array_2[] = {1,2,3,4}; // 元素个数由初始化的元素确定
    int array_3[4] = {1,2,3,4}; // 元素全部初始化
    int array_4[4] = {1,2,3}; // 元素部分初始化，未初始化的元素值 不确定
    int array_5[4] = {[1]=2,[2]=3};// 指定位置初始化
    //2.数组元素个数
    int array_bit = sizeof(array_2)/sizeof(int);
    //3.取元素值
    int value = array_2[1];
    //4.更变元素值
    array_2[1] = 5;


    /*5.数组在内存中存储细节
    1.内存寻址从大到小，从高地址开辟一块连续没有被使用的内存分别给数组
    2.从分配的连续内存中，从地址小的位置开始给每个元素分配空间
    3.从每个元素分配的控制中，地址最大的位置开始存储数据
    4.数组名指向整个存储空间最小的地址
     */

}

/**
 字符数组_字符串
 1.C中没有专门的字符串类型，以字符数组代替
 2.字符数组 以\0 空字符为结束标志 代表一个字符串
 3.字符串可以被分配与 栈，堆 或者只读空间中
 */
void test0(){
    // 1.字符数组中 以 \0 空字符结尾
    char array_char1 [] = {'1','2','\0'};

    // 2.'\0' 的 ASCII 值 是 0,SO 下面也是字符串
    char array_char2 [] = {'1','2',0};

    // 3.双引号字符串
    /*
     1.在常量区申请了存储空间
     2.在数组结尾加上了\0
     3.返回了地址
     */
    char array_char3[] = "it";
    char array_char3[2] = "it"; // 只是字符数组不是字符串

}
/**
 结构体数组
 */
void test1(){

    struct group {
        int age;
        char *name;
        double height;
    };

    struct group strurtArray[2] = {{18,"chen",22.0},{19,"xiao",23.0}};

    // 通过数组名访问 修改 结构体元素的成员变量
    strurtArray[0].age = 28;

    struct group array_indx0 = strurtArray[0];
    printf("array_indx0.age = %d\n",array_indx0.age);

}
/**
 指针数组
 1.一个数组，各元素都是指针变量，每元素保存一个地址，这样的数组称为指针数组。
 */
void test11(){
    int value1 = 10,value2 = 20,value3 =30;
    int *p1 = &value1;
    int *p2 = &value2;
    int *p3 = &value3;
    //由于[]比*的优先级要高，故 array_p 先与[]结合，也就是说 array_p 是一个数组
    int *array_p[3] ={p1,p2,p3};

}

/**二维数组
 1.数据类型 数组名[一维数组的个数][一维数组的元素个数]
 2.其中"一维数组的个数"表示当前二维数组中包含多少个一维数组
 3.其中"一维数组的元素个数"表示当前前二维数组中每个一维数组元素的个数
 */

void test12(){
    // 1.初始化
    int array_wei1[2][3] = {{1,2,3},{4,5,6}};
    int array_wei2[2][3];
    // 2.赋值 取值
    array_wei2[0][0] = 1;
    array_wei2[0][1] = 2;
    array_wei2[0][2] = 3;
}
