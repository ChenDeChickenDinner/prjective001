//
//  ISA.m
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import "ISA.h"

@implementation ISA

@end
/* OC 三大对象之间的关系: isa（一个Class 类型的指针）
 1.实例对象:isa--->类对象
 2.类对象:isa--->元类对象
 3.所有的元类对象:isa--->基类元类对象
 4.基类元类对象:isa--->基类元类对象(它自己)
 实例对象                   类对象                      基类元类对象                          它类元类对象
 [[NSObject alloc]init]---> [NSObject class]---> object_getClass([NSObject class]) <----- object_getClass([NSObjectXS class])
 */
