//
//  NSObject+xs.h
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 //category本质
 struct category_t {
 const char *name;// 属于哪个类的分类
 classref_t cls;
 struct method_list_t *instanceMethods;//增加的对象方法
 struct method_list_t *classMethods; //增加的类方法
 struct property_list_t *instanceProperties;//实例变量属性
 struct property_list_t *_classProperties; //类对象属性
 struct protocol_list_t *protocols;  //遵守的协议
 method_list_t *methodsForMeta(bool isMeta) {
 if (isMeta) return classMethods;
 else return instanceMethods;
 }
 property_list_t *propertiesForMeta(bool isMeta, struct header_info *hi);
 };
 
 
 typedef struct category_t *Category;
 
 //category加载
 1.编译阶段:一个分类就是一个 category_t 类型的变量
 2.运行时:利用运行时机制把分类中的方法都添加到类跟元类中去
 3.结果:
 1.category的方法没有“完全替换掉”原来类已经有的方法，也就是说如果category和原来类都有methodA，
 那么category附加完成之后，类的方法列表里会有两个methodA
 
 2.category的方法被放到了新方法列表的前面，而原来类的方法被放到了新方法列表的后面，
 这也就是我们平常所说的category的方法会“覆盖”掉原来类的同名方法，
 这是因为运行时在查找方法的时候是顺着方法列表的顺序查找的
 
 3.类对象:[分类方法列表(最后编译的分类在最前面)][分类方法列表][分类方法列表]
 
// 分类对方法调用的影响-方法覆盖
 1.通过方法地址调用的方法 是不受分类影响的，比如分类中的load
 2.通过runtime消息机制调用的方法，分类会对其有影响，造成覆盖的假象
 
 //分类中使用@property
 1.仅仅作为方法的声明使用，一般配合readonly  readwrite,只实现一个
 2.利用关联对象达到添加属性的效果
 
 //分类的方法会被子类继承吗
 */

@interface NSObject (xs1)


/**
 1.在分类中的@property 只能起到声明方法的作用，且要注意实现
 2.一般配合readonly  readwrite,只实现一个
 */
@property(nonatomic,copy,readonly) NSString *nameStr;



@end


@interface XSNSObject:NSObject

@end
