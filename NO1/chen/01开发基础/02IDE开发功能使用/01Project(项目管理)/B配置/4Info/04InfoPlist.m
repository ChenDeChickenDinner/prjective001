//
//  Info.m
//  XcodeStudy
//
//  Created by xs on 2017/3/7.
//  Copyright © 2017年 Touker. All rights reserved.
//

//https://www.cnblogs.com/mukekeheart/p/8315229.html
/**


从 资源-- 到配置设置（哪些设置，怎么使用，在哪个阶段起作用 ）--产品形成流程







自定义iOS目标属性

 Info.plist格式的版本信息:InfoDictionary version  : CFBundleInfoDictionaryVersion = 6.0


 表A-1 控制应用的名称
 1.该bundle的可执行文件名    (:Executable file:     CFBundleExecutable = $(EXECUTABLE_NAME)
 2.文件系统中的bundle名     (:Bundle name:         CFBundleName = $(PRODUCT_NAME)
 3.app名称                (:Bundle display name: CFBundleDisplayName = @"热血传奇"

 表A-2应用标识+应用版本
 1.app IDs (:Bundle identifier：              CFBundleIdentifier = $(PRODUCT_BUNDLE_IDENTIFIER)
 2.构建版本 (:Bundle version:                  CFBundleShortVersionString = @"1.1"
 3.app版本 (:Bundle versions string, short :  CFBundleShortVersionString = @"1.1.2"


 A-3 应用图标


 A-4 控制应用初始化启动:
 1.启动图 (:Launch Screen File: UILaunchStoryboardName = LaunchScreen


 A-5  用户界面
 1.屏幕方向的支持      (:Device Orientation: UISupportedInterfaceOrientations: （数组：UIInterfaceOrientationPortraitUpsideDown..）
 2.状态栏信息         (:UIStatusBarStyle = UIStatusBarStyleLightContent/UIStatusBarStyleDefault/UIStatusBarHidden = true/UIRequiresFullScreen = false
 3.启动时加载的主界面  (:Main Interface:                UIMainStoryboardFile: Main/LaunchScreen/空

 表A-6 获取用户权限信息
 NSCalendarsUsageDescription:日历
 NSContactsUsageDescription:通讯录
 NSPhotoLibraryUsageDescription:照片
 NSRemindersUsageDescription:备忘录
 NSLocationUsageDescription:位置信息


添加，网络权限、定位权限、读写联系人权限等等，应用白名单的添加等都是在这里进行配置的


 capabilities :属性设置这一块主要是一些性能设置开关选择，例如推送通知、云存储、游戏中心、后台模式等，我们选择需要的开关进行打开或者关闭，这些相应的状态都会在info.plist中进行修改。所以，同样的，我们也可以在info.plist添加一些权限或性能开关之后，在target的capabilities中也会进行相应的修改的


 Document Types 文档类型：定义了应用程序所能识别的文档类型，并且还可以定义在系统中显示的该类型文档的自定义图标。
 Exported UTIs 导出的UTI：UTI Uniform Type Identifiers同一类型标识符。
 Imported UTIs 导入的UTI：
 URL Types URL类型：用来定义URL以便让应用程序理解应用间交换的数据结构。可用于：IOS唤醒其他程序，程序间相互调用。例如：:在URLTypes中URLSchemes中组册AAPP;在B程序中，openUrl:[NSURL urlWithString:@"AAPP:"];注意":"冒号,没有冒号是不能成唤醒另一个程序的。其次如果参数中有“&”特殊字符穿，建议对参数进行base64转换。
 
 */

