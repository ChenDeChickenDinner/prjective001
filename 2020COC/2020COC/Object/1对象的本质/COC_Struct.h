//
//  COC_Struct.m
//  2020COC
//
//  Created by xs on 2019/7/11.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifndef MJClassInfo_h
#define MJClassInfo_h
#define FAST_DATA_MASK          0x00007ffffffffff8UL
#endif

# if __arm64__
#   define ISA_MASK        0x0000000ffffffff8ULL
# elif __x86_64__
#   define ISA_MASK        0x00007ffffffffff8ULL
# endif

#if __LP64__
typedef uint32_t mask_t;
#else
typedef uint16_t mask_t;
#endif
typedef uintptr_t cache_key_t;
//列表结构体
struct entsize_list_tt {
    uint32_t entsizeAndFlags;
    uint32_t count;
};





#pragma mark-成员结构体



//成员结构体
struct ivar_t {
    int32_t *offset;
    const char *name;
    const char *type;
    uint32_t alignment_raw;
    uint32_t size;
};
//成员列表
struct ivar_list_t : entsize_list_tt {
    ivar_t first;
};



#pragma mark-性结构体
//属性结构体
struct property_t {
    const char *name;
    const char *attributes;
};
//属性列表
struct property_list_t : entsize_list_tt {
    property_t first;
};
struct chained_property_list {
    chained_property_list *next;
    uint32_t count;
    property_t list[0];
};


#pragma mark-方法结构体
//方法结构体
struct method_t {
    SEL name;
    const char *types;
    IMP imp;
};
//方法列表
struct method_list_t : entsize_list_tt {
    method_t first;
};

#pragma mark-协议列表
//协议列表
typedef uintptr_t protocol_ref_t;
struct protocol_list_t {
    uintptr_t count;
    protocol_ref_t list[0];
};




#pragma mark-Class只读信息
struct class_ro_t {
    uint32_t flags;
    uint32_t instanceStart;
    uint32_t instanceSize;  // instance对象占用的内存空间
#ifdef __LP64__
    uint32_t reserved;
#endif
    const uint8_t * ivarLayout;
    const char * name;  // 类名
    method_list_t * baseMethodList;
    protocol_list_t * baseProtocols;
    const ivar_list_t * ivars;  // 成员变量列表
    const uint8_t * weakIvarLayout;
    property_list_t *baseProperties;
};

#pragma mark-Class可读可写信息
struct class_rw_t {
    uint32_t flags;
    uint32_t version;
    const class_ro_t *ro;               // 只读信息
    property_list_t *properties;        // 属性列表
    method_list_t * methods;            // 方法列表
    const protocol_list_t * protocols;  // 协议列表
    Class firstSubclass;
    Class nextSiblingClass;
    char *demangledName;
};



#pragma mark-isa
union isa_t {
    Class cls;
    uintptr_t bits;
    isa_t() { }
    isa_t(uintptr_t value) : bits(value) { }
};


#pragma mark-类的缓存信息
struct bucket_t {
    cache_key_t _key;
    IMP _imp;
};

struct cache_t {
    bucket_t *_buckets;
    mask_t _mask;
    mask_t _occupied;
};

#pragma mark-类信息
struct class_data_bits_t {
    uintptr_t bits;
public:
    class_rw_t* data() {
        return (class_rw_t *)(bits & FAST_DATA_MASK);
    }
};


#pragma mark-OC对象的根_结构体
struct mj_objc_object {
    void *isa;
    
    isa_t isa2;
};
typedef struct objc_object *id;


#pragma mark-OC元类对象与类对象的类型(isa superclass/属性信息/成员信息/方法信息/协议信息)
struct mj_objc_class : mj_objc_object {
    Class ISA;
    Class superclass;
    cache_t cache;          //方法缓存
    class_data_bits_t bits; //类信息
public:
    class_rw_t* data() {
        return bits.data();
    }
};
typedef struct mj_objc_class *Class;



