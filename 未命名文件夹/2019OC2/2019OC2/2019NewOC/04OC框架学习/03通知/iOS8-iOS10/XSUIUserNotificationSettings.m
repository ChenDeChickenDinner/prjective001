

//通知样式
typedef NS_OPTIONS(NSUInteger, UIUserNotificationType) {
    UIUserNotificationTypeNone    = 0,      //
    UIUserNotificationTypeBadge   = 1 << 0, //
    UIUserNotificationTypeSound   = 1 << 1, //
    UIUserNotificationTypeAlert   = 1 << 2, //
} NS_ENUM_DEPRECATED_IOS(8_0, 10_0) ;



typedef NS_ENUM(NSUInteger, UIUserNotificationActivationMode) {
    UIUserNotificationActivationModeForeground, //
    UIUserNotificationActivationModeBackground  //
} NS_ENUM_DEPRECATED_IOS(8_0, 10_0,) ;

typedef NS_ENUM(NSUInteger, UIUserNotificationActionContext) {
    UIUserNotificationActionContextDefault,  // t
    UIUserNotificationActionContextMinimal   //
} NS_ENUM_DEPRECATED_IOS(8_0, 10_0;





@interface UIUserNotificationSettings : NSObject

+ (instancetype)settingsForTypes:(UIUserNotificationType)types
                      categories:(nullable NSSet<UIUserNotificationCategory *> *)categories;
                         
// 通知支持的展示类型
@property (nonatomic, readonly) UIUserNotificationType types;
// 通知携带的交互信息 动作, 一般是使用其可变实例 UIMutableUserNotificationCategory来添加多个行为
@property (nullable, nonatomic, copy, readonly) NSSet<UIUserNotificationCategory *> *categories;

@end




// 通知携带动作的Category
@interface UIUserNotificationCategory : NSObject <NSCopying, NSMutableCopying, NSSecureCoding>

- (instancetype)init  ;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder  ;

@property (nullable, nonatomic, copy, readonly) NSString *identifier ;

- (nullable NSArray<UIUserNotificationAction *> *)actionsForContext:(UIUserNotificationActionContext)context ;

@end



@interface UIMutableUserNotificationCategory : UIUserNotificationCategory

@property (nullable, nonatomic, copy) NSString *identifier;


- (void)setActions:(nullable NSArray<UIUserNotificationAction *> *)actions forContext:(UIUserNotificationActionContext)context;

@end



// 通知携带的行为
@interface UIUserNotificationAction : NSObject <NSCopying, NSMutableCopying, NSSecureCoding>

- (instancetype)init  ;
- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder ;

@property (nullable, nonatomic, copy, readonly) NSString *identifier ;

@property (nullable, nonatomic, copy, readonly) NSString *title ;

@property (nonatomic, assign, readonly) UIUserNotificationActionBehavior behavior  ;


@property (nonatomic, copy, readonly) NSDictionary *parameters ;

@property (nonatomic, assign, readonly) UIUserNotificationActivationMode activationMode ;


@property (nonatomic, assign, readonly, getter=isAuthenticationRequired) BOOL authenticationRequired ;


@property (nonatomic, assign, readonly, getter=isDestructive) BOOL destructive ;

@end





@interface UIMutableUserNotificationAction : UIUserNotificationAction


@property (nullable, nonatomic, copy) NSString *identifier;

@property (nullable, nonatomic, copy) NSString *title;

@property (nonatomic, assign) UIUserNotificationActionBehavior behavior ;

@property (nonatomic, copy) NSDictionary *parameters ;

@property (nonatomic, assign) UIUserNotificationActivationMode activationMode;


@property (nonatomic, assign, getter=isAuthenticationRequired) BOOL authenticationRequired;

@property (nonatomic, assign, getter=isDestructive) BOOL destructive;

@end

