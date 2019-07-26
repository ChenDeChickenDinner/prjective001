//
//  NSObject+category_property.h
//  2020COC
//
//  Created by xs on 2019/7/18.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (category_property)

@end

NS_ASSUME_NONNULL_END

//A.成员变量
//1.分类不能添加属性(成员变量)
//2.分类中的@property,只会生成setter/getter方法的声明,不会生成实现以及私有的所有变量
//3.分类可以访问原来类中的成员变量（分类就是自己）
