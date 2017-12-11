/

 Xcode-Project 设置  1:哪些可设置选项，此设置选项 作业与什么阶段

 isa = PBXProject; /// 类型
attributes = { /// 包含一些编译器的基本信息，版本，以及项目中的target，每一个target一个UUID
    CLASSPREFIX = HB; /// 类名前缀
    LastUpgradeCheck = 0820;
    ORGANIZATIONNAME = Touker; /// 组织名称
    TargetAttributes = { /// 所有 targets信息
        4B7F0FA51A41261700586554 = {  /// 此target UUID
            CreatedOnToolsVersion = 6.1.1; /// 创建项目的Xcode 版本
            DevelopmentTeam = QG479838Q3; /// 开发组
            ProvisioningStyle = Automatic; /// 签名方式（自动/手动）
            SystemCapabilities = {  ///系统所包含的功能
                com.apple.BackgroundModes = {
                    enabled = 1; /// 后台模式
                };
                com.apple.Keychain = {
                    enabled = 1; ///钥匙串
                };
                com.apple.Push = {
                    enabled = 1; /// 推送功能
                };
                com.apple.SafariKeychain = {
                    enabled = 1; ///
                };
            };
        };
    };
};
 buildConfigurationList = 4B7F0FA11A41261700586554 ; /// 引用的是哪一套编译配置 引用的是 XCConfigurationList
 compatibilityVersion = "Xcode 3.2"; /// 应该是兼容版本 目前看来是 Xcode 3.2
 developmentRegion = English; /// 当前开发语言，English英语
 hasScannedForEncodings = 0; /// 是否已经扫描了文件编码信息
knownRegions = (  /// 本地资源文件列表
                en,
                Base,
                "zh-Hans",
                );
 mainGroup = 4B7F0F9D1A41261700586554; /// 项目引用的的主要文件组织，引用  PBXGroup 类型 对象
 productRefGroup = 4B7F0FA71A41261700586554 /* Products */; /// 产品引用的文件组织 PBXGroup 类型
projectDirPath = ""; /// 项目路径 目前为空
projectRoot = ""; /// 项目的根目录  目前为空
targets = ( /// 此项目 包含的所以 target, 引用 PBXNativeTarget类型 对象
           4B7F0FA51A41261700586554 /* HBStockWarning */,
           );
};


 /* Begin XCConfigurationList section */ ==================》一套配置环境  每一个PBXProject/PBXNativeTarget 对象 都会有一套
557BB6D71FDA6F07003539FA  = {
    isa = XCConfigurationList;
    buildConfigurations = ( /// 当前 项目、构建目标 有多少种 配置环境
                           557BB6F01FDA6F07003539FA /* Debug */,
                           557BB6F11FDA6F07003539FA /* Release */,
                           );
    defaultConfigurationIsVisible = 0;
    defaultConfigurationName = Debug; ///默认是哪一种 配置
};



