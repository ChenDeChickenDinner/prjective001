//
//  02AppDelegate.m
//  2019OC2
//
//  Created by xs on 2019/4/9.
//  Copyright © 2019 Touker. All rights reserved.
//

https://www.jianshu.com/p/2089f5f1f712

@protocol UIApplicationDelegate<NSObject> // 应用生命周期

// 应用启动完成执行
- (void)applicationDidFinishLaunching:(UIApplication *)application;

// 应用启动进程已经开始，但部分状态没有完全恢复
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(6_0);
//  告诉代理启动基本完成程序准备开始运行（加载到窗口，可以看到）
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(nullable NSDictionary *)launchOptions NS_AVAILABLE_IOS(3_0);


// 当应用程序失去焦点的时候调用
- (void)applicationWillResignActive:(UIApplication *)application;
// 当程序被推送到后台的时候调用
- (void)applicationDidEnterBackground:(UIApplication *)application NS_AVAILABLE_IOS(4_0);


// 当程序将要被推送到前台的时候调用
- (void)applicationWillEnterForeground:(UIApplication *)application NS_AVAILABLE_IOS(4_0);
// 当应用程序完全获取焦点的时候调用
- (void)applicationDidBecomeActive:(UIApplication *)application;

// 当程序将要退出是被调用，通常是用来保存数据和一些退出前的清理工作。这个需要要设置
- (void)applicationWillTerminate:(UIApplication *)application;
// 接收来自系统内存警告
- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application;





// 请求委托打开由url标示的资源
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(nullable NSString *)sourceApplication annotation:(id)annotation NS_DEPRECATED_IOS(4_2, 9_0, "Please use application:openURL:options:");

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url NS_DEPRECATED_IOS(2_0, 9_0, "Please use application:openURL:options:") __TVOS_PROHIBITED;

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey, id> *)options;






// 当状态栏的方向即将要发生改变时执行
- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration;
// 当状态栏的方向发生改变时执行
- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation;

// 当状态栏的frame即将要发生改变时执行
- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame ;   // in screen coordinates
// 当状态栏的frame发生改变时执行
- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame;
