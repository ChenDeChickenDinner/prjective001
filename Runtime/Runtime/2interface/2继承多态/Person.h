//
//  Person.h
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject
- (void)eat;
- (void)rewriteEat;
- (instancetype)initWithName:(NSString *)name;
- (NSString *)name;
@end

@interface students1 : Person

@end
@interface students2 : Person

@end
@interface CXTest : NSObject

@end
