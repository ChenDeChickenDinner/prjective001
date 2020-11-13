//
//  Interface.h
//  2000YEARLATER
//
//  Created by xs on 2020/11/12.
//

#import <Foundation/Foundation.h>
// 1.类的声明 实现
// 2.成员变量的作用域 封装 点语法
// 3.对象方法 类方法 表达
// 4.类的继承 扩展 分类
// 5.协议  表达
// 6.block 表达
// 7.内存管理
// 9.特殊关键字

// 8.基类的能力
//Class  id  instancetype self super sel



// 10

@protocol MyProtocol <NSObject>

- (void)test1;// 默认是必须实现的

@required     // 必须实现的方法
- (void)test2;
@optional     //不强制要求实现的方法
- (void)test3;

@property(nonatomic,assign) BOOL isBool;
@end


/*类的声明
 1.OC自定义的类全部继承自基类NSObject
 2.类不是重复声明实现
 */
@interface Interface : NSObject<MyProtocol>




//2.Ivar的封装
@property (nonatomic) NSString *name1;
@property (nonatomic) NSString *name2;
@property (nonatomic) NSString *name3;
@property (nonatomic) NSString *name4;

//2.@property修饰关键字
@property(readonly)  NSString *name11;
@property(readwrite) NSString *name22;
@property(nonnull) NSString *name32;
@property(nullable) NSString *name42;
@property(setter=writeNme:,getter=isName) NSString *name51;


- (void)test1;
@end

/*类扩展
 
 */
@interface Interface()

@end



/*类的分类
 1.如果分类中有和原有类同名的方法, 会优先调用分类中的方法, 就是说会忽略原有类的方法，同名方法调用的优先级为 分类 > 本类 > 父类；
 2.如果多个分类中都有和原有类中同名的方法, 那么调用该方法的时候执行谁由编译器决定；编译器会执行最后一个参与编译的分类中的方法

 */
@interface Interface(XS)
- (void)test1;
@end
