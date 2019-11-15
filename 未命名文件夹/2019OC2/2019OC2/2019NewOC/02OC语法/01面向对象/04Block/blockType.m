//
//  blockType.m
//  2019OC
//
//  Created by xs on 2019/2/25.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "blockType.h"

@implementation blockType2
@end
@interface blockType()
typedef void(^myBlock)(void);
@property(nonatomic,copy) void(^block1)(void);
@property(nonatomic,copy) myBlock block2;
@end

@implementation blockType
+ (void)testBlock:(void(^)(void))blcok{

}
+ (void)load{
    
}
/**
 block基本用法
 */
+ (void)test1{
    /*
     1.声明block类型变量: 返回值类型(^变量)(参数类型列表)
     2.block实现: ^(形参列表...){
        返回值
     };
     3.block调用: block();
     */
    int (^block)(int) = ^(int a){
        NSLog(@"a = %d\n",a);
        return 0;
    };
    block(10);

    /*
     1.block定义者:根据 参数，执行代码，返回结果
     2.block持有者:负责 执行传参
     */
    /*
     block 运用的各种形式
     1.直接代码块
     2.当参数传递
     3.当对象属性
     */

}
/*block本质
 1.一个功能代码块，会对其内部使用的外部变量进行捕捉，在适当的时候执行代码
 2.一个OC对象
 */
+ (void)test2{
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
}

/**
 对外部基本数据类型变量的捕捉访问
 */
int  age = 10;
static int hegight = 20;

+ (void)test3{
    /*
     局部变量的捕获相当于 跨 函数 访问变量,在B函数使用A函数的变量，理所当然的需要进制值传递保存
     */
    {
        int age = 20;
        void(^block)(void) = ^{
            NSLog(@"age = %d\n",age);
        };
        age = 30;
        block();

        /*
         struct __main_block_impl_0 {
         struct __block_impl impl;
         struct __main_block_desc_0* Desc;
         int age; // 捕获了外部的自动局部变量 值传递
         };
         */
    }
    {
       static int age = 20;
        void(^block)(void) = ^{
            NSLog(@"age = %d\n",age);
        };
        age = 30;
        block();

        /*
         struct __main_block_impl_0 {
         struct __block_impl impl;
         struct __main_block_desc_0* Desc;
         int *age; // 捕获了外部的静态的局部变量 指针传递传递
         };
         */
    }
    {
        // 全局变量 不会进行捕获，因为全局变量谁都可以直接访问
        void(^block)(void) = ^{
            int age2 = age;
            int hegight2 = hegight;
        };
        age = 30;
        block();
    }


}
/**
block类型
1. block有3种类型，可以通过调用class方法或者isa指针查看具体类型，最终都是继承自NSBlock类型
a. __NSGlobalBlock__ （ _NSConcreteGlobalBlock ）
b. __NSStackBlock__ （ _NSConcreteStackBlock
c. __NSMallocBlock__ （ _NSConcreteMallocBlock ）

1.没有访问auto变量 为 NSGlobalBlock <分配在数据区>
a.这个没有访问auto变量，或者仅仅访问了全局变量的block 一般是抽成函数

2.访问了auto变量 为 NSStackBlock <分配在栈区>
a.访问了auto变量的block 因其分配在栈 上，代码块结束后 再调用的话有潜在风险
b.为解决堆上的block风险问题，将block 进行copy就会 生成一个再堆上的block,升级为NSMallocBlock类型

3.block的copy
 a.数据区  的block copy 无任何变化
 b.栈区    的block copy 会生成一个 NSMallocBlock block
 c.堆上的  的block copy 引用计算器加1

 d.在ARC环境下，编译器会根据情况自动将栈上的block复制到堆上
 1.block作为函数返回值时
 2.将block赋值给__strong指针时
 3.block作为Cocoa API中方法名含有usingBlock的方法参数时
 4.block作为GCD API的方法参数时

 e.ARC下block属性的建议写法
 @property (strong, nonatomic) void (^block)(void);
 @property (copy, nonatomic) void (^block)(void);
 */
- (void)test4{

}
/**
 对外部对象类型变量的捕捉访问
 */
