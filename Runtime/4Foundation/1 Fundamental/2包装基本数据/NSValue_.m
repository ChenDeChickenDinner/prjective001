//
//  NSValue(Wrappers).m
//  Runtime
//
//  Created by xs on 2020/11/26.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSValue_.h"

@implementation NSValue_Wrappers_
/*
 NSValue对象可以保存任何标量类型，例如int，float和char，以及指针，结构和对象id引用。
 使用此类可处理集合中的此类数据类型（例如NSArray和NSSet），
 键值编码以及其他需要Objective-C对象的API。 NSValue对象始终是不可变的。
 */
#pragma warning -

+ (void)load{
    char *myCString = "123456789";
    /*
     1.通过数据的地址以及数据的@encode类型来包装数据
     2.通过送进去一个保存数据的地址，获取数据
     */
    NSValue *value = [[NSValue alloc]initWithBytes:myCString objCType:@encode(char *)];
    char *myNewCString = NULL;
//    [value getValue:myNewCString size:sizeof(char *)];

    

    {
        //NSValue (NSValueCreation) 包装原始值
        NSValue *value = [NSValue value:myCString withObjCType:@encode(char *)];
    }

    
    {
        //NSValue (NSValueExtensionMethods)包装指针置
        NSValue *value = [NSValue valueWithPointer:myCString];
        void *pointerValue = value.pointerValue;
        NSLog(@"value2 = %@,value2.pointerValue = %c",value,*((char *)pointerValue));
    }

    
    {
        //NSValue (NSValueRangeExtensions)包装结构体
        NSValue *value = [NSValue valueWithRange:NSMakeRange(1, 5)];
        NSRange range2 = value.rangeValue;
    }
    {
        //NSValue (NSValueGeometryExtensions)
        NSValue *value1 = [NSValue valueWithPoint:NSZeroPoint];
        NSValue *value2 = [NSValue valueWithSize:NSZeroSize];
        NSValue *value3 = [NSValue valueWithRect:NSZeroRect];
        NSValue *value4 = [NSValue valueWithEdgeInsets:NSEdgeInsetsMake(0, 0, 0, 0)];

        NSPoint point =  value1.pointValue;
        NSSize size =  value2.sizeValue;
        NSRect rect =  value3.rectValue;

    }
    {
        /* UIKit 框架下的包装
         Working with CoreGraphics Geometry Values
         + valueWithCGPoint:

         Working with UIKit Geometry Values
         + valueWithUIEdgeInsets:

         Working with CoreAnimation Transform Values
         + valueWithCATransform3D:

         Working with Media Time Values
         + valueWithCMTime:
         */

    }
    { // 用于将值从一种表示形式转换为另一种表示形式的抽象类。  CoreData
        NSValueTransformer *ob = [[NSValueTransformer alloc]init];
    }
}


@end
