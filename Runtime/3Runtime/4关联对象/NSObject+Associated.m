//
//  NSObject+CX.m
//  Runtime
//
//  Created by xs on 2019/7/29.
//  Copyright © 2019 xax. All rights reserved.
//
#import "NSObject+Associated.h"
#import <objc/runtime.h>
/**
 关联
 1.关联是指把两个对象相互关联起来，使得其中的一个对象作为另外一个对象的一部分。
 在类的定义之外为类增加额外的存储空间
 1. 使用关联，我们可以不用修改类的定义而为其对象增加存储空间。
 2..关联是基于关键字的，因此，我们可以为任何对象增加任意多的关联，每个都使用不同的关键字即可。
 3.关联是可以保证被关联的对象在关联对象的整个生命周期都是可用的（在垃圾自动回收环境下也不会导致资源不可回收）。
 */
@implementation NSObject (Associated)
- (void)setName:(NSString *)name{
    
    
    /**
     给对象添加关联
     @param object#> 给哪个对象添加关联(self) description#>
     @param key#> 关键字 key description#>
     @param value#> 关联哪个值 description#>
     @param policy#> 内存属性 description#>
     objc_setAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>, <#id  _Nullable value#>, <#objc_AssociationPolicy policy#>)
     */
    /**
     key 的写法
     1.一个唯一的值，So 利用方法地址的唯一性 以及关联的属性值
     */
    objc_setAssociatedObject(self, @selector(name), name, OBJC_ASSOCIATION_COPY);
}
- (NSString *)name{
    
    /**
     取关联对象的值
     @param object#> 哪个关联对象 description#>
     @param key#> 关键字 key description#>
     objc_getAssociatedObject(<#id  _Nonnull object#>, <#const void * _Nonnull key#>)
     */
    return  objc_getAssociatedObject(self, @selector(name));
}
/**
 关联技术底层
 1.关联对象并不是存储在被关联对象本身内存中
 2.关联对象存储在全局的统一的一个AssociationsManager中
 
 AssociationsManager可重复创建，
 但是AssociationsHashMap是AssociationsManager内的静态变量，全局只有一个，负责管理所有对象的关联表。
 通过对象地址的反码取出该对象的属性关联表ObjectAssociationMap。
 然后再通过关联key从对象关联表中获取对应的ObjectAssociation，
 ObjectAssociation内存储的就是真正需要的存储的value值和内存关联策略policy了
 
 关联对象的释放
 在对象释放的时候，会判断对象是否关联过属性，如果关联过属性，则会调用_object_remove_assocations删除其在AssociationsHashMap中对应的值ObjectAssociationMap和ObjectAssociationMap中的每个ObjectAssociation
 
 AssociationsManager
 AssociationsManager称之为管理对象，其内部有一个AssociationsHashMap类型的静态指针变量_map，这个变量在程序运行期间只有一份
 class AssociationsManager {
 static AssociationsHashMap *_map;
 }
 AssociationsHashMap
 disguised_ptr_t:ObjectAssociationMap
 disguised_ptr_t:ObjectAssociationMap
 disguised_ptr_t:表示对象
 
 ObjectAssociationMap
 void * : ObjectAssociation
 void * : ObjectAssociation
 void *:表示对象的key
 
 ObjectAssociation
 uintptr_t _policy;
 id _value:存储的值
 */
- (void)test1{
    
}
@end
