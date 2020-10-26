//
//  AppDelegate.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/16.
//  Copyright © 2020 fang. All rights reserved.
//

#import "AppDelegate.h"
#import "XSTabBarViewController.h"
#import "TUIKit.h"
#import "GenerateTestUserSig.h"
#import <ShareSDK/ShareSDK.h>
#import <MOBFoundation/MobSDK+Privacy.h>
#import "WXApi.h"
#import "XSPaymentViewController.h"
#import <AlipaySDK/AlipaySDK.h>
#import "JPUSHService.h"
#import "HBPushServiceImp.h"
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
#import <UserNotifications/UserNotifications.h>
#endif
#import "XSHouseDetailsController.h"
#import "XSResourceViewController.h"


@interface AppDelegate ()<JPUSHRegisterDelegate>
@property(assign,nonatomic) NSUInteger BadgeNumber;
@end

@implementation AppDelegate
//Team ID  74KP7U86ZU

//fangdinghui
//784R36R9JM

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.BadgeNumber = 0;
//    [self clearLaunchScreenCache];
     self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
     self.window.rootViewController = [[XSTabBarViewController alloc]init];
     [self.window makeKeyAndVisible];
    [AMapServices sharedServices].apiKey = @"9130b0a7ff0c9fd01b8d91eca03acb36";
    

    [[TUIKit sharedInstance] setupWithAppId:SDKAPPID];
    [TUIKit sharedInstance].config.avatarType =  TAvatarTypeRounded;
    
    
    [MobSDK uploadPrivacyPermissionStatus:YES onResult:^(BOOL success) {

    }];
//    [WXApi startLogByLevel:WXLogLevelDetail logBlock:^(NSString *log) {
//          NSLog(@"log : %@", log);
//      }];
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
                               //更新到4.3.3或者以上版本，微信初始化需要使用以下初始化
     [platformsRegister setupWeChatWithAppId:@"wx7ef4e6f9a5d0aaf1" appSecret:@"551b4c6e21439268214f620b471572dc" universalLink:@"https://orppo.share2dlink.com/"];

    }];
    
    [WXApi registerApp:@"wx7ef4e6f9a5d0aaf1"  universalLink:@"https://orppo.share2dlink.com/"];


     JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;

    } else {
        // Fallback on earlier versions
    }
    [JPUSHService setDebugMode];
     [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    
    [JPUSHService setupWithOption:launchOptions appKey:@"a754b29f1a14be78817e4e7b"
                           channel:@"AppStore"
                  apsForProduction:0
             advertisingIdentifier:nil];
    
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"registrationID-%@",[JPUSHService registrationID]);
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
  [JPUSHService registerDeviceToken:deviceToken];
}
// iOS 7
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
  [JPUSHService handleRemoteNotification:userInfo];
    [self dealWithPushNotification:userInfo];

  completionHandler(UIBackgroundFetchResultNewData);
}

// iOS 10  App在后台运行及程序退出杀死 会调用的方法
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
  // Required
    self.BadgeNumber++;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:self.BadgeNumber];
  NSDictionary * userInfo = response.notification.request.content.userInfo;
  if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
      [self dealWithPushNotification:userInfo];

  }
  completionHandler();  // 系统要求执行这个方法
}

// iOS 10  App在前台时候回调：用户正在使用状态
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
  // Required
  NSDictionary * userInfo = notification.request.content.userInfo;
  if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    [JPUSHService handleRemoteNotification:userInfo];
      [self dealWithPushNotification:userInfo];
  }
  completionHandler(UNNotificationPresentationOptionAlert); // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
}

- (void)jpushNotificationAuthorization:(JPAuthorizationStatus)status withInfo:(NSDictionary *)info {
    
}




// iOS 12 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(UNNotification *)notification{
  if (notification && [notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
    //从通知界面直接进入应用
  }else{
    //从通知设置界面进入应用
  }
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    self.BadgeNumber = 0;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:self.BadgeNumber];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    self.BadgeNumber = 0;
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:self.BadgeNumber];
}


