//
//  HBPushService.h
//  BeeHive
//
//  Created by Walker on 2019/4/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//@protocol HBPushService <BHServiceProtocol>
@protocol HBPushService <NSObject>
-(void)configPushService:(NSDictionary*)launchOptions appKey:(NSString *)appKey channel:(NSString *)channel apsForProduction:(BOOL)isProduction;
-(void)registerDeviceToken:(NSData *)deviceToken;
-(void)didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(nullable void (^)(UIBackgroundFetchResult))completionHandler;
- (void)networkDidReceiveMessage:(NSNotification *)notification;
//因为BeeHive底层对UNUserNotificationCenterDelegate进行了覆盖，所以此处进行代理中转
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler __IOS_AVAILABLE(10.0);
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler __IOS_AVAILABLE(10.0);
//- (void)userNotificationCenter:(UNUserNotificationCenter *)center openSettingsForNotification:(nullable UNNotification *)notification __IOS_AVAILABLE(12.0) __OSX_AVAILABLE(10.14) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;

@end

NS_ASSUME_NONNULL_END
