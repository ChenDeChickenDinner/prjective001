//
//  XSOBject.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/17.
//

#import "Class.h"



@implementation XSOBject
/*
 当 类 或者 类别 加入Runtime中时（就是被引用的时候）就会执行 load 方法。
 1. 父类 先于 子类执行；子类未实现，不会 调用父类的 load 方法；原类>分类(a,b,c 看编译顺序)
 2. load 方法的本质：直接执行函数指针，load 方法不会执行发送消息objc_msgSend那一套流程，这也解释了，为何子类、分类的load 方法不会覆盖父类的load 方法
 */
+ (void)load{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
}
/*
 在类、或者其子类，接收到第一条消息之前被执行。

 1. 类引入项目，但未使用，则不会执行；
 2. 父类 先于 子类执行；（同 load方法特点）
 3. 子类未实现，则 会调用 父类的initialize方法；
 4. 类的分类实现了 initialize方法，则 会覆盖 类中的 initialize方法；
 5. 类存在多个分类，且都实现了 initialize 方法，则依赖于 Compile Sources 中的顺序，执行顺序中 最后一个分类 的 initialize 方法
 6. initialize 方法最终是通过 objc_msgSend 来执行的。
 */
+ (void)initialize
{

    if (self == [XSOBject class]) { //可能被多次调用
        
    }
}
//alloc实现了开辟内存空间、创建对象、并且将内存空间和对象关联起来(类才有创建对象的能力)
+ (instancetype)alloc{
    return [super alloc];
}


//new其实就是[[XXX alloc] init]，只是不同的写法。

@end

@implementation XSOBject2
+ (void)load{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
    // 是否是某类的子类
    BOOL ob1 =  [XSOBject isSubclassOfClass:[NSObject class]];
    // 是否遵守某协议
    BOOL ob2 =  [XSOBject conformsToProtocol:@protocol(NSObject)];
    // 实例对象是否响应某方法
    BOOL ob3 =  [XSOBject instancesRespondToSelector:@selector(description)];
    // 根据实例对象的选择器返回函数指针
    IMP imp = [XSOBject instanceMethodForSelector:@selector(description)];


}
@end







