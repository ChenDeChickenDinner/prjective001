//
//  main.m
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         
        基本数据类型
        结构体
        基本数据包装
         
         
        字符串
         
         
        集合（排序 筛选 正则）
         
         NSAutoreleasePool 内存管理 NSGarbageCollector垃圾回收

         
        NSObject kvc kvo
        NSObject(NSKeyValueCoding) kvc
        NSObject(NSKeyValueObserving)


        Type Encodings NSMethodSignature   NSInvocation 消息转发
        NSUndoManager 恢复撤销
        NSProxy NSDistantObject  NSProtocolChecker  消息转发


        NSNotification NSNotificationQueue 通知
         

         NSCoding NSCoder   NSArchiver  NSKeyedArchiver NSKeyedUnarchiver
         NSJSONSerialization NSPropertyListSerialization 归档序列化
         
         NSLocale 本地化         NSUserDefaults.h
         
         日期时间
         文件处理
        线程
        网络
        编码解码
        归档存储


         
         

         
        NSInteger
        NSUInteger
        CGFloat


        CGPoint
        CGSize
        CGRect
        NSRect

        NSValue NSNumber   NSDecimal NSDecimalNumber

        NSString NSMutableString     NSScanner NSTextCheckingResult NSCharacterSet

        NSData/NSStream


        NSDate NSDateInterval  NSDateIntervalFormatter NSDateComponentsFormatter
        NSCalendar NSCalendarDate

        NSTimer NSTimeZone


        NSFormatter.h
        NSNumberFormatter.h
        NSDateFormatter.h
        NSByteCountFormatter
        NSEnergyFormatter
        NSLengthFormatter
        NSListFormatter
        NSMassFormatter
        NSRelativeDateTimeFormatter


        NSIndexPath NSIndexSet
        NSDictionary NSMutableDictionary  NSCache

        NSArray NSMutableArray
        NSSet NSMutableSet NSCountedSet  NSOrderedSet
        NSMapTable NSHashTable
        NSPointerArray NSPointerFunctions

         
         
        NSEnumerator 数组->枚举器
        NSSortDescriptor 数组->排序
        NSPredicate NSComparisonPredicate NSCompoundPredicate  表示一个可以用来过滤对象集合的条件
        NSRegularExpression 正则













        NSUUID
        NSBundle
        NSFileManager
        NSFileHandle
        NSFileWrapper
        NSFileCoordinator
        NSPathUtilities 路径工具





        NSProcessInfo NSXPCConnection
        NSThread
        NSTask NSOperation NSConnection
        NSLock  NSDistributedLock
        NSRunLoop


        NSURLSession.h
        NSURLResponse.h
        NSURLProtocol.h
        NSURLRequest.h
        NSURLError.h
        NSURLHandle.h
        NSURLProtectionSpace.h
        NSURLCredentialStorage.h
        NSURLDownload.h
        NSURLConnection.h
        NSURLCredential.h
        NSURLCache.h
        NSURL.h
        NSURLAuthenticationChallenge.h
        NSPortNameServer.h
        NSPortMessage.h
        NSPort.h
        NSPortCoder.h
        NSNetServices.h
        NSHTTPCookieStorage.h
        NSHTTPCookie.h


        NSXMLParser.h
        NSXMLNodeOptions.h
        NSXMLNode.h
        NSXMLElement.h
        NSXMLDTDNode.h
        NSXMLDTD.h
        NSXMLDocument.h

         NSHost.h
         NSError.h
        NSExtensionRequestHandling.h
        NSExtensionItem.h
        NSExtensionContext.h  异常
        NSExpression.h
        NSException.h
         */
//        NSInteger
//        NSUInteger
//        CGFloat
//        CGPoint
//        CGSize
//        CGRect
//        NSRect
//        NSIndexPath NSIndexSet
        
//        NSValue NSNumber  NSDecimal NSDecimalNumber
        
//        NSString NSMutableString NSScanner条件判断利器  NSTextCheckingResult
//        NSCharacterSet 字符串处理->字符集
        
        
        
//        NSCoder
        
//        NSFormatter.h
//        NSNumberFormatter.h
//        NSDateFormatter.h
//        NSByteCountFormatter
//          NSEnergyFormatter
//        NSLengthFormatter
//        NSListFormatter
//        NSMassFormatter
//        NSRelativeDateTimeFormatter
        
//        NSDictionary NSMutableDictionary  NSCache
//        NSSet NSMutableSet  NSOrderedSet
//        NSArray NSMutableArray  NSPointerArray NSPointerFunctions
//        NSMapTable NSHashTable
        
//        NSEnumerator 数组->枚举器
//        NSSortDescriptor 数组->排序
    
//

//        NSStream 流
        
//        NSDate NSDateComponentsFormatter
//        NSDateInterval NSDateIntervalFormatter
//        NSCalendar 日历 NSCalendarDate
        
        
        
//        NSExtensionRequestHandling.h
//        NSExtensionItem.h
//        NSExtensionContext.h  异常
//        NSExpression.h
//        NSException.h
        
//        NSBundle NSUUID
//        NSFileManager
//        NSFileHandle
//        NSFileWrapper
//        NSFileCoordinator
//        NSPathUtilities 路径工具
        
//        NSTimeZone.h
//        NSTimer.h
//        NSHost.h
//        NSError.h
        
        //        NSRunLoop.h
//        NSAutoreleasePool 内存管理 NSGarbageCollector垃圾回收
//        NSThread 线程  NSConnection   NSProcessInfo进程 NSXPCConnection
//        NSTask 操作
//        NSOperation  任务
//        NSLock 锁 NSDistributedLock
        
//        NSProgress 进度指示器
        
//        NSURLSession.h
//        NSURLResponse.h
//        NSURLProtocol.h
//        NSURLRequest.h
//        NSURLError.h
//        NSURLHandle.h
//        NSURLProtectionSpace.h
//        NSURLCredentialStorage.h
//        NSURLDownload.h
//        NSURLConnection.h
//        NSURLCredential.h
//        NSURLCache.h
//        NSURL.h
//        NSURLAuthenticationChallenge.h
//        NSPortNameServer.h
//        NSPortMessage.h
//        NSPort.h
//        NSPortCoder.h
//        NSNetServices.h
//        NSHTTPCookieStorage.h
//        NSHTTPCookie.h
        
//        NSCoding  NSArchiver  NSKeyedArchiver  NSJSONSerialization NSPropertyListSerialization 归档序列化
        
        
//        NSXMLParser.h
//        NSXMLNodeOptions.h
//        NSXMLNode.h
//        NSXMLElement.h
//        NSXMLDTDNode.h
//        NSXMLDTD.h
//        NSXMLDocument.h
        
//        NSPredicate NSComparisonPredicate NSCompoundPredicate  表示一个可以用来过滤对象集合的条件
//        NSRegularExpression
//
//
//        Type Encodings NSMethodSignature  NSInvocation 消息转发  NSUndoManager
//        NSProxy NSDistantObject  NSProtocolChecker  消息转发
//
//
//        NSObject(NSKeyValueCoding) kvc NSScriptClassDescription
//        NSObject(NSKeyValueObserving)
//        NSObject
//        NSObject(NSScripting) NSObjectScripting
//
//        NSLocale 本地化         NSUserDefaults.h
//
//        NSNotification NSNotificationQueue 通知
    }
    return 0;
}


