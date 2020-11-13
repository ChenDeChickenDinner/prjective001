//
//  Interface.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/12.
//

#import "Interface.h"

@implementation Interface

- (instancetype)init{
    self = [super init];
    _a = 10;
    _b1 = 3;
    _b2 = 3;
    _c1 = 3;
    _c2 = 3;

    return self;
}





// 实现协议方法
- (void)test1 {
    NSLog(@"Interface-test1");

}
- (void)test2 {
    
}

@end


@implementation Interface(XS)
/*

 */
- (void)test1{
    NSLog(@"Interface(XS)-test1");
}
@end

