//
//  person_observer.h
//  test
//
//  Created by xs on 2021/3/16.
//

#import <Foundation/Foundation.h>


@interface person_observer : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *age;

@end

@interface personTest : NSObject
@property(nonatomic,strong) person_observer *person;
@end


