//
//  NSNumber(Wrappers).m
//  Runtime
//
//  Created by xs on 2020/11/26.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSNumber_.h"
/*
  1.只能包装 基本数据
 */
@implementation NSNumber_Wrappers_
+ (void)load{
   

    {
        /* 对象探究
         1.只要是未包装数据的 其 值为 null
         */
        NSNumber *number1 = [[NSNumber alloc]init];
        NSLog(@"number = %@",number1); // number = (null)
        if (number1) {
            NSLog(@"不成立");
        }
        
        NSNumber *number2 = nil;
        if (number1 == number2) {
            NSLog(@"成立");
        }
    }
    {
        /*
         值探究
         */
        NSNumber *num1 = [NSNumber numberWithInt:10];
        NSLog(@"number = %@",num1);// number = 10
        NSNumber *num2 = [NSNumber numberWithFloat:10.10f];
        NSLog(@"number = %@",num2);// number = 10.1
        NSNumber *num3 = [NSNumber numberWithChar:'a'];
        NSLog(@"number = %@",num3);// number = 97
        NSNumber *num4 = [NSNumber numberWithInteger:100];
        NSLog(@"number = %@",num4);// number = 100
        NSNumber *num5 = [NSNumber numberWithBool:NO];
        NSLog(@"number = %@",num5);// number = 0
    }
    {
        /* Value值探究
         1.一个为空的Number，其基本数据的Value值为0，对象行Value值为null
         2.包装了数据的Number，其各种类型的Value会进行相应的转换
         */
        {
            NSNumber *num = nil;
            int intValue = num.intValue; // 0
            NSInteger integerValue = num.integerValue; // 0
            float floatValue = num.floatValue; // 0
            char charValue = num.charValue; // '\0' 0
            BOOL boolValue = num.boolValue; // NO
            NSString *stringValue = num.stringValue; // nil
        }
 
        {
            NSNumber *num = [[NSNumber alloc]init];
            int intValue = num.intValue; // 0
            NSInteger integerValue = num.integerValue; // 0
            float floatValue = num.floatValue; // 0
            char charValue = num.charValue; // '\0' 0
            BOOL boolValue = num.boolValue; // NO
            NSString *stringValue = num.stringValue; // nil
  
        }
        {
            NSNumber *num = [NSNumber numberWithBool:YES];
            int intValue = num.intValue; // 1
            NSInteger integerValue = num.integerValue; // 1
            float floatValue = num.floatValue; // 1
            char charValue = num.charValue; // '\x01' 1
            BOOL boolValue = num.boolValue; // YES
            NSString *stringValue = num.stringValue; // @"1"
            NSLog(@"%@",num);

        }
    }

    
}


@end

