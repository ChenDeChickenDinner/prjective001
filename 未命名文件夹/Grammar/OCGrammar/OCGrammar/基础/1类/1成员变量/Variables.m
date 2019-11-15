//
//  Variables.m
//  OCGrammar
//
//  Created by xs on 2019/4/24.
//  Copyright © 2019 xs. All rights reserved.
//

#import "Variables.h"

@implementation Variables
- (instancetype)init{
    self = [super init];
    _valuePublic = 10;
    _valueProtected = 10;
    _valuePrivate = 10;
    _valueDef = 10;
    
    self->_valuePublic = 10;
    self->_valueProtected = 10;
    self->_valuePrivate = 10;
    self->_valueDef = 10;
    
    return self;
}
@end
@implementation VariablesSub
- (instancetype)init{
    self = [super init];
    _valuePublic = 10;
    _valueProtected = 10;
    //    _valuePrivate = 10;
    _valueDef = 10;
    
    self->_valuePublic = 10;
    self->_valueProtected = 10;
    //    self->_valuePrivate = 10;
    self->_valueDef = 10;
    return self;
}
@end
@implementation VariablesTest
+ (void)load{
    // 外部指针对象环境下:只能访问公共属性的
    Variables *value = [[Variables alloc]init];
    value->_valuePublic = 10;
    // value->_valueProtected = 10;
    // value->_valuePrivate = 10;
    // value->_valueDef = 10;
    
    // 没有绝对私有的变量
//    [value setValue:@"chende" forKey:@"_name"];
//    NSLog(@"value.nam = %@",[value valueForKey:@"_name"]);

}
@end
