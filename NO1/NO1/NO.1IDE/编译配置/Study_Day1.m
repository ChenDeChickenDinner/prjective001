//
//  Study_Day1.m
//  XcodeStudy
//
//  Created by xs on 2017/3/9.
//  Copyright © 2017年 Touker. All rights reserved.
//


/**
 Xcode 项目文件结构解析
     A:项目内容文件
         1:AppDeletage.m + main.m +代码文件
         2:Main,Launch.storyboard
         3:配置文件 （Info.plist）
         4:资源文件（Asset.xcassets）
     B:项目配置文件（project.pbxproj）
         1：project.pbxproj 工程文件
         2：project.xxworkspace 文件
         3:xxchaemes 文件夹
         3：xxuserdata 文件夹—（xxschemes）
             1：project.xxscheme
             2：xxschememanagement.plist
 (SX)文件操作方式  http://www.jianshu.com/p/2fb4dd080aef
 (SX)APP配置多个环境变量 http://www.jianshu.com/p/83b6e781eb51
 
project.pbxproj.workspace :工作台文件
project.pbxproj 工程文件 ：它本质上是一种旧风格的 Property List 文件，项目配置文件

 
 workspace:组织projects和其他协同工作的文档的一份文档。
 
 Xcode Project
     1:包含 一切资源文件(对源文件的引用/ 源代码.h .m/ 库和框架，内部和外部 / 资源,图像文件 / （NIB）文件)
     2:Project级别的构建设置 Configurations
     3:可包含多个target

 Configurations :一种编译配置 （在project 层级体现），每个targets 都拥有这几种配置
     1:可以产生 多种配置，这些配置的不同主要体现在 Build Setting 中的设置不同（开发阶段，测试阶段，发布阶段，各自可选择某个配置以来满足不同开发阶段的不同需求）
     2:创建后 在 某个 targets 的 Build Setting 设置 各自的 参数配置
     3:在 Edit Scheme 设置中 程序 运行的各个阶段 (Build - Run - Test - Profile - Analyze - Archive)选择不同的编译配置
     4:系统默认 有Debug和Release 二种配置
     5:Debug通常称为调试版本，通过一系列编译选项的配合，编译的结果通常包含调试信息，而且不做任何优化，以为开发人员提供强大的应用程序调试能力,只有Debug版的程序才能设置断点、单步执行、使用TRACE/ASSERT等调试输出语句
     6:Release通常称为发布版本，是为用户使用的。所以不保存调试信息，同时，它往往进行了各种优化，以期达到代码最小和速度最优
     7:主要区别 与 具体 设置的地方 ( http://www.51testing.com/html/93/352093-844586.html ) 最重要  _DEBUG与NDEBUG 这两个是编译器的预处理器定义，默认情况下_DEBUG用于Debug版本，而NDEBUG用于Release版本。它们可以说是重要的无以复加。因为，assert系列的断言仅仅在_DEBUG下生效

 Xcode target: (定义了构造一个product [所需的文件  +  处理这些源文件的编译指令(Build Settings + Build Phases)])
     0:可以是一个可以运行的App，可以是一个测试，可以是一个应用扩展，也可以是一个静态库或或者Framework
     1:构建某个产品所用的全部文件的引用(要编译的文件)
     2:构建某个产品所用的构建设置，包括对其他target或其他设置的依赖关系 build settings and build phases
     3:调试或测试程序的执行环境，每个执行环境可定制的内容(加载什么东西,运行时候的环境变量,传递给可执行文件的命令行参数)
     4:target 之间的依赖 二个target在同一个workspace中的依赖 叫 隐式依赖，也可设置成显式依赖

 Xcode Scheme :  (一个target 编译，运行，测试，归档，打包)的配置 的集合,有一个是活跃的)
     1:系统会自动创建出一个编译方案，默认和项目名称相同，使用的是默认创建的 target,(一个Scheme 必须 绑定一个target才能创建)
     2:管理:创建新的 ，复制，导入，导出，删除，排序，是否显示到操作栏，所属容器，是否分享，编辑
     2:各种操作==>Build(编译) - Run(运行) - Test(测试) - Profile(剖析) - Analyze(分析) - Archive(打包)，每步执行前后 可定制操作（发邮件，运行脚本插件）
 

 Xcode-Project 设置
 （1）Info:
     1:Deployment Target：定义了我们这个工程在部署时使用的最低 iOS SDK 版本。
     2:Configurations：定义了我们在编译的时候可以使用的配置
     3:Localizations：定义了我们应用的本地化语言

 （2）-Build Settings:Target包含
     (一)General       ----通用选项 (标识,签名,部署,icon,添加库，二进制文件)
     (二)Info          ----通用选项 (info.plist，支持的文件类型，导入导出UTIs,APP跳转)
     (三)Build Settings----编译设置 (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)
     (四)Build Phases  ----编译阶段 (依赖target,源代码文件,链接的库,拷贝的资源文件)
     (五)Build Rules   ----编译规则
     (六)Capabilities  ----功能选项，设置对象支持的功能
     (七)Resource Tags ----该功能是将资源放到appstore

Xcode - 配置多个环境变量(对 Projec Configurations target  Scheme 的组合运用)
 
Xcode 所有操作演练 工作界面 设置---都是干什么的 (大概）
 
 导航器区域
 1.项目导航器：项目的源码和资源文件。
    1:Group
        1:New Group  创建一个虚拟的文件夹
        2:New Group from Selection  将选择的 文件 添加到一个 虚拟的文件夹中
    2:File
        1:New File : 提供 Xcode模板 创建一个文件 
            1:选择文件实际所在的文件夹目录,或者new 一个 folder(文件夹)
            2:Options 选项，选择添加到 哪个Group 哪个 Targets 中
        2:Add File to 当前工程  引用一个选定的文件，注意只是引用 不会复制，若此文件不在本工程中 就需要注意了，引用后源文件删除后会报红
        3:直接将文件拖入近工程 choose options for adding these files(选择选项来添加这些文件)
            1:Destination(目的地):Copy items if needed 当此文件不在次项目的文件目录下时候 会copy 一份到项目中，若不选，一旦原文件发生变化则 会报错
            2:Added folders
                1:Create groups  导入文件的时候会是逻辑结构，而不是物理结构 黄色的文件夹结构，和构建的Group是一样的（直接添加它的引用因为groups下的cpp文件是会被编译的）
                2:Create folfer references  创建引入的是蓝色的文件夹结构，物理路径,这些文件不会被编译，所以在使用的时候需要加入其路径 否则编译器就会告诉你找不到xxx.h文件。
        4:http://www.jianshu.com/p/2fb4dd080aef
    3:delete (Remove  References,删除引用 Move to Trash 删除文件)
    4:Sort 排序

 2.符号导航器：显示代码中的类、对象、函数等元素信息。
    1:hierarhical 分层  Flat 平级
    2:符号导航器中所显示出来额符号前面都有一个特殊的图标，用于表示符号元素的种类
         C 类（Class） / f	结构体（Struct) / Pr	协议（Protocol） /S	联合体（Union）/ U	函数（Function）/ K	类型定义（Typedef）
         E	全局变量（Global Variable） / M	方法（Method） /T	枚举（Enum）/ P	属性（Property）  /V	枚举成员（Case）
    3:过滤选择
         第一个过滤按钮（正方形括起来的C）永远选择是指显示类和方法，还是显示全部类型的符号（比如协议、结构、枚举等）。如果选择显示全部类型的符号的话，符号导航栏将会按照类型类进行分组
         第二个过滤按钮（折起来的文件夹）则是泳衣选择是否只显示本地项目中所定义的符号。取消选中之后，符号导航栏将会检索所有当前项目所导入的其他项目、框架中定义中的符号。然后将会显示有多少是来自于本地项目，有多少是来自于系统。
         第三个过滤按钮（正方形括起来的M）用来指定给定符号的成员（比如类的成员）是否显示
 3.搜索导航器：用来显示搜索结果和选择搜索方式。
    1:Find
        1:Text  2:References(引用) 3:Definitions(定义) 4:Regular Expression(正则表达式) 5:Call Hierarchy(调用层次结构)
        2: Containing(包含) 2:Matching(匹配) 3:Starting with (开始的位置) 4:Ending with（结束的位置）
        3: 点击放大镜  insert patterm 插入图案  recent results 最近的搜索结果  clear results 清除结果
    2:Replace
 4.事件导航器：显示在工具区找到的任何事件。比如各种错误等等。
 5.测试导航器：显示单元测试用例以及测试结果，还可以快速执行单元测试。
 6.调试导航器：显示应用程序在调试状态下资源占用状态以及堆栈信息。
 7.断点导航器：显示应用程序中标记的所有断点信息。
 8.日志导航器：显示所有日志信息，包括编译、分析、测试、调试的日志信息。
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 */

