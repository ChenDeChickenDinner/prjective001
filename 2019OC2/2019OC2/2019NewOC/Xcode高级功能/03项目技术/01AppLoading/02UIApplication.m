



// 创建应用程序的主要入口
UIKIT_EXTERN int UIApplicationMain(int argc, char *argv[], NSString * __nullable principalClassName, NSString * __nullable delegateClassName);



/*
 UIApplication:核心作用是提供了iOS程序运行期间的控制和协作工作
 1.每一个程序在运行期必须有且仅有一个UIApplication（或则其子类）的一个实例
 2.负责处理到来的用户事件，并分发事件消息到应该处理该消息的目标对象（sender,  action)。
 3.管理以及控制视图，包括呈现、控制行为、当前显示视图等（window列表（UIWindow实例））
 4.该对象有一个应用程序委托对象，以处理应用程序的生命周期事件（比如程序启动和关闭）、系统事件（比如来电、记事项警告）
 */
@interface UIApplication : UIResponder


+ (UIApplication *)sharedApplication;


***********************************(可设置的信息)***********************************
//代理对象
@property(nullable, nonatomic, assign) id<UIApplicationDelegate> delegate;

// 应用角标未读消息数字，设置0的时候隐藏，在iOS 8 必须注册后才能使用： -[UIApplication registerUserNotificationSettings:]
@property(nonatomic) NSInteger applicationIconBadgeNumber;

// 是否在状态栏展示网络请求活动
@property(nonatomic,getter=isNetworkActivityIndicatorVisible) BOOL networkActivityIndicatorVisible ; // default is NO
// 是否支持摇动手势
@property(nonatomic) BOOL applicationSupportsShakeToEdit;
// 屏幕长亮
@property(nonatomic,getter=isIdleTimerDisabled)       BOOL idleTimerDisabled;     // default is NO


***********************************(只可读取的视图信息)***********************************
// app的主视图
@property(nullable, nonatomic,readonly) UIWindow *keyWindow;
// 隐藏和可见的所有window
@property(nonatomic,readonly) NSArray<__kindof UIWindow *>  *windows;
// 返回界面的布局方向
@property(nonatomic,readonly) UIUserInterfaceLayoutDirection userInterfaceLayoutDirection;

// 是否响应事件
@property(nonatomic, readonly, getter=isIgnoringInteractionEvents) BOOL ignoringInteractionEvents;

***********************************(只可读取的运行状态后台信息)***********************************
// 应用的运行状态
@property(nonatomic,readonly) UIApplicationState applicationState;

// 获取后台刷新状态
@property (nonatomic, readonly) UIBackgroundRefreshStatus backgroundRefreshStatus ;
// 后台运行剩余时间
@property(nonatomic,readonly) NSTimeInterval backgroundTimeRemaining;


***********************************(只可读取的状态栏信息)***********************************
// 状态栏是否隐藏
@property(readonly,nonatomic,getter=isStatusBarHidden) BOOL statusBarHidden ;

// 获取状态栏的风格
@property(readonly, nonatomic) UIStatusBarStyle statusBarStyle ;

// 当前状态栏的方向
@property(readonly, nonatomic) UIInterfaceOrientation statusBarOrientation ;
// 获取状态栏的frame
@property(nonatomic,readonly) CGRect statusBarFrame ;



// 开始、结束响应事件
- (void)beginIgnoringInteractionEvents;
- (void)endIgnoringInteractionEvents;


// 打开URL资源
- (BOOL)openURL:(NSURL*)url ;
// 异步打开URL资源
- (void)openURL:(NSURL*)url options:(NSDictionary<NSString *, id> *)options completionHandler:(void (^ __nullable)(BOOL success))completion ;

// 返回一个bool值， 是否从已经安装的 apps 中跳转
- (BOOL)canOpenURL:(NSURL *)url NS_AVAILABLE_IOS(3_0);

// 发送事件给app内适用的响应者
- (void)sendEvent:(UIEvent *)event;

