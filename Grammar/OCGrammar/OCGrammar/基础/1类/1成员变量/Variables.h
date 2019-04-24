//
//  Variables.h
//  OCGrammar
//
//  Created by xs on 2019/4/24.
//  Copyright © 2019 xs. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Variables : NSObject
{
/*
 1.成员变量最好以下划线开头 以与普通变量区分开来
 2.成员变量的使用权限
     @private    私有的:只能在当前类的对象方法中直接访问,私有的也能通过Kvc访问修改
     @protected  受保护的:可以在当前类以及子类的对象方法中直接访问（默认就受保护类型的）
     @public     公共的:任何地方都可以通过指针直接访问
 3.成员变量的访问方式,在有使用权限的条件下
     a.只有对象指针 只能通过 指针访问
     b.内部有隐藏的self指针，可以直接访问,其最终还是 转换成了 self->属性
 */


/*声明属性
 1.有没有:只有在类的声明当中 对象一定拥有，不论其是什么权限限制，不论其声明在哪
 2.有没有使用权限:本类 子类 指针对象 针对三种不同的场景有不同的使用权限
 3.能不能拿到声明:有了不一定能直接使用，在编译器层需要 有声明才能使用
 */
    
    int _valueDef;  //默认是受保护类型的@protected
    
@private
    int _valuePrivate;
    NSString *_name;
@protected
    int _valueProtected;
    
@public
    int _valuePublic;
}
@end

@interface VariablesSub : Variables

@end

@interface VariablesTest : NSObject

@end
