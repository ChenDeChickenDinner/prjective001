//
//  NO2IDE结构.m
//  NO1
//
//  Created by xs on 2017/11/27.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NO2IDE结构.h"

@implementation NO2IDE__

@end
//01 IDE 基本使用概念
/**
 A:Xcode工程概念
 分为workspace -》project -》target -》File 四级
 一个工作空间 可以管理多个 工程，每个工程 可以管理多个target生成各种形式的product，

 workspac（工作空间）
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
 2:独特的配置
 (一)General======>通用选项 (标识,签名,部署,icon,添加库，二进制文件)
 (二)Info======>通用选项 (info.plist，支持的文件类型，导入导出UTIs,APP跳转)
 (三)Build Settings----编译设置 (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)
 (四)Build Phases  ----编译阶段 (依赖target,源代码文件,链接的库,拷贝的资源文件)
 (五)Build Rules   ----编译规则
 (六)Capabilities  ----功能选项，设置对象支持的功能
 (七)Resource Tags ----该功能是将资源放到appstore
 3：最终产物product(每增加一个target 会为其将资源文件拷贝一份，但删除一个target不会同时删除当时拷贝的资源文件，疑问？target 与资源文件的关系在哪？)
 4:解析-生成-运用


 Scheme(决定产品的运行配置)
 1:选择一个product,
 2:运行流程中的设置( Build(编译)/Run(运行)/Test(测试)/Profile(剖析)/Analyze(分析)/Archive(打包))
 3:可以创建各种不同的计划，但只能有一个计划处于激活状态
 4:解析-生成-运用
 */

//02 IDE 资源文件管理
/**
 B:Xcode工程目录
 projectA
 A:project所有资源文件
 B:products列表
 :只有在给当前products下达生成指令后才会生成对应的文件show in finder
 C:Frameworks引用
 D:其它配置文件
 projectB
 projectC


 C:Xcode文件结构
 A:xxx.xcodeproj()
 1:project.pbxproj（工程文件）
 2:project.xcworkspace（）
 1:contents.xcworkspacedata
 2:xcuserdata
 3:xcuserdata（）
 B:每个target文件资源
 C:其它扩展文件(textTests/git文件/xcworkspace/)
 */
//03 IDE 工具结构(基本设置，功能点。。)
