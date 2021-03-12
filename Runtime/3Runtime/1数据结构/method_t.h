//
//  method_t.h
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface method_t : NSObject

@end


/*
 struct method_t {
 SEL name;
 const char *types;
 IMP imp;
 }
 typedef struct method_t *Method;

SEL
a.SEL代表方法\函数名，一般叫做选择器，底层结构跟char *类似
b.不同类中相同名字的方法，所对应的方法选择器是相同的

IMP imp:是一个函数指针（ typedef id (*IMP)(id, SEL, ...);）
a.指向返回id类型值的方法的指针，是一种C类型
b.每个函数还有两个隐藏的参数(id)self,(SEL)_cmd,这两个都是指针类型,每个占用8个字节
 

*/
