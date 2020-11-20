//
//  Interface1.h
//  1111
//
//  Created by xs on 2020/11/13.
//

#import <Foundation/Foundation.h>


//1.只能一次声明一次实现
@interface Interface1 : NSObject
#pragma warning-Ivar的作用域
{
    int _b2; // 默认是 受保护的
    @public // 公共的:任何地方都可以直接拿对象通过指针访问
    int _a;
    @protected // 受保护的:可以在当前类以及子类的对象方法中直接访问
    int _b1;
    @private // 有的:私有，只能在当前类的对象方法中直接访问。
    int _c1;
}
@property int c2; // 默认是 私有的

#pragma warning-Ivar的封装
@property (nonatomic) NSString *name1;
@property (nonatomic) NSString *name2;
@property (nonatomic) NSString *name3;
@property (nonatomic) NSString *name4;

#pragma warning-@property修饰关键字
@property(readonly)  NSString *name11;
@property(readwrite) NSString *name22;
@property(nonnull) NSString *name32;
@property(nullable) NSString *name42;
@property(setter=writeNme:,getter=isName) NSString *name51;
@end


