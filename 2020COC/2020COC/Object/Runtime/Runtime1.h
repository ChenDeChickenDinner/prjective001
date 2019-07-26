//
//  Runtime1.h
//  2020COC
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Runtime1 : NSObject

@end
/*
 method_array_t methods;
 property_array_t properties;
 protocol_array_t protocols;

 */

struct method_t {
    SEL name;
    const char *types;
    IMP imp;
};

/**
 typedef struct objc_selector *SEL;

 SEL name: @selector(test:height:)
 1.SEL 方法选择器,只是描述了一个方法的格式,只是方法的编号，方法ID
 2.Objective-C 中的方法名是不包括参数类型的，
 3.SEL只和方法标签格式有关，并不绑定类，对于一个多态的方法，可以用同一个SEL去
 
 
 
 const char *types: 0x0000000101759dbf "i24@0:8i16f20"
 1. 1.表示的是方法的返回值和参数类型
 2.具体含义如下:
 i:代表返回值的类型是int
 24:代表这个函数的大小,
 @ : id类型,第一个参数self
 0 : 从多少个字节开始
 : : 第二个参数_cmd
 8 : 从第8个字节开始,前面只有一个self,占用8个字节
 i : int类型age
 16 : 从第16个字节开始
 f  : float类型
 20 : 从第20个字节开始
 
 IMP imp:是一个函数指针（ typedef id (*IMP)(id, SEL, ...);）
 1.指向返回id类型值的方法的指针，是一种C类型
 2.每个函数还有两个隐藏的参数(id)self,(SEL)_cmd,这两个都是指针类型,每个占用8个字节
 
 */
