//
//  NSObject+xs.h
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 1.每一个分类中的方法不论是否与系统的 与别的分类是否同名都是单独的一个 方法，在运行时会添加到元类的数据结构中去
 2.通过运行时的消息机制调用的方法，优先调用分类的，当同一个方法有多个分类实现优先调用最后编译的那一个分类
 */
@interface NSObject (xs1)
+ (void)load;
- (void)name;


/**
 1.在分类中的@property 只能起到声明方法的作用，且要注意实现
 2.一般配合readonly  readwrite,只实现一个
 */
@property(nonatomic,copy,readonly) NSString *nameStr;
@end

@interface NSObject (xs2)

+ (void)load;
- (void)name;
@end

@interface XSNSObject:NSObject

@end
