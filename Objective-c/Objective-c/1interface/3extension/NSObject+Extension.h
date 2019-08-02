//
//  NSObject+Extension.h
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 1.可以为元类添加新的属性跟方法，在编译阶段就整合到类的数据结构中去的，就是类的一部分
 2.类扩展无单独的@implementation 部分，必须依托对应类的实现部分来实现，所以你无法为系统的类添加extension
 3.定义在 .m 文件中的类扩展方法为私有的，定义在 .h 文件（头文件）中的类扩展方法为公有的
 */

@interface NSObject ()

@end

