//
//  main.m
//  XSTEST
//
//  Created by xs on 2019/8/7.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
    }
    return 0;
}

typedef void(^Block)(void);

@interface Person : NSObject

@end

@implementation Person
- (void)dealloc{
    NSLog(@"self:%@,%s",self,__func__);
}
@end
@interface XSBlock : NSObject
@property(nonatomic,copy) void (^myblcok1)(void);
@property(nonatomic,copy) Block myblock2;

@end

@implementation XSBlock

// 1.blcok的写法
+ (void)load{
    
    [self test7];
    
}

- (instancetype)initWithBlcok:(void(^)(void))block
{
    self = [super init];
    if (self) {
        self.myblcok1 = block;
    }
    return self;
}

//block本质 结构体对象
//static __main_block_imp_0 {
//    static __block_imp impl;
//    static __main_block_desc_0* Desc;
//    __main_block_imp_0(void *fp,static __main_block_desc_0* Desc,int flags =0){
//        impl.isa = &_NSConcreteStackBlock;
//        impl.Flags = flags;
//        impl.FuncPtr = fp;
//        Desc = Desc;
//    }
//};




//block的类型:从block对象的生命周期上看问题，研究它创建后存在于哪里,什么时候被销毁，因为其生命周期原因 在调用时候存在的潜在风险
/**
 全局 block:
 没有用到外界变量或只用到全局变量、静态变量的block为_NSConcreteGlobalBlock，
 生命周期从创建到应用程序结束
 */
Block globalblock = ^(){
    NSLog(@"函数外全局block");
};
+ (void)test1{
    static int age = 10;
    Block block1 = ^(){
        NSLog(@"age = %d",age);
    };
    static Block block2= ^(){
        NSLog(@"age = %d",age);
    };
}


/**
 栈区block:
 1.只用到外部局部变量，且没有强指针引用的block都是StackBlock。
 2.StackBlock的生命周期由系统控制的，一旦返回之后，就被系统销毁了
 3.风险,如果被销毁后再调用就会有问题
 */
+ (void)test2{
    int age = 10;
    ^(){
        NSLog(@"age = %d",age);
    };
}

/**
 堆区block:
 1.对栈区的block进行copy操作，对其引用计算器加1，其引用计算器为0的时候被销毁
 2.将其拷贝到堆上，其销毁由程序员手动管理，或者由系统的内存管理系统ARC、自动释放池
 
 copy操作的底层
 1.原本栈上有一block对象 随函数结束而被销毁
 2.copy后复制一份 block对象 存到堆上
 
 
 block的copy
 a.数据区  的block copy 无任何变化
 b.栈区    的block copy 会生成一个 NSMallocBlock block
 c.堆上的  的block copy 引用计算器加1
 
 在ARC环境下，编译器会根据情况自动将栈上的block复制到堆上，最后ARC自动管理释放
 1.block作为函数返回值时（在MRC下，函数一结束block就被销毁，在调用就很危险，要手动进行copy操作）
 2.将block赋值给__strong指针时
 3.block作为Cocoa API中方法名含有usingBlock的方法参数时
 4.block作为GCD API的方法参数时
 
 */
+ (void)test3{
    int age = 10;
    [^(void){
        NSLog(@"age = %d",age);
    } copy];
}


/**block的结构组成:研究对外部变量的访问原理，以及对外部变量的内存管理方面的影响
 
 block对访问外部数据的捕捉
 1.全局变量:不会捕捉 直接访问
 2.局部变量:会捕捉
 
 
 block对捕捉数据的类型定义，传进来的是什么
 1.局部自动变量:会捕捉，原类型;
 2.局部静态变量:会捕捉，原类型的指针
 
 */
int height = 188;
+ (void)test4{
    int age1 = 33;
    NSObject *objc = [[NSObject alloc]init];
    static int age2 = 22;
    /*
     struct __main_block_impl_0 {
     struct __block_impl impl;
     struct __main_block_desc_0* Desc;
     height; // 直接访问
     int age1 ;  // 原类型值传递
     NSObject *objc //原类型指针传递
     int *age2 // 原类型指针传递
     };
     */
    Block block = ^(){
        NSLog(@"height = %d,age1 = %d,age2 = %d,objc = %@",height,age1,age2,objc);
    };
    
}




// block捕捉对象类型数据的内存管理
/*
 1.对象有内存管理关键字 __weak,__strong...等
 2.在捕捉持有对象的时候，当然要进行内存管理的操作，内存修饰关键字也会捕捉，这个跟什么类型的block无关
 3.最后实际对捕捉对象的引用计算器的影响要看block的类型
 */


