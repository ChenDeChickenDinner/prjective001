//
//  02NSThread.h
//  2019OC
//
//  Created by xs on 2019/2/26.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XCNSThread : NSObject
@property (nonatomic,strong) NSThread *thread;
- (void)test0;


/**
 在主线程执行某方法

 @param aSelector 调用的方法
 @param arg 传递的对象
 @param wait 是否等待该方法执行完毕才继续往下执行 YES:等待
 @param array runloop相关
 */
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(nullable id)arg waitUntilDone:(BOOL)wait modes:(nullable NSArray<NSString *> *)array;
- (void)performSelectorOnMainThread:(SEL)aSelector withObject:(nullable id)arg waitUntilDone:(BOOL)wait;


/**
  在指定的线程执行某方法

 @param aSelector 调用的方法
 @param thr 指定的线程
 @param arg 传递的对象
 @param wait 是否等待该方法执行完毕才继续往下执行 YES:等待
 @param array runloop相关
 */
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(nullable id)arg waitUntilDone:(BOOL)wait modes:(nullable NSArray<NSString *> *)array;
- (void)performSelector:(SEL)aSelector onThread:(NSThread *)thr withObject:(nullable id)arg waitUntilDone:(BOOL)wait;


/**
 在后台执行某方法
 @param aSelector 调用的方法
 @param arg 传递的对象
 */
- (void)performSelectorInBackground:(SEL)aSelector withObject:(nullable id)arg;
@end
