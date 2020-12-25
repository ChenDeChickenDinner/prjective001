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

    {
        NSValue *value = [[NSValue alloc]init];
        NSLog(@"value = %@",value); // value = (null)
    }
    {
 
        /*NSValue (NSValueCreation) 包装原始值
         1.指向要存储在新值对象中的数据的指针。
         2.@encode（）编译器指令提供的Objective-C值类型。不要将此参数硬编码为C字符串。
         */
       int a  = 10;
       NSValue *intValue1 =  [NSValue valueWithBytes:&a objCType:@encode(int)];
       NSValue *intValue2 =  [NSValue value:&a withObjCType:@encode(int)];
       NSLog(@"intValue1 = %@",intValue1); // {length = 4, bytes = 0x0a000000}
       NSLog(@"intValue2 = %@",intValue2); // {length = 4, bytes = 0x0a000000}

        
        const char *objCType = intValue1.objCType;
        NSLog(@"objCType = %s",objCType); // objCType = i
        

        int aValue;;
        [intValue1 getValue:&aValue];
        NSLog(@"%d",aValue);

        [intValue1 getValue:&aValue size:sizeof(aValue)];
        NSLog(@"%d",aValue);
    }

    
  

    
    {
        //NSValue (NSValueRangeExtensions)包装范围结构体
        NSValue *value = [NSValue valueWithRange:NSMakeRange(1, 5)];
        NSRange range2 = value.rangeValue;
    }
    {
        //NSValue (NSValueGeometryExtensions)包装几何结构体
        NSValue *value1 = [NSValue valueWithPoint:NSZeroPoint];
        NSValue *value2 = [NSValue valueWithSize:NSZeroSize];
        NSValue *value3 = [NSValue valueWithRect:NSZeroRect];
        NSValue *value4 = [NSValue valueWithEdgeInsets:NSEdgeInsetsMake(0, 0, 0, 0)];

        NSPoint point =  value1.pointValue;
        NSSize size =  value2.sizeValue;
        NSRect rect =  value3.rectValue;

        
    }

    {
        //NSValue (NSValueExtensionMethods)包装指针置
        SEL sel =  @selector(description);
        IMP imp =  [self instanceMethodForSelector:@selector(description)];
        
        NSValue *value1 = [NSValue valueWithPointer:sel];
        NSValue *value2 = [NSValue valueWithPointer:imp];
        SEL sel2 = value1.pointerValue;
        IMP imp2 = value2.pointerValue;

    }
    
    { // 用于将值从一种表示形式转换为另一种表示形式的抽象类。  CoreData
        NSValueTransformer *ob = [[NSValueTransformer alloc]init];
    }
}


@end
