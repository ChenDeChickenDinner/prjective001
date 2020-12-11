//
//  NSSet_.h
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 1.服务起源:
 2.数据结构:{(3,1,2)}
 3.服务对象:
     .为字典服务(字典的key集合)
     .NSFilePresenter:(NSSet<NSURLResourceKey> *)attributes
     .NSBundleResourceRequest:(NSSet<NSString *> *)tags
     .NSFileCoordinator: (NSSet <NSURLResourceKey> *)attributes
     .NSUserActivity: NSSet<NSString *> *requiredUserInfoKeys
     .NSUserActivity: NSSet<NSString *> *keywords
     .NSKeyedUnarchiver: NSSet<Class> *)classes

 */
/* API:
 1.创建
 2.增加删除合并重组
 3.查询迭代筛选
 */
@interface NSSet_ : NSObject

@end


