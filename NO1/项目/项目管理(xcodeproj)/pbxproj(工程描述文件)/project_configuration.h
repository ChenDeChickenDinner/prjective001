



project-buildConfigurationList
.一个项目，有 project 级别的 buildConfigurationList，其 配置套数 根据 configurations 设置 决定（默认有 Debug/Release 各一套）
55282EEB205923F5003750A8 /* Build configuration list for PBXProject "one" */ = {
    isa = XCConfigurationList;
    buildConfigurations = (
                           55282F04205923F6003750A8 /* Debug */,
                           55282F05205923F6003750A8 /* Release */,
                           557A4F43205B588D0085D973 /* Release copy */,
                           );
    defaultConfigurationIsVisible = 0;
    defaultConfigurationName = Release;
};
EEB205923F5003750A8：此套配置 属于谁， 在此 是属于 PBXProject "one"（项目one）
buildConfigurations：此套配置包括哪些配置
defaultConfigurationIsVisible：
defaultConfigurationName：默认使用哪套配置编译《user "XXX" for command-line builds》







project-buildConfiguration 的体现
.其具体配置由project- info/build settings 中的 设置 来体现

Build Setting=====>编译设置 过滤栏设置：
操作栏：A->Basic:显示最常用的设置/ Customized:只显示已定制的构建设置 / All:显示全部设置 + B->Combined:当个对象的编译设置/Levels:所有对象的编译设置


配置元素: (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)




55282F04205923F6003750A8 /* Debug */ = {
    isa = XCBuildConfiguration;
    buildSettings = {
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
CLANG_ANALYZER_LOCALIZABILITY_NONLOCALIZED //本地化相关 ues base internationalization



Debug 与Release 编译配置
1:Debug通常称为调试版本，通过一系列编译选项的配合，编译的结果通常包含调试信息，而且不做任何优化，以为开发人员提供强大的应用程序调试能力,只有Debug版的程序才能设置断点、单步执行、使用TRACE/ASSERT等调试输出语句
2:Release通常称为发布版本，是为用户使用的。所以不保存调试信息，同时，它往往进行了各种优化，以期达到代码最小和速度最优
3. _DEBUG与NDEBUG 这两个是编译器的预处理器定义，默认情况下_DEBUG用于Debug版本，而NDEBUG用于Release版本。
区别具体体现在哪？（固定的区别 跟软区别）


用户自定义的 编译配置 与 系统的 （Debug 与Release）有什么关系

一套编译配置 到底有那些构成，哪些是 继承系统的 不能更改的 哪些是可以更改的
*/
