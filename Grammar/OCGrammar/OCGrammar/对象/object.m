//
//  object.m
//  OCGrammar
//
//  Created by xs on 2019/4/22.
//  Copyright © 2019 xs. All rights reserved.
//

#import "object.h"


@interface Person : NSObject
{
    @public
    
    @protected
    
    @private
    
    @package
    
}
/*
 @property修饰符详解
 1.内存管理:strong,weak,copy,assign
 2.线程安全:nonatomic,atomic
 3.读写限制:readonly,readwrite
 4.命名自定义:setter=xxx getter=xxx
 5.类方法:class(之会生成setter和getter的声明)
 */
@property()NSString *name;
@property()NSInteger number;

@end

@interface Person (CD)

@end

@interface Person ()

@end

@implementation object

-(id)initWithStr1:(NSString *)str{
    
    if (self = [super init]) {
        return self;
    }else{
        return nil;
    }
 
}
-(instancetype)initWithStr2:(NSString *)str{
    return nil;
}

+ (Class)classWithStr{
    Class value = [self class];
    return value;
}
- (IMP)impWithStr{
    SEL sel = @selector(init);
    return nil;
}

@end

@protocol CDProtocol <NSObject>
@required
@optional

@end

nullable _Nonnull _Nullable    __nullable __null_unspecified



