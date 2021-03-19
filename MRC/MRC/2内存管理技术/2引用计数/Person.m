//
//  Person.m
//  MRC
//
//  Created by xs on 2021/3/18.
//

#import "Person.h"


@implementation Person

- (void)setCar:(Car *)car{
    if (_car != car) {
        [_car release];
        [car retain];
        _car = car;
    }
}
- (Car *)car{
    return _car;
}
- (void)dealloc{
    [super dealloc];
    [_car release];
    NSLog(@"%p:%s",self,__func__);
}
- (void)run{
    [_car run];
}
@end
@implementation Car
- (void)dealloc{
    [super dealloc];
    
    NSLog(@"%p:%s",self,__func__);
}
- (void)run{
    NSLog(@"run");
}
@end
