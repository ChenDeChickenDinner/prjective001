//
//  Method.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "Method.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation Method1

/*(方法: typedef struct method_t *Method;
 struct method_t {
     SEL name; // SEL代表方法\函数名，一般叫做选择器，底层结构跟char *类似
     const char *types; // C语言字符串,一种编码格式（包含方法的 返回值类型，参数类型，个数）
     MethodListIMP imp; //函数指针（ typedef id (*IMP)(id, SEL, ...);）
     
 }

 
 SEL  typedef struct objc_selector *SEL;
 1.SEL代表方法\函数名，一般叫做选择器，底层结构跟char *类似（字符串）
 2.SEL的作用是作为IMP的KEY，存储在NSSet中，便于hash快速查询方法
 3.一个类(及类的继承体系)中，不能存在2个同名的方法，就算参数类型不同
 4.不同类中相同名字的方法，所对应的方法选择器是相同的
 5.不同类的实例对象执行相同的selector时，会在各自的方法列表中去根据selector去寻找自己对应的IMP
 
 IMP  typedef id (*IMP)(id, SEL, ...);
 a.指向返回id类型值的方法的指针，是一种C类型
 b.每个函数还有两个隐藏的参数(id)self,(SEL)_cmd,这两个都是指针类型,每个占用8个字节
 
 */

+ (void)load1{
    
    {
        SEL sel1 = @selector(load1);
        SEL sel3 = NSSelectorFromString(@"test1");
    }
    {
        
        //注册一个方法，将方法名映射到一个选择器，并返回这个选择器
        SEL sel1 = sel_registerName("test1");
        SEL sel2 = sel_registerName("test1");

        //获取方法名的C字符串
        const char *name = sel_getName(sel1);
        
        //比较两个选择器
        sel_isEqual(sel1, sel2);
    }

}
+ (void)load2{
    
    {
        // 根据实例对象的选择器返回函数指针
        IMP imp = [NSObject instanceMethodForSelector:@selector(description)];
        
    }
    {   //创建一个指针函数的指针，该函数调用时会调用特定的block
        IMP imp = imp_implementationWithBlock(^(){
            
        });
        //返回与IMP(使用imp_implementationWithBlock创建的)相关的block
        id block = imp_getBlock(imp);
        //解除block与IMP(使用imp_implementationWithBlock创建的)的关联关系，并释放block的拷贝
        BOOL remove = imp_removeBlock(imp);
    }
}

+ (void)load{
    Class class = [NSObject class];

    unsigned int outCount = 0;
    Method *methodList = class_copyMethodList(class, &outCount);
    for (int i = 0; i < outCount; i++) {
        Method method = methodList[i];
        SEL sel = method_getName(method);
        const char *types = method_getTypeEncoding(method);
        IMP imp = method_getImplementation(method);
        NSLog(@"sel:%@,types:%s,imp:%p",NSStringFromSelector(sel),types,imp);
    }
}

@end
