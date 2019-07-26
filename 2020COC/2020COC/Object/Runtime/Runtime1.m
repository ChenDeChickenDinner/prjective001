//
//  Runtime1.m
//  2020COC
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import "Runtime1.h"

@implementation Runtime1

@end

struct objc_object {
    Class _Nonnull isa ;
};

struct objc_class : objc_object {
    

    Class ISA;
    Class superclass;
    
   
    struct cache_t {
        uintptr_t _key;
        IMP _imp;
        uint32_t _mask;
        uint32_t _occupied;
    };
    cache_t cache;  //  方法缓存
    
    
    struct class_rw_t {
        
      
        struct class_ro_t {
            ivar_list_t * ivars;
            property_list_t *baseProperties;
            method_list_t * baseMethodList;
            protocol_list_t * baseProtocols;
        };
        const class_ro_t *ro;  // 只读信息
        property_list_t *properties;
        method_list_t * methods;
        protocol_list_t * protocols;
    };
    class_rw_t* data;//  类信息
};



typedef struct objc_class *Class;

typedef struct objc_object *id;

typedef struct objc_selector *SEL;

typedef id _Nullable (*IMP)(id _Nonnull, SEL _Nonnull, ...);
