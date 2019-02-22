//
//  ClassStruct.m
//  test1
//
//  Created by xs on 2019/2/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ClassStruct.h"

@implementation ClassStruct

@end

struct objc_object {
    isa_t isa;
}

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
