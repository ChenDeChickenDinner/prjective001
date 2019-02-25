//
//  KvcKvo.h
//  test1
//
//  Created by xs on 2019/2/25.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface school2 :NSObject
@property (nonatomic,assign) int age;
@end

@interface KvcKvo : NSObject
@property (nonatomic,assign) int age;
@property (nonatomic,strong) school2 *value;

@end


