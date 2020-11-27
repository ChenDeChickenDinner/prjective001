//
//  NIL.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/18.
//

#import "NIL.h"

@implementation NIL

//NullSafe github
+ (void)load{
    //    本质上 nil , Nil 和 NULL 是一样的
        Class class1 = Nil;
        Class class2 = nil;

        if (class1 == nil) {
            NSLog(@"class1");
        }

        if (class2 == Nil) {
            NSLog(@"class2");
        }
        NSString *str1 = nil;
        NSString *str2= Nil;
        if (str1 == Nil) {
            NSLog(@"str1");
        }

        if (str2 == nil) {
            NSLog(@"str2");
        }
        char *char1 = NULL;
        char *char2 = nil;
        char *char3 = Nil;
        if (char2 == NULL) {
            NSLog(@"char2 == NULL");
        }

        if (char2 == Nil) {
            NSLog(@"char2 == Nil");
        }
        if (char3 == NULL) {
            NSLog(@"char3 == NULL");
        }

        if (char3 == nil) {
            NSLog(@"char3 == nil");
        }
        NSLog(@"nil is %p",nil);
        NSLog(@"Nil is %p",Nil);
        NSLog(@"Null is %p",NULL);
        NSLog(@"NSNULL is  %@",kCFNull);

    //    nil is 0x0
    //    Nil is 0x0
    //    Null is 0x0
    //    NSNULL is  <null>**
}
@end
