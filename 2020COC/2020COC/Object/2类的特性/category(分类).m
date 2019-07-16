//
//  category(分类).m
//  2020COC
//
//  Created by xs on 2019/7/15.
//  Copyright © 2019 xax. All rights reserved.
//


#import <Foundation/Foundation.h>


@interface category : NSObject

@end
/** 类扩展(Extension)
 1.可以为某个类扩充一些私有的成员变量 和 方法
 2.类扩展没有名字
 */
@interface category()

@end


/**  分类 (Catepory)
 A.成员变量
 1.分类不能添加属性(成员变量)
 2.分类中的@property,只会生成setter/getter方法的声明,不会生成实现以及私有的所有变量
 3.分类可以访问原来类中的成员变量（分类就是自己）
 
 B.方法
 1.只能新增方法
 2.如果分类中和原有类同名的方法,会调用 分类的方法
 3.如果多个分类中有同名的方法，会执行最后一个编译分类的方法
 */
@interface category(XS)

@end


@implementation category

@end

@implementation category(XS)

@end
