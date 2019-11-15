//
//  object.m
//  OCGrammar
//
//  Created by xs on 2019/4/22.
//  Copyright © 2019 xs. All rights reserved.
//

#import "object.h"

// 声明类 实现类
static void test1(){
    @class
    @interface
    @implementation
    @end

}
// 声明属性 属性修饰符
static void test2(){
    @property
    0.作用范围:@public/@protected/@private/@package
    1.内存管理:strong,weak,copy,assign
    2.线程安全:nonatomic,atomic
    3.读写限制:readonly,readwrite
    4.命名自定义:setter=xxx getter=xxx
    5.类方法:class(之会生成setter和getter的声明)
    
}
// 声明协议
static void test3(){
    @protocol
    @required
    @optional
    @end
    <> 遵守协议
}
//对象代表
static void test4(){
    Class Nil
    id instancetype self super  nil
    
}
//方法代表
static void test5(){
  _cmd IMP @selector SEL
    
}
//协议代表
static void test6(){

    
}
//变量 参数 修饰符
static void test7(){
    __typeof
    __strong __weak __block __bridge @autoreleasepool
    __unsafe_unretained unsafe_unretained
    nullable _Nonnull _Nullable    __nullable __null_unspecified
}
   static void test8(){
    
    @try @catch @finally
}


/*


 
类的声明实现 继承 多态
协议的声明
 
成员变量的封装
方法的声明实现
对象本质 Block
内存管理
运行时消息机制

 

 
 属性修饰符

 对象代表
 方法代表
 协议代表
 */
@interface Person : NSObject
{
 
}
/*
 @property修饰符详解

 */
@property()NSString *name;
@property()NSInteger number;

@end

@interface Person (CD)

@end

@interface Person ()

@end

@implementation object


-(id)initWithStr1:(NSString *)str{
    
    if (self = [super init]) {
        return self;
    }else{
        return nil;
    }
 
}
-(instancetype)initWithStr2:(NSString *)str{
    return nil;
}

+ (Class)classWithStr{
    Class value = [self class];
    Nil 
    
    return value;
}
- (IMP)impWithStr{
    SEL sel = @selector(init);
    return nil;
}

@end





__weak __strong
