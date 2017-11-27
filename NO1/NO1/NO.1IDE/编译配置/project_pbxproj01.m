//
//  project_pbxproj01.m
//  XcodeStudy
//
//  Created by xs on 2017/3/9.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "project_pbxproj01.h"

@implementation project_pbxproj01
/**
 
 (一)project.pbxproj.workspace文件
 

（二）project.pbxproj 工程文件
 简介:它本质上是一种旧风格的 Property List 文件，历史可追溯到 NeXT 的 OpenStep。由于有Xcode工具的存在，我们一般不需要与pbxproj直接打交道，通过General、Build Settungs或者Info等面板，就可以完成项目工程配置信息的修改/采用 utf8编码 每个文件 有一个 唯一标识码
     示例：!$*UTF8*$!
     {
     archiveVersion = 1;
     classes = {
     };
     objectVersion = 45;
     objects = {
     ...
     };
     rootObject = 0867D690FE84028FC02AAC07  Project object ;
     }
 PBXProject: 该对象记录着targets、mainGroup等重要信息,甚至每个target在创建时候的Xcode版本都会记录在其中
 PBXSourcesBuildPhase 来源 用于构建阶段中编译源文件
 PBXResourcesBuildPhase 资源 用于构建阶段需要复制的资源文件
 PBXNativeTarget  工程中的target,如果工程中有多个target,都会在这个section中有所体现
 PBXGroup  用于组文件，或者嵌套组

 PBXFrameworksBuildPhase  用于framewrok构建的链接阶段
 PBXFileReference  跟踪项目引用的每一个外部文件
 PBXBuildFile是文件类，被PBXBuildPhase等作为文件包含或被引用的资源。

 PBXTargetDependency 目标的外部依赖管理。
 PBXVariantGroup 对不同地区资源文件的引用管理。
 XCBuildConfiguration  构建配置元素
 XCConfigurationList构建配置相关元素的列表
 http://www.jianshu.com/p/e82ec6a56fc2
 http://www.jianshu.com/p/bd4e3c1a7276#
 http://gcblog.github.io/2016/02/23/GitHub+Hexo/
 
(三.1)Build(编译) - Run(运行) - Test(测试) - Profile(剖析) - Analyze(分析) - Archive(打包)=======>参数设置含义
     Build===>
             1:当前方案所要编译的全部对象 ，每个对象右侧 有多个复选框，控制对应操作运行之前，是否要编译该目标，如果发现Xcode不能确定依赖关系，这时需要开发者自己通过“+”添加选择一个对象
             2:Parallelize Build:并行编译，允许Xcode并行编译多个独立的对象，即不依赖于其它对象可单独运行的对象,若对象编译顺序十分重要的话，需要取消并行编译选项
             3:Find Implicit Dependencies:允许Xcode自动寻找依赖
     Run===>
             1:Info:Build Configuration:选择当前的编译配置、
                 Executable:可执行文件，选择运行的可执行文件，也可以选择在运行时手动指定
                 Debug executable:调试可执行文件，指定是否对当前选定的可执行文件执行调试操作，如不执行，调试操作无作用
                 Debug Process as:允许开发者以自身账号或者根用户的身份运行，如果开发者要调试某些需要权限才能运行的应用，则必须使用根用户。该选项只有MAC程序可以勾选
                 Launch：启动，表示发起运行操作是自动执行可执行文件还是需要开发者自行启动
             2:Arguments
                 Arguments Passed on Launch:启动时传递的参数，可以使用“+”添加启动时所需要传递的特定参数，这些参数一般情况下可以用在命令行程序上。
                 Environment Variables：环境变量，可以添加或覆盖当前应用环境中存在的环境变量。
                 Expand Variables Based ON:指定扩展Xcode所提供的变量时，要使用哪个可以行文件的特定环境变量。
             3:Options选项
                 Background Fetch:后台获取，允许开发者启用后台获取功能
                 Localization Debugging:本地化调试，在调试过程中，选择是否输出未经本地化操作的字符串
                 Application Language:应用程序语言，选择应用程序运行时所在的平台或者所在的环境的语言，
                 Application Region:应用程序区域
                 Core Location:定位模拟相关设置。allow location simulation:允许模拟器运行时模拟设备的地理位置。default location:定义模拟器启动时，首选的地理模拟位置，
                 Routing App Coverage File:设置用于导航、交通相关的应用，开发者可以在项目中指定一个GeoJSON文件，详细说明应用所覆盖的地理区域
                 Application Data:允许开发者从项目中事先将数据放置到应用程序中，需要application data package（应用程序数据包）的支持，如果当前工作区中不存在该数据包，则不可以进行数据预加载操作
                 GPU Frame Capture:为OpenGL之类的使用GPU的应用程序提供调试支持，Xcode可以捕获CPU绘制出来的每个帧画面，供开发者调试
            4:Diagnostics诊断选项卡
                Runtime Sanitization:运行时处理 Address Sanitizer:检测一些内存方面的错误 Thread Sanitizer:检测多线程方面的错误 Pause on Issues:依次查看运行时的问题
                Memory Management:开启一些内存管理相关的服务，这些工具会在控制台调试区域输出
                     1 :Malloc Scribble:内存涂抹，向分配的内存中填充0xAA，向已经销毁的内存中填入0x55。
                     2 :Malloc Guard Edges:边缘保护，分配大容量的内存前后添加保护。
                     3 :Guard Malloc:动态内存分配保护，使用libgmalloc来捕获常见的内存问题，比如缓冲区溢出。
                     4 :Zombie Objects:僵尸对象，僵尸对象表示已经被销毁的对象，开启后，如果向该对象发送消息，运行时便会输出错误，并可追踪到调用语句。
                Logging:设置调试过程中，输出的日志包含的内容
                     1 :Malloc Stack:动态内存分配栈，记录分配内存和释放内存时相关栈的信息。
                     2 :Dynamic Linker API Usage:记录动态链接相关API的调用信息。
                     3 :Dynamic Library Loads:库加载信息，记录动态链接相关API的调用信息
 
 
 (三.2)Build(编译) - Run(运行) - Test(测试) - Profile(剖析) - Analyze(分析) - Archive(打包)=======>运行原理
     Build===>
     1:编译前端-->词法分析、语法分析、语义分析、中间代码生成（与编译的源语言有关）
     2:编译后端-->代码优化和目标代码生成部分(仅与编译的目标语言及运行环境有关)

     预编译:预编译过程主要处理源代码文件那些#开头的预编译指令
             1. 删除所有#define, 展开所有宏定义
             2. 处理所有预编译指令, 如#if, #ifdef, #elif, #else, #endif
             3. 递归处理#include
             4. 删除所有注释
             5. 添加行号和文件名标识
             6. 保留所有#pragma编译器指令
     编译:过程可分为6部 : 扫描, 语法分析, 语义分析, 源代码优化, 代码生成和目标代码优化.
             1. 扫描 : 扫描器运用一种类似于有限状态机的算法把源代码分割成一些列的记号(Token)
             2. 语法分析 : 语法分析器采用上下文无关语法(Context-free Grammar)将Token进行语法分析, 生成语法树(Syntax Tree).该语法树就是以表达式为节点的树
             3. 语义分析 : 语法分析只是对表达式的语法进行层面的分析, 它并不知道该语句是否真正有意义. 在这里, 语义分析器能够进行静态语义分析, 分析过后整个语法树的表达式都被标识了类型
             静态语义 : 在编译器可以确定的语义, 通常包括声明和类型的匹配, 转换.
             动态语义 : 在运行时才能确定的语义, 比如0作为除数则在这里报错
             4. 源代码优化 : 源码级优化器(Source Code Optimizer)在源代码级别进行优化, 把一些类似于(2+6)这些在编译器就能确定的表达式优化成值, 从而把整个语法树转换成中间代码(Intermediate Code)
             中间代码使得编译器可以被分为前端和后端, 前端负责产生机器无关的中间代码, 后端将中间代码转换成目标机器代码
             5. 代码生成与优化 : 代码生成器(Code Generator)将中间代码转换成目标机器代码(该过程十分依赖于目标机器), 最后目标代码优化器(Target Code Optimizer)将上述的代码进行优化, 例如选择合适的寻址方式, 使用位移来代替乘法运算, 删除多余的指令等.
     
     汇编---->汇编器将汇编代码转换成机器可以执行的指令, 输出目标文件 (被编译成了目标文件) ===>生成.o 文件
             .o 文件 包含什么：ELF文件头(包含了整个文件的基本属性) + 段表(描述了ELF文件包含的所有段的信息) + 重定位表() + 符号表()
     链接--->链接过程包括 : 地址和空间分配(Address and Storage Allocation), 符号决议(Symbol Resolution) 和 重定位(Relocation)===>可执行文件文件
     装载--->程序想要运行起来, 就必须被装载进内存中才能被CPU调度到
             1:早期程序装载 : 把整个程序一次性加载到内存中, 然后执行.
             2:覆盖装入 : 在覆盖管理器(Overlay Manager)的辅助下, 进程使用到什么模块就把该模块载入到内存中替换掉不需要使用的模块
             3:从操作系统的角度看可执行文件的装载
                 1:创建一个独立的虚拟地址空间
                 2:读取可执行文件, 建立可执行文件与虚拟空间的映射关系
                 3:将CPU的指令寄存器设置成可执行文件的入口地址, 启动运行!
    Test--->测试
    Profile--->是动态分析工具，这个工具叫“Instruments”，它是Xcode 集成在一起，可以在Xcode中通过菜单Product→Profile启动，Instruments有很多TraceTemplate（跟 踪模板）可以动态分析和跟踪内存、CPU和文件系统
     
    Analyze--->是查找静态内存泄漏
    Archive--->打包归档
 
 （四）Target设置
 
 (一)General======>通用选项 (标识,签名,部署,icon,添加库，二进制文件)
     1:Identity--身份
                 1:display name:项目名称，默认就好 ( CFBundleDisplayName )
                 2:Bundle Identifier:包标识符，该ID是唯一的 ( CFBundleIdentidier )
                 3:Version:外部版本号，用户能够看到 ( CFBundleShortVersionString )
                 4:Build:内部版本号，开发者自己看的，区分测试版本用 ( CFBundleVersion )
     2:Signing--应用程序的签名，如果有开发者账号
                 1:Code Signing Entitlements 授权机制
                 1:在Xcode的capabilities选项卡下选择一些选项后，Xcode就会生成这样一段XML，Xcode会自动生成一个entitlements文件，然后再需要的时候往里面添加条目。当构建整个应用时，这个文件也会提及给codesign作为应用所需要拥有哪些授权的参考。这些授权信息必须都在开发者中心的AppID中启用，并且包含在配置文件中
                 2:Code Signing Identity  配置证书
                 3:Development Team  开发者所在的群组
                 4:Other Code Signing Flags
 5：Provisioning profile + Provisioning profile (Deprecated) 配置描述文件 自动
     3:Deployment Info--部署信息
                 1:Deployment Target:对象支持运行的版本
                 2:Devices:支持的设备
                 3:Main Interface:启动时加载的主界面，如果使用了storyboard，该值会是Main，如果纯代码编程，则需要设置为空，然后删掉storyboard
                 4:Device Orientation:应用支持的方向
                 5:Status Bar Style:状态栏的样式
     4:App Icons and Launch Images--图片 +启动图片
     5:Embedded Binaries：绑定的二进制文件，使用了第三方SDK时会需要
     6:Linked Frameworks and Libraries：使用系统自带的SDK时选择，也可以添加第三方框架

 (二)Info======>通用选项 (info.plist，支持的文件类型，导入导出UTIs,APP跳转)
    (1)  :Information Property List ：
            0:Bundle display name 显示的名称  = build setting - packaging - Product Name (PRODUCT_NAME)
            1:Bundle identifier 包标识符
            2:Bundle versions string, short 对外版本
            3:Bundle version  编译版本
            4:Bundle name      App文件夹名
            5:Executable file  默认 = $(EXECUTABLE_NAME) 应用程序的可执行文件
            6:InfoDictionary version （ Info.plist格式的版本信息,一般不动）
            7:Main storyboard file base name 应用程序首次启动时载入的xib文件 这个基本用不到 （APP启动时候再学习）
            8:Launch screen interface file base name 同上
            9:Application requires iPhone environment 应用程序是否需要iPhone 环境
            10:Supported interface orientations 设定应用程序的显示模式。
            11:Localization native development region 定位本地开发地区。本地化相关，如要设置拍照下面按钮显示中文
            12:Required device capabilities 指定程序适用于哪些设备
    （2）:URL Types:让应用程序之间理解和交互数据用的。最多是用在APP之间的跳转的时候。
    （3）:Document Types:定义了程序能够识别的文档类型，不需要识别文档的应用无需设置
    （4）:Exported UTLs:导出UTI，定义UTI让应用能够识别对应的文件类型 imported UTLs:和上面对应，用来导入UTI


 (三)Build Settings----编译设置 (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)
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


 (四)Build Phases  ----编译阶段 (依赖target,源代码文件,链接的库,拷贝的资源文件)
         1:Target Dependencies：设置依赖target。是用来管理你的 Target 依赖的。在几年前，基本上都是使用它来做第三方工程依赖的。
         2:Link Binary with Libraries：是用来管理二进制库和Framework的
         3:Compile Sources：该target需要编译的源代码文件，一个 Target 里面并不一定要编译和使用左侧工程里面的所有源文件
         4:Copy Bundle Resources：是用来设置你需要拷贝到 Main Bundle 里面的资源文件的，里面可能会包括 storyboard，xib，图片文件，JS 文件，CSS 文件，其他的资源包


 (五)Build Rules   ----编译规则
 (六)Capabilities  ----功能选项，设置对象支持的功能
 (七)Resource Tags ----该功能是将资源放到appstore
 
 
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
 
 
 三.开发证书 Certificates 介绍，生产
 1:它是由一个由权威机构——CA机构（CA =CertificateAuthority），又称为数字证书授权中心（数字证书认证机构）颁发（发行）的，人们可以在网上用它来识别对方的身份
 2:数字证书是一个经 CA 数字签名的包 包含:公开密钥拥有者信息以及公开密钥的文件
 3:公开密钥、名称以及 CA 的数字签名
 3:数字证书还有一个重要的特征就是时效性：只在特定的时间段内有效


 3.1):数字证书的概念
 1:它是由一个由权威机构——CA机构（CA =CertificateAuthority），又称为数字证书授权中心（数字证书认证机构）颁发（发行）的，人们可以在网上用它来识别对方的身份
 2:数字证书是一个经 CA 数字签名的包 包含:公开密钥拥有者信息以及公开密钥的文件
 3:公开密钥(公钥）相当于公章 +    名称    +    CA 的数字签名
 3:数字证书还有一个重要的特征就是时效性：只在特定的时间段内有效
 3.2):根证书的概念
 1:根证书是被严格限制和确认的，根证书的颁发者被称之为 Root Certificate Authority（Root CA）。
 2:某一认证领域内的根证书是 CA 认证中心给自己颁发的证书（自行签名），安装根证书意味着对这个 CA 认证中心的信任。

 3.3):可信的根证书列表（一级证书）
 1:可信的根证书列表”是指操作系统开发商通过严格地审核，将安全可靠、可被信任的 CA 机构纳入白名单，并将这些权威可信 CA 的根证书预安装到操作系统中。
 2:现代网络操作系统都会内置一份可信的根证书列表（Firefox 的根证书列表独立于操作系统之外),保证信任链起点的安全
 3:在macOS 的 Keychain Access中，可查看系统根证书（或系统证书）：Apple Root CA

 3.4）iOS（开发）证书的根证书 ---AppleWWDRCA.cer（二级证书）
 1：AppleWWDRCA.cer 是由苹果公司一级认证中心 Apple Certification Authority（Apple Root CA）给下属的二级证书机构Apple Worldwide Developer Relations Certification Authority颁发的证书
 2：iOS 以及 Mac OS X 系统（在安装 Xcode 时）将自动安装AppleWWDRCA.cer这个中间证书（Intermediate Certificates），它实际上就是 iOS（开发）证书的证书，即开发根证书。

 3.5）申请证书，通过 Keychain证书助理从证书颁发机构请求证书
 1: 在 Keychain Access|Keys 中将新增一对非对称密钥对 Public Key（公共秘钥） / Private Key （私有）秘钥
 2:私钥private key始终保存在 Mac OS 的 Keychain Access 中，用于签名（CodeSign）本机对外发布的 App
 3:公钥public key一般随证书（随Provisioning Profile，随 App 安装）散布出去，对 App 签名进行校验认证
 2: 生成 一个 CSR 文件（包含:开发者身份信息 + 公钥 ）
 3: 利用 CSR 文件 在开发者网站 换取 （ios_development.cer）数字证书

 3.6)安装证书: 双击 数字证书 将其 安装到 电脑上 【iPhone Developer: *@gmail.com (**********)】三级来发证书
 1：(利用AppleWWDRCA证书公钥对该开发证书数字签名进行解密和校验。校验成功会标记此证书有效)
 2:最后 每一个三级开发证书安装成功后
 1:在Keys 中 ，创建 CSR 时生成的 Key Pair 中的（私钥）前面的箭头，可以查看到包含其对应（公钥的证书） 私钥 包含证书
 2:在Certificates 中，展开安装的证书（ios_development.cer）前面的箭头，可以看到其对应的（私钥）   证书 包含 私钥
 

 Provisioning Profiles （xxxx.mobileprovision）   描述文件
 （1）Name：该mobileprovision的文件名。

 （2）UUID：该mobileprovision文件的真实文件名。

 （3）TeamName：Apple ID账号名。

 （4）TeamIdentifier：Team Identity。

 （5）AppIDName：explicit/wildcard App ID name（ApplicationIdentifierPrefix）。

 （6）ApplicationIdentifierPrefix：完整App ID的前缀（TeamIdentifier.*）。

 （7）DeveloperCertificates：包含了可以为使用该配置文件应用签名的所有证书。
 
 （8）Entitlements键对应的：
     1:keychain-access-groups：
        每个应用程序都有一个可以用于安全保存一些如密码、认证等信息的keychain，一般而言自己的程序只能访问自己的keychain。通过对应用签名时的一些设置，还可以利用keychain的方式实现同一开发者签证（就是相同bundle seed）下的不同应用之间共享信息的操作
    2:application-identifier：带前缀的全名，例如
    3:com.apple.security.application-groups：App Group ID
    4:com.apple.developer.team-identifier：同Team Identifier
    
 （9）ProvisionedDevices：该mobileprovision授权的开发设备的UDID 。
 
 
 
 
 (七):Provisioning Profile 描述文件  (xxxx.mobileprovision文件) ---->其作用是 决定 Xcode 用 (哪个证书)来签署应用程序
 
 1: Profile = (App IDs + Devices +证书 +用途)
 2: 其作用是 决定 Xcode 用 (哪个证书)来签署应用程序，并将其嵌入到 .ipa包，安装应用程序时文件被拷贝到 iOS 设备中，通过它来认证安装的程序
 
 
 3:Provisioning Profile被配置到【XcodeTarget|Build Settings|Code Signing|Provisioning Profile】下，然后在Code Signing Identity下拉可选择Identities from Profile "..."（即Provisioning Profile中包含的Certificates）
 
 
 4:TeamProvisioning Profile的概念
 1：每个 Apple 开发者账号都对应一个唯一的Team ID，在 Xcode 中添加 Apple Developer Account(账户) 时,自动生成iOS Team Provisioning Profile
 2：其包含:一个为Xcode iOS Wildcard App ID(*)生成的iOS Team Provisioning Profile:*（匹配所有应用程序)
 3：作用:账户里所有的 Development Certificates 和 Devices 都可以使用它在这个 team 注册的所有设备上调试应用程序
 4:  也被配置到【XcodeTarget|Build Settings|Code Signing|Provisioning Profile】下，同时需要在【XcodeTarget|General|Identity】下指定 Team 账号ID。
 */
@end
