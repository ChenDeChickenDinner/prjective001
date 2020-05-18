//
//  runtimeStruct.m
//  Runtime
//
//  Created by xs on 2019/11/7.
//  Copyright © 2019 xax. All rights reserved.
//

#import "runtimeStruct.h"

@implementation runtimeStruct

/*runtime对象模型整体设计模式
runtime:是一个共享动态库
1.是一套由C C++ 汇编实现的API
2.定义了整个OC对象的数据结构
3.对NSObject定义了一些基础操作
4.为OC的运行提供运行环境，为上层OC源码提供实现以及转换


对象模型：runtime对OC对象实现的设计
1.一个程序的运行需要无数个具体各种功能的对象
:具有什么能力，携带什么类型的信息，以及携带的是什么信息
2.设计出一种数据结构，这个数据结构能满足以上各种功能需要(objc_class结构体)
:objc_class 中的属性列表  成员变量列表 方法列表 协议列表 等等 功能性属性元素
3.出于性能考虑需要优化出一种能抽象出层次关系的设计:(三大对象类型，基类，继承)
:objc_class 中的 isa superclass 就是对层次关系的实现
4.归纳抽象出 objc_class结构体 Clas 类型，所有对象都是 objc_class 类型的结构体

5.OC的三大对象类型:为什么要设计出这三大类型:一个类的功能:
:可以携带信息的类型-成员属性
:不需要具体的实例对象就可以调用的方法-类方法
:需要具体的实例信息才可以调用的方法-对象方法
:无数个不同信息 相同功能的对象


6.满足以上需要设计出三种类型的对象
meta-class 对象（元类对象）:
:决定类对象具有什么能力(类方法):遵从设计原则 根据isa找方法
:每个类在内存中有且只有一个meta-class对象

class 对象（类对象）:
:决定实例对象能携带什么类型的信息(属性)，以及具体什么能力(对象方法)
:每个类在内存中有且只有一个class对象

instance 对象(实例对象):
:表示这个对象在限制的属性信息下具体能携带什么值
:每个类可以实例化无数个实例对象

OC的三大类型对象之间的关系 isa指针：
:指向一个Class类型对象的地址指针，可以是类对象 也可以是元类对象
:作用是根据指向的这个对象找方法列表，实现 元类对象 类对象 实例对象之间的关系
NSObject对象--isa-->NSObject类对象--isa-->NSObject元类对象(isa指向它自己)
subClass对象--isa-->subClass类对象--isa-->subClass元类对象(isa指向基类元类对象)

7.superclass指针:描述类之间的继承关系以及OC中所以的类都继承自NSObject
:指向一个Class类型对象的地址指针，可以是类对象 也可以是元类对象，也可以是nil
实例对象没有 superclass
子类类对象---->父类类对象--->NSObject类对象-->nil
子类元类对象---->父类元类对象--->NSObject元类对象-->NSObject类对象
*/
+ (void)load1{
    
    {
         struct ivar_t {
             const char *name;
             const char *type;
             int32_t *offset;
             uint32_t alignment_raw;
             uint32_t size;
         };
         typedef struct ivar_t *Ivar;

         
        struct property_t {
            const char *name;
            const char *attributes;
        };
         typedef struct property_t *objc_property_t;

         
         typedef struct objc_selector *SEL;//SEL代表方法\函数名，一般叫做选择器，底层结构跟char *类似
         typedef void (*IMP)(void /* id, SEL, ... */ );//C函数指针
         struct method_t {
             SEL name;// 函数名
             const char *types; //一种编码格式（包含方法的 返回值类型，参数类型，个数）
             IMP imp; //函数地址
         };
         typedef struct method_t *Method;
    }
    {
        struct isa_t {
            Class cls;
            uintptr_t bits;
        };
        struct objc_object {
            isa_t isa;
        }
        typedef struct objc_object *id;
    }
    {
        //只读表
        struct class_ro_t {
            const char * name; //类名
            method_list_t * baseMethodList; //方法列表
            protocol_list_t * baseProtocols; //协议列表
            const ivar_list_t * ivars; //成员变量列表
            /*
             baseMethodList、baseProtocols、ivars、baseProperties是一维数组，是只读的，包含了类的初始内容
             (method_list_t *):[method_t,method_t,method_t]
             */
        };
        // 可读可写 表
        struct class_rw_t {
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
        
        struct objc_class:objc_object {
            Class superclass;          //父类
            cache_t cache;             //方法缓存
            class_data_bits_t bits;    //用于获取类的详细信息

            class_rw_t *data() { //
                return  (class_rw_t *)(bits & FAST_DATA_MASK);
            }
        }
        typedef struct objc_class *Class;
    }
    {
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
        typedef struct category_t *Category;

    }
    {
        struct protocol_t : objc_object {
        const char *mangledName;
        struct protocol_list_t *protocols;
        method_list_t *instanceMethods;
        method_list_t *classMethods;
        method_list_t *optionalInstanceMethods;
        method_list_t *optionalClassMethods;
        property_list_t *instanceProperties;
        uint32_t size;   // sizeof(protocol_t)
        uint32_t flags;
        // Fields below this point are not always present on disk.
        const char **_extendedMethodTypes;
        const char *_demangledName;
        property_list_t *_classProperties;
        }
    }

}

+ (void)load{


}




@end
