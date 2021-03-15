//
//  Block.h
//  1111
//
//  Created by xs on 2020/11/16.
//

#import <Foundation/Foundation.h>

/*
    // block 结构体 FuncPtr 为 block执行的逻辑函数
    struct __main_block_impl_0 {
        struct __block_impl impl;
        struct __main_block_desc_0* Desc;
        // 构造函数（类似于OC的init方法），返回结构体对象
        __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
            impl.isa = &_NSConcreteStackBlock;
            impl.Flags = flags;
            impl.FuncPtr = fp;
            Desc = desc;
        }
    };

    // 封装了block执行逻辑的函数
    static void __main_block_func_0(struct __main_block_impl_0 *__cself) {

    }


    // 定义block变量 = &block结构体
    void (*block)(void) = &__main_block_impl_0(
                                               __main_block_func_0,
                                               &__main_block_desc_0_DATA
                                               );

    // 执行block内部的代码
    block->FuncPtr(block);
 */



