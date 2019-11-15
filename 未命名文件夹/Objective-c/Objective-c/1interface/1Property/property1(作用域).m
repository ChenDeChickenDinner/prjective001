//
//  property.m
//  2020COC
//
//  Created by xs on 2019/7/11.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface property : NSObject



/*
 1.作用域
 2.封装
 3.修饰词
 4.各种骚操作
 */
{
    int _default; // 默认是 @protected的
    
@public // 公共的:任何地方都可以直接访问
    int _age;
@protected // 受保护的:可以在当前类以及子类的对象方法中直接访问
    int _height;
@private // 有的:私有，只能在当前类的对象方法中直接访问。
    char * _name;
@package // 包:同一个“体系内”（框架）可以访问，介于@private和@public之间
    NSString *_oldName;
}



@end



@implementation property
- (instancetype)init{
   self =  [super init];
    
    return self;
}
@end

@interface propertySub : property
@end

@implementation propertySub
- (instancetype)init{
    self =  [super init];
    self->_default = 10;// 子类可以访问
//    self->_name = 20;
    return self;
}
@end



@interface propertyOther :NSObject
@end
@implementation propertyOther
- (instancetype)init{
    self =  [super init];
    property *ob = [[property alloc]init];
    ob->_age = 10;//只能访问公共的
    return self;
    
}
@end
