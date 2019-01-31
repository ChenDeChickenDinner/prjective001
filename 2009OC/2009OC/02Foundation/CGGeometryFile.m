//
//  CGGeometryFile.m
//  CoreGraphics
//
//  Created by xs on 2018/11/27.
//  Copyright © 2018 Touker. All rights reserved.
//

#import "CGGeometryFile.h"

@implementation CGGeometryFile





/** OC中的基本数据类型  NSInteger NSUInteger  CGFloat
1. NSInteger = int/long
2. NSUInteger = unsigned int/ unsigned long
3. CGFloat = float/double;也就是说在64位系统下,CGFLOAT是double类型,32位系统下是float类型.

 */
+ (void)test1{

    NSInteger value_integer = 10;
    NSUInteger value_uinteger = 10;


    CGFloat value_CGfloat = 10.0;
    CGFloat value_Min = CGFLOAT_MIN;
    CGFloat value_Max = CGFLOAT_MAX;
    NSLog(@"value_Min = %f,value_Max = %f\n",value_Min,value_Max);
}
/**
 CGPoint  CGSize CGVector CGRect CGRectEdge
 1.定义几何结构体、空值常量， 创建函数， 转字符串输出
 */
+ (void)test2{
    CGPoint value_point = CGPointZero;
    NSLog(@"value_point = %@\n",NSStringFromPoint(value_point));// value_point = {0, 0}
    value_point = CGPointMake(10, 20);
    NSLog(@"value_point = %@\n",NSStringFromPoint(value_point));

    CGSize value_size = CGSizeZero;
    NSLog(@"value_size = %@\n",NSStringFromSize(value_size)); // value_size = {0, 0}
    value_size = CGSizeMake(30, 50);
    NSLog(@"value_size = %@\n",NSStringFromSize(value_size));

    /*
     空矩形 CGRectNull; 取两个不相交矩形的相交区域会返回CGRectNull,一个矩形与CGRectNull的并集为原矩形。
     使用CGRectIsNull判断一个矩形是否为CGRectNull。CGRectIsEmpty对CGRectZero和CGRectNull都返回true
     */
    CGRect value_rect = CGRectNull;
    NSLog(@"value_rect = %@\n",NSStringFromRect(value_rect)); // value_rect = {{inf, inf}, {0, 0}}
    value_rect = CGRectZero;
    NSLog(@"value_rect = %@\n",NSStringFromRect(value_rect)); //value_rect = {{0, 0}, {0, 0}}
    value_rect = CGRectMake(0, 0, 10, 20);
    NSLog(@"value_rect = %@\n",NSStringFromRect(value_rect));

    //无限矩形 CGRectInfinite 具有无限区域的矩形
    CGRect value_rectInfinite = CGRectInfinite;
    NSLog(@"value_rectInfinite = %@\n",NSStringFromRect(value_rectInfinite));

    /*
     1.
     2.枚举值 是 uint32_t（typedef unsigned int uint32_t） 类型
     */
    CGRectEdge value_rectEdge = CGRectMinXEdge;
    value_rectEdge = CGRectMaxXEdge;
    value_rectEdge = CGRectMinYEdge;
    value_rectEdge = CGRectMaxYEdge;

}

/** 根据一个 CGRect 取 其 x y width height
 */
+ (void)test3{
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
/**
1.比较二个  CGPoint  CGSize CGVector CGRect

 */
+ (void)test4{
    BOOL isEqualToPoint = CGPointEqualToPoint(CGPointZero, CGPointZero);
    BOOL isEqualToSize = CGSizeEqualToSize(CGSizeZero, CGSizeZero);
    BOOL isEqualToRect = CGRectEqualToRect(CGRectZero, CGRectZero);
}
/**
   对 一个 CGRect 进行判空处理
  */
+ (void)test5{
    //判断是否为空 既width或height为0
    BOOL isEmpty = CGRectIsEmpty(CGRectZero);
    //判断是否为空 Null一般时执行某个方法后的返回值(例如两个不相交的CGRect执行相交方法(在下面)返回值为Null)
    BOOL isNull= CGRectIsNull(CGRectZero);
    //判断是否为无穷大
    BOOL isInfinite = CGRectIsInfinite(CGRectZero);

}
/**
 一个 CGPoint、CGRect  与 另一个 CGRect 的关系
 */
+ (void)test6{
    //判断point是否在rect内
    BOOL isContainsPoint  = CGRectContainsPoint(CGRectMake(0, 0, 1, 1), CGPointZero);

    //判断rect1是否包含rect2
    BOOL isContainsRect = CGRectContainsRect(CGRectMake(0, 0, 1, 1), CGRectMake(0, 0, 2, 2));

     //判断rect1和rect2是否相交
    BOOL isIntersects = CGRectIntersectsRect(CGRectMake(0, 0, 1, 1), CGRectMake(0, 0, 2, 2));
}
@end

void test_CGGeometryFile(){
    [CGGeometryFile test1];
    [CGGeometryFile test2];
    [CGGeometryFile test3];
    [CGGeometryFile test4];
}

