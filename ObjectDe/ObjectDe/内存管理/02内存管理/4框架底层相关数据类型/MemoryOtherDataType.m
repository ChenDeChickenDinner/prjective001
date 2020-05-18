//
//  MemoryOtherDataType.m
//  2019OC2
//
//  Created by xs on 2019/3/4.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "MemoryOtherDataType.h"
@interface MemoryOtherDataType()
@property(nonatomic,strong) NSTimer *timer;
@end
@implementation MemoryOtherDataType

/**
 time:target的强引用的循环引用问题
 */
- (void)test1{
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(test2) userInfo:nil repeats:YES];
    self.timer = timer;
}
- (void)test2{

}
@end
