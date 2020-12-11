//
//  NSIndexSet_.h
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 1.服务起源:为有序的集合，提供索引服务
 2.数据结构:indexes: 5 (in 3 ranges), indexes: (0 2-3 7-8)]
 3.特定:无序，唯一
 3.服务对象:NSArray
 */
/* API:
 1.创建
 2.可变:增加，删除
 查询:时候包含
 迭代:获取索引
 筛选:筛选索引个数

 */
@interface NSIndexSet_ : NSObject

@end


