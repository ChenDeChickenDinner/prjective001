//
//  object_Inst.m
//  1231231
//
//  Created by xs on 2021/3/11.
//

#import "object_Inst.h"
#import <objc/runtime.h>
@implementation object_Inst
+ (void)load{
    id obj = [NSObject new];

    BOOL isClass = object_isClass(obj);
    
    Class objClass1 = object_setClass(obj, [NSObject class]);
    
    Class objClass2 = object_getClass(obj);

    Ivar ivar = class_getClassVariable([NSObject class], "_str");
    
    object_setIvar(obj, ivar, @(1));
    
    id value = object_getIvar(obj, ivar);
    


}
@end