- (void)test5{
    // self _cmd 为什么在方法中可以使用的原因是 默认是当做参数传递进来的
    void(^block)(void) = ^{
        NSLog(@"self = %@\n",self);
        NSLog(@"self.name = %@\n",self->_name);
        NSLog(@"self.name = %@\n",[self name]);
    };
    block();

    // 对对象类型的 auto变量 也会进行捕捉 (NSObject *)
    NSObject *obje = [[NSObject alloc]init]; // 在栈上
    void(^block2)(void) = ^{
        NSLog(@"obje = %@\n",obje);
    }; // 在堆上 将obje拷贝一份到堆上，强引用 obje 对象，
    block2();
}
/**
 会对外部对象类型变量进行内存管理
 1.如果block是在栈上:将不会对auto变量产生强引用
 2.block被拷贝到堆上:
 a.会调用block内部的copy函数，copy函数内部会调用_Block_object_assign函数
 b._Block_object_assign函数会根据auto变量的修饰符（__strong、__weak、__unsafe_unretained）做出相应的操作，形成强引用（retain）或者弱引用
 3.如果block从堆上移除
 a.会调用block内部的dispose函数
 b.dispose函数内部会调用_Block_object_dispose函数
 _Block_object_dispose函数会自动释放引用的auto变量（release）
 */
- (void)test6{

}


/**
 对auto变量的修改
 1.block 内部 不能对 auto变量 进行直接修改 一个再A函数 一个在B函数
 2.__block可以用于解决block内部无法修改auto变量值的问题
 3.__block 修饰的 auto变量 会被编译器包装成一个对象，对象里面有对应的变量
 4.__block不能修饰全局变量、静态变量（static）
 5.block 会对 __block对象进行强引用


__block对象对其包装对象的引用问题
 a.修饰基本类型 不存在内存管理 问题
 b.修饰对象类型，存在内存管理问题，至于 __block对象对其是强 还是弱引用 看 对象的内存修饰符
 */
- (void)test7{

    { //  1.当block在栈上时，__block对象不会对 其包装的对象产生强引用
        int age1 = 10;
        __block int age2 = 10;
        __block NSObject *objc1 = [[NSObject alloc]init];
        __block __weak NSObject *objc2 = [[NSObject alloc]init];
        // 上面都在栈上
        ^{
            NSLog(@"%d,%d,%@,%@",age1,age2,objc1,objc2);
        }(); // block 也在栈上，访问auto变量有风险
    }
    { //  1.当block在堆上时，__block对象可以对 其包装的对象产生强引用，具体看修饰符
        int age1 = 10;
        __block int age2 = 10;
        __block NSObject *objc1 = [[NSObject alloc]init];
        __block __weak NSObject *objc2 = [[NSObject alloc]init];
        // 上面都在栈上
        void(^block)(void) =^{
            /*
          age1:值传递
          age2:__block拷贝到堆上，被block强引用，_block对象 中 有 inat age2,不存在内存管理问题
          objc1:__block拷贝到堆上，被block强引用，_block对象 中 强引用 objc1
          objc1:__block拷贝到堆上，被block强引用，_block对象 中 弱引用 objc1
             */
            NSLog(@"%d,%d,%@,%@",age1,age2,objc1,objc2);
        };
        block();
    }

}

/**
 1.全局变量，不会捕捉 直接访问
 2.局部静态变量，会捕捉，指针传递
 3.局部自动变量 会捕捉
     a.普通对象值
         a1.基本类型:捕捉,值传递
         a2.对象类型
            1.栈上的block,捕捉，指针传递 不会强引用
            2.堆上的block,捕捉，指针传递，看其修饰符
     b.__block对象
         a1.基本类型:捕捉__block对象,指针传递，__block对象对其包装对象 值传递引用
         a2.对象类型
             1.栈上的block,捕捉__block对象，指针传递 __block对象对其包装对象不会强引用
             2.堆上的block,捕捉__block对象，指针传递，__block对象对其包装对象的引用看其修饰符
 */


/**
 循环引用
 */
- (void)test8{
    self.name = @"123";
    self.block=^{
        self.name;
    };
    {
        __weak typeof(self) weakSelf = self;
        self.block=^{
          NSString *name =  weakSelf.name;
        };
    }
    {
        __block  blockType2 *objc1 = [[blockType2 alloc]init];
        objc1.block=^{
            NSString *name =  objc1.name;
            objc1 = nil;
        };
        objc1.block();
    }


}
@end

