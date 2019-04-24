//
//  CDObject.m
//  OCGrammar
//
//  Created by xs on 2019/4/24.
//  Copyright © 2019 xs. All rights reserved.
//

#import "CDObject.h"

@implementation CDObject
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
// 一段代码

/* self/super/instancetype
 self
 1.如果self在 对象方法中, 那么self就是 代表 调用当前对象方法 的 那个对象
 2.如果self在 类方法中, 那么 self 就 代表 调用当前类方法 的那个类
 >  self会自定区分 类方法 和 对象方法, 如果在类方法中 使用self调用对象方法, 那么会直接报错
 >  不能在 对象方法 或者 类方法中利用 self 调用当前的self 所在的方法(查看#warning 死循环)
 
 super
 1.super在类方法中(父类类对象), 一定会调用父类的类方法
 2.super在对象方法中(父类对象), 一定会调用父类的对象方法
 3.可以利用super 在任意方法中 调用父类中的方法
 instancetype:
 1.instancetype == id == 万能指针 == 指向一个对象
 2.instancetype 在编译的时候 可以判断对象的真实类型
 3.instancetype 只能用于作为返回值类型
 4.但凡自定义构造方法, 返回值尽量使用instancetype,不要使用id(id不能判断对象的真实类型)
 */
- (instancetype)init{
    self = [super init];
    
    return self;
}
/**
 类对象
 */
static void test1(){
    Class value = Nil;
}
/**
 实例对象
 */
static void test2(){
    id value = nil;
}
/**
 方法对象
 */
static void test3(){
    /*sel 方法选择器
     1.SEL 是一种 数据类型，typedef struct objc_selector *SEL;
     2.调用方法就是 将方法 包装成 一个 SEL 类型的数据，
     */
    SEL sel = @selector(init);
    
    /* IMP 函数指针
     
     */
    IMP imp = [NSObject methodForSelector:@selector(init)];
}
/**
 协议对象
 */
static void test4(){
    // 协议对象
    Protocol *protocol = @protocol(NSObject);
}
@end


#pragma clang diagnostic pop
