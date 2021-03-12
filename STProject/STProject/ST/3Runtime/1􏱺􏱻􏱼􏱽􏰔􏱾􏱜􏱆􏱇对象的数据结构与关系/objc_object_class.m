//
//  objc_object_class.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "objc_object_class.h"

#pragma warning-对象模型(三大对象)

元类对象(meta-class)
typedef struct objc_class *Class;

struct objc_class : objc_object {
    Class ISA; 
    Class superclass;
    cache_t cache;
    class_data_bits_t bits;
    class_rw_t *data() const {
        const class_ro_t *ro{
            uint32_t instanceSize; //
            const char * name; //
            const ivar_list_t * ivars;//
            property_list_t * baseProperties;//
            method_list_t   * baseMethodList;//
            protocol_list_t * baseProtocols;//
        };

        property_array_t properties;//
        method_array_t methods;//
        protocol_array_t protocols;//
        
    }

};



类对象(class)
typedef struct objc_class *Class;
struct objc_class : objc_object {
    Class ISA;
    Class superclass;
    cache_t cache;
    class_data_bits_t bits;
    class_rw_t *data() const {
        const class_ro_t *ro{
            uint32_t instanceSize; //
            const char * name; //
            const ivar_list_t * ivars;//
            property_list_t * baseProperties;//
            method_list_t   * baseMethodList;//
            protocol_list_t * baseProtocols;//
        };

        property_array_t properties;//
        method_array_t methods;//
        protocol_array_t protocols;//
        
    }

};

实例对象(Instance)
typedef struct objc_object *id;

struct objc_object {
    isa_t isa{
        Class cls: class 指针
        uintptr_t bits: 通过 bits 做位操作 对 struct进行取值
        struct: ISA_BITFIELD 对象信息
        uintptr_t nonpointer        : 1;  // 0:普通指针，1:优化过，使用位域存储更多信息
        uintptr_t has_assoc         : 1;  // 对象是否含有或曾经含有关联引用
        uintptr_t has_cxx_dtor      : 1;  // 表示是否有C++析构函数或OC的dealloc
        uintptr_t shiftcls          : 33; // 存放着 Class、Meta-Class 对象的内存地址信息
        uintptr_t magic             : 6;  // 用于在调试时分辨对象是否未完成初始化
        uintptr_t weakly_referenced : 1;  // 是否被弱引用指向
        uintptr_t deallocating      : 1;  // 对象是否正在释放
        uintptr_t has_sidetable_rc  : 1;  // 是否需要使用 sidetable 来存储引用计数
        uintptr_t extra_rc          : 19;  // 引用计数能够用 19 个二进制位存储时，直接存储在这里
    };
};


#pragma warning-对象关系
/* isa:指向自己所属的类
 1.实例对象:isa--->类对象
 2.类对象:isa--->元类对象
 3.所有的元类对象:isa--->基类元类对象
 4.基类元类对象:isa--->基类元类对象(它自己)
 */

/* spuerclass:指向自己所属的父类
 1.实例对象:只有Class，无spuerclass
 2.子类(类对象):--->父类(类对象)--->基类(类对象)--->无spuerclass
 3.子类(元类对象):--->父类(元类对象)--->基类(元类对象)--->基类(类对象)
 */
