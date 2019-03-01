//
//  classStruct.m
//  2019OC
//
//  Created by xs on 2019/2/25.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "classStruct.h"

@implementation classStruct

@end
/**
 Class的底层结构
 */
struct objc_class:objc_object {
    //Class ISA;
    Class superclass;
    cache_t cache;             //方法缓存
    class_data_bits_t bits;    //用于获取类的详细信息

    class_rw_t *data() { //
        return  (class_rw_t *)(bits & FAST_DATA_MASK);
    }
}

struct class_rw_t { // 可读可写 表
    const class_ro_t *ro;  //只读表
    method_array_t methods; //方法列表
    property_array_t properties; //属性列表
    protocol_array_t protocols; //协议列表
    /*
     methods、properties、protocols是二维数组，是可读可写的，包含了类的初始内容、分类的内容
     methods:[[method_list_t],[method_list_t],[method_list_t]]
     method_list_t:一个类或者分类的方法列表
     */
}
struct class_ro_t { //只读表

    uint32_t instanceSize; //成员变量所占字节
    const char * name; //类名
    method_list_t * baseMethodList; //方法列表
    protocol_list_t * baseProtocols; //协议列表
    const ivar_list_t * ivars; //成员变量列表
    /*
     baseMethodList、baseProtocols、ivars、baseProperties是一维数组，是只读的，包含了类的初始内容
     (method_list_t *):[method_t,method_t,method_t]
     */
};


/**
 分类底层结构体，每一个分类就是一个结构体指针
 */
struct category_t {
    const char *name;
    classref_t cls;
    struct method_list_t *instanceMethods;
    struct method_list_t *classMethods;
    struct protocol_list_t *protocols;
    struct property_list_t *instanceProperties;
    // Fields below this point are not always present on disk.
    struct property_list_t *_classProperties;

    method_list_t *methodsForMeta(bool isMeta) {
        if (isMeta) return classMethods;
        else return instanceMethods;
    }

    property_list_t *propertiesForMeta(bool isMeta, struct header_info *hi);
};
static void test1(){
    { // class
        Class class1 = Nil;

        /* Class 类型
         1.类对象 以及元类对象的类型 都是 Class
         2.Class 是 struct objc_class * 结构体 指针
         */
        /* struct objc_class 结构体 组成解析
         */


        {1.Class isa;
            a.instance实例对象的isa指向class类对象
            b.class类对象的isa指向meta-class元类对象
            c.所有meta-class元类对象的isa指向基类的meta-class
            d.基类的meta-class元类对象的isa指向基类的class类对象（类方法最后成了对象方法）
        }
        {2.superclass
            1.实例对象的superclass--->父类————>基类(到顶)
            2.类对象的superclass--->父类的类对象————>基类的类对象
            3.元类对象的superclass--->父类的元类对象————>基类的元类对象
            4.基类的类对象的superclass = nil;
            5.基类的元类对象的superclass = 基类的类对象的
        }
    }
    { // meta-class对象（元类对象）
        /*
         每个类在内存中有且只有一个meta-class对象

         */
        NSObject *object1 = [[NSObject alloc] init];
        // 传递实例对象 获取类对象
        Class objectClass1 = object_getClass(object1);
        // 传递类对象 获取元类对象
        Class objectClass2 = object_getClass(objectClass1);
        // 判断是否是元类对象
        BOOL resule = class_isMetaClass(objectClass2);
    }
    { // class对象（类对象）
        /*
         1.每个类在内存中有且只有一个class对象
         */
        NSObject *object1 = [[NSObject alloc] init];
        Class objectClass0 = [NSObject class];
        Class objectClass1 = [object1 class];
        Class objectClass3 = object_getClass(object1);


    }

    {
        /* 1.Class objc_getClass(const char *aClassName)
         1> 传入字符串类名
         2> 返回对应的类对象
         */
        /*  2.object_getClass(id _Nullable obj) 的底层实现（根据参数对象的isa）
         1.如果是 实例对象 返回实例对象 isa 所指向的对象(类对象)
         2.如果是class对象，返回meta-class对象
         3.如果是meta-class对象，返回NSObject（基类）的meta-class对象
         */

        /* - (Class)class、+ (Class)class 的底层实现
         1> 返回的就是类对象
         - (Class) {
         return self->isa;
         }
         + (Class) {
         return self;
         }
         */
    }
}
