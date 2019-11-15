//
//  property.m
//  2020COC
//
//  Created by xs on 2019/7/11.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface property2 : NSObject
{
    NSString *_name0;
}
//@property:按规则生成 set get 方法的声明

@property NSString *name0;
@property NSString *name1;
@property NSString *name2;
@property NSString *name3;

@end



@implementation property2

//手动全部实现 则不会自动生成 对应的下划线变量，只能手动添加对应的实例变量
- (void)setName0:(NSString *)name0{
    _name0 = name0;
}
- (NSString *)name0{
    return _name0;
}



/** @synthesize
 1.实现 @property的声明，
 2.并且生成成员变量 name1
 */
@synthesize name1;



//只要有了成员变量则可以手动实现set get
@synthesize name2;
- (void)setName2:(NSString *)name{
    name2 = name;
}
- (NSString *)name2{
    return name2;
}

//生成指定名称的成员变量
@synthesize name3 = _name3;
- (void)setName3:(NSString *)name3{
    _name3 = name3;
}
- (NSString *)name3{
    return _name3;
}




@end

@interface propertyTest : NSObject


@end
@implementation propertyTest
+ (void)load{
    property2 *ob = [[property2 alloc]init];
    ob.name0 = @"123";
    NSLog(@"%@",ob.name1);
}
@end
