//
//  XSInstance.h
//  Runtime
//
//  Created by xs on 2020/11/20.
//  Copyright © 2020 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

#undef    AS_SINGLETON
#define AS_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef    DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once(&once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

//1.既能单例又能实例化 二种兼顾
@interface XSInstance : NSObject
+(XSInstance *)sharedInstance;
@end


