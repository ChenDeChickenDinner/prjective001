//
//  Person.m
//  MRC1
//
//  Created by xs on 2019/3/4.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "Person.h"
@implementation Car
- (void)dealloc{
    [super dealloc];
    NSLog(@"%s\n",__func__);
}
@end

@implementation Person
- (void)setCar:(Car *)car{
    if (car != _car) {
        [_car release];
        [car retain];
        _car = car;
    }
}
- (Car *)getCar{

    return _car;
}

- (void)setName:(NSString *)name{
    if (name != _name) {
        [_name release];
        [name retain];
        _name = name;
    }
}
- (NSString *)getName{
    return _name;
}

- (void)setAge:(int)age{
    _age = age;
}
- (int)getAge{

    return _age;
}

- (void)dealloc{
    [_car release];
    [_name release];
    [super dealloc];
    NSLog(@"%s\n",__func__);
}
@end
