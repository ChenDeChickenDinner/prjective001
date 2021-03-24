
#import "NSObject_protocol.h"

@implementation NSObject_protocol

+ (void)load{
    Class class = [NSObject class];
    NSObject *instances = [NSObject new];
    BOOL boolvalue = YES;
    id object = boolvalue?class:instances;
    
    {  // 对象自检
        /* isa是不是链条内 本类-子类-父类基类
         1.对象：对象的类型 是不是 XXClass 的子类，
         2.类对象:类对象的元类  是不是 XXClass 的子类，
         */
        BOOL b1 =  [object isKindOfClass:[NSObject class]];
        /* isa是否相等
          1.对象：对象的类型 是不是 XXClass类型，
          2.类对象:类对象的元类 是不是 XXClass类型，
         */
        BOOL b2 =  [object isMemberOfClass:[NSObject class]];
        
        BOOL b3 =  [object conformsToProtocol:@protocol(NSObject)];
        
        BOOL b4 =  [object respondsToSelector:@selector(test)];
    }
    { // 对象信息获取
        [object class];
        [object superclass];

        [object hash];
        [object description];

    }
    { // 对象执行方法
        [object performSelector:@selector(hash)];
        [object performSelector:@selector(hash) withObject:nil];
        [object performSelector:@selector(hash) withObject:nil withObject:nil];
    }
}


@end
