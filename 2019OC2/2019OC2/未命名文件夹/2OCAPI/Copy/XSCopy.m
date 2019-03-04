//
//  XSCopy.m
//  2019OC2
//
//  Created by xs on 2019/3/2.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "XSCopy.h"

@implementation XSCopy

/**
 copy最根本的理论
 */

/**
可变 不可变
*/

/**
是否是新对象
*/

/**
 系统可变类
 */
- (void)test1{

}


/**
使用注意 copy 在不同数据类型情况下修饰 @property
 1.@property(nonatomic,copy) NSMutableArray *array; 危险
 */
- (void)test3{

}

/**
 自定义类
 1.mutableCopy 值服务于 Foundation中 特殊的几个类
 2.自定义的类 的 copy 不存在 mutableCopy
 3.所以mutableCopy不会在 修饰 @property 中出现以影响通用型
 3.当自定义类中出现包含其它对象的时候，属性对象是不是也应该一层层遵守 copy功能
 */
- (void)test2{

}
@end
