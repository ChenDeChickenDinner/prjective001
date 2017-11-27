//
//  AppDelegate.m
//  FoundationZL
//
//  Created by xs on 2017/6/5.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


/*

 【Core OS Layer】系统核心层包含大多数低级别接近硬件的功能，它所包含的框架常常被其它框架所使用
 Accelerate:架包含数字信号，线性代数，图像处理的接口。针对所有的iOS设备硬件之间的差异做优化，保证写一次代码在所有iOS设备上高效运行
 ExternalAccessory :包含与外设进行通讯的接口
 CoreBluetooth:框架利用蓝牙和外设交互，包括扫描连接蓝牙设备，保存连接状态，断开连接，获取外设的数据或者给外设传输数据等等
 Security :框架提供管理证书，公钥和私钥信任策略,加密
 keychain,hash认证数字签名等等与安全相关的解决方案
 LocalAuthentication :框架提供了按照指定的安全策略请求用户授权（本地授权）的工具。例如， 通过 Touch ID 请求用户授权。
 system:让开发人员不受限制的访问UNIX开发环境中的一些工具
 MobileCoreServices :此框架定义统一类型标识符 (UTIs)使用的底层类型。【手机核心服务】
 MultipeerConnectivity  :可用来进行近场通讯，它兼容了WiFi和蓝牙的功能，只要两台手机同时开启了WiFi或者同时开启了蓝牙，就能进行通讯及数据传输



 【Core Services Layer】系统服务层提供给应用所需要的基础的系统服务
 CoreFoundation 、/Foundation:
 Accounts    : 账户
 AddressBook :通讯录
 EventKit    :日历事件
 HealthKit   :健康数据
 AdSupport   :是广告支持框架，提供访问用户的广告标示符号，以及判断用户是否限制了广告跟踪
 CFNetwork   :包含通过WiFi或者蜂窝无线访问网络的接口
 CoreData    :包含管理应用程序数据模型的接口【核心数据】
 CloudKit    : 提供了一套API用于在dashboard中存取数据,苹果提供的后台数据存储的地方
 CoreLocation :主要用于地理定位，地理编码等【核心位置】
 CoreMotion   :是一个专门处理Motion的框架，其中包含了两个部分 加速度计和陀螺仪【核心手势】
 CoreTelephony :实现网络类型检测【核心电话】
 CoreMedia:
 HomeKit :这个框架是用来沟通和控制我们的家庭智能硬件的
 HealthKit:
 JavaScriptCore :该框架让Objective-C和JavaScript代码直接的交互变得更加的简单方便
 SafariServices :iOS9后苹果推出的SafariServices可以在应用中打开一个 Safari 页面，这个页面与 safari 共享 cookie
 WebKit :使用WKWebView来代替IOS的UIWebView和OSX的WebView，并且使用Nitro JavaScript引擎，这意味着所有第三方浏览器运行JavaScript将会跟safari一样快
 NewsstandKit  :叫做Newsstand应用，主要都是报刊杂志，在系统自带的Newsstand应用中，Newsstand应用都是一些轻的展示类杂志应用
 PassKit :在APP中提供Wallet凭证支持
 PushKit :iOS8引入PushKit framework之后，app就可以通过push随时唤醒了，不过这个新的神通暂时还只限于voip类应用
 QuickLook  :包含预览文件接口
 Social  :苹果原生框架分享框架
 StoreKit  :包含用于处理与应用程序内购买相关的财务交易。
 SystemConfiguration :包含用于处理设备网络配置的接口

 Intents /IntentsUI :Siri相关的框架
 UserNotifications/UserNotificationsUI :通知推送功能框架
 CoreSpotlight :可以让用户通过Spotlight搜索到app中的数据，并将app相关内容和系统搜索返回的结果一起展示出来
 CallKit :用于第三方VOIP通话能快速调用手机本地系统通话界面,
 ReplayKit  :屏幕录制框架
 Speech :是Siri用来做语音识别的框架
 VideoSubscriberAccount :帮助应用支持流媒体认证或认证视频点播（也被称为TV Everywhere）与他们的有线电视或卫星电视供应商认证
 GameplayKit :是一个帮助新手开发者们在OS X和iOS平台创作游戏的基础工具和技术框架，可提供游戏资源、模块、玩法设计以及系统规则方面的内容，并不包括视觉渲染等功能
 MediaAccessibility :管理媒体文件中closed-caption内容的呈现。
 AssetsLibrary : 表整个设备中的资源库（照片库），通过 AssetsLibrary 可以获取和包括设备中的照片和视频
 NetworkExtension :该框架提供了配置和控制VPN支持和wifi热点相关的接口。通过该框架，我们可以很方便的实现VPN以及wifi热点相应的功能



 【Media Layer】媒体层提供应用中视听方面的技术，如图形图像相关的
 AVFoundation :主要是用来处理音频和视频的
 AVKit : 使用它来播放视频
 CoreAudio /CoreVideo:提供跨核心音频视频以及底层服务接口的数据类型
 CoreAudioKit :这个框架让跨应用的音频变的容易
 CoreGraphics :UIKit下的主要绘图系统，用于绘制自定义视图
 CoreImage : 对图片进行各种滤镜处理
 CoreText :是用于处理文字和字体的底层技术。它直接和Core Graphics(又被称为Quartz)打交道
 QuartzCore :核心动画框架
 ImageIO :包含读取或写入图像数据的类
 OpenGLES  :包含OpenGL ES接口。OpenGL ES框架是OpenGL跨平台2D和3D渲染库的跨平台版本
 OpenAL :包含OpenAL接口。OpenAL是一个跨平台的方位音频库
 Metal / MetalKit:提供了一组工具类和函数，目的在于节省开发Metal应用的时间,让Metal开发变得更加简单GPU
 Photos /PhotosUI: OS8及以后苹果将操作相册的ALAssetsLibrary framework替换为Photos framework，在iOS9中废弃了原ALAssetsLibrary框架。
 SceneKit  :SceneKit类似于Unity是一个制作3D物件的框架，很多3D游戏都可以基于这个框架进行开发
 SpriteKit :iOS游戏开发框架
 GLKit :是一组Objective-C 类，为使用OpenGL ES 提供一个面向对象接口，用来简化OpenGL ES应用的开发
 AudioUnit :音频单元框架,允许应用程序使用音频插件,包括音频单元和编解码器
 CoreMIDI :音频接口框架 IOKit  :包含设备所使用的接口


 【Cocoa Touch Layer】触摸层提供应用基础的关键技术支持和应用的外观
 MessageUI :【信息】
 AddressBookUI:【通讯录】
 EventKitUI:【日历】
 HealthKitUI : 【健身】
 iAd :广告
 GameKit  :游戏
 MapKit   :地图
 NotificationCenter :通知
 UIKit  :包含iOS应用程序用户界面层使用的类和方法
 
 
 
 
 */

@end
