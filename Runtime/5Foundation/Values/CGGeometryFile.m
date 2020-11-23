//
//  CGGeometryFile.m
//  CoreGraphics
//
//  Created by xs on 2018/11/27.
//  Copyright © 2018 Touker. All rights reserved.
//

#import "CGGeometryFile.h"

@implementation CGGeometryFile



/**
 CGPoint  CGSize  CGRect CGRectEdge
 */
+ (void)test2{
    CGPoint value_point = CGPointZero;
    value_point = CGPointMake(10, 20);

    
    CGSize value_size = CGSizeZero;
    value_size = CGSizeMake(30, 50);

    /*
     空矩形 CGRectNull; 取两个不相交矩形的相交区域会返回CGRectNull,一个矩形与CGRectNull的并集为原矩形。
     使用CGRectIsNull判断一个矩形是否为CGRectNull。CGRectIsEmpty对CGRectZero和CGRectNull都返回true
     */
    CGRect value_rect = CGRectNull;
    value_rect = CGRectZero;
    value_rect = CGRectMake(0, 0, 10, 20);

    //无限矩形 CGRectInfinite 具有无限区域的矩形
    CGRect value_rectInfinite = CGRectInfinite;

    /*
     1.枚举值 是 uint32_t（typedef unsigned int uint32_t） 类型
     */
    CGRectEdge value_rectEdge = CGRectMinXEdge;
    value_rectEdge = CGRectMaxXEdge;
    value_rectEdge = CGRectMinYEdge;
    value_rectEdge = CGRectMaxYEdge;

    { // 比较
        BOOL isEqualToPoint = CGPointEqualToPoint(CGPointZero, CGPointZero);
        BOOL isEqualToSize = CGSizeEqualToSize(CGSizeZero, CGSizeZero);
        BOOL isEqualToRect = CGRectEqualToRect(CGRectZero, CGRectZero);
    }
}

/** CGRect
 */
+ (void)test3{
    
    { //根据一个 CGRect 取 其 x y width height
        CGRect value_rect = CGRectMake(0, 0, 10, 20);
        
        
        CGFloat value_minx = CGRectGetMinX(value_rect);
        CGFloat value_midx = CGRectGetMidX(value_rect);
        CGFloat value_maxx = CGRectGetMaxX(value_rect);

        CGFloat value_miny = CGRectGetMinY(value_rect);
        CGFloat value_midy = CGRectGetMidY(value_rect);
        CGFloat value_maxy = CGRectGetMaxY(value_rect);

        CGFloat value_width = CGRectGetWidth(value_rect);
        CGFloat value_height = CGRectGetHeight(value_rect);
    }
 

    { // CGRect 判空
        //判断是否为空 既width或height为0
        BOOL isEmpty = CGRectIsEmpty(CGRectZero);
        //判断是否为空 Null一般时执行某个方法后的返回值(例如两个不相交的CGRect执行相交方法(在下面)返回值为Null)
        BOOL isNull= CGRectIsNull(CGRectZero);
        //判断是否为无穷大
        BOOL isInfinite = CGRectIsInfinite(CGRectZero);
    }
    
    {  //CGRect 几何判断
        //判断point是否在rect内
        BOOL isContainsPoint  = CGRectContainsPoint(CGRectMake(0, 0, 1, 1), CGPointZero);
        //判断rect1是否包含rect2
        BOOL isContainsRect = CGRectContainsRect(CGRectMake(0, 0, 1, 1), CGRectMake(0, 0, 2, 2));
         //判断rect1和rect2是否相交
        BOOL isIntersects = CGRectIntersectsRect(CGRectMake(0, 0, 1, 1), CGRectMake(0, 0, 2, 2));
    }
}



/*
 
 
 */
+ (void)StringConversion{
    
    
    
    
    NSRect rect = NSRectFromString(@"");
    NSString  *rectStr = NSStringFromRect(rect);

    
    
    /*
     1.入参没有任何限制，可以为nil
     2.如果没有包含任何数字即使入参为nil或者空结果都为{0,0}
     3.只要能分割出1个或者2个数字则就可以成功赋值
     */
    NSRange range = NSRangeFromString(@"a1s2d");
    
    NSString  *rangeStr = NSStringFromRange(range);
    
    NSLog(@"");
}

@end


