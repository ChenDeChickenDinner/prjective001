//
//  SharedInstance.h
//  Runtime
//
//  Created by xs on 2020/11/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


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


@interface SharedInstance : NSObject
+(SharedInstance *)sharedInstance;

@end

NS_ASSUME_NONNULL_END
