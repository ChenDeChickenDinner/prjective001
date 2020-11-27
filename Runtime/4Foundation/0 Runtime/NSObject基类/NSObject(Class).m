//
//  NSObject(Class).m
//  Runtime
//
//  Created by xs on 2020/11/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSObject(Class).h"

@implementation NSObject_Class_


#pragma warning - Initializing a Class
/*
 0.底层原理
 1.load 是走的是函数指针调用而非消息机制那一套，所以不存在分类覆盖原类load方法
 1.调用时机
 在runtime加载类或者分类的时候会被调用一次,发生在main函数之前，一般不主动调用
 2.调用顺序
 1、不同的类按照编译先后顺序调用+load方法（先编译，先调用）；
 2、子类调用+load方法时，要先要调用父类的+load方法；(父类优先与子类，与继承不同)；
 3、类要优先于分类调用+load方法；
 4、分类的按照编译先后顺序调用+load方法（先编译，先调用）。
3.实际运用
1、hook方法的时候,切要防止多次调用
2、涉及到组件化开发中不同组件间通信，注册相关协议等等
 */
+ (void)load{
  
    
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
}
/*
 1.initialize是在类第一次接收到消息时调用，每个类只会initialize一次（父类的initialize方法可能调用多次）
 2.+initialize是通过objc_msgSend消息机制的方式调用
 •分类中的initialize会覆盖原来类中的initialize方法
 •如果子类没有实现+initialize方法会调用父类中的initialize方法(若有多个子类，父类中的+initialize方法会调用多次)
 3.一般还是利用load实现一些操作
 */
+ (void)initialize
{
    if (self == [self class]) {
        // Identifying Class 类自检
        [self class];
        [self superclass];
        [self isSubclassOfClass:[NSObject class]];
        [self conformsToProtocol:@protocol(NSObject)];
        [self instancesRespondToSelector:@selector(hash)];
        [self instanceMethodForSelector:@selector(hash)];
    }
}


#pragma warning - Creating, Copying, and Deallocating Objects

/** 为新对象分配内存空间, 参数传nil */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    NSLog(@"%@-%s",NSStringFromClass([self class]),__func__);
    return [super allocWithZone:zone];
}
/** 为新对象分配内存空间，底层会调用allocWithZone */
+ (instancetype)alloc{
    return [super alloc];
}
/** 为新对象初始化 */
- (instancetype)init
{
    self = [super init];
    if (self) {
 
    }
    return self;
}
/** 为新对象分配内存空间并初始化, 等于[[NSObject alloc] init] */
+ (instancetype)new{
    return [super new];
}


/* copy
 1.通过调用 对象的 copyWithZone: 方法返回一个实例对象
 2.若对象内部没有实现 copyWithZone: 方法则就会 报方法找不到从而崩溃
 2.So 基类以及继承自它的子类只要是没有遵守 NSCopying协议并且实现 copyWithZone: 都不能调用 copy
 */
+ (void)copyTest{
    NSObject *ob1 = [[NSObject alloc]init];
    NSObject_Class_ *ob2 = [[NSObject_Class_ alloc]init];
    [ob1 copy]; // 崩溃
    [ob2 copy];

}

- (void)dealloc{
    NSLog(@"%s",__func__);
}



#pragma warning -Sending Messages
- (void)test2{
 
    //NSObject (NSDelayedPerforming) runloop相关
    [self performSelector:@selector(hash) withObject:nil afterDelay:0.2];
    [self performSelector:@selector(hash) withObject:nil afterDelay:0.2 inModes:@[]];
    [NSObject cancelPreviousPerformRequestsWithTarget:self]; //取消已设置的延迟执行
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(hash) object:nil];
    
    //NSObject (NSThreadPerformAdditions)线程
    [self performSelectorInBackground:@selector(hash) withObject:nil];
    [self performSelector:@selector(hash) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES];
    [self performSelector:@selector(hash) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES modes:nil];
    [self performSelectorOnMainThread:@selector(hash) withObject:nil waitUntilDone:YES];
    [self performSelectorOnMainThread:@selector(hash) withObject:nil waitUntilDone:YES modes:nil];
}
#pragma warning -消息转发 and 动态绑定 and 异常处理
- (void)test3{
    [self forwardInvocation:nil];
    [self forwardingTargetForSelector:@selector(hash)];
    [NSObject resolveClassMethod:@selector(hash)];
    [NSObject resolveInstanceMethod:@selector(hash)];
    [NSObject instanceMethodSignatureForSelector:@selector(hash)];
    [self doesNotRecognizeSelector:@selector(hash)];
    
    [self methodSignatureForSelector:@selector(hash)];
    
}

@end
