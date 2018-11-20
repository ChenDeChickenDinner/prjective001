//
//  main.m
//  typedef
//
//  Created by xs on 2018/11/20.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int myInt;
typedef double myDouble;

struct person{
    int age;
};
typedef struct person myPerson;
myPerson person1 = {10};

typedef struct person2{
    int age;
}myPerosn2;

myPerosn2 persin21  = {10};
struct person2 person22 = {10};

typedef struct {
    int age;
}myPerson3;

myPerson3 person3 = {10};

enum students{
    man,
    woman
};

typedef enum students myStudents;
myStudents student1 = man;

typedef enum students2{
    man2,
    woman2
}myStudents2;
myStudents2 student2 = man2;

typedef enum{
    man3,
    woman3
} myStudents3;

myStudents3 student3 = man3;

void test1(){
    int value1 = 10;
    int value2 = 10;
    int value3 = 10;


    int array_int[] = {1,2,3};
    char array_char[] = "123";
    struct person array_struct[] = {{10},{20}};
    enum students array_enum[] = {man,woman,man};
    int *array_p[3] = {&value1,&value2,&value3};

    typedef int myIntArray[3];
    myIntArray array1 = {1,2,3};

    typedef struct person myStructArray[3];
    myStructArray array2 =  {{10},{20}};

    typedef int *myIntParray[3];
    myIntParray array3 = {&value1,&value2,&value3};

}
void test3(int a,int b){

}
void test2(){

    int value1 = 10;
    char value2 = 12;
    struct person value3 = {10};
    enum students value4 = man;
    int value5[3] = {1,2,3};



    int *p1 = &value1;
    char *p2 = &value2;
    struct person *p3 = &value3;
    enum students *p4 = &value4;
    int (*p5)[3] = &value5;
    void (*p6)(int,int) = test3;


    typedef int * myIntP;
    typedef char * myCharP;
    typedef struct person *myStructP;
    typedef enum students *myEnumP;
    typedef int (*myIntArrayP)[3];
    typedef void (*myFunP)(int,int);
    myIntP pp1= &value1;
    myCharP pp2= &value2;
    myStructP pp3 = &value3;
    myEnumP pp4 = &value4;
    myIntArrayP pp5 = &value5;
    myFunP pp6 = test3;

}
int main(int argc, const char * argv[]) {
    @autoreleasepool {

    }
    return 0;
}
