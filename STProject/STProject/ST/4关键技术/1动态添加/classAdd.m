//
//  classAdd.m
//  STProject
//
//  Created by xs on 2021/3/23.
//

#import "classAdd.h"
#import <objc/runtime.h>
@implementation classAdd
+ (void)load{
   Class class = objc_allocateClassPair([NSObject class], "XSNSObject", 0);
   objc_registerClassPair(class);
   IMP imp =  imp_implementationWithBlock(^(){
        
    });
//   class_addMethod(class, @selector(test), imp, <#const char * _Nullable types#>)
}
@end
