//
//  NSPredicatec.h
//  Runtime
//
//  Created by xs on 2020/12/10.
//  Copyright © 2020 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Personx : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *age;

+ (id)personWithName:(NSString *)name
                 age:(NSNumber *)age;
@end
@interface NSPredicatec : NSObject
/*
 NSPredicate:谓词
 NSComparisonPredicate:比较谓词，通过左右两表达式组合来评估对象
 NSCompoundPredicate:复合谓词，通过多个谓词进行AND、OR、NOT组合来评估对象。

 
 NSPredicate
 1.是基础库中用来过滤获取数据的类，类似于SQL中的where语句，但它提供了更为自然且高级的语言，在数据集合的查询上去定义了逻辑条件语句
 2.使用时主要分两步走：第一步，定义谓词语句；第二步，根据要求，选择不同的方法执行谓词语句
 3. 基本语法
 
 比较运算符
 = , == : 判断两个表达式是否相等
 >= , => : 判断左边表达式的值是否大于或等于右边表达式的值
 <= , =< : 判断左边表达式的值是否小于或等于右边表达式的值
 > : 判断左边表达式的值是否大于右边表达式的值
 < : 判断左边表达式的值是否小于右边表达式的值
 != , <> : 判断左边表达式的值是否不相等右边表达式的值

 逻辑运算符
 && , AND : 逻辑与，要求左右表达式的值都为YES，结果才为YES
 || , OR : 逻辑或，要求只要左右表达式中有一个的值都为YES，结果就为YES
 ! , NOT : 逻辑非，对原有表达式取反

 
 集合运算符
 BETWEEN ：必须满足表达式 BETWEEN {下限, 上限}的格式，要求该表达式必须大于或等于下限，并小于或等于上限
 IN ：必须满足表达式 IN {元素0, 元素1, 元素2...}的格式，要求该表达式必须包含有{}中的任一元素
 ANY , SOME : 集合中任意一个元素满足条件，就返回YES
 ALL : 集合所有元素满足条件，才返回YES
 NONE : 集合中没有任何元素元素满足条件，就返回YES
 
 字符串间运算符
 BEGINSWITH : 检查某个字符串是否以指定的字符串
 ENDSWITH : 检查某个字符串是否以指定的字符结尾
 CONTAINS : 检查某个字符串是否包含指定的字符串
 LIKE : 检查某个字符串是否匹配指定的字符串模板
 ? : 通配符代表一个任意字符
 * : 通配符代表任意多个字符
 如果希望字符串比较运算不区分大小写和重音符号，请在这些运算符后使用[c]，[d]选项。其中[c]是不区分大小写，[d]是不区分重音符号
 
 
 %K : 字段占位符 (K必须是大写)
 %@ : 值占位符
 $VALUE : VALUE只是一个普通字符串，当做标识使用，可以任意替换，但要统一
 */
@end


