//
//  Protocol.m
//  TextCHen1
//
//  Created by xs on 2017/5/25.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "Protocol.h"

@implementation Protocol

//获取对象，对象的类对象，对象的父类对象
- (instancetype)self;
- (Class)class
@property (readonly) Class superclass;

// 对象发消息
- (id)performSelector:(SEL)aSelector;

//对象做比较
- (BOOL)isEqual:(id)object;
@property (readonly) NSUInteger hash;

//对象是否属于某类
- (BOOL)isKindOfClass:(Class)aClass;
- (BOOL)isMemberOfClass:(Class)aClass;

//对象是否遵守了某协议，实现了某方法
- (BOOL)conformsToProtocol:(Protocol *)aProtocol;
- (BOOL)respondsToSelector:(SEL)aSelector;


//对象的打印
@property (readonly, copy) NSString *description;


//对象的计数器管理
- (instancetype)retain OBJC_ARC_UNAVAILABLE;
- (oneway void)release OBJC_ARC_UNAVAILABLE;
- (instancetype)autorelease OBJC_ARC_UNAVAILABLE;
- (NSUInteger)retainCount OBJC_ARC_UNAVAILABLE;


//+ - (BOOL)isEqual:(id)object;
- (void)text1{

    NSObject *a = [[NSObject alloc]init];
    NSObject *b= [[NSObject alloc]init];

    UIColor *color1 = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
    NSLog(@"color1 == color2 = %@", color1 == color2 ? @"YES" : @"NO"); // NO
    NSLog(@"[color1 isEqual:color2] = %@", [color1 isEqual:color2] ? @"YES" : @"NO"); // YES


    /*
     *  3 = 3  符号 用在 基本数据类型 数据 做比较时候 是数值的比较
     *  a = b  符号 用在 对象之间的 比对时候 是比对的地址，是否为同一个对象
     *  isEqual 是对象与对象的 内在属性是否一致 做比较，二个相同的对象,比较肯定相同，二个不同的对象比较也可能相同
     *  isEqualToString/isEqualToArray/isEqualToDate/isEqualToDictionary/isEqualToSet/ 系统提供的比对方法
     *  自定义对象的 isEqual 方法重写 

     */
}
//@property (readonly) NSUInteger hash
- (void)text2{
/*
 
    * hash 当成员被加入到Hash Table中时, 会给它分配一个hash值, 以标识该成员在集合中的位置
    * hash方法只在对象被添加至NSSet和设置为NSDictionary的key时会调用
    * hash值是对象判等的必要非充分条件
 */
}

- (void)text3{
    /*
     */
}


- (void)text4{
    /*
     */
}


- (void)text5{
    /*
     */
}


- (void)text6{
    /*
     */
}


- (void)text7{
    /*
     */
}

- (void)text8{
    /*
     */
}

- (void)text9{
    /*
     */
}



@end
/***************	Basic protocols		***************/

@protocol NSCopying
- (id)copyWithZone:(nullable NSZone *)zone;

@protocol NSMutableCopying
- (id)mutableCopyWithZone:(nullable NSZone *)zone;

@protocol NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;


@protocol NSSecureCoding <NSCoding>
+ (BOOL)supportsSecureCoding;

/***********	Discardable Content		***********/
@protocol NSDiscardableContent
@required
- (BOOL)beginContentAccess;
- (void)endContentAccess;
- (void)discardContentIfPossible;
- (BOOL)isContentDiscarded;



















