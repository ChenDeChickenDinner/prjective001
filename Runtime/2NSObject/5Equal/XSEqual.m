//
//  XSEqual.m
//  Runtime
//
//  Created by xs on 2020/11/20.
//  Copyright © 2020 xax. All rights reserved.
//

#import "XSEqual.h"

@implementation XSEqual

- (NSUInteger)hash
{
  return [_keyPath hash];
}

- (BOOL)isEqual:(id)object
{
  if (nil == object) {
    return NO;
  }
  if (self == object) {
    return YES;
  }
  if (![object isKindOfClass:[self class]]) {
    return NO;
  }
  return [_keyPath isEqualToString:((XSEqual *)object)->_keyPath];
}

@end
