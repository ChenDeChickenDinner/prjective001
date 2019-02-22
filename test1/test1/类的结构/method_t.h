//
//  method_t.h
//  test1
//
//  Created by xs on 2019/2/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface method_t : NSObject

@end

struct objc_class {
    cache_t cache;             //方法缓存
}
struct class_rw_t { // 可读可写 表
    /*
     methods:[[method_list_t],[method_list_t],[method_list_t]]
     method_list_t:一个类或者分类的方法列表
     */
    method_array_t methods; //方法列表
}
struct class_ro_t { //只读表
    /*
     (method_list_t *):[method_t,method_t,method_t]
     */
    method_list_t * baseMethodList; //方法列表
};

/**
 一个方法信息
 */
struct method_t {
    /*
     1. SEL
     a.SEL代表方法\函数名，一般叫做选择器，底层结构跟char *类似
     b.不同类中相同名字的方法，所对应的方法选择器是相同的

     2.IMP 代表函数的具体实现({})

     3.types(Type Encoding)
     a.iOS中提供了一个叫做@encode的指令，可以将具体的类型表示成字符串编码
     */
    SEL name; // 函数名
    const char *types; //一种编码格式（包含方法的 返回值类型，参数类型，个数）
    IMP imp; //函数地址
};


/**
 一个类/元类对象的方法缓存对象
 */
struct cache_t {
    /* 散列表的实现过程（空间换时间)（参数&value=index）
     1.存入的时候 以 SEL做为key 通过算法 得出一个index,直接存入对应的位置
     2.取出的时候 直接 以SEL(key) 通过算法 得出一个index，取出对应的imp
     */
    /* 方法缓存的逻辑
     1.父类的方法也很缓存到子类的缓存列表中
     2.扩容，会清空缓存
     3.
     */
    struct bucket_t *_buckets; // 散列表
    mask_t _mask; // 散列表的长度-1
    mask_t _occupied; //已经缓存的方法数量
}
struct bucket_t {
    cache_key_t _key; //SEL做为key
    IMP _imp; //方法地址
}