// 发送一个含选择器的动作消息到指定的目标
- (BOOL)sendAction:(SEL)action to:(nullable id)target from:(nullable id)sender forEvent:(nullable UIEvent *)event;



// 实现代理设置屏幕支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientationsForWindow:(nullable UIWindow *)window NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;

// 后台任务管理
- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithExpirationHandler:(void(^ __nullable)(void))handler  NS_AVAILABLE_IOS(4_0) NS_REQUIRES_SUPER;
- (UIBackgroundTaskIdentifier)beginBackgroundTaskWithName:(nullable NSString *)taskName expirationHandler:(void(^ __nullable)(void))handler NS_AVAILABLE_IOS(7_0) NS_REQUIRES_SUPER;
- (void)endBackgroundTask:(UIBackgroundTaskIdentifier)identifier NS_AVAILABLE_IOS(4_0) NS_REQUIRES_SUPER;

// 设置后台拉去数据的时间
- (void)setMinimumBackgroundFetchInterval:(NSTimeInterval)minimumBackgroundFetchInterval NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;



@end













// 状态栏风格
typedef NS_ENUM(NSInteger, UIStatusBarStyle) {
    UIStatusBarStyleDefault                                     = 0, // 黑色，用于亮的背景
    UIStatusBarStyleLightContent     NS_ENUM_AVAILABLE_IOS(7_0) = 1, // 白色，用于深色背景
    
    UIStatusBarStyleBlackTranslucent NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 1,
    UIStatusBarStyleBlackOpaque      NS_ENUM_DEPRECATED_IOS(2_0, 7_0, "Use UIStatusBarStyleLightContent") = 2,
} __TVOS_PROHIBITED;

// 状态栏动画效果
typedef NS_ENUM(NSInteger, UIStatusBarAnimation) {
    UIStatusBarAnimationNone, // 无
    UIStatusBarAnimationFade NS_ENUM_AVAILABLE_IOS(3_2), // 褪去
    UIStatusBarAnimationSlide NS_ENUM_AVAILABLE_IOS(3_2), // 滑出
} __TVOS_PROHIBITED;

// 支持屏幕旋转的方向
// UIDeviceOrientation：是机器硬件的当前旋转方向，这个你只能取值，不能设置
// UIInterfaceOrientation：是你程序界面的当前旋转方向，这个可以设置
typedef NS_ENUM(NSInteger, UIInterfaceOrientation) {
    UIInterfaceOrientationUnknown            = UIDeviceOrientationUnknown, // 不支持屏幕旋转
    UIInterfaceOrientationPortrait           = UIDeviceOrientationPortrait, // 支持旋转
    UIInterfaceOrientationPortraitUpsideDown = UIDeviceOrientationPortraitUpsideDown, // 旋转180°
    UIInterfaceOrientationLandscapeLeft      = UIDeviceOrientationLandscapeRight, // 顺时针 向右旋转90°
    UIInterfaceOrientationLandscapeRight     = UIDeviceOrientationLandscapeLeft // 逆时针旋转 向左旋转90°
} __TVOS_PROHIBITED;

// 设置屏幕支持旋转的方向
typedef NS_OPTIONS(NSUInteger, UIInterfaceOrientationMask) {
    UIInterfaceOrientationMaskPortrait = (1 << UIInterfaceOrientationPortrait),
    UIInterfaceOrientationMaskLandscapeLeft = (1 << UIInterfaceOrientationLandscapeLeft), // 向左旋转90°
    UIInterfaceOrientationMaskLandscapeRight = (1 << UIInterfaceOrientationLandscapeRight), // 向右旋转90°
    UIInterfaceOrientationMaskPortraitUpsideDown = (1 << UIInterfaceOrientationPortraitUpsideDown), // 旋转180°
    UIInterfaceOrientationMaskLandscape = (UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight), // 向左右旋转即横屏
    UIInterfaceOrientationMaskAll = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight | UIInterfaceOrientationMaskPortraitUpsideDown), // 支持任意方向旋转
    UIInterfaceOrientationMaskAllButUpsideDown = (UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscapeLeft | UIInterfaceOrientationMaskLandscapeRight), // 除旋转180°所有方向
} __TVOS_PROHIBITED;

