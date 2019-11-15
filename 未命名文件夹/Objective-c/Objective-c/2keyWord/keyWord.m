//
//  keyWord.m
//  Objective-c
//
//  Created by xs on 2019/7/30.
//  Copyright © 2019 xax. All rights reserved.
//

#import "keyWord.h"

@implementation keyWord

+ (void)load{
    Class ob1 = [NSObject class];
    Class ob2 = [[[NSObject alloc]init] class];
}
- (void)test{
    id ob2 = [[NSObject alloc]init];

}

/**
 1.OC的万能指，可以针指向任何对象
 2.是静态数据类型，编译期间无法确定对象的真是类型，运行期间才可以
 */
- (void)test1{
    id ob2 = [[NSObject alloc]init];
}
/** instancetype
 1.只能指向实例对象
 3.instancetype 只能用于作为返回值类型
 2.instancetype 在编译的时候 可以判断对象的真实类型，及而能知道对象有哪些方法属性，以来判断调用是否合法
 4.但凡自定义构造方法, 返回值尽量使用instancetype,不要使用id(id不能判断对象的真实类型)
 5.在工作构造方法中 为避免继承语法因素最好与self结合使用
 
 self:
 1.是一个隐私参数,代表当前对象,实例对象，或者类对象
 2.执行时调用RT的objc_msgSend();
 3. id _Nullable objc_msgSend(id _Nullable self, SEL _Nonnull op, ...)、
 
 super:
 1.super并不是隐藏参数，它实际上只是一个”编译器标示符”，
 2.它负责告诉编译器，当调用方法时，去调用父类的方法，而不是本类中的方法。
 
 3.在调用[super class]的时候，runtime会去调用objc_msgSendSuper方法，而不是objc_msgSend
 4.id _Nullable objc_msgSendSuper(struct objc_super * _Nonnull super, SEL _Nonnull op, ...)
  struct objc_super {
 __unsafe_unretained _Nonnull id receiver; // 消息接收者
 __unsafe_unretained _Nonnull Class super_class; // 消息接收者的父类
 
 _name:
 1.在方法中直接访问成员变量，底层还是通过self->name 指针访问的
 };
 */
- (instancetype)initWithName:(NSString *)name{
    self = [super init];
    _name  =  @"123";
    return self;
}


/**
 SEL
 a.SEL代表方法\函数名，一般叫做选择器，底层结构跟char *类似
 b.不同类中相同名字的方法，所对应的方法选择器是相同的
 c.一个类中不允许有同名的sel,它具有唯一性
 
 IMP
 1.imp:是一个函数指针（ typedef id (*IMP)(id, SEL, ...);）
 2.指向返回id类型值的方法的指针，是一种C类型
 3.每个函数还有两个隐藏的参数(id)self,(SEL)_cmd,这两个都是指针类型,每个占用8个字节
 
 _cmd:
 1.通过 _cmd 可以拿到当前的 SEL
 */
- (void)test2{
    SEL sel1 = @selector(test);
    SEL sel2 = NSSelectorFromString(@"test");
    NSString *sel3 = NSStringFromSelector(_cmd);
    
    // 某对象的 某个IMP
    IMP imp = [NSObject instanceMethodForSelector:@selector(test)];
    
}
@end
