//
//  objc_class.h
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface objc_class : NSObject

@end

 
/*



struct objc_object {
    isa_t isa;
}

 Class类型结构
struct objc_class : objc_object {
    Class ISA;
    Class superclass;
    cache_t cache;   //方法缓存
    class_data_bits_t bits; //用于获取类的详细信息
}


 可读可写表：  methods、properties、protocols是二维数组，是可读可写的，包含了类的初始内容、分类的内容
struct class_rw_t {
    const class_ro_t *ro;  //只读表
    property_array_t properties; //属性列表
    method_array_t methods; //方法列表
    protocol_array_t protocols; //协议列表
    
property_array_t:[property_list_t,property_list_t,property_list_t]
method_array_t:[method_list_t,method_list_t,method_list_t]
protocol_array_t:[protocol_list_t,protocol_list_t,protocol_list_t]
}

只读表： baseMethodList、baseProtocols、ivars、baseProperties是一维数组，是只读的，包含了类的初始内容
struct class_ro_t {
    
    uint32_t instanceSize; //成员变量所占字节
    const char * name; //类名
    property_list_t * baseProperties;
    const ivar_list_t * ivars; //成员变量列表
    method_list_t   * baseMethodList; //方法列表
    protocol_list_t * baseProtocols; //协议列表
    
    
ivar_list_t:[Ivar,Ivar,Ivar]
    
property_list_t:[property_t,property_t,property_t]
    
method_list_t:[method_t,method_t,method_t]
    
protocol_list_t:[protocol_ref_t,protocol_ref_t,protocol_ref_t]
};
*/
