//
//  cocoapods.m
//  2019OC2
//
//  Created by xs on 2019/4/8.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "cocoapods.h"

@implementation cocoapods

@end
/*
1.Cocoapods软件

2.CocoaPods 的核心组件
 A:/Users/xs/.cocoapods/repos:仓库,这个目录存储远端的 podspec 文件到本地，
 1.master 是所有第三方的 podspec 索引文件，其本质是一个git 仓库，输出仓库的远程地址，发现是一个GitHub仓库

 B:/Users/xs/Library/Caches/CocoaPods/Pods:本地所有使用下载到的三方库缓存文件的存储目录


3.Cocoapods运作原理
CocoaPods 在解析执行过程中最重要的几个包的路径分别是：CocoaPods/CocoaPods、CocoaPods/Core 和 CocoaPods/Xcodeproj。
 1.CocoaPods/CocoaPods:这是面向用户的组件，每当执行一个 pod 命令时，这个组件将被激活。它包括了所有实用 CocoaPods 的功能

 2.CocoaPods/Core:Core Gem 提供了与 CocoaPods 相关的文件（主要是 Podfile 和 Podspecs）的处理。
     1.Podspecs:该文件描述了一个库将怎样被添加进工程中。.podspec 文件可以标识该第三方库所需要的源码文件、依赖库、编译选项，以及其他第三方库需要的配置
     2.Podfile：该文件用于配置项目所需要的第三方库，它可以被高度定制

 3.CocoaPods/Xcodeproj:这个包负责处理工程文件，它能创建以及修改 .xcodeproj 文件和 .xcworkspace 文件





4.cocoapods 各种指令
 1.pod init:为工程生成Podfile文件


 2.pod inatall:
1.第一次pod inatall
 1.会生成ProjectName.xcworkspace、Podfile.lock、Pods项目等文件
 2.根据Podfile下载指定的pods库到当前项目文件
 3.生成一个Podfile.lock文件，此文件会记录当前pods的版本，保持对每个pod已安装版本的跟踪，并且锁定这些版本
2.后面每一次pod inatall
 对于已在Podfile.lock中列出的pod，会下载指定的版本，不会检查是否有新版本。
 对于没有在Podfile.lock中列出的pod，它会搜索并安装Podfile中指定的版本。
3.使用场景
 1.0，新创建工程，第一次引入pod库时。
 2.0，修改了Podfile文件，添加或删除了所依赖的pod库时。
 3.1，团队中新人拉取工程后获取pod库时。
 3.2，团队中，不同开发者要同步对pod库的依赖时。
 3.3，有人改变了依赖关系，删除或增加pod时。
 3.4，有人执行了pod update,此时他的Podfile.lock文件中的跟踪版本就已经变更，此时，其他人只要pod install就能更新为和Podfile.lock文件中的版本。

 4.0，如果Podfile和Podfile.lock的记录相冲突，Podfile文件中指定了低于Podfile.lock中记录的版本。会以Podfile文件为准，并在获取成功后更新Podfile.lock文件。




1.会 创建生成一个 Pods 目录，并新生成的一个Pods工程
  a1.Frameworks:所有三方库依赖的系统文件
  a2.Pods:所有三方库的头文件 实现文件 配置文件
  a3.Products:所有三方库形成的.atarget
  a4.Targets Support Files:目标的支持文件
2.所有的第三方库以 .a静态库或者.framwork 形式形成一个个target

3.最后生成一个依赖所有三方.a target,名称为 libPods-目标target.a 的静态库供我们的工程使用

4.在目标target的Build Phases中[CP] Check Pods Manifest.lock

5.在目标target的Build Phases中[CP] Copy Pods Resources


6.在目标target的Build Setting中设置User Header Search Paths
 1.在用CocoaPods集成第三方库之后，默认情况下，我们需要使用类似#import <XXX/YYY.h>的方式引入第三方库的头文件。
 2.我们可以在Build Settings -> User Header Search Paths中添加${SRCROOT}并设置成recursive，
 3.这样我们就可以直接使用#impot "YYY.h"这种方式了





私有库

 */
