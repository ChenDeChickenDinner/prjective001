//
//  BinaryData.m
//  Runtime
//
//  Created by xs on 2020/11/26.
//  Copyright © 2020 xax. All rights reserved.
//

#import "BinaryData.h"

/********************************************************************************

    Base integer types for all target OS's and CPU's
    
        UInt8            8-bit unsigned integer
        SInt8            8-bit signed integer
        UInt16          16-bit unsigned integer
        SInt16          16-bit signed integer
        UInt32          32-bit unsigned integer
        SInt32          32-bit signed integer
        UInt64          64-bit unsigned integer
        SInt64          64-bit signed integer

 typedef unsigned char                   UInt8;
 typedef signed char                     SInt8;
 typedef unsigned short                  UInt16;
 typedef signed short                    SInt16;

 typedef unsigned int                    UInt32;
 typedef signed int                      SInt32;

 typedef UInt8                           Byte;
 typedef SInt8                           SignedByte;
 typedef wide *                          WidePtr;
 typedef UnsignedWide *                  UnsignedWidePtr;
 typedef Float80                         extended80;
 typedef Float96                         extended96;
 typedef SInt8                           VHSelect;
*********************************************************************************/

@implementation BinaryData
+ (void)load{
    [self test1];
}
#pragma warning - Creating Data
+ (void)test1{
    NSData *data1 = [NSData data];
    
    Byte myByte[] = {0x01,0x02,0x03};
    NSData *data2 = [NSData dataWithBytes:myByte length:sizeof(myByte)];
    NSLog(@"data = %@",data2);
    
    NSData *data3 = [NSData dataWithData:data2];
    {
        NSData *data1 = [NSData dataWithContentsOfFile:@""];
    }
}
@end
