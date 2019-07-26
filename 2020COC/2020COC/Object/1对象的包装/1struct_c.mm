//
//  COC_Struct.m
//  2020COC
//
//  Created by xs on 2019/7/11.
//  Copyright © 2019 xax. All rights reserved.
//
1.c c++ 是静态语言

2.OC作为动态语言为了达到在程序运行期，动态的修改，必须想办法将静态语言在编译期决定的事情，推迟到运行期来做

3.RunTime为OC的动态运行提供支持




1.底层数据结构




2.面向对象





3.消息机制


4.RunTime的运行加载

5.runtime API
2.消息转发
2.方法交互

#import <Foundation/Foundation.h>

typedef uint32_t mask_t;
//列表结构体
struct entsize_list_tt {
    uint32_t entsizeAndFlags;
    uint32_t count;
};

//成员变量
struct ivar_t {
    int32_t *offset;
    const char *name;
    const char *type;
    uint32_t alignment_raw;
    uint32_t size;
};

//@property
struct property_t {
    const char *name;
    const char *attributes;
};


//方法
struct method_t {
    SEL name;
    const char *types;
    IMP imp;
};


//成员列表
struct ivar_list_t : entsize_list_tt {
    ivar_t first;
};
//属性列表
struct property_list_t : entsize_list_tt {
    property_t first;
};

//方法列表
struct method_list_t : entsize_list_tt {
    method_t first;
};

//协议列表
struct protocol_list_t {
    uintptr_t count;
    uintptr_t list[0];
};


struct mj_objc_object {
    Class cls;
};
typedef struct objc_object *id;


struct mj_objc_class : mj_objc_object {

//  isa superclass
    Class ISA;
    Class superclass;
    
//  方法缓存
    struct cache_t {
        uintptr_t _key;
        IMP _imp;
        uint32_t _mask;
        uint32_t _occupied;
    };
    cache_t cache;
    
//  类信息
    struct class_rw_t {
        
      // 只读信息
        struct class_ro_t {
            
            // 成员变量列表 属性列表 方法列表 协议列表
            ivar_list_t * ivars;
            property_list_t *baseProperties;
            method_list_t * baseMethodList;
            protocol_list_t * baseProtocols;
        };
        const class_ro_t *ro;
        
    // 属性列表 方法列表 协议列表
        property_list_t *properties;
        method_list_t * methods;
        protocol_list_t * protocols;
    };
    class_rw_t* data;
};
typedef struct mj_objc_class *Class;






