//
//  main.m
//  Foundation
//
//  Created by xs on 2018/11/27.
//  Copyright © 2018 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

void loginChen(NSString *str,id value){
    NSLog(@"%@ = %@",str,value);
}

void chen_null(){
    NSNull *null = [NSNull null];
    loginChen(@"null", null);
}
void chen_value(){

    NSValue *value1 = [NSValue valueWithPoint:NSMakePoint(0, 0)];
    NSValue *value2 = [NSValue valueWithSize:NSMakeSize(10, 10)];
    NSValue *value3 = [NSValue valueWithRect:NSMakeRect(0, 0, 10, 10)];
    NSValue *value4 = [NSValue valueWithRange:NSMakeRange(0, 1)];

}

int main(int argc, const char * argv[]) {
    @autoreleasepool {

//        chen_null();
//        NSNull
//
//        NSString
//        NSMutableString
//        NSScanner
//
//        NSCharacterSet 字符集
//        NSMutableCharacterSet
//
//
//        NSArray
//        NSMutableArray
//        NSPointerArray
//        NSSortDescriptor 排序
//
//        NSDictionary
//        NSKeyValueCoding
//        NSKeyValueObserving
//        NSMutableDictionary
//
//        NSSet
//        NSMutableSet
//
//        NSOrderedSet
//
//
//        NSEnumerator
//        NSHashTable
//        NSMapTable
//        NSPointerFunctions
//
//
//        NSIndexPath
//        NSIndexSet
//
//
//        NSValue
//        NSValueTransformer
//        NSNumber
//        NSNumberFormatter
//        NSDecimal
//        NSDecimalNumber
//        NSData
//        NSKeyedArchiver 归档
//        NSKeyedUnarchiver 读取归档
//
//
//        NSCoder
//
//        NSDate
//        NSDateFormatter
//        NSDateInterval
//        NSDateIntervalFormatter
//        NSISO8601DateFormatter
//
//        NSCalendar 日历
//        NSTimer
//        NSTimeZone
//
//
//        NSBundle
//        NSFileManager
//        NSFileHandle
//        NSPathUtilities
//
//NSFormatter
//NSMassFormatter
//NSLengthFormatter
//NSEnergyFormatter
//
//
//NSAutoreleasePool 内存管理
//NSInvocation 方法调用 反射操作
//NSMethodSignature
//NSLock  数据加锁
//
//
//NSOperation 多线程
//NSPort
//NSProcessInfo
//NSRunLoop
//NSThread
//NSXPCConnection
//
//
//NSNotification
//NSNotificationQueue
//
//NSRegularExpression 正则
//NSTextCheckingResult
//
//NSPropertyList plist文件
//
//
//
//NSHTTPCookie
//NSHTTPCookieStorage
//NSURL
//NSURLAuthenticationChallenge
//NSURLCache
//NSURLConnection
//NSURLCredential
//NSURLCredentialStorage
//NSURLError
//NSURLProtectionSpace
//NSURLProtocol
//NSURLRequest
//NSURLResponse
//NSJSONSerialization
//NSXMLParser
//NSError
//FoundationErrors
//NSException 异常
//NSStream
//
//        NSUserDefaults
    }
    return 0;
}
