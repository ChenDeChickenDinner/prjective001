//
//  对象.m
//  2020COC
//
//  Created by xs on 2019/7/18.
//  Copyright © 2019 xax. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface XSHU : NSObject
@end

@implementation XSHU

/** typedef struct mj_objc_class *Class;
 1.元类对象: struct mj_objc_class *Class 类型
 method_list_t * methods:类方法
 
 2.类对象:   struct mj_objc_class *Class 类型
 ivar_list_t * ivars:成员变量
 property_list_t *properties:属性信息
 method_list_t * methods:对象方法
 protocol_list_t * protocols:协议
 
 3.所有类的 元类对象 或者类对象都是 Class 类型， 包括基类
 */
+ (void)test1{
    
    //元类对象
    Class object_meatClass = object_getClass([NSObject class]);
    
    //类对象
    Class object_class1 = [NSObject class];
    Class object_class2 = [[NSObject class] class];
    Class object_class3 = object_getClass([[NSObject alloc]init]);
    
    object_class3 = Nil;
}


/** typedef struct objc_object *id;
 1.是一种通用指针类型，是一种弱类型，编译时不进行类型检查
 2.当指向类对象 或者元类对象的时候 运行过程中仍然是id类型的
 3.当指向实例对象时候，运行过程中能确定其具体的类型
 */
+ (void)test2{
    id  ob1 = [[NSObject alloc]init];
    id  ob2 = [NSObject class]; // 运行后任然是id 类型 不是class 类型
    ob2 = nil;
}


/**instancetype(实例对象)
 1.只能指向实例对象
 3.instancetype 只能用于作为返回值类型
 2.instancetype 在编译的时候 可以判断对象的真实类型，及而能知道对象有哪些方法属性，以来判断调用是否合法
 4.但凡自定义构造方法, 返回值尽量使用instancetype,不要使用id(id不能判断对象的真实类型)
 5.在工作构造方法中 为避免继承语法因素最好与self结合使用
 */
+ (instancetype)test3{
    return [[self alloc]init];
}

/* OC 三大对象之间的关系: isa（一个Class 类型的指针）
 1.实例对象:isa--->类对象
 2.类对象:isa--->元类对象
 3.所有的元类对象:isa--->基类元类对象
 4.基类元类对象:isa--->基类元类对象(它自己)
 实例对象                   类对象                      基类元类对象                          它类元类对象
 [[NSObject alloc]init]---> [NSObject class]---> object_getClass([NSObject class]) <----- object_getClass([NSObjectXS class])
 */
@end
