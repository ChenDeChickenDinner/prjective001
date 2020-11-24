//
//  property_t.h
//  Runtime
//
//  Created by xs on 2019/7/25.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface property_t : NSObject
@property(nonatomic,copy) NSObject *ivar;

@end
/*
 typedef struct property_t *objc_property_t;
 struct property_t {
 const char *name;
 const char *attributes;
 };
 char *name:名称，注意不是是不带_下划线的名称
 char *attributes:对定义的描述，具体按照type encodings的规则描述

 */
