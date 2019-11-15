//
//  Notifications.m
//  2019OC2
//
//  Created by xs on 2019/4/9.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "Notifications.h"

// 远程通知
@interface UIApplication (UIRemoteNotifications)

// 通过苹果推送通知注册接收远程通知服务
- (void)registerForRemoteNotifications NS_AVAILABLE_IOS(8_0);
// 注销远程通知服务
- (void)unregisterForRemoteNotifications NS_AVAILABLE_IOS(3_0);

// 应用是否注册了远程通知服务
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly, getter=isRegisteredForRemoteNotifications) BOOL registeredForRemoteNotifications NS_AVAILABLE_IOS(8_0);
#else
- (BOOL)isRegisteredForRemoteNotifications NS_AVAILABLE_IOS(8_0);
#endif
// 通过注册苹果的远程推送通知，接收指定类型的服务
- (void)registerForRemoteNotificationTypes:(UIRemoteNotificationType)types NS_DEPRECATED_IOS(3_0, 8_0, "Use -[UIApplication registerForRemoteNotifications] and UserNotifications Framework's -[UNUserNotificationCenter requestAuthorizationWithOptions:completionHandler:]") __TVOS_PROHIBITED;

// 返回应用通知的接收类型
- (UIRemoteNotificationType)enabledRemoteNotificationTypes NS_DEPRECATED_IOS(3_0, 8_0, "Use -[UIApplication isRegisteredForRemoteNotifications] and UserNotifications Framework's -[UNUserNotificationCenter getNotificationSettingsWithCompletionHandler:] to retrieve user-enabled remote notification and user notification settings") __TVOS_PROHIBITED;

@end

// 本地通知
@interface UIApplication (UILocalNotifications)

// 立即呈现本地通知
- (void)presentLocalNotificationNow:(UILocalNotification *)notification NS_DEPRECATED_IOS(4_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]") __TVOS_PROHIBITED;
// 本地安排通知
- (void)scheduleLocalNotification:(UILocalNotification *)notification NS_DEPRECATED_IOS(4_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:]") __TVOS_PROHIBITED;  // copies notification
// 取消指定的本地通吃
- (void)cancelLocalNotification:(UILocalNotification *)notification NS_DEPRECATED_IOS(4_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenter removePendingNotificationRequestsWithIdentifiers:]") __TVOS_PROHIBITED;
// 取消所有的本地通知
- (void)cancelAllLocalNotifications NS_DEPRECATED_IOS(4_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenter removeAllPendingNotificationRequests]") __TVOS_PROHIBITED;
// 返回本地日程安排通知数组
@property(nullable,nonatomic,copy) NSArray<UILocalNotification *> *scheduledLocalNotifications NS_DEPRECATED_IOS(4_0, 10_0, "Use UserNotifications Framework's -[UNUserNotificationCenter getPendingNotificationRequestsWithCompletionHandler:]") __TVOS_PROHIBITED;

@end

// 设置通知
@class UIUserNotificationSettings;
@interface UIApplication (UIUserNotificationSettings)

// 注册通知
- (void)registerUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;

// 返回当前用户启用的通知
#if UIKIT_DEFINE_AS_PROPERTIES
@property(nonatomic, readonly, nullable) UIUserNotificationSettings *currentUserNotificationSettings NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;
#else
- (nullable UIUserNotificationSettings *)currentUserNotificationSettings NS_AVAILABLE_IOS(8_0) __TVOS_PROHIBITED;
#endif

@end
