//
//  load_func.m
//  STProject
//
//  Created by xs on 2021/3/15.
//

#import "load_func.h"

@implementation load_func

#pragma warning - 类加载

/*
 0.底层原理
 1.load 是走的是函数指针调用而非消息机制那一套，所以不存在分类覆盖原类load方法
 
 1.调用时机
 每个类、分类的+load，在程序运行过程中只调用一次，发生在main函数之前，一般不主动调用

 
 2.调用顺序
 1、不同的类按照编译先后顺序调用+load方法（先编译，先调用）；
 2、子类调用+load方法时，要先要调用父类的+load方法；(父类优先与子类，与继承不同)；
 3、类要优先于分类调用+load方法；
 4、分类的按照编译先后顺序调用+load方法（先编译，先调用）。

 
 */
+ (void)load{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
}

/*
 1.initialize是在类第一次接收到消息时调用
 2.先调用父类的initialize 再调用子类的 initialize
 3.+initialize是通过objc_msgSend消息机制的方式调用
     •分类中的initialize会覆盖原来类中的initialize方法
     •如果子类没有实现+initialize方法会调用父类中的initialize方法(若有多个子类，父类中的+initialize方法会调用多次)
 */
+ (void)initialize
{
    if (self == [self class]) {
        NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
    }
}
@end


@implementation load_func(cat)
+ (void)load{
    NSLog(@"");

}
@end


