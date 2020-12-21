//
//  NSObject(Class).m
//  Runtime
//
//  Created by xs on 2020/11/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSObject(Class).h"

@implementation NSObject_Class_


#pragma warning - 类加载
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
    }
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

- (void)dealloc{
    NSLog(@"%s",__func__);
}


#pragma warning -类/对象自检
- (void)test1{

    {
        Class class1 = [NSObject class];
        Class class2 = [NSObject superclass];

        // 是否是某类的子类
        BOOL ob1 =  [NSObject isSubclassOfClass:[NSObject class]];
        // 是否遵守某协议
        BOOL ob2 =  [NSObject conformsToProtocol:@protocol(NSObject)];
        // 实例对象是否响应某方法
        BOOL ob3 =  [NSObject instancesRespondToSelector:@selector(description)];

        // 根据实例对象的选择器返回函数指针
        IMP imp = [NSObject instanceMethodForSelector:@selector(description)];
        
        [NSObject hash];
        [NSObject description];
    }
    
    { // 识别 class
        [self class];
        [self superclass];

        [self isKindOfClass:[NSObject class]]; // YES
        [self isMemberOfClass:[NSObject class]]; // NO
        
        BOOL b1 =  [self conformsToProtocol:@protocol(NSObject)];
        BOOL b2 =  [self respondsToSelector:@selector(test)];
        

        [self hash];
        [self description];

    }
}

#pragma warning -消息发送
- (void)test2{
 
    // @protocol NSObject
    [self performSelector:@selector(hash)];
    [self performSelector:@selector(hash) withObject:nil];
    [self performSelector:@selector(hash) withObject:nil withObject:nil];
    
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


@end