//{
//  "_j_business" : 1,
//  "_j_uid" : 42032029783,
//  "_j_msgid" : 38280672022780499,
//  "aps" : {
//    "alert" : {
//      "title" : "我是帅哥",
//      "body" : "你是傻逼"
//    },
//    "badge" : 1,
//    "sound" : "default"
//  }
//}
- (void)dealWithPushNotification:(NSDictionary *)notificationDict{
    NSLog(@"123--%@",notificationDict);
    NSString *houseType = [notificationDict objectForKey:@"houseType"];
    NSString *houseid = [notificationDict objectForKey:@"houseid"];

    NSDictionary *aps = [notificationDict objectForKey:@"aps"];
    NSDictionary *alert = [aps objectForKey:@"alert"];
    NSString *title = [alert objectForKey:@"title"];
    NSString *body = [alert objectForKey:@"body"];

    JPushXSModel *model =  [JPushXSModel mj_objectWithKeyValues:notificationDict];
    WEAK_SELF;

    if (model.title && model.content) {
        UIAlertController *arl =  [UIAlertController alertControllerWithTitle:model.title message:model.content preferredStyle:UIAlertControllerStyleAlert];
          UIAlertAction *can = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
              
          }];
          UIAlertAction *ok = [UIAlertAction actionWithTitle:@"查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
              STRONG_SELF;
              [self jumpNotWithModel:model];
           }];
          [arl addAction:can];
          [arl addAction:ok];

          [[NSObject getTopViewController]  presentViewController:arl animated:YES completion:^{
              
          }];
    }else if (houseType.length > 0 && houseid.length > 0){
        
        
        UIAlertController *arl =  [UIAlertController alertControllerWithTitle:title?title:@"房源推荐" message:body?body:@"最新房源信息不容错过" preferredStyle:UIAlertControllerStyleAlert];
          UIAlertAction *can = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
              
          }];
          UIAlertAction *ok = [UIAlertAction actionWithTitle:@"查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            XSHouseDetailsController *vc = [[XSHouseDetailsController alloc]init];
              vc.houseType = houseType.integerValue;
              vc.houseid = [NSNumber numberWithInteger:houseid.integerValue];
              vc.source =  XSBHouseInfoSource_MyPublish;
              [[NSObject getTopViewController].navigationController pushViewController:vc animated:YES];
           }];
          [arl addAction:can];
          [arl addAction:ok];

          [[NSObject getTopViewController]  presentViewController:arl animated:YES completion:^{
              
          }];
        
  
    }else if (title){
        UIAlertController *arl =  [UIAlertController alertControllerWithTitle:title message:body preferredStyle:UIAlertControllerStyleAlert];
          UIAlertAction *can = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
              
          }];
          UIAlertAction *ok = [UIAlertAction actionWithTitle:@"查看" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            XSHouselishViewController *list = [[XSHouselishViewController alloc]init];
            list.houseType = XSBHouseType_New;
            list.source = XSBHouseInfoSource_keyPush;
            list.search = YES;
            list.screening = YES;
            list.resource = XSHouseSource_0;
            list.module = YES;
            [[NSObject getTopViewController].navigationController pushViewController:list animated:YES];
           }];
          [arl addAction:can];
          [arl addAction:ok];

          [[NSObject getTopViewController]  presentViewController:arl animated:YES completion:^{
              
          }];
    }


    
    

}
/*
1, "租房发布成功","你的二手房子已经审核成功".
2,"二手房发布成功","你的二手房子已经审核成功"

3, "租房审核失败","你的租房子审核失败"
4,"二手房审核失败","你的二手房子审核失败"

 点击消息类型分别进入房子的详情中进去查看。
5,"中介认证成功","你的中介认证信息已经审核成功"
6, "中介认证失败","你的中介认证信息审核失败"
点击进去查看中介信息类型进去查看房产中介信息
*/
- (void)jumpNotWithModel:(JPushXSModel *)model{
    switch (model.pushType.intValue) {
        case 1:
        case 2:
        case 3:
        case 4:
        {
            XSHouseDetailsController *vc = [[XSHouseDetailsController alloc]init];
            vc.houseType = model.houseType.integerValue;
            vc.houseid = [NSNumber numberWithInteger:model.houseId.integerValue];
            vc.source = XSBHouseInfoSource_MyPublish;
            [[NSObject getTopViewController].navigationController pushViewController:vc animated:YES];
        }
        break;
        case 5:
        case 6:
        {
            XSResourceViewController *vc = [[XSResourceViewController alloc]init];
            [[NSObject getTopViewController].navigationController pushViewController:vc animated:YES];
        }
        break;
            
        default:
            break;
    }
}





// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options{
    return [self appJumpCallBackWithURL:url];

}


- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [self appJumpCallBackWithURL:url];
}


- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id<UIUserActivityRestoring>> * _Nullable))restorationHandler{
    
    return [WXApi handleOpenUniversalLink:userActivity delegate:[XSPaymentViewController sharedManager]];
}
- (BOOL)appJumpCallBackWithURL:(NSURL *)url{
    if ([url.scheme isEqualToString:@"wx7ef4e6f9a5d0aaf1"]){
      return  [WXApi handleOpenURL:url delegate:[XSPaymentViewController sharedManager]];
    }else if ([url.host isEqualToString:@"safepay"]){
        // 支付跳转支付宝钱包进行支付，处理支付结果
         [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
             NSString *result = [resultDic objectForKey:@"result"];
             NSString *resultStatus = [resultDic objectForKey:@"resultStatus"];

             if (result.length > 0 && resultStatus.integerValue == 9000 ) {
                 [ProgressHUD showSuccess:@"支付结果：成功！"];
                 [XSUserServer sharedInstance].userModel.vip = YES;
                 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                     [[NSNotificationCenter defaultCenter] postNotificationName:@"XSAlipaySuccess" object:nil];

                 });
             }
             NSLog(@"result = %@",resultDic);
         }];
         
         // 授权跳转支付宝钱包进行支付，处理支付结果
         [[AlipaySDK defaultService] processAuth_V2Result:url standbyCallback:^(NSDictionary *resultDic) {
             NSLog(@"result = %@",resultDic);
             // 解析 auth code
             NSString *result = resultDic[@"result"];
             NSString *authCode = nil;
             if (result.length>0) {
                 NSArray *resultArr = [result componentsSeparatedByString:@"&"];
                 for (NSString *subResult in resultArr) {
                     if (subResult.length > 10 && [subResult hasPrefix:@"auth_code="]) {
                         authCode = [subResult substringFromIndex:10];
                         break;
                     }
                 }
             }
             NSLog(@"授权结果 authCode = %@", authCode?:@"");
         }];
    }
    return YES;
}


@end

@implementation JPushXSModel



@end
