//
//  XSLoad.m
//  Runtime
//
//  Created by xs on 2020/11/20.
//  Copyright © 2020 xax. All rights reserved.
//

#import "XSLoad.h"
/*
 0.底层原理
 1.load 是走的是函数指针调用而非消息机制那一套，所以不存在分类覆盖原类load方法
 1.调用时机
 在runtime加载类或者分类的时候会被调用一次,发生在main函数之前，一般不主动调用
 2.调用顺序
 1、不同的类按照编译先后顺序调用+load方法（先编译，先调用）；
 2、子类调用+load方法时，要先要调用父类的+load方法；(父类优先与子类，与继承不同)；
 3、类要优先于分类调用+load方法；
 4、分类的按照编译先后顺序调用+load方法（先编译，先调用）。
3.实际运用
1、hook方法的时候,切要防止多次调用
2、涉及到组件化开发中不同组件间通信，注册相关协议等等
 */
@implementation XSLoad
+ (void)load{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
}
/*
 1.initialize是在类第一次接收到消息时调用，每个类只会initialize一次（父类的initialize方法可能调用多次）
 2.+initialize是通过objc_msgSend消息机制的方式调用
 •分类中的initialize会覆盖原来类中的initialize方法
 •如果子类没有实现+initialize方法会调用父类中的initialize方法(若有多个子类，父类中的+initialize方法会调用多次)
 3.一般还是利用load实现一些操作
 */
+ (void)initialize
{
    if (self == [self class]) {
            
    }
}
@end
@implementation XSLoad2
+ (void)load{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
}
@end
@implementation XSLoad2(Category1)
+ (void)load{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
}
@end
@implementation XSLoad2(Category2)
+ (void)load{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
}
@end
