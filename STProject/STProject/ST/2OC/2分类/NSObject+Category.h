//
//  NSObject+Category.h
//  STProject
//
//  Created by xs on 2021/3/12.
//

#import <Foundation/Foundation.h>

#pragma warning-分类
/*
 1.作用:可以为元类添加新的属性、方法、协议，在运行时动态添加到元类中去的
 
 2.加载原理：
  a.编译阶段:一个分类就是一个 category_t 类型的变量
  b.运行时:循环所有分类，利用运行时机制把分类中的属性、方法、协议列表都添加到类跟元类中去
  C.结果:分类跟元类的方法都存在，共存
  
 4.调用:
 a: 通过runtime消息机制调用的方法：分类(多分类看编译顺序) > 本类 > 父类
 b: 通过方法地址调用的方法 是不受分类影响的，比如分类中的load
 
 */
@interface NSObject(Category1)

// 增加 set get 对象方法 声明
@property(nonatomic,strong) NSString *name;

// 增加 set get 的类方法 声明
@property(class,nonatomic,assign) double valueNum;

-(void)test;
+(void)test;
@end
@interface NSObject(Category2)
-(void)test;
+(void)test;
@end

