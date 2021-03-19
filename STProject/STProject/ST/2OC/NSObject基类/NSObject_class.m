//
//  NSObject_class.m
//  1231231
//
//  Created by xs on 2021/3/11.
//

#import "NSObject_class.h"

@implementation NSObject_class
#pragma warning - 类加载
+ (void)load{
    
}

+ (void)initialize{
    
}

#pragma warning - 对象的生命周期(创建-销毁)

/** 为新对象分配内存空间, 参数传nil */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
    return [super allocWithZone:zone];
}
/** 为新对象分配内存空间，底层会调用allocWithZone */
+ (instancetype)alloc{
    return [super alloc];
}

/** 为新对象分配内存空间并初始化, 等于[[NSObject alloc] init] */
+ (instancetype)new{
    return [super new];
}


#pragma warning -类自检
+ (void)test2{


    // 是否是某类的子类
    BOOL ob1 =  [NSObject isSubclassOfClass:[NSObject class]];
    // 是否遵守某协议
    BOOL ob2 =  [NSObject conformsToProtocol:@protocol(NSObject)];
    // 实例对象是否响应某方法
    BOOL ob3 =  [NSObject instancesRespondToSelector:@selector(description)];
}

#pragma warning -类信息获取
+ (void)test1{

    
    Class class1 = [NSObject class];
    Class class2 = [NSObject superclass];



    IMP imp = [NSObject instanceMethodForSelector:@selector(description)];
    NSMethodSignature *sig = [NSObject instanceMethodSignatureForSelector:@selector(description)];
    
    
    [NSObject hash];
    [NSObject description];
}


@end
