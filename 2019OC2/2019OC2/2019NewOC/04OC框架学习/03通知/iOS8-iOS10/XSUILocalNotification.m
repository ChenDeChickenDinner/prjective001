
@class CLRegion;


@interface UILocalNotification : NSObject<NSCopying, NSCoding>

- (instancetype)init;

//激发的确切时间
@property(nullable, nonatomic,copy) NSDate *fireDate;
//激发时间是否根据时区改变而改变如果设置为nil的话，那么UILocalNotification将在一段时候后被激发，而不是某一个确切时间被激发
@property(nullable, nonatomic,copy) NSTimeZone *timeZone;


//repeatInterval是UILocalNotification被重复激发之间的时间差
@property(nonatomic) NSCalendarUnit repeatInterval;
//repeatCalendar是UILocalNotification重复激发所使用的日历单位需要参考的日历，如果不设置的话，系统默认的日历将被作为参考日历
@property(nullable, nonatomic,copy) NSCalendar *repeatCalendar;


@property(nullable, nonatomic,copy) CLRegion *region;


@property(nonatomic,assign) BOOL regionTriggersOnce;

// alerts 当应用不在运行时，由系统处理
//是否在提醒框中显示动作按钮的布尔值，默认值为YES
@property(nonatomic) BOOL hasAction;
@property(nullable, nonatomic,copy) NSString *alertTitle;
//是一串现实提醒内容的字符串（NSString），如果alertBody未设置的话，Notification被激发时将不现实提醒
@property(nullable, nonatomic,copy) NSString *alertBody;
//alertAction的内容将作为提醒中动作按钮上的文字，如果未设置的话，提醒信息中的动作按钮将显示为“View”相对文字形式
@property(nullable, nonatomic,copy) NSString *alertAction;
//是在用户点击提醒框中动作按钮（“View”）时，等待应用加载时显示的图片，这个将替代应用原本设置的加载图片
@property(nullable, nonatomic,copy) NSString *alertLaunchImage;



// 播放的声音 UILocalNotificationDefaultSoundName来使用系统默认提醒声音
@property(nullable, nonatomic,copy) NSString *soundName;
// app角标
@property(nonatomic) NSInteger applicationIconBadgeNumber;
// 附带的参数信息
@property(nullable, nonatomic,copy) NSDictionary *userInfo;
@property (nullable, nonatomic, copy) NSString *category ;

@end

