//
//  myProtocol.m
//  ObjectDe
//
//  Created by xs on 2019/11/5.
//  Copyright © 2019 xax. All rights reserved.
//

#import "myProtocol.h"

@protocol myProtocol <NSObject>
// 默认是必须实现的
- (void)text;
// 必须实现的方法
@required
- (void)test1;
//不强制要求实现的方法
@optional
- (void)test2;

//通过@property声明方法
@property (nonatomic, copy) NSString *datetime;

@end

@interface myProtocol : NSObject<myProtocol>
@property(nonatomic,strong) myProtocol<myProtocol> *sub;
@end
@implementation myProtocol
- (instancetype)initWinitProtocol:(id<myProtocol>)protocol{
    self = [super init];
    return self;
}
- (void)text{
    
}
- (void)test1{
    
}
- (void)test2{
    
}
@end
