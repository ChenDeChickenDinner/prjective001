//
//  project_pbxproj01.m
//  XcodeStudy
//
//  Created by xs on 2017/3/9.
//  Copyright © 2017年 Touker. All rights reserved.
//


/**
 电脑版本（某一个版本 支持 哪些 xcode版本）    设备型号（）

 xcode版本(这个xcode 支持运行哪些 iOS 版本的设备)


 手机版本(iOS 11)
 1.通过此版本构建出来的 app ,支持向下兼容，这个手机 从iOS 7~~~iOS 11 都可以运行这个APP.运行的时候 只走手机当前版本的代码

 2.哪些设备可以安装此版本





(五)Build Settings----编译设置 (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)
 (1)--> Architectures--体系结构(1.支持的硬件，2.支持的平台 3.使用的基础SDK)


:Architectures 体系结构   (  ARCHS = ("$(ARCHS_STANDARD)");)
 是指项目默认将会支持的arm处理器架构。默认是Standard architectures，包含了armv7（32位处理器）和arm64(64位处理器)。

:Valid Architectures
 该编译项指定支持的有效指令集，该列表和Architectures列表的交集，将是Xcode最终生成二进制包所支持的指令集

:Build Active Architecture Only
 是否只为当前连接的（活跃的）手机生成二进制包。一般Debug 设置为YES, Release设置为NO。 Debug时一般只会连接一个手机，这时设置为YES, 就只会生成这个手机处理器指令集的二进制包，这样debug时比较快。但Release时是需要发布ipa包给各种各样的手机使用的，所以必须设置NO为所有指令集的手机生成二进制包。

ARCHS_STANDARD
:Base SDK  指的是当前编译用的SDK版本

:Additional SDKs 在编译的时候需要附加的SDK。(ADDITIONAL_SDKS = "";)

:Supported Platforms--支持的平台

 (2)--> Asset--资源
 1.Asset Pack Manifest URL Prefix( 资源包清单的下载路径URL前缀)
 2.Embed Asset Packs In Product Bundle( 是否将资源包嵌入产品的bundle中)
 3.Enable On Demand Resources( 是否开启按需获取资源功能)
 4.On Demand Resources Initial Install Tags( 按需加载资源时的初始安装资源文件标签)
 5.On Demand Resources Prefetch Order( 按需加载资源时预加载的标签顺序)




 (2)-->Build Locations -- 编译目录(文件目录)
 1.在电脑上 项目编译后的产品文件目录位置
/Users/xs/Library/Developer/Xcode/DerivedData/chende-euyiiuuuyvkpjlgddujmaulvqxsc/Build（一个product）



1:Build Products Path 产品相关的文件都将放在这个目录的子目录中 （SYMROOT = build）

     1.1:Per-configuration Build Product Path (CONFIGURATION_BUILD_DIR = )
     当前编译设置下的产品存放位置


2:Intermediate Build Files Path  ( OBJROOT = $(SYMROOT) )
 编译时临时文件的存放位置。编译中间文件格式为product name+.build，如MyProduct.build。
    2.1:Per-configuration Intermediate File Path 当前编译设置下编译时临时文件的存放位置(CONFIGURATION_TEMP_DIR =  OBJROOT /...)


3:Precompiled Headers Cache Path （SHARED_PRECOMPS_DIR =  OBJROOT /...）
 存放预编译头文件的位置。通过这个配置，Targets可以互相共享预编译的头文件






 (3)--> Build Options  -- 编译选项（编译器选择，debug文件类型，Bitcode，生成的文件类型，私有API验证


1:Always Embed swift standard libraries ( ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;)
 是否 总是嵌入switf标准库,对于未使用swift代码的情况可以设置为NO。(ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;)

2.Build Variants   ( BUILD_VARIANTS = (normal,profile) )
     1.此项可以设定生成产品的变种。您可以创建额外的产品变种作为特殊用途。例如，您可以使用编译配置文件的名称来创建一个高度定制的二进制文件。
     2.选项，normal-用于生成普通的二进制文件； profile-用于可以生成配置信息的二进制文件； debug-用于生成带有debug标志、额外断言和诊断代码的二进制文件。


3:Compiler for C/C++/Objective-C ( GCC_VERSION = 000;)
选择使用的编译器。目前Xcode8.2默认使用APPLE LLVM 8.0版本的编译器。

:Debug Information Format （DEBUG_INFORMATION_FORMAT = dwarf）
 这个选项决定了记录debug信息的文件格式,选项有DWARF with dSYM File和DWARF。建议选择DWARF with dSYM File。DWARF是较老的文件格式，会在编译时将debug信息写在执行文件中。

:Enable Bitcode(ENABLE_BITCODE = YES;)
     1.Bitcode(一种中间代码形式)
    2.包含bitcode配置的程序将会在App store上被编译和链接。bitcode允许苹果在后期重新优化我们程序的二进制文件，而不需要我们重新提交一个新的版本到App store上。
    3.当我们提交程序到App store上时，Xcode会将程序编译为一个中间表现形式(bitcode)。然后App store会再将这个botcode编译为可执行的64位或32位程序。

 enable index-while-building functionlity( COMPILER_INDEX_STORE_ENABLE = YES;) ?
控制编译器是否应该发出索引数据而构建。


Enable Testability (ENABLE_TESTABILITY = YES;)
这个设置被激活时,该产品将由选项适合运行自动化测试,可以访问私有接口等测试。这可能导致测试运行速度低于他们会没有启用可测试性。


excluded source file names ?
included source file name  ?

 Generate Profiling Code( GENERATE_PROFILING_CODE = YES;)
激活这个设置会导致编译器和链接器生成分析代码。例如,GCC会生成代码适合使用gprof了(1)。


Precompiled Header Uses Files From Build Directory(PRECOMPS_INCLUDE_HEADERS_FROM_BUILT_PRODUCTS_DIR = YES;)
预编译build路径中的头文件。由于编译过程比较耗时，且两次编译之间未必会改动所有文件。因此将不会改动的常用文件保留成预编译文件将大大减少编译时的时间。建议这一项选择YES。

Require Only App_Extension-Safe(APPLICATION_EXTENSION_API_ONLY = NO;) ?
 如果我们要想应用扩展使用内嵌框架，那么首先要配置一下。将target的Require Only App-Extension-Safe API选项设置为Yes。如果你不这样设置，那么Xcode会向你提示警告：linking against dylib not safe for use in application extensions。


 Scan All Source Files for Includes ( SCAN_ALL_SOURCE_FILES_FOR_INCLUDES = YES;)?
 扫描include文件所包含的所有源文件。


 Validate Built Product(VALIDATE_PRODUCT = NO;)
这个选项决定了是否在编译的时候进行验证。验证的内容和app store的审查内容一致。默认选项是debug时不验证，release时验证。



 (4)--> Deployment (部署)
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
 (5)--> signing (签名)
         1: code signing entitlements
         2: code signing identity
         3: development team
         4: other code signing flags
         5: provisioning profile
         6: provisioning profile(depreacatef)
 (6)--> Linking (链接)
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
 (7)--> Packaging  (包)
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

 (8):Search Paths

         always search user paths

         framework search paths

         header search paths

         linrary search paths

         rez search paths
         
         use header maps
         
         user header search paths
 (8)--> versioning  (版本控制)
 (9)--> Search Paths (搜索路径)

 (10)--> Headers(头部)
         1:Run unifdef on product headers
         2:Unifdef Flags for product headers
 (11)--> Kernel Module (内核模块)
         1:module identifier
         2:module start routine
         3:module stop routine
         4:module version










 
 
  Asset catalog compiler - options ---图标
 
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



 Inerface Builder storyboard compiler - options

 OSACompile - build options

 Static Analyzer - Analysis policy

 Static Analyzer - Generic issues

 Static Analyzer - issues -OC

 Static Analyzer - issues -Security
 
 User-Defined
 
 
 
 */

