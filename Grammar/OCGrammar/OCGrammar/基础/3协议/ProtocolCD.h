//
//  ProtocolCD.h
//  OCGrammar
//
//  Created by xs on 2019/4/24.
//  Copyright © 2019 xs. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 1.声明一个协议
 2.声明的协议遵守其它协议
 */
@protocol CDProtocol <NSObject>

@optional //不强制要求实现的方法

@required // 必须实现的方法

@end
//类遵守协议
@interface ProtocolCD : NSObject<CDProtocol>
// 对象遵守协议
@property(nonatomic,weak) id<CDProtocol> delegate;
@end

