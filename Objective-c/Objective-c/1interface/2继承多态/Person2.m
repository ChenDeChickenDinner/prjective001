//
//  Person.m
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import "Person2.h"

@implementation Person2
- (void)eat{
    NSLog(@"selfClass = %@:%s",[self class],__func__);
}
- (void)selfEat{
    NSLog(@"selfClass = %@:%s",[self class],__func__);

}
- (NSString *)name{
    return @"Person";
}

@end


@implementation students1
- (void)rewriteEat{
    [super rewriteEat];
    NSLog(@"selfClass = %@:%s",[self class],__func__);

}
- (NSString *)name{
    return @"students1";
}
@end

@implementation students2
- (void)rewriteEat{
    NSLog(@"selfClass = %@:%s",[self class],__func__);

}
- (NSString *)name{
    return @"students2";
}
@end
@implementation CXTest
+(void)load{
    
}


/**
 子类拥有父类的所有成员变量与方法
 */
+ (void)test1{
    students1 *instance = [[students1 alloc]init];
    [instance eat];
}
/**
 子类可以重写父类的方法,在重写的时候可以调用super 经过父类的公用逻辑
 */
+ (void)test2{
    students1 *instance = [[students1 alloc]init];
    [instance rewriteEat];
}
/**多态
 父类指针可以指向子类对象
 1.多种情况下的实例对象 只要他们的父类一样则只用一个父类就可以表示代替
 
 2.收集各个子类对象的不同之处，通过声明一个父类方法，子类单独去实现
 */
+ (void)test3{
    Person2 *instance1 = [[students1 alloc]init];
    Person2 *instance2 = [[students2 alloc]init];

    [instance1 name];
    [instance2 name];

}
@end
