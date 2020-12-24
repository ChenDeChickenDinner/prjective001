//
//  Numbers.m
//  Runtime
//
//  Created by xs on 2020/11/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "Numbers.h"

@implementation Numbers
+ (void)load{

}
#pragma warning -整数
/*
 1. typedef long NSInteger;
 2. typedef unsigned long NSUInteger;
 3. static const NSInteger NSNotFound = NSIntegerMax;
 */
+ (void)test{
 
    NSInteger value1 = 10;
    NSInteger valueMin = NSIntegerMin;// -9223372036854775808
    NSInteger valueMax = NSIntegerMax; // 9223372036854775807
    NSInteger valueNotFound = NSNotFound; //9223372036854775807

    NSUInteger value2 = 10;
    NSUInteger valueUMax = NSUIntegerMax; // -1

}


#pragma warning -浮点几何
+ (void)test2{
    
    CGFloat value_Min = CGFLOAT_MIN;
    CGFloat value_Max = CGFLOAT_MAX;
    
    { //常量
        CGPoint value_point = CGPointZero;
        CGSize value_size = CGSizeZero;
        /*
         1.空矩形 CGRectNull; 取两个不相交矩形的相交区域会返回CGRectNull,一个矩形与CGRectNull的并集为原矩形。
         2.无限矩形 CGRectInfinite 具有无限区域的矩形
         3.使用CGRectIsNull判断一个矩形是否为CGRectNull。CGRectIsEmpty对CGRectZero和CGRectNull都返回true
         */
        CGRect value_rect1 = CGRectZero;
        CGRect value_rect2 = CGRectNull;
        CGRect value_rect3 = CGRectInfinite;
    }
    
    {  //创建
        CGPoint point = CGPointMake(10, 20);
        CGSize  size  = CGSizeMake(30, 50);
        CGRect  rect  = CGRectMake(0, 0, 10, 20);
    }
    
    { // 比较
        BOOL isEqualToPoint = CGPointEqualToPoint(CGPointZero, CGPointZero);
        BOOL isEqualToSize = CGSizeEqualToSize(CGSizeZero, CGSizeZero);
        BOOL isEqualToRect = CGRectEqualToRect(CGRectZero, CGRectZero);
    }

    { // 几何判断，取值
        
    
        //判断是否为空 Null
        BOOL isNull= CGRectIsNull(CGRectZero);
        //判断是否为空 既width或height为0
        BOOL isEmpty = CGRectIsEmpty(CGRectZero);
        //判断是否为无穷大
        BOOL isInfinite = CGRectIsInfinite(CGRectZero);
        
        
        //判断point是否在rect内
        BOOL isContainsPoint  = CGRectContainsPoint(CGRectMake(0, 0, 1, 1), CGPointZero);
        //判断rect1是否包含rect2
        BOOL isContainsRect = CGRectContainsRect(CGRectMake(0, 0, 1, 1), CGRectMake(0, 0, 2, 2));
         //判断rect1和rect2是否相交
        BOOL isIntersects = CGRectIntersectsRect(CGRectMake(0, 0, 1, 1), CGRectMake(0, 0, 2, 2));
        
        
        //根据一个 CGRect 取 其 x y width height
        CGRect  rect  = CGRectMake(0, 0, 10, 20);
        CGFloat value_minx = CGRectGetMinX(rect);
        CGFloat value_midx = CGRectGetMidX(rect);
        CGFloat value_maxx = CGRectGetMaxX(rect);

        CGFloat value_miny = CGRectGetMinY(rect);
        CGFloat value_midy = CGRectGetMidY(rect);
        CGFloat value_maxy = CGRectGetMaxY(rect);

        CGFloat value_width = CGRectGetWidth(rect);
        CGFloat value_height = CGRectGetHeight(rect);
    }
    
}


#pragma warning -Foundation/NSRange.h
/*用来表示事物的一个范围
 typedef struct _NSRange {
     NSUInteger location; 表示该范围的起始位置
     NSUInteger length;   表示该范围内的长度
 } NSRange;
 */
+ (void)test4{
    // 从0开始3个长度的范围内
    NSRange range = NSMakeRange(0, 3);
    
    
    //range这个范围内最大元素的下标
    NSUInteger maxIndex = NSMaxRange(range);
    //判断所给的下标是否在range内
    BOOL inLocationIn = NSLocationInRange(1, range);

    
    
    //判断两个range是否相等
    BOOL isequl = NSEqualRanges(range, range);
    //取2个range的并集
    NSRange unionRange = NSUnionRange(range, range);
    //取2个range的交集
    NSRange intersectionRange = NSIntersectionRange(range, range);
    
    NSRectPointer point;
    

    NSRect rect = NSRectFromString(@"");
    NSString  *rectStr = NSStringFromRect(rect);

    /*
     1.入参没有任何限制，可以为nil
     2.如果没有包含任何数字即使入参为nil或者空结果都为{0,0}
     3.只要能分割出1个或者2个数字则就可以成功赋值
     */
    range = NSRangeFromString(@"a1s2d");
    
    rectStr = NSStringFromRange(range);
}
@end

