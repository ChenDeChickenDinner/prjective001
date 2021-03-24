//
//  ISA.m
//  MRC
//
//  Created by xs on 2021/3/22.
//

#import "ISA.h"
/*
 NONPOINTER_ISA同样是苹果公司对于内存优化的一种方案。
 用 64 bit 存储一个内存地址显然是种浪费，毕竟很少有那么大内存的设备。
 于是可以优化存储方案，用一部分额外空间存储其他内容。
 isa 指针第一位为 1 即表示使用优化的 isa 指针，
 这里列出在__x86_64__架构下的 64 位环境中 isa 指针结构，__arm64__的架构会有所差别

 union isa_t {
     isa_t() { }
     isa_t(uintptr_t value) : bits(value) { }

     Class cls;
     uintptr_t bits;
 #if defined(ISA_BITFIELD)
     struct {
       uintptr_t nonpointer        : 1;
       uintptr_t has_assoc         : 1;
       uintptr_t has_cxx_dtor      : 1;
       uintptr_t shiftcls          : 44;
       uintptr_t magic             : 6;
       uintptr_t weakly_referenced : 1;
       uintptr_t deallocating      : 1;
       uintptr_t has_sidetable_rc  : 1;
       uintptr_t extra_rc          : 8
     };
 #endif
 };

 nonpointer：示是否对isa开启指针优化。0代表是纯isa指针，1代表除了地址外，还包含了类的一些信息、对象的引用计数等
 has_assoc：关联对象标志位，0没有，1存在。
 has_cxx_dtor：该对象是否有C++或Objc的析构器，如果有析构函数，则需要做一些析构的逻辑处理，如果没有，则可以更快的释放对象。
 shiftcls：存在类指针的值，开启指针优化的情况下，arm64位中有33位来存储类的指针
 magic：判断当前对象是真的对象还是一段没有初始化的空间
 weakly_referenced：是否被指向或者曾经指向一个ARC的弱变量，没有弱引用的对象释放的更快。
 deallocating：标志是否正在释放内存。
 has_sidetable_rc：是否有辅助的引用计数散列表。当对象引⽤技术⼤于 10 时，则需要借⽤该变量存储进位。
 extra_rc：表示该对象的引⽤计数值，实际上是引⽤计数值减 1，例如，如果对象的引⽤计数为 10，那么 extra_rc 为 9。如果引⽤计数⼤于 10，则需要使⽤到下⾯的 has_sidetable_rc。

 作者：夜幕降临耶
 链接：https://www.jianshu.com/p/f683ada6d304
 来源：简书
 著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

 */
@implementation ISA

@end
