//
//  XSUserServer.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/22.
//  Copyright © 2020 fang. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "BRAddressModel.h"
#import "XSHouseEnum.h"
#import <CoreLocation/CoreLocation.h>


UIKIT_EXTERN NSString *const HBNotificationLoginStatusChangedLoginFailed;
UIKIT_EXTERN NSString *const NotificationLoginStatusChangedLogin;
UIKIT_EXTERN NSString *const NotificationLoginStatusChangedLogout;

#define Login [HBUserServer sharedInstance].isLogin


@interface XSUserModel : NSObject


//
@property (nonatomic, strong) NSNumber *ID;

//
@property (nonatomic, copy) NSString *name;

//
@property (nonatomic, copy) NSString *nickName;

//
@property (nonatomic, copy) NSString *icon;

//
@property (nonatomic, assign) BOOL vip;

//
@property (nonatomic, copy) NSString *token;

//
@property (nonatomic, assign) BOOL activate;

//
@property (nonatomic, copy) NSString *phone;

//
@property (nonatomic, copy) NSString *expirationDate;

//
@property (nonatomic, copy) NSString *city;
// 中介认证
@property (nonatomic, assign) BOOL agency;


@property (nonatomic, assign) XSAgencyType agencyType;

@end

@interface XSUserServer : NSObject<CLLocationManagerDelegate>

//AS_SINGLETON(XSUserServer)
+ (XSUserServer *)sharedInstance;

+ (void)automaticLogin;
/** 用户模型 */
@property (nonatomic ,strong) XSUserModel *userModel;

@property (nonatomic ,strong) BRProvinceModel *cityModel;

@property(nonatomic,strong,readonly) CLLocation * location;

@property (nonatomic, copy) NSString *kfPhone;
@property (nonatomic, copy) NSString *wmdeshuoming;

@property(nonatomic,strong) CLLocationManager * locationManager;

/** 是否登录 */
@property (nonatomic ,assign) BOOL isLogin;
+ (void)exitLogin;
+ (void)againLogin;
+ (void)needLoginSuccess:(logSuccess)successBlack cancel:(logCancel)cancelBlack;
- (void)YHGetLocationPermissionVerifcationWithController:(UIViewController *)vc;
@end


