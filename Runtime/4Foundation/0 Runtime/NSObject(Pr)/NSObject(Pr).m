//
//  NSObject(Pr).m
//  Runtime
//
//  Created by xs on 2020/11/25.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSObject(Pr).h"

@implementation NSObject_Pr_
- (instancetype)init
{
    self = [super init];
    if (self) {
        
        { // 识别 class
            [self class];
            [self superclass];
        }
        { // 识别和比较对象
            [self isEqual:nil];
            
            [self hash];
        }
        { //测试对象的继承，方法和协议
            [self isKindOfClass:[NSObject class]]; // YES
            
            [self isMemberOfClass:[NSObject class]]; // NO
            
            BOOL b1 =  [self respondsToSelector:@selector(test)];
            
            BOOL b2 =  [self conformsToProtocol:@protocol(NSObject)];
        }
        { // 描述对象
            [self description];
        }
        { // 发送信息
            
            [self performSelector:@selector(hash)];
            [self performSelector:@selector(hash) withObject:nil];
            [self performSelector:@selector(hash) withObject:nil withObject:nil];
        }

    }
    return self;
}
@end
