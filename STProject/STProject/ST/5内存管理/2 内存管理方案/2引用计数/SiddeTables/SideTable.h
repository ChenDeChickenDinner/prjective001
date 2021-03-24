//
//  SideTable.h
//  MRC
//
//  Created by xs on 2021/3/22.
//

#import <Foundation/Foundation.h>


/*
 1.系统中维护了一个全局的SideTables，这是一个SideTable的集合。
  为什么用多个SideTable？ 如果只有一个table，意味着内存中分配的所有对象都要在一个表中操作，因为多个线程可能同时操作这个表，所以就要对这个表加锁，如果并发操作这个表的线程有成千上万个，就会产生效率问题。所以系统引入了分离锁这样一个技术方案，把大表拆成多个小表来进行操作，分别对小表加锁，从而提升效率

 2.SideTable在OC中扮演这一个很重要的角色,在runtime中，通过SideTable来管理对象的引用计数以及weak引用。

 c:当引用计数存储到一定值是，并不会再存储到Nonpointer_isa的位域的extra_rc中，而是会存储到SideTables 散列表中


 struct SideTable {

     自旋锁，用于上锁/解锁 SideTable。
     spinlock_t slock;

     用来存储OC对象的引用计数的 hash表(仅在未开启isa优化或在isa优化情况下isa_t的引用计数溢出时才会用到)
     RefcountMap refcnts;

     存储对象弱引用指针的hash表。是OC中weak功能实现的核心数据结构。
     weak_table_t weak_table;
 }
 */
@interface SideTable : NSObject

@end


