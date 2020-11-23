//
//  XSDetect.m
//  Runtime
//
//  Created by xs on 2020/11/23.
//  Copyright © 2020 xax. All rights reserved.
//

#import "XSDetect.h"

@implementation XSDetect
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSSortDescriptor *ss = nil;
        [self isKindOfClass:[NSObject class]]; // YES
        
        [self isMemberOfClass:[NSObject class]]; // NO
        
        [self conformsToProtocol:@protocol(NSObject)];
        
        [self respondsToSelector:@selector(test)];
        
    }
    return self;
}
- (void)test{
    
}
@end
