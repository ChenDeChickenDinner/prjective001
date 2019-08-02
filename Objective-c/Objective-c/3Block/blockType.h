//
//  blockType.h
//  2019OC
//
//  Created by xs on 2019/2/25.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface blockType : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) void(^block)(void);
@end
@interface blockType2 : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) void(^block)(void);
@end
