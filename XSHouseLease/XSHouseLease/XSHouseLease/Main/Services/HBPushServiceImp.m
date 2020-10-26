//
//  HBPushServiceImp.m
//  BeeHive
//
//  Created by Walker on 2019/4/22.
//

#import "HBPushServiceImp.h"
#import <JPush/JPUSHService.h>
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
#import <UserNotifications/UserNotifications.h>
#endif

//需拆分解耦的类文件

@interface HBPushServiceImp()<JPUSHRegisterDelegate>

@end

@implementation HBPushServiceImp

//+ (BOOL)singleton;{
//    return YES;
//}

DEF_SINGLETON(HBPushServiceImp)

-(void)configPushService:(NSDictionary*)launchOptions appKey:(NSString *)appKey channel:(NSString *)channel apsForProduction:(BOOL)isProduction;{
    [JPUSHService setLogOFF];
    //Required
    //notice: 3.0.0及以后版本注册可以这样写，也可以继续用之前的注册方式
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义categories
        // NSSet<UNNotificationCategory *> *categories for iOS10 or later
        // NSSet<UIUserNotificationCategory *> *categories for iOS8 and iOS9
    }
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    // Optional
    // 获取IDFA
    // 如需使用IDFA功能请添加此代码并在初始化方法的advertisingIdentifier参数中填写对应值
    //    NSString *advertisingId = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    
    // Required
    // init Push
    // notice: 2.1.5版本的SDK新增的注册方法，改成可上报IDFA，如果没有使用IDFA直接传nil
    // 如需继续使用pushConfig.plist文件声明appKey等配置内容，请依旧使用[JPUSHService setupWithOption:launchOptions]方式初始化。
    [JPUSHService setupWithOption:launchOptions appKey:appKey
                          channel:channel
                 apsForProduction:isProduction
            advertisingIdentifier:nil];
}

-(void)registerDeviceToken:(NSData *)deviceToken;{
    [JPUSHService registerDeviceToken:deviceToken];
}

-(void)didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;{
    __weak typeof(self)weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf handleRemoteNotification:userInfo];
    });
    if (completionHandler) {
        completionHandler(UIBackgroundFetchResultNewData);
    }
}

/**
 处理app在前台运行时到达的通知，这时通知并未提示，当处理完成后执行completionHandler来确定通知样式
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler __IOS_AVAILABLE(10.0);{
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        dispatch_async(dispatch_get_main_queue(), ^{
//            [JPUSHService handleRemoteNotification:userInfo];
            //调用消息个数
            NSLog(@"notification--TabBar%@",userInfo);
//            [HBMessageServer messageCount];
        });
    }
//    completionHandler(UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionSound|UNNotificationPresentationOptionAlert);
}
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger options))completionHandler;{
    [self userNotificationCenter:center willPresentNotification:notification withCompletionHandler:^(UNNotificationPresentationOptions options) {
        completionHandler((NSInteger)options);
    }];
}

/**
 本地、远程推送，点击通知进入app或者点击通知上的自定义action时触发，会唤醒app进行事件处理
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler __IOS_AVAILABLE(10.0);{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        __weak typeof(self)weakSelf = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf handleRemoteNotification:userInfo];
        });
    }
    completionHandler();  // 系统要求执行这个方法
}
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler;{
    [self userNotificationCenter:center didReceiveNotificationResponse:response withCompletionHandler:completionHandler];
}

/**
 iOS12 通知管理->关闭 / 通知设置 页面会出现：在“Notication”中配置...选项，点击进入应用。主要是进入应用自身的通知设置页面
 该方法调用需要在授权的时候增加这个选项 UNAuthorizationOptionProvidesAppNotificationSettings
 */
- (void)userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(nullable UNNotification *)notification __IOS_AVAILABLE(12.0) __OSX_AVAILABLE(10.14) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;{
    
}
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(nullable UNNotification *)notification NS_AVAILABLE_IOS(12.0);{
    [self userNotificationCenter:center openSettingsForNotification:notification];
}

#pragma mark - custom methods
/**
 处理收到的远程通知
 */
- (void)handleRemoteNotification:(nullable NSDictionary *)userInfo {
    [JPUSHService handleRemoteNotification:userInfo];
//    [[HBPushMessageManager sharedInstance] dealWithPushNotification:userInfo];
}

/**
 收到极光非APNs通知
 */
- (void)networkDidReceiveMessage:(NSNotification *)notification {
    
    dispatch_async(dispatch_get_main_queue(), ^{

//        [HBMessageServer messageCount];
//        [[HBPushMessageManager sharedInstance] addNewAlertPushMessageNotification:notification];
    });
    
}


@end
