//
//  Interface2.h
//  1111
//
//  Created by xs on 2020/11/13.
//

#import "Interface1.h"

#pragma warning-继承
/*
 1.子类拥有父类的全部属性、方法
 2.子类可以重写父类的方法实现
 3.父类指针可以指向子类对象 多态
 */
@interface Interface2 : Interface1

@end
#pragma warning-扩展
/*
 */
@interface Interface2()

@end
#pragma warning-分类
/*
 1.如果分类中有和原有类同名的方法, 会优先调用分类中的方法, 就是说会忽略原有类的方法，同名方法调用的优先级为 分类 > 本类 > 父类；
 2.如果多个分类中都有和原有类中同名的方法, 那么调用该方法的时候执行谁由编译器决定；编译器会执行最后一个参与编译的分类中的方法
 */
@interface Interface2(Category)

@end
