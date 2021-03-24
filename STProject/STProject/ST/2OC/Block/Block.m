//
//  Block.m
//  1111
//
//  Created by xs on 2020/11/16.
//

#import "Block.h"
/*
 1.block是一个OC对象，是用来封装函数以及其调用环境
 2.封装函数:把block的参数、返回值、执行体封装成一个函数
 3.封装调用环境:指block内部会捕获变量，并且存储这些捕获的变量
 */
typedef int (^MyBlock)(int,double);

@interface Block : NSObject
@property(nonatomic,copy) int(^block1)(int,double);
@property(nonatomic,copy) MyBlock block2;
@property(nonatomic,copy) NSString *name;
@end
@implementation Block
+ (void)load{
}

#pragma warning-Block的表现 定义，调用，作为参数，作为Ivar
+ (void)test1{
    int (^block)(int,double) ;
    
    block = ^int(int a,double b){
        return 0;
    };
    block(10,2.2);
}

- (void)test2WithBlok:(int(^)(int,double))block{

}
#pragma warning- Block三种类型
/*
1.没有访问auto变量 为 NSGlobalBlock <分配在数据区>
2.访问了auto变量 为 NSStackBlock <分配在栈区>// 1.栈区出了作用域会被系统回收 后续再用有风险
3.【NSStackBlock coyp】 为 NSMallocBlock <分配在堆区>
4.在ARC环境下，编译器会根据情况自动将栈上的block复制到堆上
    1.block作为函数返回值时
    2.将block赋值给__strong指针时
    3.block作为Cocoa API中方法名含有usingBlock的方法参数时
    4.block作为GCD API的方法参数时
5.block的实现原理，作为了解，解释了他为什么可以使用
 */
#pragma warning- Block 对数据的捕捉访问

int age = 10;
static int height = 20;
- (void)test3{
    {
        // 全局变量 不会进行捕获，因为全局变量谁都可以直接访问
        void(^block1)(void) = ^(void){
            NSLog(@"age = %d,height = %d",age,height);
        };
        block1();
    
        //1.局部变量是值传递,互不影响
        int a = 10;
        void(^block2)(void) = ^(void){
            NSLog(@"a = %d",a);
        };
        a = 30;
        block2();
      
      //1.捕获了外部的静态的局部变量 指针传递传递
      static  int a2 = 10;
        void(^block3)(void) = ^(void){
            NSLog(@"a = %d",a2); //a = 30;
        };
        a2 = 30;
        block3();
    }
    {
        // 1.捕捉对象会对其进行内存管理，主要看对象的内存修饰符
        NSObject *obje = [[NSObject alloc]init]; // 在栈上
        void(^block1)(void) = ^{
            NSLog(@"obje = %@\n",obje);
        }; // 在堆上 将obje拷贝一份到堆上，强引用 obje 对象，
        block1();
        
        NSObject *obje2 = [[NSObject alloc]init]; // 在栈上
        
        __weak NSObject *obje3 = obje2;
        void(^block2)(void) = ^{
            NSLog(@"obje = %@\n",obje3);
        }; // 在堆上 将obje拷贝一份到堆上，弱引用 obje 对象，
        block2();
        
        
        
        // 2.对对象的内存管理，特殊情况下会存在循环引用的问题
        __weak typeof(self)weakSelf = self;
        self.block1 = ^int(int a, double b) {
            NSString *name =  weakSelf.name;
            return 0;
        };
        
        __block Block *ob =  [[Block alloc]init];
        ob.block1 = ^int(int a, double b) {
            NSString *name =  ob.name;
            ob = nil;
            return 0;
        };
    }
    {
        /**
          WEAK_SELF 与 STRONG_SELF 组合使用的场景
           1.WEAK_SELF: 再会造成循环引用时候使用，但使用的时候原对象可能已经被释放了
           2.STRONG_SELF:在block内部再对外部对象强引用一次，防止对象销毁
           3.STRONG_SELF:不会造成循环引用，因为其强引用的是 block内部的自动变量指针，这个指针在代码块执行完后会自动销毁 从而破解 循环引用
           4.STRONG_SELF：好处 既能保持外部对象在，又不会造成循环引用
           5.多层block嵌套 需要一层一层处理
         
         */
        #define WEAK_SELF __weak typeof(self)weakSelf = self
        #define STRONG_SELF __strong typeof(weakSelf)self = weakSelf
 
    }
    
}

#pragma warning- Block 对外部变量的修改
/*
 1.block 内部 不能对 auto变量 进行直接修改 一个是A函数中的一个指针， 一个是B函数中的指针，修改其中一个的指向，不能影响另一个，把原指针包装起来，通过容器拿到里面的指针修改
 
 2.__block可以用于解决block内部无法修改auto变量值的问题
 3.__block 修饰的 auto变量 会被编译器包装成一个对象，对象里面有对应的变量
 4.__block不能修饰全局变量、静态变量（static）
 5.block 会对 __block对象进行强引用


__block对象对其包装对象的引用问题
 a.修饰基本类型 不存在内存管理 问题
 b.修饰对象类型，存在内存管理问题，至于 __block对象对其是强 还是弱引用 看 对象的内存修饰符
 */

+ (void)test4{
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
@end
