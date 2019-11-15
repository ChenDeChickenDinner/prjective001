//
//  VariablesProperty.m
//  OCGrammar
//
//  Created by xs on 2019/4/24.
//  Copyright © 2019 xs. All rights reserved.
//

#import "VariablesProperty.h"
@interface VariablesProperty ()
{
    NSString *name0;
    
    
    NSString *_name5;
    NSString *_name6;

}
/*@property
 1.生成对应的 set get 方法
 2.readonly,readwrite,setter=xxx getter=xxx 会对方法的生成做适当的限制
 3.@property 只觉得生成什么样子的 set get 方法 声明，其内部访问 的具体是哪个属性，其并不影响
 */
//一个存在 一个不存在
@property()NSString *name0;
@property()NSString *name1;

// 指定别名
@property()NSString *name2;
@property()NSString *name3;


@property(nonatomic)NSString *name4;
@property(nonatomic)NSString *name5;
@property(nonatomic)NSString *name6;
@property(nonatomic)NSString *name7;

@end
@implementation VariablesProperty
/*************************************(是否生成对应的成员变量)*****************************************************/
/* 自动实现 set get，并指定访问的成员变量
 1.实现 必须是由@property 声明的set get 方法,否者无效报错
 2.访问 @synthesize 指定的成员变量，若又指定 了别名则以别名为主
 3.若访问的成员变量不存在则自动生成一个
 */
// name0存在; 则不会主动生成
@synthesize name0;
// name1不存在;则会主动生成name1
@synthesize name1;

// _name2不存在;则主动生成_name2（目标编译器默认的做法）
@synthesize name2 = _name2;
// _Haha不存在;则主动生成_Haha
@synthesize name3 = _Haha;





/*************************************(set get的影响)*****************************************************/

/*
 1.@synthesize 手动实现其中一个方法
 2.如果二个都手动实现则会导致 @synthesize 失效，@synthesiz失效则不会自动生成对应的成员变量
 3.如果二个都必须手动实现，则需要自己声明对应的成员变量
 */
@synthesize name4 = _name4;
- (void)setName4:(NSString *)name4{
    _name4 = name4;
}

/* @synthesize 手动实现二个方法
1.手动实现 set get，
2.指定访问的成员变量
3.主动添加属性
 */

@synthesize name5 = _name5;
- (void)setName5:(NSString *)name5{
    _name5 = name5;
}
- (NSString *)name5{
    if (_name5 == nil) {
        _name5 = [NSString stringWithFormat:@"name5"];
    }
    return _name5;
}

/* 无@synthesize 手动实现二个方法
 1.手动实现 set get，
 2.指定访问的成员变量
 3.主动添加属性
 */
- (void)setName6:(NSString *)name6{
    _name6 = name6;
}
- (NSString *)name6{
    if (_name6 == nil) {
        _name6 = [NSString stringWithFormat:@"name6"];
    }
    return _name6;
}
/*
 1.不会生成对应的成员变量
 2.不会实现set get 方法
 3.一般用法是仅仅利用  @property 声明的 方法，然后手动选择实现
 */
@dynamic name7;


- (instancetype)init{
    self = [super init];

    
    return self;
}

@end

@interface VariablesPropertyTest : NSObject

@end
@implementation VariablesPropertyTest
+ (void)load{
    VariablesProperty *value= [[VariablesProperty alloc]init];
    value.name4 = @"name4";
    value.name5 = @"name5";
    value.name6 = @"name6";

    NSLog(@"123");
}
@end
