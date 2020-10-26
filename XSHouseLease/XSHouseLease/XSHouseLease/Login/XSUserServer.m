//
//  XSUserServer.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/22.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSUserServer.h"
#import "XSLoginViewController.h"
#import "TUIKit.h"
#import "GenerateTestUserSig.h"

NSString *const HBNotificationLoginStatusChangedLoginFailed = @"HBNotificationLoginStatusChangedLoginFailed";

NSString *const NotificationLoginStatusChangedLogin = @"NotificationLoginStatusChangedLogin";

NSString *const NotificationLoginStatusChangedLogout = @"NotificationLoginStatusChangedLogout";
@implementation XSUserModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{
             @"ID" : @"id",//前边的是你想用的key，后边的是返回的key
             };
}
- (void)setAgencyType:(XSAgencyType)agencyType{
    _agencyType = agencyType;
    if (_agencyType == XSAgencyType_Agencying || _agencyType == XSAgencyType_Pass) {
        _agency = YES;
    }
}
@end



@implementation XSUserServer

DEF_SINGLETON(XSUserServer)

+ (void)automaticLogin{
     NSDictionary *userInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
     XSUserModel *model =  [XSUserModel mj_objectWithKeyValues:userInfo];
    if (model.token) {
        [XSUserServer sharedInstance].userModel = model;
    }
    [[XSUserServer sharedInstance].locationManager startUpdatingLocation];
}
+ (void)exitLogin{
    [[NSUserDefaults standardUserDefaults] setObject:@{} forKey:@"userInfo"];
    [XSUserServer sharedInstance].userModel = nil;
    [[TIMManager sharedInstance] logout:^{
        [[NSNotificationCenter defaultCenter] postNotificationName:TUIKitNotification_onChangeUnReadCount object:nil];
    } fail:^(int code, NSString *msg) {
        
    }];
    [self postNotification:NotificationLoginStatusChangedLogout];
}
+ (void)againLogin{
    
    UIAlertController *arl =  [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"当前未登录或登录已超时\n是否重新登录" preferredStyle:UIAlertControllerStyleAlert];

     
     UIAlertAction *can = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
         
     }];
     UIAlertAction *ok = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
         [XSUserServer needLoginSuccess:nil cancel:nil];
      }];
     [arl addAction:can];
     [arl addAction:ok];

     [[NSObject getTopViewController] presentViewController:arl animated:YES completion:^{
         
     }];
}
- (void)setUserModel:(XSUserModel *)userModel{
    _userModel = userModel;
    NSDictionary *dict = [NSDictionary dictionaryWithDictionary:[userModel mj_keyValues]];
    [[NSUserDefaults standardUserDefaults] setObject:dict forKey:@"userInfo"];
    if (userModel.token) {
        [self imLogin];
        [[NSNotificationCenter defaultCenter] postNotificationName:NotificationLoginStatusChangedLogin object:nil];
    }

    NSLog(@"userModel = %@",[userModel mj_keyValues]);

}

-(void)imLogin{

    NSString *identifier = [NSString stringWithFormat:@"%@",self.userModel.ID];
    TIMLoginParam *param = [[TIMLoginParam alloc] init];
    param.identifier = identifier;
    param.userSig = [GenerateTestUserSig genTestUserSig:identifier];
    TIMUserConfig *con =  [[TIMUserConfig  alloc]init];
    con.disableAutoReport = YES;
    con.enableReadReceipt = YES;
    WEAK_SELF;
//    [[TIMManager sharedInstance] setUserConfig:con];
    [[TIMManager sharedInstance] login:param succ:^{
//        [ProgressHUD showSuccess:@"im登录成功"];
//        STRONG_SELF;
//        [self unReadCount:nil];

        [[NSNotificationCenter defaultCenter] postNotificationName:TUIKitNotification_onChangeUnReadCount object:nil];

    } fail:^(int code, NSString *msg) {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"code:%d msdg:%@ ,请检查 sdkappid,identifier,userSig 是否正确配置",code,msg] message:nil delegate:self cancelButtonTitle:@"知道了" otherButtonTitles:nil, nil];
//                [alert show];
    }];
}

- (void)unReadCount:(NSNotification *)no{
      int unReadCount = 0;
      NSArray *convs = [[TIMManager sharedInstance] getConversationList];
      for (TIMConversation *conv in convs) {
          if([conv getType] == TIM_SYSTEM){
              continue;
          }
          unReadCount += [conv getUnReadMessageNum];
      }
      NSNumber *totalUnReadCount = [NSNumber numberWithInteger:unReadCount];

  }
- (BOOL)isLogin{
    if (_userModel.token) {
        return YES;
    }
    return NO;
}



- (BRProvinceModel *)cityModel{
    if (_cityModel == nil) {
        _cityModel = [[BRProvinceModel alloc]init];
        _cityModel.code = @"1";
        _cityModel.name = @"上海";
    }
    return _cityModel;
}

+ (void)needLoginSuccess:(logSuccess)successBlack cancel:(logCancel)cancelBlack{
    if (![XSUserServer sharedInstance].isLogin) {
         XSLoginViewController *login = [[XSLoginViewController alloc]init];
        login.successBlack = successBlack;
        login.cancelBlack = cancelBlack;
         login.modalPresentationStyle = UIModalPresentationFullScreen;
        UINavigationController *vc = [[UINavigationController alloc]initWithRootViewController:login];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;

         [[NSObject getTopViewController] presentViewController:vc animated:YES completion:^{
             
         }];
    }else{
        if (successBlack) {
            successBlack();
        }
    }
  
}

- (CLLocationManager *)locationManager{
    if (!_locationManager) {
            _locationManager  = [[CLLocationManager alloc]init];
            _locationManager.delegate =  self;
        }
        return _locationManager;
    return nil;
}
- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations {
    _location = locations.lastObject;

    [self.locationManager stopUpdatingLocation];

}

- (void)YHGetLocationPermissionVerifcationWithController:(UIViewController *)vc{
    BOOL enable = [CLLocationManager locationServicesEnabled];
    NSInteger state = [CLLocationManager authorizationStatus];
    
    if (!enable || 2 > state) {// 尚未授权位置权限
        if (8 <= [[UIDevice currentDevice].systemVersion floatValue]) {
            NSLog(@"系统位置权限授权弹窗");

            if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
                  [self.locationManager requestWhenInUseAuthorization];
              }
            
        }
    }
    else {
        if (state == kCLAuthorizationStatusDenied) {// 授权位置权限被拒绝
            NSLog(@"授权位置权限被拒绝");
            UIAlertController *alertCon = [UIAlertController alertControllerWithTitle:@"提示"
                                                                              message:@"访问位置权限暂未授权"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
            [alertCon addAction:[UIAlertAction actionWithTitle:@"暂不设置" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }]];
            
            [alertCon addAction:[UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                dispatch_after(0.2, dispatch_get_main_queue(), ^{
                    NSURL *url = [[NSURL alloc] initWithString:UIApplicationOpenSettingsURLString];// 跳转至系统定位授权
                    if( [[UIApplication sharedApplication] canOpenURL:url]) {
                        [[UIApplication sharedApplication] openURL:url];
                    }
                });
            }]];
            
            [vc presentViewController:alertCon animated:YES completion:^{
                
            }];
        }
    }
}
@end
