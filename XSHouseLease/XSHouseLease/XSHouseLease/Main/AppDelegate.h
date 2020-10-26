//
//  AppDelegate.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/16.
//  Copyright © 2020 fang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow * window;

@end

@interface JPushXSModel : NSObject
@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *content;
@property (copy, nonatomic) NSString *pushType;
@property (copy, nonatomic) NSString *houseId;
@property (copy, nonatomic) NSString *houseType;

@end


