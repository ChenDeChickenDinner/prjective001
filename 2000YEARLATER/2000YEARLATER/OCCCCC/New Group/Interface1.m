//
//  Interface1.m
//  1111
//
//  Created by xs on 2020/11/13.
//

#import "Interface1.h"

@implementation Interface1

#pragma warning-@property
/*
1.声明set get方法
2.当我们同时重写了setter and getter方式时，系统会报错，原因是找不到实例变量
 */
//- (void)setName1:(NSString *)name1{
//    _name1 = name1;
//}
- (NSString *)name1{
    return _name1;
}
#pragma warning-@synthesize
/*
 1.必须结合 @property 使用
 2.实现 @property的声明,没有显式手动实现则编译器自动实现
 3.根据情况决绝是否生成指定的成员变量
 */
//为类生成一个和name2同名的实例变量。我们在类文件中赋值取值是可以直接用
@synthesize name2;

//如果不存在_name3变量，则会创建一个_name3成员变量，如果存在则不会添加_name3成员变量
@synthesize name3 = _name3;


- (void)setName2:(NSString *)name2{
    name2 = name2;
}
- (NSString *)name2{
    return name2;
}

- (void)setName3:(NSString *)name3{
    _name3 = name3;
}
- (NSString *)name3{
    return _name3;
}
#pragma warning-@dynamic
/*
就是要来告诉编译器，代码中用@dynamic修饰的属性，
其getter和setter方法会在程序运行的时候或者用其他方式动态绑定，以便让编译器通过编译。
其主要的作用就是用在NSManageObject对象的属性声明上，
由于此类对象的属性一般是从Core Data的属性中生成的，
Core Data框架会在程序运行的时候为此类属性生成getter和Setter方法。
 */
@dynamic name4;
@end
