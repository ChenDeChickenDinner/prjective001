//
//  Info.m
//  XcodeStudy
//
//  Created by xs on 2017/3/7.
//  Copyright © 2017年 Touker. All rights reserved.
//

//https://www.cnblogs.com/mukekeheart/p/8315229.html
/*


从 资源-- 到配置设置（哪些设置，怎么使用，在哪个阶段起作用 ）--产品形成流程

自定义iOS目标属性
 1.来自:当新工程创建完毕后，会自动创建一个名为<project>-Info.plist文件，该文件位于bundle目录(Supporting Files)的顶部,在工程构建时，该文件用以生成Info.plist文件，之后添加至bundle中。
 2.文件性质:Info.plist文件多数情况下是以UTF-8进行编码，并且其内部的配置内容其实是以XML格式进行组织。XML的根节点是一个词典（dictionary），包含描述bundle各个方面的keys和values。
 3.作用:文件中的keys和values描述了许多要应用于该bundle的行为以及配置选项，系统读取该文件，并获取app的配置信息，app向系统提供自己的元信息。
 4.编辑体现:其修改 直接体现在 Info.plist 中 或者 buildSettings 中 同时体现
 5.与buildSettings的关系:


Info.plist文件的keys分类
 Core Foundation Keys: 该类的keys的特点是以CF为前缀，用以代表Core Foundation，描述了一些常用的行为项
 Lanch Services Keys: 加载服务项，提供了App加载所依赖的配置，描述了app启动的方式选择。
 Cocoa Keys: Cocoa框架或Cocoa Touch框架依赖这些keys来标识更高级别的配置项目，如app的main nib文件，主要类。这些key描述影响着Cocoa和Cocoa Touch框架初始化和运行app的运行方式
 UIKit Keys: 描述IOS Apps的行为，每个IOS应用都依赖于Info.plist的keys来与IOS系统通信。Xcode提供了生成的plist文件提供了所有app所需的那些比较重要的keys。
             但app可能需要扩展默认的plist来描述更多的信息，如定制app启动后的默认旋转方向，标识app是否支持文件共享等等。
 OS X Keys :描述了Mac Apps的行为，本章不描述。


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

其它：
    添加，网络权限、定位权限、读写联系人权限等等，应用白名单的添加等都是在这里进行配置的


capabilities :功能选项，设置项目支持的功能
     1.属性设置这一块主要是一些性能设置开关选择，例如推送通知、云存储、游戏中心、后台模式等，我们选择需要的开关进行打开或者关闭。
     2.这些相应的状态都会在info.plist中进行修改。所以，同样的，我们也可以在info.plist添加一些权限或性能开关之后，在target的capabilities中也会进行相应的修改的
     3.选择一些选项后，Xcode就会生成这样一段XML，Xcode会自动生成一个entitlements文件，然后再需要的时候往里面添加条目。当构建整个应用时，这个文件也会提及给codesign作为应用所需要拥有哪些授权的参考。这些授权信息必须都在开发者中心的AppID中启用，并且包含在配置文件中。
     4.修改体现{XCBuildConfiguration/buildSettings}  +  {PBXProject/attributes/TargetAttributes/SystemCapabilities}



 Document Types 文档类型：定义了应用程序所能识别的文档类型，并且还可以定义在系统中显示的该类型文档的自定义图标。


 Exported UTIs 导出的UTI：UTI Uniform Type Identifiers同一类型标识符。

 Imported UTIs 导入的UTI：


 URL Types URL类型：用来定义URL以便让应用程序理解应用间交换的数据结构。可用于：IOS唤醒其他程序，程序间相互调用。例如：:在URLTypes中URLSchemes中组册AAPP;在B程序中，openUrl:[NSURL urlWithString:@"AAPP:"];注意":"冒号,没有冒号是不能成唤醒另一个程序的。其次如果参数中有“&”特殊字符穿，建议对参数进行base64转换。

 */