// 判断旋转是否有效
#define UIDeviceOrientationIsValidInterfaceOrientation(orientation) ((UIDeviceOrientation)(orientation) == UIDeviceOrientationPortrait || (UIDeviceOrientation)(orientation) == UIDeviceOrientationPortraitUpsideDown || (UIDeviceOrientation)(orientation) == UIDeviceOrientationLandscapeLeft || (UIDeviceOrientation)(orientation) == UIDeviceOrientationLandscapeRight)

// 屏幕是否横屏
static inline BOOL UIInterfaceOrientationIsPortrait(UIInterfaceOrientation orientation) __TVOS_PROHIBITED {
    return ((orientation) == UIInterfaceOrientationPortrait || (orientation) == UIInterfaceOrientationPortraitUpsideDown);
}

// 屏幕是否竖屏
static inline BOOL UIInterfaceOrientationIsLandscape(UIInterfaceOrientation orientation) __TVOS_PROHIBITED {
    return ((orientation) == UIInterfaceOrientationLandscapeLeft || (orientation) == UIInterfaceOrientationLandscapeRight);
}

// 注册远程通知 角标、声音、提示
typedef NS_OPTIONS(NSUInteger, UIRemoteNotificationType) {
    UIRemoteNotificationTypeNone    = 0,
    UIRemoteNotificationTypeBadge   = 1 << 0,
    UIRemoteNotificationTypeSound   = 1 << 1,
    UIRemoteNotificationTypeAlert   = 1 << 2,
    UIRemoteNotificationTypeNewsstandContentAvailability = 1 << 3,
} NS_ENUM_DEPRECATED_IOS(3_0, 8_0, "Use UserNotifications Framework's UNAuthorizationOptions for user notifications and registerForRemoteNotifications for receiving remote notifications instead.") __TVOS_PROHIBITED;

// 后台处理拉取数据结果类型
typedef NS_ENUM(NSUInteger, UIBackgroundFetchResult) {
    UIBackgroundFetchResultNewData, // 成功拉去数据
    UIBackgroundFetchResultNoData, // 没有数据
    UIBackgroundFetchResultFailed // 拉出数据失败或超时
} NS_ENUM_AVAILABLE_IOS(7_0);

// 后台刷新状态
typedef NS_ENUM(NSInteger, UIBackgroundRefreshStatus) {
    UIBackgroundRefreshStatusRestricted, // 受限制
    UIBackgroundRefreshStatusDenied, // 被拒绝
    UIBackgroundRefreshStatusAvailable // 可用
} NS_ENUM_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;

//  app 运行状态
typedef NS_ENUM(NSInteger, UIApplicationState) {
    UIApplicationStateActive, // 在前台运行
    UIApplicationStateInactive, // 待激活状态：锁屏、下拉看通知、任务管理
    UIApplicationStateBackground // 在后台运行：按下home键
} NS_ENUM_AVAILABLE_IOS(4_0);

// 任务标示
typedef NSUInteger UIBackgroundTaskIdentifier;
// 设置无效的任务
UIKIT_EXTERN const UIBackgroundTaskIdentifier UIBackgroundTaskInvalid  NS_AVAILABLE_IOS(4_0);
// 后台保持的最小时间
UIKIT_EXTERN const NSTimeInterval UIMinimumKeepAliveTimeout  NS_AVAILABLE_IOS(4_0);
// 请求的最小间隔(刷新最频繁)
UIKIT_EXTERN const NSTimeInterval UIApplicationBackgroundFetchIntervalMinimum NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
// 请求的最大间隔，阻止请求(不刷新)
UIKIT_EXTERN const NSTimeInterval UIApplicationBackgroundFetchIntervalNever NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;