/*
 1.当访问了外部变量为对象类型时，block 的desc 中会新增 2个内存管理函数
 2.只有对 block 对象进行copy操作的时候 会调用 内存管理函数
 
 static struct __main_block_desc_0 {
 size_t reserved;
 size_t Block_size;
 void (*copy)(struct __main_block_impl_0*, struct __main_block_impl_0*);
 void (*dispose)(struct __main_block_impl_0*);
 }
 
 copy函数:block被拷贝到堆上:
 0.新增拷贝一份block对象到堆上:
 1.copy函数内部会调用_Block_object_assign函数
 2._Block_object_assign函数会根据auto变量的修饰符（__strong、__weak、__unsafe_unretained）做出相应的操作，
 3.形成强引用（retain）或者弱引用
 
 dispose函数:lock从堆上移除
 a.会调用block内部的dispose函数
 b.dispose函数内部会调用_Block_object_dispose函数
 _Block_object_dispose函数会自动释放引用的auto变量（release）
 */

+ (void)test5{
    
    {
        {
            Person *ob1 = [[Person alloc]init];
            Person *ob2 = [[Person alloc]init];
            __weak NSObject *ob3 = ob2;
            ^(){
                NSLog(@"%@,%@",ob1,ob3);
            };
        } // 上面的block在栈上，block中无copy操作，所以无论外面是强 还是若 都不会形成强引用，最后的结果可能导致访问到空对象
        NSLog(@"-------");
        
    }
    
    {
        /*
         1.栈上 有2个Person对象，以及2个自动变量指针ob1，ob2
         2.栈上 还有一个block对象，对2个自动变量的持有对对象的内存管理无硬性
         3.被拷贝到堆上的block对象，根据捕捉的对象的内存管理修饰符进行相应的操作
         */
        Block block;
        {
            Person *ob1 = [[Person alloc]init];
            Person *ob2 = [[Person alloc]init];
            __weak NSObject *ob3 = ob2;
            block = ^(){
                NSLog(@"%@,%@",ob1,ob3);
            };
            NSLog(@"block-class = %@",[block class]);
        }
        NSLog(@"-------");
        block();
    }
    
}
/*
 1、为什么不能直接修改 而要通过 __block 对象包装数据
 1.使用可以:只要能拿到指针地址 就可以使用，使用过程中可能会出现意外
 2.修改不行:修改的原意是想修改原数据，但block内部捕捉的只是指针，
 3.你修改捕捉的指针达不到修改原数据的意图，所以从编码的角度上将不允许修改
 4.__block 对象，将原数据包装成__block对象的组成部分，这样通过指针就可以达到修改原数据的意图
 
 
 2.__block的底层结构
 1.每一个 被 __block 包装的变量最后变成 一个 结构体变量
 2.被包装的数据是什么类型，在结构体中还是什么类型
 2.1包装基本数据类型
 struct __Block_byref_age_0 {
 void *__isa;
 __Block_byref_age_0 *__forwarding;
 int __flags;
 int __size;
 int age; //
 };
 2.2.包装对象类型 多了2个内存管理函数
 struct __Block_byref_weakPerson_0 {
 void *__isa; // 8
 __Block_byref_weakPerson_0 *__forwarding; // 8
 int __flags; // 4
 int __size; // 4
 void (*__Block_byref_id_object_copy)(void*, void*);
 void (*__Block_byref_id_object_dispose)(void*);
 MJPerson *__weak weakPerson;
 };
 */
+ (void)test6{
    
    Person *person1 = [[Person alloc]init];
    NSMutableArray *array = [NSMutableArray array];
    Block block = ^(){
        /*
         1.可以使用，不能修改
         */
        [array addObject:person1];
        [array removeAllObjects];
        //array = nil;
    };
    
    /*
     1.原本我想将person2 置为nil;
     2.blockPerson 就相当于block对象中捕捉到指针，操作blockPerson 不会对 person2 有任何影响
     */
    Person *person2 = [[Person alloc]init];
    Person *blockPerson = person2;
    blockPerson = nil;
}


/* __block 对象 与 被 __block 包装的对象
 1.被__block 包装的对象可以被内存管理关键字修饰
 2.__block 对象本身不能被内存管理关键字修饰
 3.So 内存管理关键字修饰的都是被包装的对象
 __block __strong Person *ob3  = ob1;
 __block __weak  Person *ob4  = ob2;
 
 __strong __block  Person *ob3  = ob1;
 __weak __block   Person *ob4  = ob2;
 
 */


/* block 对 __block 对象内存管理
 1.还是那个原则，栈上的 block并不会对__block变量产生强引用
 2.当block被copy到堆时，会调用block内部的copy函数，copy函数内部会调用_Block_object_assign函数，对__block变量形成强引用
 3.只会形成强引用，__block 不存在被弱引用
 */

/* __block 对象 对 包装对象的内存管理
 1.当__block变量在栈上时，不会对指向的对象产生强引用
 2.当__block变量在堆上时，根据被包装对象的内存管理修饰词 形成 强弱引用
 
 */
+ (void)test7{
    
    
}
@end
