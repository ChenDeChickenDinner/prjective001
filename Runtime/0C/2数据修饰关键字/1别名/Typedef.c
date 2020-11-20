//
//  Typedef.c
//  CGrammar
//
//  Created by xs on 2019/4/19.
//  Copyright © 2019 xs. All rights reserved.
//

#include "Typedef.h"

enum HBStockType{
    one,
    two
};

struct Person{
    int age;
    char *name;
    double height;
};

typedef int MyInt;
typedef enum HBStockType MyStockType;
typedef struct Person Person;

typedef int MyIntArray[3];

typedef int * intPointer;

typedef void (*MyFuncation)(void);

void test0(){
    
}

static void test1(){
    MyInt value1 = 10;
    MyStockType stock = {18,"chen",88.88};
    
    MyIntArray array ={1,1,1};
    int a = 10;
    intPointer p = &a;
    
    MyFuncation func = test0;
    
}

