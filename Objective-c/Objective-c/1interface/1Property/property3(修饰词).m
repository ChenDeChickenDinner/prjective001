//
//  property.m
//  2020COC
//
//  Created by xs on 2019/7/11.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface property3 : NSObject

/**
 内存管理
 */
@property(strong)   NSString *name11;
@property(weak)     NSString *name12;
@property(copy)     NSString *name13;
@property(assign)   NSString *name14;
/**
 变量空提示，一般修饰对象
 */
@property(nonnull)NSString *name5;
@property(nullable)NSString *name6;


/**
 线程安全
 */
@property(nonatomic) NSString *name21;
@property(atomic)   NSString *name22;


/**
 操作限制
 */
@property(readwrite) NSString *name31;
@property(readonly) NSString *name32;


/**
 方法别名
 */
@property(setter=toSettingName:,getter=isPro) NSString *name4;


/**
 添加类方法
 1.给类添加类方法,注意必须实现，不然存在方法找不到,一般配合readonly、readwrite使用
 */
@property(class,readonly) property3 *sharedInstance;

@end



@implementation property3

+ (instancetype)sharedInstance{
    return [[self alloc]init];
}
@end
@interface propertyTest1 : NSObject


@end
@implementation propertyTest1
+ (void)load{
    property3 *ob = property3.sharedInstance;
 
}
@end
