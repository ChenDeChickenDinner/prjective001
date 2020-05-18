//
//  myNullable.m
//  ObjectDe
//
//  Created by xs on 2019/11/5.
//  Copyright © 2019 xax. All rights reserved.
//

#import "myNullable.h"
@interface myNullable()
@property(nonatomic,copy) NSString * __nullable height3;
@property(nonatomic,copy) NSString * __nonnull height4;

@property(nonatomic,copy) NSString * _Nullable height1;
@property(nonatomic,copy) NSString * _Nonnull height2;

// ios9出来的
@property(nonatomic,copy,nullable)NSString *name1;
@property(nonatomic,copy,nonnull)NSString *name2;

@end
@implementation myNullable
- (nullable NSString*)callBackName1{
    return nil;
}
- ( NSString* _Nullable)callBackName2{
    return nil;
}

- (void)testName1:(nonnull NSString *)name1 name2:(NSString * _Nonnull)name2{
    
}
//修饰 的是block参数可以为空，针对的是参数是否可以为空，而不是block的返回值
- (void)methodWithBlock1:(nullable NSString *(^)(void))block{
}
- (void)methodWithBlock2:(NSString *(^ __nullable)(void))block{
}
- (void)methodWithBlock3:(NSString *(^ _Nullable)(void))block{
}

// 修复blcok的返回值 、 Block的参数;这时候就不能用 nonnull/nullable 修饰，只能用带下划线的 __nonnull/__nullable 或者 _Nonnull/_Nullable

//block的入参 跟返回值 都可以为空
- (void)methodWithBlock4:(NSString *_Nullable (^)(NSString * _Nullable name))block{
}
//block参数可以为空 ，block的入参 跟返回值 也都可以为空
- (void)methodWithBlock5:(NSString *_Nullable (^_Nullable)(NSString * _Nullable name))block{
}
@end


/// 泛型支持
@interface myGeneric : NSObject
// 只能支持 NSString * 类型的数据
@property(nonatomic,strong)NSArray<NSString *> *array1;
// 能支持 NSString * 及其子类类型的数据
@property(nonatomic,strong)NSArray<__kindof NSString *> *array2;

@end

@implementation myGeneric
@end