/* Begin XCBuildConfiguration section */==================》 一种配置环境(Debug)
 557BB6F01FDA6F07003539FA /* Debug */ = {
     isa = XCBuildConfiguration;
     buildSettings = {
         ALWAYS_SEARCH_USER_PATHS = NO;
         CLANG_ANALYZER_NONNULL = YES;
         CLANG_ANALYZER_NUMBER_OBJECT_CONVERSION = YES_AGGRESSIVE;
         CLANG_CXX_LANGUAGE_STANDARD = "gnu++14";
         CLANG_CXX_LIBRARY = "libc++";
         CLANG_ENABLE_MODULES = YES;
         CLANG_ENABLE_OBJC_ARC = YES;
         CLANG_WARN_BLOCK_CAPTURE_AUTORELEASING = YES;
         CLANG_WARN_BOOL_CONVERSION = YES;
         CLANG_WARN_COMMA = YES;
         CLANG_WARN_CONSTANT_CONVERSION = YES;
         CLANG_WARN_DIRECT_OBJC_ISA_USAGE = YES_ERROR;
         CLANG_WARN_DOCUMENTATION_COMMENTS = YES;
         CLANG_WARN_EMPTY_BODY = YES;
         CLANG_WARN_ENUM_CONVERSION = YES;
         CLANG_WARN_INFINITE_RECURSION = YES;
         CLANG_WARN_INT_CONVERSION = YES;
         CLANG_WARN_NON_LITERAL_NULL_CONVERSION = YES;
         CLANG_WARN_OBJC_LITERAL_CONVERSION = YES;
         CLANG_WARN_OBJC_ROOT_CLASS = YES_ERROR;
         CLANG_WARN_RANGE_LOOP_ANALYSIS = YES;
         CLANG_WARN_STRICT_PROTOTYPES = YES;
         CLANG_WARN_SUSPICIOUS_MOVE = YES;
         CLANG_WARN_UNGUARDED_AVAILABILITY = YES_AGGRESSIVE;
         CLANG_WARN_UNREACHABLE_CODE = YES;
         CLANG_WARN__DUPLICATE_METHOD_MATCH = YES;
         CODE_SIGN_IDENTITY = "iPhone Developer";
         COPY_PHASE_STRIP = NO;

         ENABLE_STRICT_OBJC_MSGSEND = YES;




         GCC_C_LANGUAGE_STANDARD = gnu11;
         GCC_DYNAMIC_NO_PIC = NO;
         GCC_NO_COMMON_BLOCKS = YES;
         GCC_OPTIMIZATION_LEVEL = 0;
         GCC_PREPROCESSOR_DEFINITIONS = (
                                         "DEBUG=1",
                                         "$(inherited)",
                                         );
         GCC_WARN_64_TO_32_BIT_CONVERSION = YES;
         GCC_WARN_ABOUT_RETURN_TYPE = YES_ERROR;
         GCC_WARN_UNDECLARED_SELECTOR = YES;
         GCC_WARN_UNINITIALIZED_AUTOS = YES_AGGRESSIVE;
         GCC_WARN_UNUSED_FUNCTION = YES;
         GCC_WARN_UNUSED_VARIABLE = YES;







         IPHONEOS_DEPLOYMENT_TARGET = 10.0; /// 最低部署版本
         MTL_ENABLE_DEBUG_INFO = YES;


         ADDITIONAL_SDKS = "";///在编译的时候需要附加的SDK
         ARCHS = ("$(ARCHS_STANDARD)"); /// 支持的体系结构
         VALID_ARCHS = "arm64 armv7 armvs"; /// 支持的有效指令集
         ONLY_ACTIVE_ARCH = YES; /// 是否只编译当前活跃的指令集包
         SDKROOT = iphoneos; /// 当时使用的SDK
         SUPPORTED_PLATFORMS = "iphonesimulator iphoneos"; /// 支持的平台，默认支持 iOS



         SYMROOT = build; /// 编译构建文件的根目录
         OBJROOT = $(SYMROOT); /// 中间文件位置 ，默认 引用 SYMROOT 位置
         CONFIGURATION_BUILD_DIR = ""; ///产品文件位置
         CONFIGURATION_TEMP_DIR = ""; ///当前编译设置下编译时临时文件的存放位置
         SHARED_PRECOMPS_DIR = ""; /// 存放预编译头文件的位置


         ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES; /// 是否连接swift标准库
         BUILD_VARIANTS = (normal,profile) ; /// 产品的变种 类型？
         GCC_VERSION = Apple LLVM 9.0;/// 编译器版本
         DEBUG_INFORMATION_FORMAT = dwarf; /// bug信息记录格式
         ENABLE_BITCODE = YES; /// 是否 产品 Bitcode 中间代码形式
         COMPILER_INDEX_STORE_ENABLE = YES; /// 控制编译器是否应该发出索引数据而构建
         ENABLE_TESTABILITY = YES; ///是否激活 可测试性
         GENERATE_PROFILING_CODE = YES; /// 是否生产分析代码
         PRECOMPS_INCLUDE_HEADERS_FROM_BUILT_PRODUCTS_DIR = YES;/// 是否保留预编译build路径中的头文件
         APPLICATION_EXTENSION_API_ONLY = NO; /// 应用扩展使用内嵌框架
         SCAN_ALL_SOURCE_FILES_FOR_INCLUDES = YES; ///  是否扫描全部资源文件
         VALIDATE_PRODUCT = NO; /// 是否在编译的时候进行验证

         STRIPFLAGS = "";


     };
     name = Debug;
 };

（1）Info:
1:Deployment Target： 定义了我们这个工程在部署时使用的最低 iOS SDK 版本。(//IPHONEOS_DEPLOYMENT_TARGET = 10.0;)

2:Configurations：一种编译配置环境  一个 XCBuildConfiguration 对象
    1.继承性，Project级别定义的所有配置环境  每个targets都会拥有
    2.默认，系统默认 有Debug（开发环境）和Release(正式环境) 二种配置
        1:Debug通常称为调试版本，通过一系列编译选项的配合，编译的结果通常包含调试信息，而且不做任何优化，以为开发人员提供强大的应用程序调试能力,只有Debug版的程序才能设置断点、单步执行、使用TRACE/ASSERT等调试输出语句
        2:Release通常称为发布版本，是为用户使用的。所以不保存调试信息，同时，它往往进行了各种优化，以期达到代码最小和速度最优

    3.增删，可以基于当前配置环境 复制增加一个新的配置环境。
    4.一套配置环境中 有多个环境 ，use (哪一种)for command-line builds。 (//defaultConfigurationName = Debug)



 3:Localizations：定义了我们应用的本地化语言



(2)buildSettings











(3)Debug 与Release  具体的配置差异(哪些是系统级别的设定，是不能更改的，哪些是可以更改的)
 http://www.51testing.com/html/93/352093-844586.html
 1. _DEBUG与NDEBUG 这两个是编译器的预处理器定义，默认情况下_DEBUG用于Debug版本，而NDEBUG用于Release版本。


(4)Project 与  targets 直接 XCBuildConfiguration 的关系
1.继承了哪些
2.哪些是可以修改，哪些是不能修改的
 */
