//
//  myBlock.m
//  ObjectDe
//
//  Created by xs on 2019/11/5.
//  Copyright © 2019 xax. All rights reserved.
//

#import "myBlock.h"
typedef void(^myBlock)(void);

@interface blockType : NSObject
@property (nonatomic,copy) myBlock block;
@end
@interface blockType2 : NSObject
@property (nonatomic,copy) myBlock block;
@end

@implementation blockType
+ (void)load{
    [self test];
}
+ (void)test{
    void (^block)(void) = ^(void){
        NSLog(@"this is a block");
    };
    block();
  
}

/**
 block本质
1.一个功能代码块，会对其内部使用的外部变量进行捕捉，在适当的时候执行代码
2.一个OC对象
 
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
 
 .block的copy
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

/**
 1.访问外部数据
 :使用时候的影响，是不是同一个(值传递OR指针传递)，还在不在(访问指针传递的数据是否正常)，对外部数据的内存管理上的影响(强弱引用，循环 释放)
 1.全局变量不会捕捉 直接访问 是同一个 无任何影响 （全局区block）
 2.局部变量一定会捕捉 (栈区block)   （[栈区block copy] 堆区block）
     基本数据类型 值传递   其它不考虑 无任何影响
     静态数据类型 指针传递 其它不考虑 无任何影响
     对象数据类型 指针传递
         1.栈上的block,不会强引用 再次访问 有风险
         2.堆上的block,强弱引用看其修饰符
 */

 NSInteger age = 20;
static NSInteger height = 10;
+ (void)test1{
    {
        int (^block)(int) = ^(int value){
            NSLog(@"age = %ld,height = %ld",age,height);
            return 0;
        };
        block(0);
    }
    {
        NSInteger age2 = 20;
        static NSInteger height2 = 10;
        
        // 栈区blcok
         ^(int value){
            NSLog(@"age2 = %ld,height2 = %ld",age2,height2);
            return 0;
         };
     
        
        //堆区blcok
        [^(int value){
            NSLog(@"age2 = %ld,height2 = %ld",age2,height2);
            return 0;
        } copy];
    }
    
    {
        // self _cmd 为什么在方法中可以使用的原因是 默认是当做参数传递进来的
        void(^block)(void) = ^{
            NSLog(@"self = %@\n",self);
        };
        block();

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
        NSObject *obje = [[NSObject alloc]init]; // 在栈上
        void(^block2)(void) = ^{
            NSLog(@"obje = %@\n",obje);
        }; // 在赋值给 block2 时候将在栈上的block拷贝一份到堆上，强引用 obje 对象，
        block2();
    }
}
/**
 对数据的修改（修改基本数据类型 修改对象数据类型）
 1.利用__block将数据包装成__block对象，对象里面有对应的变量
 2.__block不能修饰全局变量、静态变量（static）

 原始数据 、__block对象、  block 三者之间的关系
 
 __block对象 与原始数之间
 a.修饰基本类型 不存在内存管理 问题
 b.修饰对象类型，存在内存管理问题，至于 __block对象对其是强 还是弱引用 看 对象的内存修饰符
 
  __block对象  与   block 之间
 1.栈区的 block 不会对 __block对象 形成内存管理，访问的时候有风险
 2.堆区的 block 会对 __block对象 形成内存管理，并且一定是强引用
 */
+ (void)test2{
    {
           int age1 = 10;
           __block int age2 = 10;
           __block NSObject *objc1 = [[NSObject alloc]init]; // __block 对 objc1是强引用
           __block __weak NSObject *objc2 = [[NSObject alloc]init];// __block 对 objc2是弱引用
           ^{
               //栈上的block 对 __block objc1、 __block objc2 没有内存管理
               NSLog(@"%d,%d,%@,%@",age1,age2,objc1,objc2);
           }(); // block 也在栈上，访问auto变量有风险
       }
       {
           int age1 = 10;
           __block int age2 = 10;
           __block NSObject *objc1 = [[NSObject alloc]init];// __block 对 objc1是强引用
           __block __weak NSObject *objc2 = [[NSObject alloc]init];// __block 对 objc2是弱引用
           void(^block)(void) =^{
               //拷贝到堆上的block 对 __block objc1、 __blockobjc2 是强引用
               NSLog(@"%d,%d,%@,%@",age1,age2,objc1,objc2);
           };
           block();
       }
}
- (void)test3{
    { // 自己的block 强持有自己
        self.block=^{
            NSLog(@"self = %@",self);
        };
        { // 解决方法
            __weak typeof(self) weakSelf = self;
            __weak blockType * weakSelf2 = self;
            self.block=^{
               NSLog(@"self = %@",weakSelf);
            };
        }
    }
    {
        //objc自己的block 强持有自己
        blockType *objc = [[blockType alloc]init];
        objc.block=^{
            NSLog(@"objc = %@",objc);
        };
        { // 解决方法
           __block blockType *objc = [[blockType alloc]init];
            objc.block=^{
                NSLog(@"objc = %@",objc);
                objc = nil;
            };
        }
        
    }
    {
        /**
          WEAK_SELF 与 STRONG_SELF 组合使用的场景
           1.WEAK_SELF: 再会造成循环引用时候使用，但使用的时候原对象可能已经被释放了
           2.STRONG_SELF:在使用WEAK_SELF的基础上，并且 希望在blcok执行的时候 最原始的 self 不会释放
           3.STRONG_SELF:不会造成循环引用，因为其强引用的是 block内部的自动变量指针，这个指针在代码块执行完后会自动销毁 从而破解 循环引用
           4.STRONG_SELF：好处 既能保持外部对象在，又不会造成循环引用
         */
        #define WEAK_SELF __weak typeof(self)weakSelf = self
        #define STRONG_SELF __strong typeof(weakSelf)self = weakSelf
 
    }

}
- (void)perfrmBlock:(void(^)(void))blcok{
    
}
@end
@implementation blockType2
@end
