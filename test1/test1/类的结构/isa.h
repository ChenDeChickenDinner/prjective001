//
//  isa.h
//  test1
//
//  Created by xs on 2019/2/22.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface isa : NSObject

@end
/**
 isa指针
 1.在arm64架构之前，isa就是一个普通的指针，存储着Class、Meta-Class对象的内存地址
 2.从arm64架构开始，对isa进行了优化，变成了一个共用体（union）结构，还使用位域来存储更多的信息
 */
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
    /*
     nonpointer
     0，代表普通的指针，存储着Class、Meta-Class对象的内存地址
     1，代表优化过，使用位域存储更多的信息

     has_assoc
     是否有设置过关联对象，如果没有，释放时会更快

     has_cxx_dtor
     是否有C++的析构函数（.cxx_destruct），如果没有，释放时会更快

     shiftcls
     存储着Class、Meta-Class对象的内存地址信息

     magic
     用于在调试时分辨对象是否未完成初始化

     weakly_referenced
     是否有被弱引用指向过，如果没有，释放时会更快

     deallocating
     对象是否正在释放

     extra_rc
     里面存储的值是引用计数器减1

     has_sidetable_rc
     引用计数器是否过大无法存储在isa中
     如果为1，那么引用计数会存储在一个叫SideTable的类的属性中
     */
}
