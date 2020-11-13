//
//  03结构体.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/11.
//

#import "03Struct.h"

@implementation _3___
/**
 结构体
 1.样式: struct 类型名{成员变量;成员变量;成员变量}变量名;
 类型名:可省略，省略后就成了 匿名 结构体
 {}:这才是结构体类型的精髓
 变量名:可在定义类型的同事定义一个变量
 */
- (void)test6{
    // 1.定义类型 ，成员变量 以;号隔开
    struct person{
        int age; // 成员变量的类型 可以是任何类型 但，不能嵌套自身类型的变量
        char *name;
        double height;
    };
    
    //    定义类型的同时定义变量
    struct chen{
        int age;
    }value;
    value.age = 10;
    
    //    匿名结构体变量，不能重复复用
    struct {
        int age;
    }value2;
    value2.age = 20;
    
    // 2.初始化
    struct person man = {18,"chen",55.0};
    struct person woman = {18,"chen",55.0};
    
    // 3.成员变量的 访问 修改
    man.age = 17;
    man.name = "xiao";
    man.height = 88.0;
    
    // 4.结构体变量之间 若是相同类型则可以互相赋值，且只做值传递
    man = woman;
}
@end
