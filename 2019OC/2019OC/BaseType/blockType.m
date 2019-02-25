//
//  blockType.m
//  2019OC
//
//  Created by xs on 2019/2/25.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "blockType.h"



@interface blockType()
typedef void(^myBlock)(void);
@property(nonatomic,copy) void(^block1)(void);
@property(nonatomic,copy) myBlock block2;
@end

@implementation blockType
+ (void)testBlock:(void(^)(void))blcok{

}
+ (void)load{
    
}
/**
 block基本用法
 */
+ (void)test1{
    /*
     1.声明block类型变量: 返回值类型(^变量)(参数类型列表)
     2.block实现: ^(形参列表...){
        返回值
     };
     3.block调用: block();
     */
    int (^block)(int) = ^(int a){
        NSLog(@"a = %d\n",a);
        return 0;
    };
    block(10);

    /*
     1.block定义者:根据 参数，执行代码，返回结果
     2.block持有者:负责 执行传参
     */
    /*
     block 运用的各种形式
     1.直接代码块
     2.当参数传递
     3.当对象属性
     */

}
/*block本质
 1.一个功能代码块，会对其内部使用的外部变量进行捕捉，在适当的时候执行代码
 2.一个OC对象
 */
+ (void)test2{

}
@end

