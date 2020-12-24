//
//  NSIndexPath_.h
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 1.服务起源:数组(元素-->数组(元素-->数组(元素)))找到这个树结构中的一个节点
 2.数据结构:{length = 3, path = 1 - 3 - 4}
 3.服务对象:UITableView
 */
/* API:
 1.创建
 2.增加删除节点
 3.比较
 */
@interface NSIndexPath_ : NSObject

@end


