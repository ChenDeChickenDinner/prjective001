//
//  MemoryManagement.m
//  MRC
//
//  Created by xs on 2021/3/19.
//

#import "MemoryManagement.h"


A:方法底层实现


retainCount：
objc_object::rootRetainCount()
{
    //是否是 TaggedPointer技术
    if (isTaggedPointer()) return (uintptr_t)this;

    //sidetable加锁
    sidetable_lock();
    // 取出isa
    isa_t bits = LoadExclusive(&isa.bits);
    ClearExclusive(&isa.bits);
    //判断是否是优化过的isa，64之后都是的
    if (bits.nonpointer) {
        // 判断isa引用计数位加1后是否越界，如果越，留下一半引用计数在isa的引用计数位，其他复制到引用计数表去
        uintptr_t rc = 1 + bits.extra_rc;
        if (bits.has_sidetable_rc) {
            rc += sidetable_getExtraRC_nolock();
        }
        sidetable_unlock();
        return rc;
    }
    //
    sidetable_unlock();
    // sidetable直接取retainCount
    return sidetable_retainCount();
}



objc_object::sidetable_retain()
{
#if SUPPORT_NONPOINTER_ISA
    ASSERT(!isa.nonpointer);
#endif
    //以自己为key取出SideTables中的table
    SideTable& table = SideTables()[this];
    //加锁
    table.lock();
    //以自己为key取出table中的 RefcountMap 表
    size_t& refcntStorage = table.refcnts[this];
    //
    if (! (refcntStorage & SIDE_TABLE_RC_PINNED)) {
        //
        refcntStorage += SIDE_TABLE_RC_ONE;
    }
    //
    table.unlock();

    return (id)this;
}

objc_object::sidetable_release(bool performDealloc)
{
#if SUPPORT_NONPOINTER_ISA
    ASSERT(!isa.nonpointer);
#endif
    SideTable& table = SideTables()[this];

    bool do_dealloc = false;

    table.lock();
    auto it = table.refcnts.try_emplace(this, SIDE_TABLE_DEALLOCATING);
    auto &refcnt = it.first->second;
    if (it.second) {
        do_dealloc = true;
    } else if (refcnt < SIDE_TABLE_DEALLOCATING) {
        // SIDE_TABLE_WEAKLY_REFERENCED may be set. Don't change it.
        do_dealloc = true;
        refcnt |= SIDE_TABLE_DEALLOCATING;
    } else if (! (refcnt & SIDE_TABLE_RC_PINNED)) {
        refcnt -= SIDE_TABLE_RC_ONE;
    }
    table.unlock();
    if (do_dealloc  &&  performDealloc) {
        ((void(*)(objc_object *, SEL))objc_msgSend)(this, @selector(dealloc));
    }
    return do_dealloc;
}
