//
//  NSObjCRuntimeC.m
//  FoundationZL
//
//  Created by xs on 2017/6/5.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NSObjCRuntimeC.h"

@implementation NSObjCRuntimeC

@end
/**************** NSObjCRuntime *****************/

//NSInteger: 就是 长整形 long
//NSUInteger: 就是 无符号 长整形 unsigned long
//unichar:unsigned short

//
//
//NSNotFound:NSInteger类型的全局常量 = NSIntegerMax,表示不存在 ，找不到 -1；

//NSExceptionName:表示异常的名字
//NSRunLoopMode:表示线程模式


//
//NSComparator: 一种 返回值 为NSComparisonResult类型的 biock 类型
//    NSComparator comparator = ^(NSString *a,NSString *b){
//        return NSOrderedAscending;
//    };
//    NSComparisonResult  __unused comperisonResult4 = comparator(@"1",@"2");
//
//NSComparisonResult: 表示对象比较的结果的枚举类型
//    *NSOrderedAscending  左操作数小于右操作数。a <  b 提升
//    *NSOrderedSame;两个操作数是相等的。         a = b 等于
//    *NSOrderedDescending;左操作数大于右操作数。 a > b 下降
//
//NSEnumerationOptions:枚举操作
//    *NSEnumerationConcurrent。同步，但顺序可能不确定
//    *NSEnumerationReverse。倒序处理
//
//NSSortOptions:排序操作
//    *NSSortConcurrent 并发 高效的但不稳定的排序算法
//    *NSSortStable 稳定的排序算法
//NSQualityOfService: 服务质量 __ iOS8 及更高版本
//    *NSQualityOfServiceUserInteractive  用户互动级别的 毫秒级
//    *NSQualityOfServiceUserInitiated  用户启动,发起级别的 秒级
//    *NSQualityOfServiceUtility  实用程序服务 例如下载或导入数据  几秒钟到几分钟
//    *NSQualityOfServiceBackground 其操作在后台和不可见的用户，例如索引，同步和备份工作。专注于能源效率
//    *NSQualityOfServiceDefault 优先级用户启动和效用之间下降



//NSKeyValueCoding.h
//http://www.jianshu.com/p/d209a8f18359

