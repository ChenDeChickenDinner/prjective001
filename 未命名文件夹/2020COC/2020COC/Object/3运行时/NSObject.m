//
//  NSObject.m
//  2020COC
//
//  Created by xs on 2019/7/17.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObjectXSSub : NSObject

@end

@implementation NSObjectXSSub



/**
 
 */
+(void)test1{
    Class class = [NSObject class];

}

/* 万能指针 id
 1.id == 万能指针，可以指向任何类型的实例对象
 2.id 是动态数据类型 在编译阶段不能进行类型检测
 */
+ (void)load{
    Class class = [NSObject class];
    id objc = [[NSObject alloc]init];
    class = objc = nil;
}


/*
 带类型检测的对象返回值类型 instancetype
 1.instancetype == id == 万能指针 == 指向一个对象
 2.instancetype 在编译的时候 可以判断对象的真实类型
 3.instancetype 只能用于作为返回值类型
 4.但凡自定义构造方法, 返回值尽量使用instancetype,不要使用id(id不能判断对象的真实类型)
 */
- (instancetype)init{
    self = [super init];
    if (self) {
        return self;
    }else{
        return nil;
    }
}


/**
 self:
 1.方法的隐藏参数，代表当前对象，调用的是本类的方法
 2.self 执行方法的原理 objc_msgSend(id _Nullable self, SEL _Nonnull op, ...)
 
 
 super:
 1.
 2.super 执行方法的原理 objc_msgSendSuper(struct objc_super * _Nonnull super, SEL _Nonnull op, ...)
 */
- (void)test2{
    Class class1 = [self class];
    Class class2 = [super class];
    
}
@end
