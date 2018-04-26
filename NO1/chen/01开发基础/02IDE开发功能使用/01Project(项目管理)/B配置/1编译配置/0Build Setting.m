/*
target(Build Setting)



Architectures -->《硬件平台SKD》
     1:Valid Architectures               (:限制可能被支持的指令集的范围
     2:Architectures                     (:指明选定Target要求被编译生成的二进制包所支持的指令集
     3:Build Active Architecture Only    (:指明是否只编译当前连接设备所支持的指令集
     4:Supported Platforms               (:运行的平台)
     5:Base SDK                          (:当前编译用的SDK版本
     6:Additional SDKs                   (:在编译的时候需要附加的SDK


Asset---->《资源》
 1.Asset Pack Manifest URL Prefix( 资源包清单的下载路径URL前缀)
 2.Embed Asset Packs In Product Bundle( 是否将资源包嵌入产品的bundle中)
 3.Enable On Demand Resources( 是否开启按需获取资源功能)
 4.On Demand Resources Initial Install Tags( 按需加载资源时的初始安装资源文件标签)
 5.On Demand Resources Prefetch Order( 按需加载资源时预加载的标签顺序)



Asset Catalog Compiler-Options-->《资产目录编译选项》
     Asset Catalog App Icon Set Name:App 图标
     Asset Catalog Launch Image Set Name: App 启动图



Build Locations --> 《编译文件路径》
     1:Build Products Path                     (:产品文件和编译中间文件的根目录
     1:Intermediate Build Files Pat            (:编译时临时文件的存放位置
     2:Per-configuration Build Product Path    (:当前编译设置下的产品存放位置
     2:Per-configuration Intermediate File Path(:当前编译设置下编译时临时文件的存放位置
     3:Precompiled Headers Cache Path          (:存放预编译头文件的位置

Build Options  --> 《编译选项》
     1:Compiler for C/C++/Objective-C                    (:选择使用的编译器)
     2:Scan All Source Files for Include                 (:是否扫描include文件所包含的所有源文件)
     2:Precompiled Header Uses Files From Build Directory(:是否预编译build路径中的头文件)
     2:Validate Built Product                            (:是否在编译的时候进行验证)

     3:Debug Information Format                          (:决定记录debug信息的文件格式)
     3.Build Variants                                    (:产生二进制文件的类型，普通的/配置信息/debug型)
     3:Enable Bitcode                                    (:是否产生中间代码形式)
     3:Generate Profiling Code                           (:激活这个设置会导致编译器和链接器生成分析代码)


Deployment -->《部署信息》
     1.Deployment Target:       (:支持的最低部署版本（IPHONEOS_DEPLOYMENT_TARGET = 11.1）
     2.Deployment Postprocessing:


     3.Strip Linked Product：受到Deployment Postprocessing设置选项的影响，其开启才有效
     设为YES的时候，app的构建过程多了这样两步，在app构建的开始，会生成一些.hmap辅助文件，在app构建的末尾，会执行Strip操作
     当Strip Linked Product设为YES的时候，运行app，断点不会中断，在程序中打印[NSThread callStackSymbols]也无法看到类名和方法名


     4.Strip Style：选择不同的Strip Style时，app构建末尾的Strip操作会被带上对应的参数 如果选择debugging symbols的话，函数调用栈中，类名和方法名还是可以看到的。

     5.Strip Debug Symbols During Copy:


Linking -->《链接》
    Other Linker Flags   (:例如fobjc-arc(可在Build Rules中针对单个文件配置ARC开关）、-force_load。
    Dead Code Stripping  (:一般对Debug关闭，对Release版本开启以去除无效路径僵尸代码，压缩安装包体积。
    Display Mangled Names(:针对C++ symbols，ld --no-demangle链接开关，一般选择NO。
    Mach－O type         (:Static Library、Dynamic Library、Executable、Bundle、Relocatable Object File（Position-Dependent ）。


Packaging -->《包》
     Expand Build Setting in Info.plist File(:告诉编译器是否处理info.plist。默认是YES。
     Info.plist File                        (:使用的Info.plist文件(INFOPLIST_FILE            = 123/Info.plist)
     bundle identifier                      (:Bundle 唯一标识符   (PRODUCT_BUNDLE_IDENTIFIER = @"123.com")
     Product Name                           (:文件系统中的bundle名（PRODUCT_NAME              = "$(TARGET_NAME)"）
     Wrapper Extension          (:打包的扩展名，默认app。
     Public Headers Folder Path (:公共头文件路径
     Private Headers Folder Path(:私有头文件的存放位置。
     Defines Module             (:是否定义模块。默认app类的工程为NO，framwork工程默认为YES。
     Product Module Name        (:产品模块名称

Search Paths -->《搜索路径》
     1.always search user paths      (:是否搜索用户指定的路径，默认是NO；
     2.System Framework Search Paths (:管理导入的*.framework的路径
     2.System Library Search Paths   (:管理导入的*.a的路径

     3.Framework Search Paths        (:管理导入的*.framework的路径
     3.Library Search Paths          (:管理导入的*.a的路径

     4.Header Search Paths           (:管理导入的头文件的路径
     4.user header search paths:

Signing-->《签名》
     (1)Development Team          (:开发者所在的群组 DEVELOPMENT_TEAM = QG479838Q3;
     (2)Code Signing Style        (:管理签名方式 CODE_SIGN_STYLE = Automatic/Manual
     (3)Code Signing Identity     (:配置证书 Signing Certificate: CODE_SIGN_IDENTITY = "iPhone Distribution"/ "iPhone Developer"/..
     (4)Code Signing Entitlements (:capabilities 工程中的功能实体文件CODE_SIGN_ENTITLEMENTS = xxxxx
     (5)：Provisioning profile + Provisioning profile (Deprecated)(: 配置描述文件 自动


Apple LLVM -Language   -->《语言》
    1.Prefix Header             (:预编头文件
    2.Precompile Prefix Header  (:是否预编译头文件
    3.Public Headers Folder Path(:对外公开头文件路径


Apple LLVM -Preprocessing -->《预编译》
    1.Preprocessor Macros(定义全局宏)

Apple LLVM -Code Generation-->《》
    1.Generate Debug Symbols (:是否在编译阶段增加 -g和-gmodules两项参数
    2.Debug Information Level(:文件编译时候 参数配置


Apple LLVM -Warnings-->《警告》

User-Defined-->《自定义变量》

Headers-->《头部》
 1:Run unifdef on product headers
 2:Unifdef Flags for product header

Versioning-->《数据库版本》


 
Other
 Devices:(支持运行设备)
 （General中设置） Devices:TARGETED_DEVICE_FAMILY = 1/2




info文件中

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



 (二)Capabilities  ----功能选项，设置项目支持的功能
在Xcode的capabilities选项卡下选择一些选项后，Xcode就会生成这样一段XML，Xcode会自动生成一个entitlements文件，然后再需要的时候往里面添加条目。当构建整个应用时，这个文件也会提及给codesign作为应用所需要拥有哪些授权的参考。这些授权信息必须都在开发者中心的AppID中启用，并且包含在配置文件中。

 
 (三)Resource Tags ----该功能是将资源放到appstore





























 



 变量:有哪些变量 干什么 的 怎么来的
 文件:文件 所在位置，之间的引用关系 ，怎么设置引用

 Debug 与Release 多编译环境下 一般哪些会不同设置

 9.workspace多工程联编设置
 10.为静态库添加依赖的shell脚本


 $(TARGET_NAME)目标工程名称
 $(SRCROOT)工程文件（比如Nuno.xcodeproj）的路径
 $(CURRENT_PROJECT_VERSION)当前工程版本号

 当编译静态库，设备选模拟器(iPhone 5.0 Simulator)，未设置任何Build Settings参数时，默认的基础路径：
 /Users/xxx/Library/Developer/Xcode/DerivedData/xxxWorkspace-caepeadwrerdcrftijaolkkagbjf
 下面用$()代替上面一长串东东
 $(SYMROOT) = $()/Build/Products
 $(BUILD_DIR) = $()/Build/Products
 $(BUILD_ROOT) =  $()/Build/Products
 这三个变量中的$()不会随着Build Settings参数的设置而改变
 相反，以下可以通过设置而改变
 $(CONFIGURATION_BUILD_DIR) = $()/Build/Products/Debug-iphonesimulator
 $(BUILT_PRODUCTS_DIR) = $()/Build/Products/Debug-iphonesimulator
 $(CONFIGURATION_TEMP_DIR) = $()/Build/Intermediates/UtilLib.build/Debug-iphonesimulator
 $(TARGET_BUILD_DIR) = $()/Build/Products/Debug-iphonesimulator
 $(SDK_NAME) = iphonesimulator5.0
 $(PLATFORM_NAME) = iphonesimulator
 $(CONFIGURATION) = Debug
 $(TARGET_NAME) = UtilLib
 $(EXECUTABLE_NAME) = libUtilLib.a 可执行文件名
 ${IPHONEOS_DEPLOYMENT_TARGET} 5.0
 $(ACTION) = build
 $(CURRENTCONFIG_SIMULATOR_DIR) 当前模拟器路径
 $(CURRENTCONFIG_DEVICE_DIR) 当前设备路径

 $(BUILD_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME =
 $()/Build/Products/Debug-iphonesimulator
 $(PROJECT_TEMP_DIR)/$(CONFIGURATION)$(EFFECTIVE_PLATFORM_NAME) = $()/Build/Intermediates/UtilLib.build/Debug-iphonesimulator

 自定义变量
 ${CONFIGURATION}-iphoneos 表示：Debug-iphoneos
 ${CONFIGURATION}-iphonesimulator 表示：Debug-iphonesimulator
 $(CURRENTCONFIG_DEVICE_DIR) = ${SYMROOT}/${CONFIGURATION}-iphoneos
 $(CURRENTCONFIG_SIMULATOR_DIR) = ${SYMROOT}/${CONFIGURATION}-iphonesimulator
 自定义一个设备无关的路径（用来存放各种架构arm6/arm7/i386输出的产品）
 $(CREATING_UNIVERSAL_DIR) = ${SYMROOT}/${CONFIGURATION}-universal
 自定义变量代表的值
 $(CURRENTCONFIG_DEVICE_DIR) ＝ $()/Build/Products/Debug-iphoneos
 $(CURRENTCONFIG_SIMULATOR_DIR) = $()/Build/Products/Debug-iphonesimulator
 $(CREATING_UNIVERSAL_DIR) = $()/Build/Products/Debug-universal








 */
