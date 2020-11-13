//
//  02枚举.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/11.
//

#import "02Enum.h"

@implementation _2__
/**
 枚举
 1.枚举值是当做整形常量处理，称为枚举常量
 2.枚举元素的值取决于定义时各枚举元素排列的先后顺序,默认第一个为0，后面依次+1
 3.可以在定义的 时候 自定义 枚举常量的值
 4.定义类型，枚举值 以,号隔开,可以自定义常量值
 */
- (void)test5{
    
    enum type1{
        type1_0,
        type1_1,
    };
    
    typedef  NS_ENUM(NSInteger,type2){
        type2_0,
        type2_1,
    };
    
    typedef NS_OPTIONS(NSUInteger, type3){
        type3_0 =  0,
        type3_1 = (1 << 0),
        type3_2 = (1 << 1),
        type3_all = (type3_0|type3_1|type3_2)
    };
  
}
@end
