/**
target(Build Setting)

()

Apple LLVM 9.0 Preprocessing(预处理)



Architectures（硬件平台SKD）
1:Valid Architectures(限制可能被支持的指令集的范围)
2:Architectures (指明选定Target要求被编译生成的二进制包所支持的指令集，)
3.Build Active Architecture Only(指明是否只编译当前连接设备所支持的指令集)

4.:Supported Platforms(运行的平台)

5:Base SDK  （当前编译用的SDK版本）
6:Additional SDKs (在编译的时候需要附加的SDK)


Build Options  -- 编译选项

0:excluded source file names ?
0:included source file name  ?

1:Compiler for C/C++/Objective-C (选择使用的编译器)

2:Scan All Source Files for Include(是否扫描include文件所包含的所有源文件)
2:Precompiled Header Uses Files From Build Directory(是否预编译build路径中的头文件)
2: Validate Built Product(是否在编译的时候进行验证)

3:Debug Information Format(决定记录debug信息的文件格式)
3.Build Variants(产生二进制文件的类型，普通的/配置信息/debug型)
3:Enable Bitcode(是否产生中间代码形式)
3:Generate Profiling Code(激活这个设置会导致编译器和链接器生成分析代码)

>Build Locations(编译产生的文件路径)
 1:Build Products Path :产品文件和编译中间文件的根目录
 1:Intermediate Build Files Pat:编译时临时文件的存放位置
 2:Per-configuration Build Product Path:当前编译设置下的产品存放位置
 2:Per-configuration Intermediate File Path:当前编译设置下编译时临时文件的存放位置
 3:Precompiled Headers Cache Path :存放预编译头文件的位置




Linking(链接)




Packaging(包)
 Info.plist File:  使用的Info.plist文件(INFOPLIST_FILE = 123/Info.plist)
 bundle identifier:Bundle 唯一标识符(PRODUCT_BUNDLE_IDENTIFIER = @"123.com")
 Product Name: 文件系统中的bundle名（PRODUCT_NAME = "$(TARGET_NAME)"）


 
Signing(签名)

 (1)Development Team:  开发者所在的群组
 DEVELOPMENT_TEAM = QG479838Q3;

 (2)Code Signing Style:管理签名方式
 CODE_SIGN_STYLE = Automatic/Manual

 (3)Code Signing Identity:配置证书
（General中设置）       Signing Certificate:   CODE_SIGN_IDENTITY = "iPhone Distribution"/ "iPhone Developer"/..
（Build Setting中设置） Code Signing Identity: CODE_SIGN_IDENTITY = "iPhone Distribution"/ "iPhone Developer"/..

 (4)Code Signing Entitlements (capabilities 功能授权)
 CODE_SIGN_ENTITLEMENTS = xxxxx


 (5)：Provisioning profile + Provisioning profile (Deprecated) 配置描述文件 自动

 Deployment(部署)

 Deployment Target:支持的最低部署版本（IPHONEOS_DEPLOYMENT_TARGET = 11.1）


Other
 Devices:(支持运行设备)
 （General中设置） Devices:TARGETED_DEVICE_FAMILY = 1/2

App Icons Images(APP 图标 资源)
 ASSETCATALOG_COMPILER_APPICON_NAME = AppIcon;

Launch Image Screen(APP 启动图 资源)
ASSETCATALOG_COMPILER_LAUNCHIMAGE_NAME = LaunchImage;





info文件中

InfoDictionary version （ Info.plist格式的版本信息）
 （info.plist中设置）   InfoDictionary version  : CFBundleInfoDictionaryVersion = 6.0

  表A-1 控制应用的名称
 Executable name:(该bundle的可执行文件名)
 （info.plist中设置）   Executable file  : CFBundleExecutable = $(EXECUTABLE_NAME)

 Bundle name:(文件系统中的bundle名)
 （info.plist中设置）   Bundle name  : CFBundleName = $(PRODUCT_NAME)


 Display name（app名称）
 （General中设置）      Display name：       CFBundleDisplayName = @"热血传奇"
 （info.plist中设置）   Bundle display name :CFBundleDisplayName = @"热血传奇"


表A-2应用标识+应用版本
 Bundle identifier（app IDs）
 （info.plist中设置）   Bundle identifier：CFBundleIdentifier = $(PRODUCT_BUNDLE_IDENTIFIER)


 Build versions(构建版本)
 （General中设置）      Build:         CFBundleShortVersionString = @"1.1"
 （info.plist中设置）   Bundle version:CFBundleShortVersionString = @"1.1"


 Version（app版本）
 （General中设置）                             Version: CFBundleShortVersionString = @"1.1.2"
 （info.plist中设置）   Bundle versions string, short : CFBundleShortVersionString = @"1.1.2"







表A-3 获取用户权限信息
NSCalendarsUsageDescription:日历
NSContactsUsageDescription:通讯录
NSPhotoLibraryUsageDescription:照片
NSRemindersUsageDescription:备忘录
NSLocationUsageDescription:位置信息


 A-4 应用图标


 A-5 控制应用初始化启动:
 Launch Screen File:(启动图)
 (General中设置)Launch Screen File: UILaunchStoryboardName = LaunchScreen
 （info.plist中设置）Launch screen interface file base name:UILaunchStoryboardName = LaunchScreen
 iOS启动图有两种设置方式，分别为 Launch Images Source 和 Launch Screen File，
 新建项目时 Xcode 会自动创建 LaunchScreen.storyboard 且默认使用 Launch Screen File 的方式展示启动图。



A-6  用户界面

 Device Orientation（屏幕方向的支持)
 （General中设置）  Device Orientation: UISupportedInterfaceOrientations: （数组：UIInterfaceOrientationPortraitUpsideDown..）

 Status Bar Style:(状态栏信息)
 UIStatusBarStyle = UIStatusBarStyleLightContent/UIStatusBarStyleDefault
 UIStatusBarHidden = true
 UIRequiresFullScreen = false


Main Interface(启动时加载的主界面)
 （General中设置） Main Interface:                UIMainStoryboardFile: Main/LaunchScreen/空
 info.plist中设置）Main storyboard file base name:UIMainStoryboardFile: Main/LaunchScreen/空


其它 应用控制、本地化、自定义URL和文档类型:、使用iCloud:、启动服务字段:、



 (二)Capabilities  ----功能选项，设置项目支持的功能
在Xcode的capabilities选项卡下选择一些选项后，Xcode就会生成这样一段XML，Xcode会自动生成一个entitlements文件，然后再需要的时候往里面添加条目。当构建整个应用时，这个文件也会提及给codesign作为应用所需要拥有哪些授权的参考。这些授权信息必须都在开发者中心的AppID中启用，并且包含在配置文件中。

 
 (三)Resource Tags ----该功能是将资源放到appstore














 */
