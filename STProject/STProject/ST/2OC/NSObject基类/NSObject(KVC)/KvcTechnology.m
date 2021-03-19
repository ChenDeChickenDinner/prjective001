//
//  KvcTechnology.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "KvcTechnology.h"


/*
 1.访问和修改私有变量
 2.修改控件的内部属性
 3.获取集合对象
 4.模型转换
 */
@interface person_kvcsub : NSObject
@property(nonatomic,copy) NSString *name;

@end

@interface person_kvc3 : NSObject
@property(nonatomic,assign) double age;
@property(nonatomic,copy) NSString *name;

@property(nonatomic,strong) person_kvcsub *sub;
@end

@implementation person_kvc3

- (instancetype)init
{
    self = [super init];
    if (self) {
        {// 对象键值编码
            
            /*
             - (void)setValue:(nullable id)value forKey:(NSString *)key;   通过Key来设值

              内部赋值原理调用顺序
              1.找 setKey: 方法,找不到则
              2.找 _setKey:方法,找不到则
              3.调用accessInstanceVariablesDirectly查看返回值，是否允许直接访问成员变量
              a.若不允许则:抛出异常NSUnknownKeyException
              b.若允许则：按照_key、_isKey、key、isKey顺序查找成员变量,直接赋值,找不到则抛出异常NSUnknownKeyException
             

             - (nullable id)valueForKey:(NSString *)key;  直接通过Key来取值
              内部取值原理调用顺序
              1.按照getKey、key、 isKey、_key顺序查找方法
              2.查看accessInstanceVariablesDirectly方法的返回值
              3.按照_key、_isKey、key、isKey顺序查找成员变量,直接取值
              4.调用valueForUndefinedKey:并抛出异常NSUnknownKeyException
             */
            [self setValue:@"111" forKey:@"name"];
            
            [self valueForKey:@"name"];

        }
        {//容器键值编码
            
        }
        {//  forKeyPath
            [self setValue:@"111" forKey:@"sub.name"];
            [self valueForKey:@"sub.name"];

        }
        { //安全验证
            NSError *error;
            NSString *key = @"name";
            NSString *value = @"小明";
            
            /*
             1.当开发者需要验证能不能用KVC设定某个值时，就需要在进行KVC赋值前验证值value的有效性
             2.通过重写 validateValue ，并主动调用 来实现安全验证
             */
            BOOL result = [self validateValue:&value forKey:key error:&error];
            if (error) {
              NSLog(@"error = %@", error);
            }

            if (result) {
              NSLog(@"验证正确是小明");
            }else {
              NSLog(@"不是小明");
            }
        }
        {// 异常处理
            // 对一个不存在的key 进行 setValue
            [self setValue:@"111" forKey:@"name2"];
            
            // 对一个非对象类型属性 进行 setValue，传递nil
            [self setValue:nil forKey:@"age"];
        }
  
    }
    return self;
}
// kvc setValue 当找不到 set 方法时候,询问是否可以直接访问成员变量
//access:访问 InstanceVariables：实例变量 Directly：直接
+ (BOOL)accessInstanceVariablesDirectly{
    return YES;
}

// 安全验证
- (BOOL)validateValue:(inout id  _Nullable __autoreleasing *)ioValue forKey:(NSString *)inKey error:(out NSError *__autoreleasing  _Nullable *)outError{
    NSString *name = *ioValue;
    if ([name isEqualToString:@"小明"]) {
        return YES;
    }
    return NO;
}


/* 异常处理--NSUnknownKeyException
 1.当 进行 对一个不存在的 key  进行 setValue 时候，会引起崩溃，并报NSUnknownKeyException错误
 2.实现这个方法，就可以处理 避免崩溃
 */
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"找不到的key:%@",key);
}

/* 异常处理--NSInvalidArgumentException
 1.当 进行 对一个非对象类型的属性值进行 setValue时候 传了一个 nil值，则会引起崩溃，并报NSInvalidArgumentException错误
 2.实现这个方法，就可以处理 避免崩溃
 */
- (void)setNilValueForKey:(NSString *)key{
    NSLog(@"属性值不能为nil");
}

@end

@implementation person_kvcsub
@end
