//
//  NSObject+category_sel.m
//  2020COC
//
//  Created by xs on 2019/7/18.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 分类的结构
 struct category_t {
 const char *name;// 属于哪个类的分类
 classref_t cls;
 struct method_list_t *instanceMethods;//增加的对象方法
 struct method_list_t *classMethods; //增加的类方法
 struct protocol_list_t *protocols;  //遵守的协议
 struct property_list_t *instanceProperties;//实例变量属性
 struct property_list_t *_classProperties; //类对象属性
 method_list_t *methodsForMeta(bool isMeta) {
 if (isMeta) return classMethods;
 else return instanceMethods;
 }
 property_list_t *propertiesForMeta(bool isMeta, struct header_info *hi);
 };
 
 1.每一个分类都是一个 category_t 变量 可以保存若干信息
 */
@interface NSObject (category_sel)




@end


@implementation NSObject (category_sel)


/**
 1.分类的作用:为类添加新方法
 a.这里的load不是重写覆盖，就是一个独立的新的方法，所有一个类中可能存在多个相同的方法，实现不一样
 b.新方法 不受任何因素影响 只要是写了了就是一个独立的方法
 */
+ (void)load{
    
}
+ (void)test{
    
}
/*
 分类的原理
 1.编译阶段:一个分类就是一个 category_t 类型的变量
 2.运行时:利用运行时机制把分类中的方法都添加到类跟元类中去
 类对象:[分类方法列表(最后编译的分类在最前面)][分类方法列表][分类方法列表]
 */


@end

