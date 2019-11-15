//
//  XSNullable.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "XSNullable.h"
@interface XSNullable ()
@property (nonatomic,copy,nullable) NSString *aString1;
@property (nonatomic,copy) NSString* __nullable aString2;
@property (nonatomic,copy) NSString* _Nullable aString3;

// 在这两个宏之间的代码，所有简单指针对象都被假定为 nonnull
NS_ASSUME_NONNULL_BEGIN
@property (nonatomic,copy) NSString *aString4;
NS_ASSUME_NONNULL_END

@end



@implementation XSNullable
// 默认是什么情况


- (nullable NSString*)method1{
    return nil;
}
- (NSString* __nullable)method2{
    return nil;

}
- (NSString* _Nullable)method3{
    return nil;
}

- (void)method1WithString:(nullable NSString*)aString{

}
- (void)method2WithString:(NSString* _Nullable)aString{

}
- (void)method3WithString:(NSString* __nullable)aString{

}



/**
而对于双指针类型对象 、 Block 的返回值 、 Block 的参数 等，这时候就不能用 nonnull/nullable 修饰，只能用带下划线的 __nonnull/__nullable 或者 _Nonnull/_Nullable
 */
- (void)methodWithError1:(NSError* _Nullable * _Nullable)error{

}
- (void)methodWithError2:(NSError* __nullable* __null_unspecified)error{

}
// nullable 用于修饰方法传入的参数 Block 可以为空，而不是修饰 Block 返回值；
- (void)methodWithBlock1:(nullable id(^)())block{

}



- (void)methodWithBlock2:(void(^ _Nullable)(void))block{

}
- (void)methodWithBlock3:(void(^ __nullable)(void))block{

}

// nullable 用于修饰方法传入的参数 Block 可以为空，而 __nonnull 用于修饰Block返回值id 不能为空；
- (void)methodWithBlock4:(nullable id __nonnull(^)(id __nullableparams))block{

}


- (void)methodWithBlock5:(id __nonnull(^ __nullable)(id __nullableparams))block{

}
- (void)methodWithBlock6:(id _Nonnull (^ _Nullable)(id _Nullable params))block{

}
@end



