//
//  XSTestObject.m
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import "XSTestObject.h"

#import <objc/runtime.h>

@protocol XSProtocol <NSObject>
// 默认是必须实现的
- (void)test3;

//不强制要求实现的方法
@optional
- (void)test1;

// 必须实现的方法
@required
- (void)test2;

//通过@property声明方法，可以让遵守协议的类 根据处理方式不同:新增成员变量，或者只实现方法，或者都有

@property (nonatomic, copy) NSString *name1;
@property (nonatomic, copy) NSString *name2;
@property (nonatomic, copy) NSString *name3;
@property (nonatomic, copy,class) NSString *name4;

@end

@interface XSTestObject : NSObject<XSProtocol>

@end


@implementation XSTestObject
//新增生成 成员变量 name1,且有set get 方法的实现
@synthesize name1;
//新增生成 成员变量 _name2,且有set get 方法的实现
@synthesize name2 = _name2;

//未生成 成员变量 ,只有有set get 方法的实现
- (void)setName3:(NSString *)name3{
    NSLog(@"%s",__func__);
}
- (NSString *)name3{
    return @"name3";
}

// 添加类方法的实现
@dynamic name4;
+ (void)setName4:(NSString *)name4{
    
}
+ (NSString *)name4{
    return nil;
}
- (void)test2 {
}

- (void)test3 {
}

@end
@implementation XSProtoclTest

+ (void)load{
    
    unsigned int numIvars; //成员变量个数
    Ivar *vars = class_copyIvarList(NSClassFromString(@"XSTestObject"), &numIvars);
    
    NSString *key=nil;
    for(int i = 0; i < numIvars; i++) {
        Ivar thisIvar = vars[i];
        key = [NSString stringWithUTF8String:ivar_getName(thisIvar)];  //获取成员变量的名字
        NSLog(@"variable name :%@", key);
        key = [NSString stringWithUTF8String:ivar_getTypeEncoding(thisIvar)]; //获取成员变量的数据类型
        NSLog(@"variable type :%@", key);
    }
                                    
}
@end
