//
//  Person.h
//  Runtime
//
//  Created by xs on 2019/7/26.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person2 : NSObject
- (void)eat;
- (void)rewriteEat;
- (instancetype)initWithName:(NSString *)name;
- (NSString *)name;
@end

@interface students1 : Person2

@end
@interface students2 : Person2

@end
@interface CXTest : NSObject

@end
