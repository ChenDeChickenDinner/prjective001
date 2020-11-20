//
//  Nullable.m
//  1111
//
//  Created by xs on 2020/11/16.
//

#import "Nullable.h"
@interface Nullable : NSObject
@property(nonatomic,copy,nullable) NSString *name1;
@property(nonatomic,copy,nonnull) NSString *name2;

@property (nonatomic,copy) NSString* __nullable aString2;
@property (nonatomic,copy) NSString* _Nullable aString3;

// 在这两个宏之间的代码，所有简单指针对象都被假定为 nonnull

NS_ASSUME_NONNULL_BEGIN
@property(nonatomic,copy) NSString *name3;
NS_ASSUME_NONNULL_END

@end
@implementation Nullable
- (nullable NSString *)test1{

    return nil;
}
- (nonnull NSString *)test2{
    
    return nil;
}

- (void)test3:(nonnull NSString *)str{
    
}
- (void)test4:(nullable NSString *)str{

    [self block1:nil]; //block不能为空
    [self block2:nil]; //block不能为空
    [self block3:nil]; //block不能为空
    [self block4:nil]; //block可以为空
    [self block5:^id(NSString * _Nonnull a, NSString * _Nonnull b) {
        return nil; //返回值可以为空
    }];
    [self block6:^id _Nonnull(NSString * _Nullable a) {
        
        return nil;
    }];

}

//  用于作为参数 的Block 可不可以以为空，而不是修饰 Block 返回值；
- (void)block1:(nonnull id (^)(int,int))block{
}
- (void)block2:(id (^_Nonnull)(int,int))block{
}
- (void)block3:(id (^ __nonnull)(int,int))block{
}
- (void)block4:(id (^ __nullable)(int,int))block{
}


//block的参数不能为空的修饰
- (void)block5:(id (^ __nonnull)(NSString * _Nonnull,NSString * _Nonnull))block{
    block(nil,nil);
}

- (void)block6:(id _Nonnull (^ _Nonnull)(NSString * _Nullable))bloclk{
    bloclk(nil);
}
@end
