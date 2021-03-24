//
//  weak_.m
//  MRC
//
//  Created by xs on 2021/3/22.
//

#import "weak_.h"
/**ARC下runtime支持 weak的实现  https://www.jianshu.com/p/9c52b6f9d01c
 https://www.jianshu.com/p/ef6d9bf8fe59
 1.runtime维护了一个weak表，用于存储指向某个对象的所有weak指针。
 2.weak表其实是一个hash（哈希）表，key是所指对象的地址，Value是weak指针的地址（这个地址的值是所指对象指针的地址）数组。
 3.使用过程
A:初始化时
1.runtime会调用objc_initWeak函数，初始化一个新的weak指针指向对象的地址。
B:添加引用时
1.objc_initWeak函数会调用 storeWeak() 函数，
2.storeWeak() 的作用是更新指针指向，创建对应的弱引用表。
C:释放时
1.调用clearDeallocating函数。
2.clearDeallocating函数首先根据对象地址获取所有weak指针地址的数组
3.然后遍历这个数组把其中的数据设为nil，最后把这个entry从weak表中删除，最后清理对象的记录。


 */
@implementation weak_

@end
