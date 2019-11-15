//
//  XSNotification.m
//  2019OC2
//
//  Created by xs on 2019/4/17.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "XSNotification.h"

@implementation XSNotification


/**
 本地推送
 */
- (void)localNotification{
    
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"alertBody";
    notification.applicationIconBadgeNumber = 1;
    notification.userInfo = @{@"key":@"velue"};
    
    
    UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    
    //     注册通知:1.会跟用户申请权限 2.多次注册会覆盖之前的注册
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    UIUserNotificationSettings *currentSetting = [UIApplication sharedApplication].currentUserNotificationSettings;
    
    //    1.立即执行一个通知对象
    [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
    //    1.注册一个通知对象
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    //    1.取消一个通知对象
    
    [[UIApplication sharedApplication] cancelLocalNotification:notification];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    //    1.获取当前注册的所有通知对象
    
    NSArray *array = [[UIApplication sharedApplication] scheduledLocalNotifications];
   
}

- (void)remoteNotification{
    //0.配置安装推送证书
    /*
     
     */
    //1.将APPID 配置上远程推送服务
    
    //2.将程序info.plist配置上远程推送服务
    
    // 1.    注册通知设置:会跟用户申请权限 ;多次注册会覆盖之前的注册
    UIUserNotificationType type =  UIUserNotificationTypeAlert | UIUserNotificationTypeBadge | UIUserNotificationTypeSound;
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    
    
    //2. 注册远程通知
    [[UIApplication sharedApplication] registerForRemoteNotifications];

}
// 远程通知注册成功回调方法，其中deviceToken即为APNs返回的token
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    NSLog(@"deviceToken = %@",deviceToken);
    
    // 1.收到此deviceToken 后将其发送给后台服务器
    
}
// 远程通知注册失败回调方法，处理失败情况
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
    NSLog(@"deviceTokenError = %@",error);
    
}








//0.当APP从终止状态启动时候,被杀死后点击了通知在此可以检测通知
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //launchOptions:一般通过其他方式启动APP,会把一些参数传递到这个字典中
    //  userInfo为收到远程通知的内容
//    1.本地通知
    NSDictionary *LocalUserInfo = launchOptions[UIApplicationLaunchOptionsLocalNotificationKey];
//    2.远程通知
    NSDictionary *RemoteuUserInfo = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];

    
    if (LocalUserInfo) {
        // 有本地推送的消息，说明是用户点击通知启动的app，处理推送的消息
    }
    if (RemoteuUserInfo) {
        // 有远程推送的消息，说明是用户点击通知启动的app，处理推送的消息
    }
    
    
    
    return YES;
}

//1.当app在前台，在后台，在锁屏状态下 接受到或者点击了《本地通知》--->会在此被监听到
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    // 这里真实需要处理交互的地方
    // 获取通知所带的数据
    NSString *notMess = [notification.userInfo objectForKey:@"key"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"本地通知(前台)"
                                                    message:notMess
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    
 
    if (application.applicationState == UIApplicationStateActive) {
        // 在前台
    }else if(application.applicationState == UIApplicationStateInactive){
        // 待激活 ，在app运行时候 查看通知，查看后台，锁屏
    }
    
    
}


//1.当app在前台，在后台，在锁屏状态下 接受到或者点击了《远程通知》--->会在此被监听到
//2.如果是iOS8.0以上的系统，不会运行该方法
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    NSLog(@"%s",__func__);
    if (application.applicationState == UIApplicationStateActive) {
        // 在前台
    }else if(application.applicationState == UIApplicationStateInactive){
        // 待激活 ，在app运行时候 查看通知，查看后台，锁屏
    }

}
//1.会覆盖上面的方法
//2.在任何状态下接受到通知都会来到这里
//3.具有completionHandler功能 未点击也能自动处理代码
  //1.打开后台运行模式 2.在userInfo 额外添加"content-available":1 键值对 3.最后completionHandler(UIBackgroundFetchResultNewData);告诉系统
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler{
    NSLog(@"%s",__func__);
    if (application.applicationState == UIApplicationStateActive) {
        // 在前台
    }else if(application.applicationState == UIApplicationStateInactive){
        // 待激活 ，在app运行时候 查看通知，查看后台，锁屏
    }else if(application.applicationState == UIApplicationStateBackground){
        // 在后台
    }
    // 此步一定得在业务代码之后
    completionHandler(UIBackgroundFetchResultNewData);
}
//NS_AVAILABLE_IOS(8_0, 10_0);
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo completionHandler:(void(^)())completionHandler {
    //处理完消息，最后一定要调用这个代码块
    completionHandler();
}
// 下面这个方法是 9.0新加的，如果要是适配8.0，只需要用上面的方法就可以了，参数 responseInfo 可以通过 notification.userInfo 取到。
//NS_AVAILABLE_IOS(9_0, 10_0);
- (void)application:(UIApplication *)application handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(NSDictionary *)userInfo withResponseInfo:(NSDictionary *)responseInfo completionHandler:(void(^)())completionHandler {
     completionHandler();
}

@end
