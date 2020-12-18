//
//  NSData_.m
//  Runtime
//
//  Created by xs on 2020/12/18.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSData_.h"

@implementation NSData_
/*
typedef NS_OPTIONS(NSUInteger, NSDataReadingOptions) {
 
    //使用这个参数后，iOS就不会把整个文件全部读取的内存了，而是将文件映射到进程的地址空间中。
    //这么做并不会占用实际内存。这样就可以解决内存满的问题。
    NSDataReadingMappedIfSafe = 1UL << 0,
 
    //数据将不会存入内存中，对于只会使用一次的数据，这么做会提高性能。
    NSDataReadingUncached = 1UL << 1,
 
    //数据始终会被存储在内存中，如果用户定义了NSDataReadingMappedIfSafe和这个枚举，那么这个枚举会优先起作用。
    NSDataReadingMappedAlways NS_ENUM_AVAILABLE(10_7, 5_0) = 1UL << 3,
    
    //老枚举，苹果建议不再使用。
    NSDataReadingMapped = NSDataReadingMappedIfSafe, // Deprecated name for NSDataReadingMappedIfSafe
    NSMappedRead = NSDataReadingMapped,   // Deprecated name for NSDataReadingMapped
    NSUncachedRead = NSDataReadingUncached  // Deprecated name for NSDataReadingUncached
};
 



 typedef NS_OPTIONS(NSUInteger, NSDataBase64EncodingOptions) {
     NSDataBase64Encoding64CharacterLineLength = 1UL << 0, 每64个字符插入\r或\n
     NSDataBase64Encoding76CharacterLineLength = 1UL << 1, 每76个字符插入\r或\n
     NSDataBase64EncodingEndLineWithCarriageReturn = 1UL << 4, 插入字符为\r
     NSDataBase64EncodingEndLineWithLineFeed = 1UL << 5, 插入字符为\n

 };


 typedef NS_OPTIONS(NSUInteger, NSDataBase64DecodingOptions) {

     NSDataBase64DecodingIgnoreUnknownCharacters = 1UL << 0
 } ;

*/
+ (void)load{

    //1.空data
    NSData *data1 = [NSData data];
    NSLog(@"data = %@",data1);// data = {length = 0, bytes = 0x}

    //1.包装字节
    Byte byteArray[] = {1,22,44};// Byte 字节 一个字节存储8位无符号数，储存的数值范围为0-255。(unsigned char )
    NSData *data2 = [NSData dataWithBytes:byteArray length:sizeof(byteArray)/sizeof(Byte)];
    NSLog(@"data = %@",data2); //data = {length = 4, bytes = 0x00020432}
    
    //1.来自其他NSData
    NSData *data3 = [NSData dataWithData:data2];

    //1.来自文件
    NSData *data4 = [NSData dataWithContentsOfFile:@""];
    NSData *data5 = [NSData dataWithContentsOfURL:[NSURL URLWithString:@""]];

    {
        NSUInteger dataLength =  data2.length;// 字节数
        const void *allContents = [data2 bytes]; // 读取所有内容(一个指向内容的指针)

        Byte sectionContents1;
        [data2 getBytes:&sectionContents1 length:1];// 读取部分内容
        
        Byte sectionContents2;
        [data2 getBytes:&sectionContents2 range:NSMakeRange(1, 1)];// 读取部分内容
        NSLog(@"sectionContents1 = %d",sectionContents1);
        NSLog(@"sectionContents2 = %d",sectionContents2);

        /*
         1.NSData通常可能是由一系列不同的数据整合到一起得到 NSMutableData
         2.bytes 会把所有NSData看成一个数据块。
         3.推荐使用此方法来进行遍历 它是带有 NSRange 的
         */
        NSError *error;
        NSString *path = @"/Users/xs/Desktop/Git/Runtime/writeDict.plist";
        NSData *fileData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:&error];
        [fileData enumerateByteRangesUsingBlock:^(const void * _Nonnull bytes, NSRange byteRange, BOOL * _Nonnull stop) {
            NSLog(@"");
        }];
    }

    [self NSMutableDataDemo];
}

+ (void)readingDatafromaFile{
    NSError *error;
    NSString *path = @"/Users/xs/Desktop/Snip20201216_8.png";
    NSString *path2 = @"/Users/xs/Desktop/chen.png";
    NSData *fileData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:&error];
    
    {
        //1.将 Data进行 base64 编码(加密)
        NSData *encodingData = [fileData base64EncodedDataWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        
        //2.将 经过base64编码的Data 进行解码(解密)
        NSData *decodingData = [[NSData alloc]initWithBase64EncodedData:encodingData options:NSDataBase64DecodingIgnoreUnknownCharacters];
        //3.生成文件
        [decodingData writeToFile:path2 atomically:YES];
    }
    {
        //1.将 Data进行 base64 编码转成 字符串(NSData-->NSString)
        NSString *encodingStr = [fileData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        //2.将 经过base64编码的NSString 进行解码(NSString-->NSData)
        NSData   *decodingData = [[NSData alloc]initWithBase64EncodedString:encodingStr options:NSDataBase64DecodingIgnoreUnknownCharacters];
        [decodingData writeToFile:path2 atomically:YES];
    }
    
    NSDataBase64EncodingOptions op1 = 0; // 则表示不插入任何字符
    NSDataBase64EncodingOptions op2 = NSDataBase64Encoding76CharacterLineLength | NSDataBase64EncodingEndLineWithCarriageReturn; //76个字符后插入一个\r则可以

}


+ (void)NSMutableDataDemo{
    Byte byteArray1[] = {1,2,3};
    Byte byteArray2[] = {5,6,7};
    Byte byteArray3[] = {9,10,11};
    NSData *data0 = [NSData dataWithBytes:byteArray1 length:sizeof(byteArray1)/sizeof(Byte)];

    NSMutableData *data = [NSMutableData data];

    {
        [data appendData:data0];
        [data appendData:data0];
        [data appendData:data0];
        NSUInteger length = data.length;
        // 这个 NSRange 是怎么体现出来的？？？？？？？？ 这里还是一个 NSRange
        [data enumerateByteRangesUsingBlock:^(const void * _Nonnull bytes, NSRange byteRange, BOOL * _Nonnull stop) {
            NSLog(@"byteRange = %@",NSStringFromRange(byteRange));
        }];
    }
    {
        [data appendBytes:byteArray1 length:sizeof(byteArray1)/sizeof(Byte)];
        [data appendBytes:byteArray2 length:sizeof(byteArray2)/sizeof(Byte)];
        [data appendBytes:byteArray3 length:sizeof(byteArray3)/sizeof(Byte)];
        NSUInteger length = data.length;
        
        // 这个 NSRange 是怎么体现出来的？？？？？？？？ 这里仍然还是一个 NSRange
        [data enumerateByteRangesUsingBlock:^(const void * _Nonnull bytes, NSRange byteRange, BOOL * _Nonnull stop) {
            NSLog(@"byteRange = %@",NSStringFromRange(byteRange));
        }];

    }
}
@end
