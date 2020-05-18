//
//  myObject.m
//  ObjectDe
//
//  Created by xs on 2019/11/5.
//  Copyright © 2019 xax. All rights reserved.
//

#import "myObject.h"

@implementation myObject
/** typedef struct objc_object *id;
1.是一种通用指针类型，是一种弱类型，编译时不进行类型检查
2.当指向类对象 或者元类对象的时候 运行过程中仍然是id类型的
3.当指向实例对象时候，运行过程中能确定其具体的类型
*/

/**instancetype(实例对象)
1.只能指向实例对象
3.instancetype 只能用于作为返回值类型
2.instancetype 在编译的时候 可以判断对象的真实类型，及而能知道对象有哪些方法属性，以来判断调用是否合法
4.但凡自定义构造方法, 返回值尽量使用instancetype,不要使用id(id不能判断对象的真实类型)
5.在工作构造方法中 为避免继承语法因素最好与self结合使用
*/

/**
self:
1.是一个隐私参数,代表当前对象,实例对象，或者类对象
2.执行时调用RT的objc_msgSend();
3. id objc_msgSend(id theReceiver, SEL theSelector, ...)



super:
0.子类调用父类的方法，方法中的self 仍然是当前子类对象
1.是个编译器的指令符号,只是告诉编译器在执行的时候,去调谁的方法
2.执行时调用RT的objc_msgSendSuper();
3.id objc_msgSendSuper(struct objc_super *super, SEL op, ...)
    struct objc_super {
     __unsafe_unretained _Nonnull id receiver; //实例对象 self
     __unsafe_unretained _Nonnull Class super_class; //指向父类
    };
 a:首先从super->super_class指向的父类的方法中查找对应的selector，
 b:找到后再使用 super->receiver 调用对应的selector。

spuerclass:(一个Class 类型的指针)
1.实例对象:只有Class，无spuerclass
2.子类(类对象):--->父类(类对象)--->基类(类对象)--->无spuerclass
3.子类(元类对象):--->父类(元类对象)--->基类(元类对象)--->基类(类对象)
*/
- (void)nilObject{
    Class ob1 = Nil;
    id ob2 = nil;
}

- (Class)getMyClassStr{
    return [self class];
}
-(id)initWithAge:(NSInteger)age{
    self = [super init];
    return self;
}

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    return self;
}

-(IMP)getFuncIMP{
    IMP func = [NSObject methodForSelector:@selector(superclass)];
    return func;
}
-(SEL)getFuncSel{
    SEL sel = @selector(copy);// 译器指令
    return sel;
}
- (Protocol *)getMyProtocol{
    Protocol *protocol = @protocol(NSObject);
    return protocol;
}

- (void)textClass:(Class)class ob:(id)ob sel:(SEL)sel imp:(IMP)imp protocol:(Protocol *)proctocol{
}
@end
