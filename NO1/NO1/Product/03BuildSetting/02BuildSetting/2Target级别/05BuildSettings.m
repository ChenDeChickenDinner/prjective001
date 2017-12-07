//
//  project_pbxproj01.m
//  XcodeStudy
//
//  Created by xs on 2017/3/9.
//  Copyright © 2017年 Touker. All rights reserved.
//


/**
 



(五)Build Settings----编译设置 (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)
 (1)--> Architectures--体系结构(指令集)
         1:Base SDK 指的是当前编译用的SDK版本
         2:Supported Platforms--支持的平台
         3:Build Active Architecture Only:它只编译当前的architecture版本
         4:Architectures--在这个项目里你想要Xcode编译的目标设备列表
         5:Valid Architectures 该编译项指定可能支持的指令集，该列表和Architectures列表的交集，将是Xcode最终生成二进制包所支持的指令集
 (2)-->Build Locations -- 编译目录(文件目录)
         1:Build Products Path 产品文件和编译时临时文件都将放在这个目录的子目录中
         2:Intermediate Build Files Path  编译时临时文件的存放位置。编译中间文件格式为product name+.build，如MyProduct.build。
         3:Per-configuration Build Product Path 当前编译设置下的产品存放位置
         4:Per-configuration Intermediate File Path 当前编译设置下编译时临时文件的存放位置
         5:Precompiled Headers Cache Path 存放预编译头文件的位置。通过这个配置，Targets可以互相共享预编译的头文件
 (3)--> Build Options  -- 编译选项（编译器选择，debug文件类型，Bitcode，生成的文件类型，私有API验证
 s 此项可以设定生成产品的变种
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

