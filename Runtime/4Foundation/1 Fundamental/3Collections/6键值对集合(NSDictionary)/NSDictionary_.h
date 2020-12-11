//
//  NSDictionary_.h
//  Runtime
//
//  Created by xs on 2020/12/11.
//  Copyright © 2020 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


/* 
 1.NSDictionary（字典）是使用 hash表来实现key和value之间的映射和存储的
 2.key:键不能重复，是唯一的键可以是任何对象（前提是它符合NSCopying协议），不能为nil
 2.key:但是请注意，在使用键值编码时，键必须是字符串
 */
@interface NSDictionary_ : NSObject

@end


