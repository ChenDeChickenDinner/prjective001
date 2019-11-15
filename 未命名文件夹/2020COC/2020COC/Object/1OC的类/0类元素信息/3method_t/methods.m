//
//  selfSuper.m
//  2020COC
//
//  Created by xs on 2019/7/18.
//  Copyright © 2019 xax. All rights reserved.
//

#import "methods.h"


@implementation methods
/*
 struct method_t {
 SEL name;
 const char *types;
 IMP imp;
 };
 */


- (int)test:(int)age height:(float)height{
    
    SEL sel = @selector(test:height:);
    SEL sel2 = NSSelectorFromString(@"test:height:");
    
    return 0;
}

@end

