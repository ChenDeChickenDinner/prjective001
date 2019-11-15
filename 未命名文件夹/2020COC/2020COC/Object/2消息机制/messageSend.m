//
//  messageSend.m
//  2020COC
//
//  Created by xs on 2019/7/24.
//  Copyright © 2019 xax. All rights reserved.
//

#import "messageSend.h"

@implementation messageSend

@end

/*
 元类 类对象 实例对象/ 类
 1.实例对象
 a.instance-->isa--->Class类对象:找不到
 b.Class->superclass--->父类类对象:父类对象找不到
 c.父类类对象-->superclass--->NSObject.Class基类对象:找不到报方法不存在
 
 2.类对象
 a.Class-->isa--->metaClass元类对象:找不到
 b.metaClass-->superclass--->父类元类对象:找不到
 c.父类元类对象-->superclass--->NSObject基类元类对象:找不到
 d.NSObject基类元类对象-->superclass--->NSObject基类类对象:类方法变对象方法
 
 
 分类参与的方法调用
 + (void)load{
 
 }
 + (void)test{
 
 }
 */
