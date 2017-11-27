//
//  project_pbxproj03.m
//  XcodeStudy
//
//  Created by xs on 2017/4/26.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "project_pbxproj03.h"

@implementation project_pbxproj03

//
//  ViewController.m
//  DebugAndRelease
//
//  Created by xs on 2017/3/8.
//  Copyright © 2017年 Touker. All rights reserved.
//


/**
 Xcode 项目文件结构解析
 A:项目内容文件
 B:项目配置文件（project.pbxproj）
 C:项目测试文件

 A:项目内容文件
 1:AppDeletage.m + main.m +代码文件
 2:Main,Launch.storyboard
 3:配置文件 （Info.plist）
 4:资源文件（Asset.xcassets）
 B:项目配置文件（project.pbxproj）
 1：project.pbxproj 工程文件
 2：project.xxworkspace 文件
 3：xxuserdata 文件—（xxschemes）
 1：project.xxscheme
 2：xxschememanagement.plist
 (SX)文件操作方式  http://www.jianshu.com/p/2fb4dd080aef
 (SX)APP配置多个环境变量 http://www.jianshu.com/p/83b6e781eb51

 文件相关知识扩展

 （一）project.pbxproj 工程文件
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


 workspace

 Xcode Project
 1:包含 一切资源文件(对源文件的引用/ 源代码.h .m/ 库和框架，内部和外部 / 资源,图像文件 / （NIB）文件)
 2:Project级别的构建设置 Configurations
 3:可包含多个target

 Configurations :一种编译配置 （在project 层级体现），每个targets 都拥有这几种配置
 1:可以产生 多种配置，这些配置的不同主要体现在 Build Setting 中的设置不同（开发阶段，测试阶段，发布阶段，各自可选择某个配置以来满足不同开发阶段的不同需求）
 2：用法
 1:创建后 在 某个 targets 的 Build Setting 设置 各自的 参数配置
 2:在 Edit Scheme 设置中 程序 运行的各个阶段 (Build - Run - Test - Profile - Analyze - Archive)选择不同的编译配置
 3:系统默认 有Debug和Release 二种配置
 1:Debug通常称为调试版本，通过一系列编译选项的配合，编译的结果通常包含调试信息，而且不做任何优化，以为开发人员提供强大的应用程序调试能力,只有Debug版的程序才能设置断点、单步执行、使用TRACE/ASSERT等调试输出语句
 2:Release通常称为发布版本，是为用户使用的。所以不保存调试信息，同时，它往往进行了各种优化，以期达到代码最小和速度最优
 3:主要区别 与 具体 设置的地方 ( http://www.51testing.com/html/93/352093-844586.html ) 最重要  _DEBUG与NDEBUG 这两个是编译器的预处理器定义，默认情况下_DEBUG用于Debug版本，而NDEBUG用于Release版本。它们可以说是重要的无以复加。因为，assert系列的断言仅仅在_DEBUG下生效

 Xcode target:定义了构造一个product [所需的文件  +  处理这些源文件的编译指令(Build Settings + Build Phases)]
 0:是一个可以运行的App，可以是一个测试，可以是一个应用扩展，也可以是一个静态库或或者Framework
 1:构建某个产品所用的全部文件的引用(要编译的文件)
 2:构建某个产品所用的构建设置，包括对其他target或其他设置的依赖关系 build settings and build phases
 Copy Bundle Resources 是指生成的product的.app内将包含哪些资源文件 包括程序的主图标
 Compile Sources 是指将有哪些源代码被编译
 Link Binary With Libraries 是指编译过程中会引用哪些库文件
 3:调试或测试程序的执行环境，每个执行环境可定制的内容(加载什么东西,运行时候的环境变量,传递给可执行文件的命令行参数)
 4:target 之间的依赖 二个target在同一个workspace中的依赖 叫 隐式依赖，也可设置成显式依赖

 Xcode Scheme :  (一个target 编译，运行，测试，归档，打包)的配置 的集合,有一个是活跃的
 1:对Scheme 的操作
 1:系统会自动创建出一个编译方案，默认和项目名称相同，使用的是默认创建的 target,(一个Scheme 必须 绑定一个target才能创建)
 2:管理:创建新的 ，复制，导入，导出，删除，排序，是否显示到操作栏，所属容器，是否分享，编辑
 2:各种操作==>Build(编译) - Run(运行) - Test(测试) - Profile(剖析) - Analyze(分析) - Archive(打包)，每步执行前后 可定制操作（发邮件，运行脚本插件）
 Build--
 1:当前方案所要编译的全部对象 ，每个对象右侧 有多个复选框，控制对应操作运行之前，是否要编译该目标，如果发现Xcode不能确定依赖关系，这时需要开发者自己通过“+”添加选择一个对象
 2:Parallelize Build:并行编译，允许Xcode并行编译多个独立的对象，即不依赖于其它对象可单独运行的对象,若对象编译顺序十分重要的话，需要取消并行编译选项
 3:Find Implicit Dependencies:允许Xcode自动寻找依赖
 Run--
 Info:Build Configuration:选择当前的编译配置、
 Executable:可执行文件，选择运行的可执行文件，也可以选择在运行时手动指定
 Debug executable:调试可执行文件，指定是否对当前选定的可执行文件执行调试操作，如不执行，调试操作无作用
 Debug Process as:允许开发者以自身账号或者根用户的身份运行，如果开发者要调试某些需要权限才能运行的应用，则必须使用根用户。该选项只有MAC程序可以勾选
 Launch：启动，表示发起运行操作是自动执行可执行文件还是需要开发者自行启动
 Arguments
 Arguments Passed on Launch:启动时传递的参数，可以使用“+”添加启动时所需要传递的特定参数，这些参数一般情况下可以用在命令行程序上。
 Environment Variables：环境变量，可以添加或覆盖当前应用环境中存在的环境变量。
 Expand Variables Based ON:指定扩展Xcode所提供的变量时，要使用哪个可以行文件的特定环境变量。
 Options选项
 Background Fetch:后台获取，允许开发者启用后台获取功能
 Localization Debugging:本地化调试，在调试过程中，选择是否输出未经本地化操作的字符串
 Application Language:应用程序语言，选择应用程序运行时所在的平台或者所在的环境的语言，
 Application Region:应用程序区域
 Core Location:定位模拟相关设置。allow location simulation:允许模拟器运行时模拟设备的地理位置。default location:定义模拟器启动时，首选的地理模拟位置，
 Routing App Coverage File:设置用于导航、交通相关的应用，开发者可以在项目中指定一个GeoJSON文件，详细说明应用所覆盖的地理区域
 Application Data:允许开发者从项目中事先将数据放置到应用程序中，需要application data package（应用程序数据包）的支持，如果当前工作区中不存在该数据包，则不可以进行数据预加载操作
 GPU Frame Capture:为OpenGL之类的使用GPU的应用程序提供调试支持，Xcode可以捕获CPU绘制出来的每个帧画面，供开发者调试
 Diagnostics诊断选项卡
 Runtime Sanitization:运行时处理 Address Sanitizer:检测一些内存方面的错误 Thread Sanitizer:检测多线程方面的错误 Pause on Issues:依次查看运行时的问题
 Memory Management:开启一些内存管理相关的服务，这些工具会在控制台调试区域输出
 1 :Malloc Scribble:内存涂抹，向分配的内存中填充0xAA，向已经销毁的内存中填入0x55。
 2 :Malloc Guard Edges:边缘保护，分配大容量的内存前后添加保护。
 3 :Guard Malloc:动态内存分配保护，使用libgmalloc来捕获常见的内存问题，比如缓冲区溢出。
 4 :Zombie Objects:僵尸对象，僵尸对象表示已经被销毁的对象，开启后，如果向该对象发送消息，运行时便会输出错误，并可追踪到调用语句。
 Logging:设置调试过程中，输出的日志包含的内容
 Malloc Stack:动态内存分配栈，记录分配内存和释放内存时相关栈的信息。
 Dynamic Linker API Usage:记录动态链接相关API的调用信息。
 Dynamic Library Loads:库加载信息，记录动态链接相关API的调用信息

 App配置多个环境变量(对 Projec Configurations target  Scheme 的组合运用)

 Build(编译) - Run(运行) - Test(测试) - Profile(剖析) - Analyze(分析) -
 Archive(打包) 账号 证书 真机  内部测试 发布 自动构建测试（） 设备知识 UUID ...


 Xcode 所有操作演练 工作界面 Xcode设置---都是干什么的
 文件结构 沙盒 文件操作 位置
 APP 的 运行---（AppDelegate--xx--xx）--前后台 手机对他的管理
 debug调试 命令行-调式 都是干什么的（的细节）内存分析 程序从 创建 安装运行--

 业务基础:设备-用户-- 登录-secion-后端收集
 版本升级跳转 对应的下载页，消息推送，友盟数据统计，分享，
 协调技术:  1：UI 2:H5,JS 3:三方库引用
 APP内部的所有东西 (基础 + 业务):行情 1：上证 2：开户 3：中卓 4：股票账户
 版本管理: SVN  json标准-请求--抓取--调试
 基础视频学习


 Build(编译)


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

 运行--->崩溃，退出 http://www.jianshu.com/p/4984c1b27d9c  http://blog.csdn.net/Hello_Hwc/article/details/53557308




 Profile  是动态分析工具，这个工具叫“Instruments”，它是Xcode 集成在一起，可以在Xcode中通过菜单Product→Profile启动，Instruments有很多Trace Template（跟踪模板）可以动态分析和跟踪内存、CPU和文件系统



 Analyze ，是查找静态内存泄漏




 Archive 打包归档







 */

@end

