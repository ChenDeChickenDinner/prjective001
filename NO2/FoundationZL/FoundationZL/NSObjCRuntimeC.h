//
//  NSObjCRuntimeC.h
//  FoundationZL
//
//  Created by xs on 2017/6/5.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObjCRuntimeC : NSObject

@end
/*
 
 *************** NSRange(结构体) *****************
//  *NSRange:表示范围的结构体
NSRange range = NSMakeRange(0, 2);

//    *最大位置的值
NSUInteger __unused uinyeger = NSMaxRange(range);

//    *某个位置是否在此范围内
BOOL  __unused location = NSLocationInRange(1, range);
//    *二个范围是否相同
BOOL __unused equal = NSEqualRanges(range, range);
//    *结构体转换为字符串
NSString __unused *rangeStr = NSStringFromRange(range);


**************** NSZone *****************

//    *NSZone是用来分配和管理一段内存空间的一个结构体。
//*alloc无法指定一个NSZone来存储自己创建的实例，它最终调用的是allocWithZone(nil)，使用的是系统给定的NSZone
//*allocWithZone可以指定自己的NSZone来存储自己创建的实例，如果zone传nil 它使用的就是系统给定的NSZone


**************** NSNull: NSObject <NSCopying, NSSecureCoding> *****************
//    nil :对象的字面空值
//    Nil: 类的字面空值
//    NULL: C 指针的字面空值
//    NSNull *null = [NSNull null]; 空对象
//    NaN:1.除以0，2.sizeWithFont的字符串为nil 3.数学函数不正确运算


*/
