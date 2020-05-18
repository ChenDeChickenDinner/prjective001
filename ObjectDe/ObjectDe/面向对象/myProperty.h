//
//  myProperty.h
//  ObjectDe
//
//  Created by xs on 2019/11/5.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface myProperty : NSObject{
int _default; // 默认是 @protected的
@private int _height; // 有的:私有，只能在当前类的对象方法中直接访问。
//@protected NSString *_name; // 受保护的:可以在当前类以及子类的对象方法中直接访问
@package NSString *_oldNmae; // 包:同一个“体系内”（框架）可以访问，介于@private和@public之间
@public int _age; // 公共的:任何地方都可以直接访问
}

@property(assign)int array1;
@property(strong)NSArray * _Nonnull array11;
@property(copy)NSArray * _Nullable array12;
@property(weak)NSArray * _Nullable array13;

@property(nonatomic)NSArray * _Nullable array14;
@property(atomic)NSArray * _Nonnull array15;

@property(nonnull)NSArray *array16;
@property(nullable)NSArray *array17;

@property(readonly)NSArray * _Nullable array18;
@property(readwrite)NSArray * _Nonnull array19;

@property(setter=setArray:,getter=isPro)NSArray * _Nullable array21;
/**
添加类方法
1.给类添加类方法,注意必须实现，不然存在方法找不到,一般配合readonly、readwrite使用
*/
@property(class,readonly)myProperty * _Nullable sharedInstance;


@end


