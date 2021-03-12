//
//  ivar_t.h
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ivar_t : NSObject
@property(nonatomic,copy) NSObject *ivar;
@end

/*
Ivar作为一个对象中实际储存信息的变量,它实际上是一个指向ivar_t结构体的指针
struct ivar_t {
    int32_t *offset;//代表了这个变量在内存中相对所属对象内存空间起始地址的偏移量,偏移量大小根据类型来定
    const char *name;//名称
    const char *type;//类型
    uint32_t size; //大小
    uint32_t alignment_raw;
};
typedef struct ivar_t *Ivar;


访问ivar_t对象的ivar成员变量:
1.根据通过 static ivar_t *getIvar(Class cls, const char *name)函数获取到 ivar_t
2.读取 ivar_t 的偏移量
3.根据 ivar_t 的内存首地址做偏移, 定位 ivar 成员变量的实际内存地址

 */
