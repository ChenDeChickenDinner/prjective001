//
//  Func.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/11.
//

#import "Func.h"

@implementation Func

@end
/*
实参到形参的问题
A.实参到形参
1.C语言的参数传递过程中好像没有严格的编译器限制（参数传递内存过程）
  2.形参的表面类型:不论实参是什么类型 ，最终会转成形参的类型
  2.形参的最终类型:
  3.形参的最终值:

 */
void test0(){

}
/*
B.各种类型形参表现
 */
enum man{
    man,
    woman
};
struct person{
    int age;
    double height;
    char *name;
};
int test1(int a,double b,char c,enum man d,bool e,_Bool f,struct person g){
    return 0;
}

void test2(char array1[],char *array2[]){

}
void test3(int *p,int(*p2)[],void(*p3)(void)){

}

void test4(char *p0,char **p1,char *p2[],char p3[2][2]){

}
/*
C.各种修饰词对形参的影响
 */
void test5(const int a){
//    a = 10; 不允许修改a的值
}
