//
//  protocol.m
//  2020COC
//
//  Created by xs on 2019/7/11.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol XSProtocol <NSObject>
// 默认是必须实现的
- (void)test3;

//不强制要求实现的方法
@optional
- (void)test1;

// 必须实现的方法
@required
- (void)test2;

//通过@property声明方法
@property (nonatomic, copy) NSString *datetime;

@end


/**
 1.一个类可以遵守多个协议
 2.子类也能继承父类遵守的协议
 */
@interface protocolClass : NSObject<XSProtocol>

//成员变量遵守协议
@property (nonatomic, copy) NSString<XSProtocol> *name;
//参数对象遵守协议
- (void)classObjc:(Class<XSProtocol>)classObjc variableObjc:(NSString<XSProtocol> *)variableObjc;
@end


@implementation protocolClass
- (void)classObjc:(Class<XSProtocol>)classObjc variableObjc:(NSString<XSProtocol> *)variableObjc{
  
}


/**
 在协议中 @synthesize能实现 @property 声明的方法
 */
@synthesize datetime;

- (void)test2 {
    
}

- (void)test3 {
    
}


@end


@interface propertyTest2 : NSObject


@end
@implementation propertyTest2
+ (void)load{
    protocolClass *ob = [[protocolClass alloc]init];
    ob.datetime = @"123";
    NSLog(@"%@",ob.datetime);
}
@end
