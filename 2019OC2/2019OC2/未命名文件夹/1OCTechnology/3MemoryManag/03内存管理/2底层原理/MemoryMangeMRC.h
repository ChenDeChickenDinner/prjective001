//
//  Person.h
//  MRC1
//
//  Created by xs on 2019/3/4.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Person;
@interface Car : NSObject
// 解决循环引用问题
@property(nonatomic,assign) Person *person;
@end

@interface Person : NSObject
{
@public
    Car *_car;
    NSString *_name;
    int _age;
}
- (void)setCar:(Car *)car;
- (Car *)getCar;

- (void)setName:(NSString *)name;
- (NSString *)getName;

- (void)setAge:(int)age;
- (int)getAge;


/**
 1.retain:release1旧对象 ，retain新对象【适用于OC对象】
 2.copy:release1旧对象 ，copy新对象
 3.__unsafe_unretained,纯粹只是指向对象，没有任何额外的操作
 4.assign:直接赋值【适用于非OC对象】
 */
@property(nonatomic,retain) Car *car1;
@property(nonatomic,copy) NSString *name2;
@property(nonatomic,assign) int age2;

@end
