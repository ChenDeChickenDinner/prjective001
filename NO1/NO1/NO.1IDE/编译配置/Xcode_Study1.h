//
//  Xcode_Study1.h
//  XcodeStudy
//
//  Created by xs on 2017/3/3.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Xcode_Study1 : NSObject
/**
 
Project
 
 (一)Info
     1:iOS Deployment target:部署版本
     2:Configurations:可配置对象 use XX for command-line builds
     3：Localizations:本地化
（二）Build Setting=====>编译设置 过滤栏设置：
     A->Basic:显示最常用的设置/ Customized:自定义的设置 / All:显示全部设置
     B->Combined:当个对象的编译设置/Levels:所有对象的编译设置

 Target
 (一)General       ----通用选项 (标识,签名,部署,icon,添加库，二进制文件)
 (二)Info          ----通用选项 (info.plist，支持的文件类型，导入导出UTIs,APP跳转)
 (三)Build Settings----编译设置 (指令集,编译目录,编译选项,部署,链接,签名,内核模块,包,版本管理,测试，搜索路径，编译语言，编译警告)
 (四)Build Phases  ----编译阶段 (依赖target,源代码文件,链接的库,拷贝的资源文件)
 (五)Build Rules   ----编译规则 ()
 (六)Capabilities  ----功能选项，设置对象支持的功能
 (七)Resource Tags ----该功能是将资源放到appstore
 

  (一)General       ----通用选项
    1:Identity--身份
        1:display name:项目名称，默认就好 ( CFBundleDisplayName )
        2:Bundle Identifier:包标识符，该ID是唯一的 ( CFBundleIdentidier )
        3:Version:外部版本号，用户能够看到 ( CFBundleShortVersionString )
        4:Build:内部版本号，开发者自己看的，区分测试版本用 ( CFBundleVersion )
    2:Signing--应用程序的签名，如果有开发者账号
    3:Deployment Info--部署信息
        1:Deployment Target:对象支持运行的版本
        2:Devices:支持的设备
        3:Main Interface:启动时加载的主界面，如果使用了storyboard，该值会是Main，如果纯代码编程，则需要设置为空，然后删掉storyboard
        4:Device Orientation:应用支持的方向
        5:Status Bar Style:状态栏的样式
    4:App Icons and Launch Images--图片 +启动图片
    5:Embedded Binaries：绑定的二进制文件，使用了第三方SDK时会需要
    6:Linked Frameworks and Libraries：使用系统自带的SDK时选择，也可以添加第三方框架

 (四)Info.pilst          ----通用选项 ( CFBundleInfoDictionaryVersion )
    1:Custom iOS Target Properties -
        0:Bundle display name 显示的名称  = build setting - packaging - Product Name (PRODUCT_NAME)
        1:Bundle identifier 包标识符
        2:Bundle versions string, short 对外版本
        3:Bundle version   编译版本
        4:Bundle name      App文件夹名
        5:Executable file  默认 = $(EXECUTABLE_NAME) 应用程序的可执行文件
        4:InfoDictionary version （ Info.plist格式的版本信息,一般不动）
        1:Main storyboard file base name 应用程序首次启动时载入的xib文件 这个基本用不到 （APP启动时候再学习）
        1:Launch screen interface file base name 同上
        3:Application requires iPhone environment 应用程序是否需要iPhone 环境
        3:Supported interface orientations 设定应用程序的显示模式。
        3:Localization native development region 定位本地开发地区。本地化相关，如要设置拍照下面按钮显示中文
        3:Required device capabilities 指定程序适用于哪些设备
 
    2:URL Types:让应用程序之间理解和交互数据用的。最多是用在APP之间的跳转的时候。
    3:Document Types:定义了程序能够识别的文档类型，不需要识别文档的应用无需设置
    4:Exported UTLs:导出UTI，定义UTI让应用能够识别对应的文件类型 imported UTLs:和上面对应，用来导入UTI

(五)Build Settings----编译设置
    A--> Architectures--体系结构(指令集) / Build Locations -- 编译目录(文件目录)
    C--> Build Options   -- 编译选项（编译器选择，debug文件类型，Bitcode，生成的文件类型，私有API验证）
    D--> Deployment (部署) / signing (签名) / Linking (链接)
    G--> Headers(头部) / Kernel Module (内核模块) / Packaging  (包) / Search Paths (搜索路径) / versioning  (版本控制)


    M1-->Asset catalog compiler - options
    M2-->Inerface Builder storyboard compiler - options
    M3-->OSACompile - build options
    M4-->Static Analyzer - Analysis policy
    M5-->Static Analyzer - Generic issues
    M6-->Static Analyzer - issues -OC
    M7-->Static Analyzer - issues -Security
    M8-->User-Defined
     
    Q1-->Apple LLIV 8.0 - address sanitizer
    Q2-->Apple LLIV 8.0 - code generation
    Q3-->Apple LLIV 8.0 - custom compiler fiags
    Q4-->Apple LLIV 8.0 - language
    Q5-->Apple LLIV 8.0 - language - C++
    Q6-->Apple LLIV 8.0 - language - modules
    Q7-->Apple LLIV 8.0 - language - OC
    Q8-->Apple LLIV 8.0 - perprocessing
    Q9-->Apple LLIV 8.0 - warning policies
    Q10-->Apple LLIV 8.0 - warnings -all languages
    Q11-->Apple LLIV 8.0 - warnings - C++
    Q12-->Apple LLIV 8.0 - warnings - OC
    Q13-->Apple LLIV 8.0 - warnings - OC and ARC

 
 
 
 
 
 
 
 
 

    1:Architectures--体系结构(指令集)
        1:Base SDK 指的是当前编译用的SDK版本
        2:Supported Platforms--支持的平台
        3:Build Active Architecture Only:它只编译当前的architecture版本
        4:Architectures--在这个项目里你想要Xcode编译的目标设备列表
        5:Valid Architectures 该编译项指定可能支持的指令集，该列表和Architectures列表的交集，将是Xcode最终生成二进制包所支持的指令集
 
    2:Assets ？？
 3：Build Locations：配置构建目录
        1:Build Products Path 产品文件和编译时临时文件都将放在这个目录的子目录中
        2:Intermediate Build Files Path  编译时临时文件的存放位置。编译中间文件格式为product name+.build，如MyProduct.build。
        3:Per-configuration Build Product Path 当前编译设置下的产品存放位置
        4:Per-configuration Intermediate File Path 当前编译设置下编译时临时文件的存放位置
        5:Precompiled Headers Cache Path 存放预编译头文件的位置。通过这个配置，Targets可以互相共享预编译的头文件
 4:Build Options
        0:Build Variants 此项可以设定生成产品的变种
        1:Compiler for C/C++/Objective-C--->选择编译器
        2:Debug Information Format 这个选项决定了记录debug信息的文件格式
        3:Always Embed swift standard libraries 是否 总是嵌入switf标准库
        4:Enable Bitcode 启用Bitcode(一种中间代码) 
        5:Enable Testbility 这是单元测试有关选项，项目里如果没有单元测试 就关了吧
        6:Generate Profiling Code 是否生成配置代码。默认选择NO。
        7:Precompiled Header Uses Files From Build Directory 未改动的文件保留成预编译文件
        8:Scan All Source Files for Includes 扫描include文件所包含的所有源文件。
        9:Validate Built Product  这个选项决定了是否在编译的时候进行验证
        10:Require Only App_Extension-Safe API APP 扩展API 的使用
 5:Deployment  部署
        1:Additional Strip Flags
        2:Additional Install Group
        3:Additional Install Owner
        4:Additional Install Permissions
        5:Additional Permissions Files
        6:Deployment Location
        6:Deployment Postprocessing
        6:Install Group
        6:Install Owner
        6:Install Permissions
        6:Installation Build Products Location
        6:Installation Directory
        6:Resources Targted Device Family
        6:Skip Install
        6:Strip Debug Symbols During copy
        6:Strip Linked Product
        6:Strip style
        6:Targeted Device Family
        6:Use Separate Strip
 6:Headers  头部
    1:Run unifdef on product headers
    2:Unifdef Flags for product headers
 7:Kernel Module   内核模块
     module identifier
     module start routine
     module stop routine
     module version
 8:Linking
    1:Bundle Loader
    2:Coppatibility Version
    3:Current Library Version
    4:Dead code stripping
    5:display mangled names
    6:don`t dead- strip inits and terms
    7:dynamic Library install name
    8:dynamic Library install name base
    9:exportd symbols file
    10:generate positioan-dependen executable
    11:initialization routine
    12:link with standard libraries
    13:mach-0 type
    14:order file
    15:other librarian flags
    16:other link flags
    17:Path to link map file
    18:perform single-object prelink
    19: prelink libraries
    21:perserve private external symbols
    22:quote linker arguments
    23:re-Exported framework names
    24:re-Exported library names
    25:re-Exported library paths
    26:Runpath search paths
    27:separately edit symbols
    28:single-object prelink flags
    29:symbol ordering flags
    30: unexported symobls file
    31: warning linker flags
    32: write link map file
  8:Packaging
    convert copied files
    create info.plist section in binary
    defines module
    executable extension
    executable prefix
    expand build setting in info.plist file
    force package info generation
    framework version
    info.plist file
    info.plist other preprocessor flags
    info.plist output encoding
    info.plist preprocessor definitions
    info.plist preprocessor prefix file
    module map file
    preprocess info.plist file
    preserve HFS data
    private headers folder path
    private module map file
    product bundle identifier
    product module name
    product name
    property list output encoding
    public headers folder path
    strings file output encoding
    wrapper extension
   8:Search Paths
     always search user paths
     framework search paths
     header search paths
     linrary search paths
     rez search paths
     use header maps
     user header search paths
   8:signing
    code signing entitlements
    code signing identity
    development team
    other code signing flags
    provisioning profile ()
    provisioning profile(depreacatef)
   8:testing
 8:text- based API
 8:versioning

 Apple LLIV 8.0 - address sanitizer
 Apple LLIV 8.0 - code generation
 Apple LLIV 8.0 - custom compiler fiags
 Apple LLIV 8.0 - language
 Apple LLIV 8.0 - language - C++
 Apple LLIV 8.0 - language - modules
 Apple LLIV 8.0 - language - OC
 Apple LLIV 8.0 - perprocessing
 Apple LLIV 8.0 - warning policies
 Apple LLIV 8.0 - warnings -all languages
 Apple LLIV 8.0 - warnings - C++
 Apple LLIV 8.0 - warnings - OC
 Apple LLIV 8.0 - warnings - OC and ARC

Asset catalog compiler - options

Inerface Builder storyboard compiler - options

OSACompile - build options

Static Analyzer - Analysis policy
Static Analyzer - Generic issues
Static Analyzer - issues -OC
Static Analyzer - issues -Security

User-Defined



*/
@end
