//
//  CDObject.m
//  OCGrammar
//
//  Created by xs on 2019/4/24.
//  Copyright © 2019 xs. All rights reserved.
//

#import "CDObject.h"

@implementation CDObject
/** 成员变量的访问
 1.访问方式
 a.当前对象直接访问 b.指针权限访问
 */
- (instancetype)init{
    self = [super init];
    
    
    /*本类对象(self)环境下:可以访问所有类型的
     1.直接访问
     2.指针访问
     */
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

@implementation CDObjectSub
- (instancetype)init{
    self = [super init];
    
    /*子类对象(self)环境下:可以访问私有类型之外的所有类型
     1.直接访问
     2.指针访问
     */
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

@implementation TestClass
+ (void)load{

    // 外部指针对象环境下:只能访问公共属性的
    CDObject *value = [[CDObject alloc]init];
    value->_valuePublic = 10;
    // value->_valueProtected = 10;
    // value->_valuePrivate = 10;
    // value->_valueDef = 10;
}
@end
