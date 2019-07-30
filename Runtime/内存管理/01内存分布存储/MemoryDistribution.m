//
//  MemoryDistribution.m
//  2019OC2
//
//  Created by xs on 2019/3/2.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "MemoryDistribution.h"
/*

 低 1.保留
 2.代码段（__TEXT）:编译之后的代码
 3.数据段（__DATA）
 1.字符串常量 ：比如NSString *str = @"123"
 2.已初始化数据 ：已初始化的全局变量、静态变量等
 3.未初始化数据 ：未初始化的全局变量、静态变量等
 4.堆（heap）↓ ：函数调用开销，比如局部变量。分配的内存空间地址越来越小
 5.栈（stack）↑ ：通过alloc、malloc、calloc等动态分配的空间，分配的内存空间地址越来越大
 高 内核区

 */
/* Tagged Pointer
 1.从64bit开始，iOS引入了Tagged Pointer技术，用于优化NSNumber、NSDate、NSString等小对象的存储
 2.在没有使用Tagged Pointer之前， NSNumber等对象需要动态分配内存、维护引用计数等，NSNumber指针存储的是堆中NSNumber对象的地址值
 3.使用Tagged Pointer之后，NSNumber指针里面存储的数据变成了：Tag + Data，也就是将数据直接存储在了指针中
 4.当指针不够存储数据时，才会使用动态分配内存的方式来存储数据
 5.objc_msgSend能识别Tagged Pointer，比如NSNumber的intValue方法，直接从指针提取数据，节省了以前的调用开销

 */
/*Tagged Pointer 好处 与注意点
 1.当数据小的时候使用Tagged Pointer存储，当数据大时候 还是以OC对象存储
 2.存储消耗内存小
 3.存储 取值 更效率
 4.当不是以OC对象存储时候 注意使用
 */
@interface MemoryDistribution ()
@property(nonatomic,copy)NSString *str1;
@property(nonatomic,copy)NSString *str2;

@end


@implementation MemoryDistribution
+ (void)load{

}
// 如果是iOS平台（指针的最高有效位是1，就是Tagged Pointer）
#   define _OBJC_TAG_MASK (1UL<<63)

// 如果是Mac平台（指针的最低有效位是1，就是Tagged Pointer）
#   define _OBJC_TAG_MASK 1UL

BOOL isTaggedPointer(id pointer)
{
    return ((uintptr_t)pointer & _OBJC_TAG_MASK) == _OBJC_TAG_MASK;
}
- (void)test1{
    NSNumber *number1 = @4;
    NSNumber *number2 = @5;
    NSNumber *number3 = @(0xFFFFFFFFFFFFFFF);
     NSLog(@"%p %p %p", number1, number2, number3);
      NSLog(@"%d %d %d", isTaggedPointer(number1), isTaggedPointer(number2), isTaggedPointer(number3));


    NSNumber *number4 = @5;
    int a = [number4 intValue]; // [number4 msgSend] 内部能判断出 number4 是否是 Tagged Pointer技术存储的 是的话 就直接通过指针取值 而不会走 msgSend的原本流程
}
- (void)test2{

    //Tagged Pointer 存储，[self str1] 不走msgSend流程，直接指针赋值(非OC对象)
    self.str1 = [NSString stringWithFormat:@"142"];
    //超过Tagged Pointer 存储范围，以OC对象存储,[self str1] 走msgSend流程(OC对象)
    self.str2 = [NSString stringWithFormat:@"1452358125"];

    //    NSTaggedPointerString __NSCFString
    NSLog(@"%@ %@\n",[self.str1 class],[self.str2 class]);
    //    0xa000000003234313 0x604000431a20
    NSLog(@"%p %p\n",self.str1,self.str2);

}
- (void)test3{

}
@end

