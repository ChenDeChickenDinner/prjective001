//
//  Class_a.m
//  Runtime
//
//  Created by xs on 2021/3/5.
//

#import "Class_a.h"

@interface person : NSObject
@property(nonatomic,copy) NSString *str1;
@end

@implementation person
- (void)text{
    
}
+ (void)text{
    
}
/*
 
 */
+ (void)load{
    /*1.对象模型
    
     基类元类: [NSObject  metaClass]
     基类对象：[NSObject class]
     基类实例对象： [[NSObject alloc]init]
     
     元类： [person  metaClass]
     类对象：[person class]
     实例对象： [[person alloc]init]
     */
    /* 2.对象关系
     
     isa:指向自己所属的类
     1.实例对象:isa--->类对象
     2.类对象:isa--->元类对象
     3.所有的元类对象:isa--->基类元类对象
     4.基类元类对象:isa--->基类元类对象(它自己)
     
     spuerclass:指向自己所属的父类
     1.实例对象:只有Class，无spuerclass
     2.子类(类对象):--->父类(类对象)--->基类(类对象)--->无spuerclass
     3.子类(元类对象):--->父类(元类对象)--->基类(元类对象)--->基类(类对象)
     */
    
    /* 3.对象数据结构构成
     
     
     */
}
@end
4008100120
struct objc_object {
    private:
        isa_t isa;
    
}
（1）isa_t (共用体)
（2）关于isa的相关操作通过objc_object结构体获取它的isa类对象，以及通过类对象的isa获取元类对象的实例以及方法。
（3）弱引用相关的方法（标记一个对象是否曾经有过弱引用指针）
（4）关于关联对象相关的方法。（为对象设置了关联属性，而这些关联属性的方法也体现在objc_object结构体中）
（5）内存管理方法的实现（retain\release@autoReleasePool）



typedef struct objc_object *id;
typedef struct objc_class *Class;
typedef struct method_t *Method;
typedef struct ivar_t *Ivar;
typedef struct category_t *Category;
typedef struct property_t *objc_property_t;
