//
//  NSGeometryFile.m
//  Runtime
//
//  Created by xs on 2020/11/23.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSRangeFile.h"

@implementation NSRangeFile


/*  用来表示事物的一个范围
 typedef struct _NSRange {
     NSUInteger location; 表示该范围的起始位置
     NSUInteger length;   表示该范围内的长度
 } NSRange;
 */
+ (void)load{
    // 从0开始3个长度的范围内
    NSRange range1 = NSMakeRange(1, 5);

    NSRange range2 = NSMakeRange(0, 3);
    
    //range这个范围内最大元素的下标
    NSUInteger maxIndex = NSMaxRange(range2);
    
    //取2个range的并集
    NSRange unionRange = NSUnionRange(range1, range2);
    //取2个range的交集
    NSRange intersectionRange = NSIntersectionRange(range1, range2);
    
    //判断所给的下标是否在range内
    BOOL inLocationIn = NSLocationInRange(1, range2);
    
    //判断两个range是否相等
    BOOL isequl = NSEqualRanges(range1, range2);
}
@end
