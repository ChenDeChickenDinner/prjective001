//
//  main.m
//  函数
//
//  Created by xs on 2018/11/9.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>


enum nameType{
    one = 0,
    two,
};

struct nameStruct{
    int age;
    char *name;
};

/**
 函数的参数传递
 1.值传递:该方法把参数的实际值复制给函数的形式参数。在这种情况下，修改函数内的形式参数不会影响实际参数。
 2.地址传递:通过指针传递方式，形参为指向实参地址的指针，当对形参的指向操作时，就相当于对实参本身进行的操作。
3.关键看 传递的是地址 还是值
 */

/**
 基本数据类型，枚举，结构体作为 函数的形参，返回值
 */

int test_int(int a){
    a = 20;
    printf("a = %p\n",&a);
    return a;
}

double test_double(double b){
    b = 30.0;
    printf("a = %p\n",&b);
    return b;
}

enum nameType test_enum(enum nameType type){
    type = two;
    return type;
}

struct nameStruct test_struct(struct nameStruct name){
    name.age = 19;
    name.name = "xiao";
    return name;
}
/**
 数组作为函数参数
1.数组作为参数，是地址传递，只是将首元素的地址传递过去
2.数组作为参数，元素个数可以不写，写了也没用(编译时也只是检查数组名)，传递的只是 指针地址，想传递 数组的长度，需要另外一个量变参数
3.数组 并不能作为函数的返回值，若需要返回一个数组 ，可以 返回一个指向数组的指针
 */
// 1.基本类型数据数组
void test_array(int array[],int a){

    for (int i =0; i<= a-1; i++) {
        printf("array[%d] = %d\n",i,array[i]);
    }
    return;
}
// 2.指针数组
void test_p_array(int * array[],int a){

    int *p1 = array[0];
    int *p2 = array[1];
    printf("*p1 = %d,*p2 = %d\n",*p1,*p2);

    *p1 = 50;
    *p2 = 60;
    printf("*p1 = %d,*p2 = %d\n",*p1,*p2);

    return;
}

/**
 各种类型指针作为 函数形参 ，返回值
 */
int * test_int_p(int *p){
    int *p2 = NULL;
    *p = 20;
    p2 = p;
    return p2;
}

enum nameType * test_enum_p(enum nameType *p){
    enum nameType *p2 = NULL;
    *p = two;
    p2 = p;
    return p2;
};

struct nameStruct * test_struct_p(struct nameStruct *p){
    struct nameStruct *p2 = NULL;
    (*p).age = 20;
    p->age = 30;
    p2 = p;
    return p2;
}
// 指向数组的指针 作为参数
void test_array_P(int (*array)[]){
    int a = (*array)[0]; // array 是指针  *array = 数组
    printf("a = %d\n",a);
}

// 指向函数的指针 作为参数
void test_function(void (*p)(int)){
    (*p)(3);
    p(4);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        int a = 10;
        printf("a = %p\n",&a);
        int a2 = test_int(a);

        double b = 10;
        printf("b = %p\n",&b);
        double b2 = test_double(b);


        enum nameType type = one;

        enum nameType type2 = test_enum(type);
        printf("type2 =  %d\n",type2);


        struct nameStruct name = {18,"chen"};
        struct nameStruct name2 = test_struct(name);

        printf("name.age = %d\n",name.age);

        int array[] = {1,2,3};
        test_array(array, 3);

        int value1 = 10;
        int value2 = 20;
        int value3 = 30;

        int *p1 = &value1;
        int *p2 = &value2;
        int *p3 = &value3;
        int *p_array[3] = {p1,p2,p3};
        test_p_array(p_array, 3);
        printf("value1 = %d,value2 =%d\n",value1,value2);

        int (*array_p)[3] = &array;
        test_array_P(array_p);
    }
    return 0;
}
