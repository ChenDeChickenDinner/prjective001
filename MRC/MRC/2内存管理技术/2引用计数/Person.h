//
//  Person.h
//  MRC
//
//  Created by xs on 2021/3/18.
//

#import <Foundation/Foundation.h>
@interface Car : NSObject
- (void)run;
@end

@interface Person : NSObject
{
    Car *_car;
}

- (void)setCar:(Car *)car;
- (Car *)car;

- (void)run;
@end
