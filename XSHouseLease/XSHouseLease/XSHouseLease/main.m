 //
 //  main.m
 //  XSHouseLease
 //
 //  Created by heartbeats on 2020/3/16.
 //  Copyright © 2020 fang. All rights reserved.
 //

 #import <UIKit/UIKit.h>
 #import "AppDelegate.h"

 int main(int argc, char * argv[]) {
     NSString * appDelegateClassName;
     @autoreleasepool {
         // Setup code that might create autoreleased objects goes here.
         appDelegateClassName = NSStringFromClass([AppDelegate class]);
     }
     return UIApplicationMain(argc, argv, nil, appDelegateClassName);
 }
