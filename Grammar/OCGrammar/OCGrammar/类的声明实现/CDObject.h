//
//  CDObject.h
//  OCGrammar
//
//  Created by xs on 2019/4/24.
//  Copyright © 2019 xs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDObject : NSObject
//成员变量的封装
/*
 1.成员变量最好以下划线开头 以与普通变量区分开来
 2.成员变量的作用范围
 @private    私有的:只能在当前类的对象方法中直接访问。
 @protected  受保护的:可以在当前类以及子类的对象方法中直接访问（默认就受保护类型的）
 @public     公共的:任何地方都可以通过指针直接访问
 */
{
    int _valueDef;//@protected
    
    @private
    int _valuePrivate;
    
    @protected
    int _valueProtected;
    
    @public
    int _valuePublic;
    
  
}
@end

// 继承 多态
@interface CDObjectSub : CDObject

@end

// 测试类
@interface TestClass : NSObject

@end

NS_ASSUME_NONNULL_END
