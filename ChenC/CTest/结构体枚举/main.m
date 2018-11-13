//
//  main.m
//  结构体枚举
//
//  Created by xs on 2018/11/9.
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
void test11(){
    /*结构体
     */

    // 1.定义类型 ，成员变量 以;号隔开
    struct person{
        int age; // 成员变量的类型 可以是任何类型 但，不能嵌套自身类型的变量
        char *name;
        double height;
    };
    // 2.初始化
    struct person man = {18,"chen",55.0};
    struct person woman = {18,"chen",55.0};

    // 3.成员变量的 访问 修改
    man.age = 17;
    man.name = "xiao";
    man.height = 88.0;

    // 4.结构体变量之间 若是相同类型则可以互相赋值，且只做值传递
    man = woman;

    /*枚举
     1.枚举值是当做整形常量处理，称为枚举常量
     2.枚举元素的值取决于定义时各枚举元素排列的先后顺序,默认第一个为0，后面依次+1
     3.可以在定义的 时候 自定义 枚举常量的值
     */
    //1.定义类型，枚举值 以,号隔开,可以自定义常量值
    enum personType{
        man_i =0,
        woman_i
    };
}
