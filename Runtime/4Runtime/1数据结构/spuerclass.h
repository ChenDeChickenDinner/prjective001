//
//  spuerclass.h
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface spuerclass : NSObject

@end

/*
 spuerclass:(一个Class 类型的指针)
 1.实例对象:只有Class，无spuerclass
 2.子类(类对象):--->父类(类对象)--->基类(类对象)--->无spuerclass
 3.子类(元类对象):--->父类(元类对象)--->基类(元类对象)--->基类(类对象)
 */
