//
//  ObjectStruct.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ObjectStruct.h"
/**  isa指针
 1.在arm64架构之前，isa就是一个普通的指针，存储着Class、Meta-Class对象的内存地址
 2.从arm64架构开始，对isa进行了优化，变成了一个共用体（union）结构，还使用位域来存储更多的信息
 union isa_t{
 Class cls;
 uintptr_t bits;
 #   define ISA_MASK        0x00007ffffffffff8ULL
 #   define ISA_MAGIC_MASK  0x001f800000000001ULL
 #   define ISA_MAGIC_VALUE 0x001d800000000001ULL
 struct {
 uintptr_t nonpointer        : 1;
 uintptr_t has_assoc         : 1;
 uintptr_t has_cxx_dtor      : 1;
 uintptr_t shiftcls          : 44; // MACH_VM_MAX_ADDRESS 0x7fffffe00000
 uintptr_t magic             : 6;
 uintptr_t weakly_referenced : 1;
 uintptr_t deallocating      : 1;
 uintptr_t has_sidetable_rc  : 1;
 uintptr_t extra_rc          : 8;
 };
 }
 */

/**
 //类对象 元类对象的 可读可写 表
 struct class_rw_t {

 methods:[[method_list_t],[method_list_t],[method_list_t]]
 method_list_t:一个类或者分类的方法列表

 method_array_t methods; //方法列表
 }
 //类对象 元类对象的 只读表
 struct class_ro_t {

 (method_list_t *):[method_t,method_t,method_t]

 method_list_t * baseMethodList; //方法列表
 };


 //一个方法信息
 struct method_t {

 1. SEL
 a.SEL代表方法\函数名，一般叫做选择器，底层结构跟char *类似
 b.不同类中相同名字的方法，所对应的方法选择器是相同的

 2.IMP 代表函数的具体实现({})

 3.types(Type Encoding)
 a.iOS中提供了一个叫做@encode的指令，可以将具体的类型表示成字符串编码

 SEL name; // 函数名
 const char *types; //一种编码格式（包含方法的 返回值类型，参数类型，个数）
 IMP imp; //函数地址
 };



 //一个类/元类对象的方法缓存对象
 struct cache_t {
 散列表的实现过程（空间换时间)（参数&value=index）
 1.存入的时候 以 SEL做为key 通过算法 得出一个index,直接存入对应的位置
 2.取出的时候 直接 以SEL(key) 通过算法 得出一个index，取出对应的imp

 方法缓存的逻辑
 1.父类的方法也很缓存到子类的缓存列表中
 2.扩容，会清空缓存
 struct bucket_t *_buckets; // 散列表
 mask_t _mask; // 散列表的长度-1
 mask_t _occupied; //已经缓存的方法数量
 }
 struct bucket_t {
 cache_key_t _key; //SEL做为key
 IMP _imp; //方法地址
 }

 */
@implementation ObjectStruct

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
