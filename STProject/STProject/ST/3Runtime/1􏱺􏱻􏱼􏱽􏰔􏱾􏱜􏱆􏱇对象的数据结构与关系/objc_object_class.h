//
//  objc_object.h
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import <Foundation/Foundation.h>


isa_t:
 union isa_t {
     isa_t() { } //构造函数
     isa_t(uintptr_t value) : bits(value) { } //构造函数

     Class cls; // class 指针
     uintptr_t bits; // typedef unsigned long uintptr_t; 64位
 #if defined(ISA_BITFIELD)
     struct {
         ISA_BITFIELD;  //对象信息
     };
 #endif
 };
isa_t是一种联合类型的联合体:
1.包含有cls，bits， struct三个变量，它们的内存空间是重叠的。占据64位内存
2.在实际使用时，仅能够使用它们中的一种，你把它当做cls，就不能当bits访问，你把它当bits，就不能用cls来访问

.它有两个构造函数
isa_t():
isa_t(uintptr_value):


.它有三个数据成员
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






objc_object:
struct objc_object {
private:
    isa_t isa; // 指向自己所属的类
};




struct objc_class : objc_object {
    Class ISA; //自身Class类型
    Class superclass; // 父类Class类型
    
    /* 方法缓存
    散列表的实现过程（空间换时间)（参数&value=index）
    1.存入的时候 以 SEL做为key 通过算法 得出一个index,直接存入对应的位置
    2.取出的时候 直接 以SEL(key) 通过算法 得出一个index，取出对应的imp

    方法缓存的逻辑
    1.父类的方法也很缓存到子类的缓存列表中
    2.扩容，会清空缓存
    struct bucket_t {
        cache_key_t _key; //SEL做为key
        IMP _imp; //方法地址
    }
    struct cache_t {
        struct bucket_t *_buckets; // 散列表
        mask_t _mask; // 散列表的长度-1
        mask_t _occupied; //已经缓存的方法数量
    }
    */
    cache_t cache;
    
    /*类信息
     .存储类的属性、方法、遵循的协议等信息的地方
     1.在编译后 bits 指向的是一个class_ro_t的地址
     2.在运行时 bits 指向的是一个class_rw_t的地址
     3.在程序运行后，初始化class,在这个过程中会
       1.把编译器存储在 bits中的class_ro_t取出，
       2.创建class_rw_t
       3.将class_ro_t赋值给class_rw_t让其成为一个不可变的成员变量
       4.将class_rw_t 设置给bits,代替之前的class_ro_t
     2.bits.data返回 class_rw_t 的地址
     */
    class_data_bits_t bits;

    /*
     
     */
    class_rw_t *data() const {
        return bits.data(); // return (class_rw_t *)(bits & FAST_DATA_MASK);
    }
    
    
    
    /*
     在编译阶段就已经确定的信息，运行后也不会被更改
     ivars:不会被copy到 class_rw_t 中去，class_rw_t中也没有这个字段
     baseProperties、baseMethodList、baseProtocols:会被copy到 class_rw_t 中去
     */
    struct class_ro_t {
        uint32_t instanceSize; //成员变量所占字节
        const char * name; //类名
        
        //指向成员变量列表的指针
        const ivar_list_t * ivars;
        
        //属性列表
        property_list_t * baseProperties;
        
        //存放方法列表, 根据info中的标识信息, 若为普通类则存放实例方法; 若为元类则存放类方法。
        method_list_t   * baseMethodList;
        
        // 类需要遵守的协议列表。
        protocol_list_t * baseProtocols;
    }

    /*
     在运行后才被创建的，且动态添加的信息都是添加到这里面
     */
    struct class_rw_t {
        uint32_t flags;
        uint16_t version;
        uint16_t witness;

        /*
         
         */
        const class_ro_t *ro;

        //所有的属性列表(
        property_array_t properties;
        
        //所有的方法列表
        method_array_t methods;
        
        //遵守的所有协议
        protocol_array_t protocols;

        Class firstSubclass;
        Class nextSiblingClass;

        char *demangledName;
        
    }

};
struct protocol_t : objc_object {
    Class ISA; //自身Class类型 Protocol 类型
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
    
}
