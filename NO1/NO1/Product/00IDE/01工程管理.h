//
//  01工程管理.h
//  NO1
//
//  Created by xs on 2017/12/1.
//  Copyright © 2017年 Touker. All rights reserved.
//

/**
IED 功能
 1:工程概念
 2:文件管理
 3:基本功能介绍

 A:Xcode工程概念    分为workspace -》project -》target -》File 四级



 workspac（工作空间）
 0:一个工作空间 可以管理多个 工程，每个工程 可以管理多个target生成各种形式的product，
 1:当一个Project需要用到另一个Project的文件的时候，默认情况下 需要将用到的其它Project的相关文件拷贝一份到自身Project中
 2:workspace,即可以单独管理多个项目，又可以通过配置，让各个项目相互依赖
 3:解析-生成-运用
 A:文件夹分析,显示包内容.xcworkspace
 1-contents.xcworkspacedata
 2-xcshareddata（WorkspaceSettings.xcsettings）
 3-xcuserdata- xs.xcuserdatad
 IDEFindNavigatorScopes.plist
 UserInterfaceState.xcuserstate
 xcdebugger(Breakpoints_v2.xcbkptlist)


 Project(一个工程，管理所以的资源文件，与基本设置)
 1:所有的资源文件【源代码，.h/.m,内部和外部的静态库和动态库,资源文件,图片文件,界面构建文件(nib)】
 2:工程层级编译配置(info,Build Setting)
 3:生成-解析-运用

 初始化创建一个Project： 选择一种product模板 + 名字 = Project(创建的名字即为本Project 与默认的 target的名字)
 1文件结构:
 No0:可选的template(模板)【Application/Framework&Library】
 No1:name ---->所有资源文件
 No2:name.xcodeproj ---->本工程配置文件





 target（决定产出什么产品）
 0:(定义了构造一个product所需的文件和编译指令。一个target对应于一个product。）
 1:存在形式,各种平台IOS watchOS tvOS下的各种产品Application/Application Extension/Test/Framework & Library/）
 2:独特的各种配置
 3：最终产物product(每增加一个target 会为其将资源文件拷贝一份，但删除一个target不会同时删除当时拷贝的资源文件，疑问？target 与资源文件的关系在哪？)



 Scheme(决定产品的运行配置)
 1:系统会自动创建出一个编译方案，默认和项目名称相同，使用的是默认创建的 target,(一个Scheme 必须 绑定一个target才能创建)
 2:管理:创建新的 ，复制，导入，导出，删除，排序，是否显示到操作栏，所属容器，是否分享，编辑
 2:各种操作==>Build(编译) - Run(运行) - Test(测试) - Profile(剖析) - Analyze(分析) - Archive(打包)，每步执行前后 可定制操作（发邮件，运行脚本插件）









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




 */
