//
//  MemoryMangeARC.m
//  2019OC2
//
//  Created by xs on 2019/3/2.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "MemoryMangeARC.h"
#import "MemoryMangeNature.h"



@implementation MemoryMangeARC



/**ARC下指针之间的赋值流转
 0.内存修饰符:
 a.__strong,对引用的对象(不论这个指针对象本身是强还是弱)retain+1;
 b.__weak,对引用的对象引用计算器无影响，纯粹的拿到操作权
 */
static void sumCount(Person *value,NSString *str){
    CFIndex count = CFGetRetainCount((__bridge CFTypeRef)(value));
    NSLog(@"%@.p = %p;%@.count = %ld\n",str,value,str,(count - 1));
}
static void test0(){

    __strong Person *p1 = [[Person alloc]init];
    NSLog(@"p1自身地址%p;",&p1);
    sumCount(p1,@"p1->");

    __weak Person *p2 = p1;
    NSLog(@"p2自身地址%p;",&p2);
    sumCount(p2,@"p2->");
    __strong Person *p3 = p2; // 对p2-->指向的对象进行 retain+1,不管p2是强还是若，只有其有值
    NSLog(@"p3自身地址%p;",&p3);
    sumCount(p3,@"p3->");

    p1 = nil;
    NSLog(@"123");
    p2 = nil;
    NSLog(@"456");
    p3 = nil; // 对象在此处 -[Person dealloc]
    NSLog(@"789");
}
/**ARC下指针在函数之间的流转
 A.函数参数
 1.函数参数默认都是强引用，会对对象retain+1;
 2.参数都是栈上的临时变量，代码块结束就销毁，会对对象release -1
 B.返回值(返回值类型必须是强指针编译器规定)
 1.如果没有返回对象 则对原引用对象无影响
 2.如果返回了真实对象，不论是强还是弱
 a.如果外部有指针引用则属于外部指针的管理范围
 b.如果外界没有引用者，则放入栈顶释放池，等池子销毁的时候 对其中的对象做release -1操作
 */
/**
 强指针参数,无返回值
 */
static void test1( Person *p){
    return;
}
/**
 强指针参数,返回空
 */
static Person * test2( Person *p){
    return nil;
}
/**
 强指针参数,返回强指针
 */
static Person * test3( Person *p){
    __strong Person *p2 = p;
    return p2;
}
/**
 强指针参数,返回若指针
 */
static Person * test4( Person *p){
    __weak Person *p2 = p;
    return p2;
}
static void test5( Person *p){
    { //  不强引用返回值 无返回值
        {
            __strong Person *p1 = [[Person alloc]init];
            test1(p1);
            NSLog(@"函数调用完，无返回值");
            NSLog(@"p1 = nil准备");
            p1 = nil;// -[Person dealloc],0x10075b920
            NSLog(@"p1 = nil完成");

        }
        {
            __strong Person *p1 = [[Person alloc]init];
            test2(p1);
            NSLog(@"函数调用完，返回nil");
            NSLog(@"p1 = nil准备");
            p1 = nil;//-[Person dealloc],0x1005061a0
            NSLog(@"p1 = nil完成");

        }

    }
    { //  不强引用返回值 有返回值
        {// p1 = nil;在自动释放池后面
            {
                // 返回强指针
                __strong Person *p1 = [[Person alloc]init];
                NSLog(@"p1自身地址%p;",&p1);
                @autoreleasepool {
                    test3(p1);
                    NSLog(@"函数返回强指针，但未接收，释放池在 =nil之前");
                }
                NSLog(@"函数调用完，自动释放池销毁");
                NSLog(@"p1 = nil准备");
                p1 = nil;//-[Person dealloc],0x1028037f0
                NSLog(@"p1 = nil完成");
            }
            {
                // 返回弱指针
                __strong Person *p1 = [[Person alloc]init];
                NSLog(@"p1自身地址%p;",&p1);
                @autoreleasepool {
                    test4(p1);
                    NSLog(@"函数返回弱指针，但未接收，释放池在 =nil之前");
                }
                NSLog(@"函数调用完，自动释放池销毁");
                NSLog(@"p1 = nil准备");
                p1 = nil;//-[Person dealloc],0x100539530
                NSLog(@"p1 = nil完成");
            }
        }


        { // p1 = nil;在自动释放池前面
            {
                // 返回强指针
                __strong Person *p1 = [[Person alloc]init];
                NSLog(@"p1自身地址%p;",&p1);
                test3(p1);
                NSLog(@"函数返回强指针，但未接收，释放池在 = nil之后");
                NSLog(@"p1 = nil准备");
                p1 = nil;
                NSLog(@"p1 = nil完成");
                //在栈顶释放池释放后 -[Person dealloc],0x100527f00
            }
            {
                // 返回弱指针
                __strong Person *p1 = [[Person alloc]init];
                test4(p1);
                NSLog(@"函数返回弱指针，但未接收，,释放池在 = nil之后");
                NSLog(@"p1 = nil准备");
                p1 = nil;
                NSLog(@"p1 = nil完成");
                //在栈顶释放池释放后 -[Person dealloc],0x100527f00
            }
        }

    }

    return;
}

/**ARC下编译器特效
A.@property内存修饰符
 strong(OC对象):对应的所有权类型是 __strong
 copy(OC对象):对应的所有权类型是 __strong
 weak(OC对象):对应的所有权类型是 __weak
 assign(非OC对象):对应的所有权类型是 __unsafe_unretained
B.代码块中的添加代码/dealloc 中添加的代码

 */
/**ARC下runtime支持 weak的实现  https://www.jianshu.com/p/9c52b6f9d01c

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

- (void)test1{

}
@end


