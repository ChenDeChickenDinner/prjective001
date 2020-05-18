//
//  myProperty.m
//  ObjectDe
//
//  Created by xs on 2019/11/5.
//  Copyright © 2019 xax. All rights reserved.
//

#import "myProperty.h"

/**@property
  1.只有一个作用按规则生成set get方法的声明
 */

/**@synthesize自动合成 为每一个@property添加 @synthesize
1.实现set get 的实现
2.根据规则生成ivar
   a.若未指定则成名 跟@property同名的ivar ，并且不会与原下划线_ivar冲突
   b.根据指定名称生成对应的的ivar
   c.若指定名称的ivar存在则不会再自动生成
3.只要是手动实现了@synthesize 则就可以同时实现set get
4.若未手动实现了@synthesize，在下面的情况下会阻止系统的自动合成
 a.同时重写了setter和getter
 b.重写了只读属性的getter时,或者重写了只写属性的setter时
 c.在 category或者@protocol 中定义的所有属性，注意要实现方法
 d.运用了@dynamic
 */

/**@dynamic
 1.会阻止系统自动合成
 2.在使用的时候注意要实现，运行是会报set get方法没有实现
 */

@interface myProperty()

@end

@implementation myProperty

@end
