//
//  XSThreadSecurity.m
//  2019OC2
//
//  Created by xs on 2019/3/2.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "XSThreadSecurity.h"
@interface XSThreadSecurity()
@property(nonatomic,copy) NSString *name;
@end
@implementation XSThreadSecurity

/**
 多线程访问资源造成程序错误
 */
- (void)ThreadSecurity1{
    // 多线程 访问 name的set方法，会造成set方法内部对旧值的 release的多次调用，造成坏内存访问
    // 解决方案 把 @propert修复符 改成 atomic，但不推荐
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0 );
    dispatch_async(queue, ^{
        self.name = [NSString stringWithFormat:@"adcdefghijk"];
    });
}
/**
 多线程访问资源造成数据错误
 */
- (void)ThreadSecurity2{

}
@end
