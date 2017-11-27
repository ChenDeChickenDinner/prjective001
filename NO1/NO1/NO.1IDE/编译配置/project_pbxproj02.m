//
//  project_pbxproj02.m
//  XcodeStudy
//
//  Created by xs on 2017/3/9.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "project_pbxproj02.h"

@implementation project_pbxproj02

@end
/**
 
 
 Xcode 打开界面
 
     1.使用Playground来开始项目，帮助我们快速实现自己的想法，比如突然想到一个东西，想验证一下，但是新建一个项目的话，需要重新跑模拟器，很麻烦，这个时候用Playground就是最好的选择。
     2.创建一个新的项目，如果需要重头开始写一个项目的话，那就是选这个。
     3.从代码库下载代码，可以从服务器上的代码库里面下载到本地，然后运行，通常用于多人协作开发。
 
Xcode 创建项目界面
    1:创建各种项目
        1：Single View Application  创建一个带有空白视图的简单应用
        2:Game 创建一个简单的游戏应用
        3: Master-Detail Application 创建一个可以查看详细信息的应用
        4: Page-Based Application  创建一个带翻页效果的应用
        5: Tabbed Application  创建一个底部带标签的应用
        6: Sticker Pack Application  Xcode8新出的，创建一个表情包应用
        7: iMessage Application  Xcode8新出的，创建一个iMessage应用
    2:创建一个库文件打包用的。
         1:Cocoa Touch Framewor 创建出一个框架项目，项目不能运行，但可以编译出框架
         2:Cocoa Touch Static Library  创建一个静态库项目，项目不能运行，但可以编译出静态库
         3:Metal Library	 Metal:iOS8以后苹果出的GPU加速3D绘图的新API，创建Metal库

 Xcode 创建文件界面
   1: iOS watchOS tvOS macOS
   2:Source 1(Cocoa Touch Class +  UI Test Case Class + Unit Test Case Class + Playground + Swift File )
            2(Objective-C File  +  Header File        + C File    + C++ File + Meatl File)
   3:User Interface
        1:Storyboard  View  + Empty +    Launch Screen
   4:Core Data   + Apple Watch + Resource + Other


 
************ Xcode 界面详解 ************
 1:顶部工具栏 + 标签页
 2:导航器区域
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
     4.事件导航器：显示在工具区找到的任何事件。比如编译错误、语法错误、库链接异常，以及错误提示等
         1:Buildtime
             1:第一个过滤按钮（时钟）用来选择是否只显示最后一次编译中所发现的问题，也就是只显示“新”问题。当然，仅限于警告
             2:第二个过滤按钮（惊叹号）用来选择是否只显示错误信息，而隐藏警告的出现。


         2:Runtime
     5.测试导航器：显示单元测试用例以及测试结果，还可以快速执行单元测试。
     6.调试导航器：显示应用程序在调试状态下资源占用状态以及堆栈信息。(CPU  + Memory + Disk + Network)!!!!!!
     7.断点导航器：显示应用程序中标记的所有断点信息。!!!!!!
     8.日志导航器：显示所有日志信息，包括编译、分析、测试、调试的日志信息。!!!!!!


 5:工具区域!!!!!!!!!!
 6:调试区域!!!!!!!!!!!


************ Xcode 顶部菜单栏 ************
1:Xoced
    1:Preferences 偏好设置 
    Behaviors 
    Open Developer Tool (Instruments + Simulator Simulator Watch +  Accessibility  Inspector +  FileMerge + Application Loader)
    Services
    Hide Xcode / Others /Show All
2:File(文件操作)
3:Edit(编辑操作)
4:View(界面操作)
5:Find(操作)
6:Navigate(导航操作)
7:Editor(编辑器操作)
8:Product(产品操作)

9:Debug(调试操作)
     Pause : 暂停 会 切换成继续
     Continue to Current Line：走到你光标选中的这行
     Step Over ： 跨越
     Step Into ：步入
     Step Out ：走出
     Step Over Instruction： 跨过指示
     Step Over Thread ：单步执行在线程
     Step Into Instruction ：步入指示
     Step Into Thread ：单步执行线程
     Capture GPU Frame: 捕获GPU位置
     Simulate Location: 模拟模拟器的位置
     Simulate Background Fetch: 让模拟器去后台
     iCloud: 苹果云相关
     View Debugging: 关于视图的调试
     Take Screenshot of Active Device：截图
     Capture View Hierarchy: 用3D图 来捕获视图层次
     Show View Frame: 在模拟器上显示各个控件的尺寸大小
     Show Alignment Rectangles: 显示对齐矩形
     Show View Drawing: 显示查看绘图
     Show Responsive Scrolling Status: 显示响应滚动状态
     Deactivate Breakpoints 停用中断点。
     Breakpoints: 相当于左下角的加号，增加各种断点。
     Debug Workflow：可以显示内存和清除打印等操作。
     Always Show Disassembly: 这要是勾上就只显示堆栈信息不看代码
     Attach to Process by PID or Name: 设置权限id或name
     Attach to Progress: 附加到进程
     Detach: 跳过所有的断点
    10:SourceControl(操作)
 
11: Source Control:
     第一行是分支管理，可以创建分支合并分支，配置分支的源等等。
     Create Working Copy：项目中如果有地方是引用的那就copy一下。
     Checkout：可以选择切换分支。
     Commit ：提交
     Push ： 上传代码
     Pull ：拉代码
     Refresh Status：刷新状态
     Discard Changes ：放弃所有修改。
     Add Selected Files : 将选中的这些问号文件add一下。
     Discard Changes in selected Files : 将选中的这些文件放弃修改。
     Mark Selected Files as Resolved: 相当于合并或rebase过程中的解决。
     History：可以看当前分支的log历史。
12:Window(操作)
     Minimize: 最小化
     Zoom：相当于windows的“还原”
     Show next tab: 如果你有两个tab的话这个就是切换tab
     Show previous tab: 同上
     Documentation and API Reference：打开xcode文档
     welcome to xcode: 来到开始页面
     Device：硬件，能看到MAC ，模拟器和手机
     Organizer：打开可以看到Archives 和 Crashes
     Project：查看最近项目，也可以在这里删除Derived Data
     Bring all to Front：把所有xcode打开的都置顶。
13: Help
     Search : 在目录中搜索功能。
     Documentation and API Reference：打开xcode文档
     Xcode OverView：打开xcode综述
     Release Notes：打开xcode各版本更新迭代的log。
     What&#39;s New in Xcode：有什么新特性
     Quick help for selected Item：快速帮助，相当于按着option点。
     Search Documentation for Selected Text：详细帮助，直接在文档里找到这个
 
 xcode->preference
 1 General通用设置
 1：Issues
 show live issues显示当前问题 设置Xcode是否实时监测当前文件中存在的问题
 continue building after errors 出现错误后仍然继续编译，默认情况下，发生错误后，会停止编译
 2:locked files:默认情况下，Xcode会锁定用户正在编辑的文件，防止被其他工具修改，勾选后，会允许其他工具修改
 3:find navigator detail:搜索导航器细节，可以选择搜索到的项目可以占据多少行的显示空间。
 4:issue navigator detail:问题导航器细节，可以选择当前问题占据多少行的显示空间。
 5:dialog warnings:对话框警告，重置不要再询问我，让其再次弹出警告。

 2 Accounts账户 用来管理苹果开发者账号以及Git相关的账户信息。
 1:点击+号，会出现添加账户，添加资源仓库，添加服务器三个选项。

 3Behaviors行为
 1:编译、测试、运行、CUP帧捕获、搜索、自动集成、文件部分。
 2:每个部分有各种阶段，包括开始、发现问题、成功、失败等阶段。对于每一阶段，我可以依次进行相关行为配置
 1:play sound:阶段完成时播放声音
 2:speak announcement using:使用系统自带的声音为开发者播报当前程序处于何种阶段
 3:notify using bezel or system notifacation:使用系统通知或者提醒卡来通知
 4:bounce Xcode icon in dock if application inactive:如果应用处于未激活状态，在dock中跳动
 5:show...:6个选项，分别设定xcode执行到该阶段时，要显示还是隐藏那些导航栏，那些窗口等
 6:navigate to:执行到该阶段时，跳转到第一条发现的问题还是当前日志
 7:run:执行到该阶段，执行选项所设定的apple script脚本

 4 Navigation导航
 1:activation:当打开某个标签页或者窗口时，让其保持活动状态。
 2:navigation:选择在使用导航区域的时候，是用的主编辑器primary还是辅助编focused辑器来打开新的导航文件
 3:optional navigation:当使用optional键来进行导航的时候，是使用同一个助理编辑器打开，还是使用另一个助理编辑器打开，或者另一个标签页或另一个窗口。
 4:double click navigation:双击导航时，使用另一个标签打开还是另一个窗口打开，或者让其和单击的操作相同。
 5 Fonts & Colors字体和颜色


 6 Text Editing文本编辑
 editing编辑  和  indentation缩进
 1:line numbers:是否显示行号
 2:code folding ribbon：是否显示代码折叠带。代码级别相同的代码段，左侧会有一个灰度不同的色带显示，灰度相同，表示同一个级别。
 3:focus code blocks on hover:是否悬停是聚焦代码块。鼠标悬停时，会有一个矩形边框来聚焦代码所在类别。
 4:page guide at column:页面的最大行长，设定一行最多有多少个字符，如果超出行长，会自动换行
 5:highlight instances of selected symbol:高亮选中的符号，高亮显示的符号是一条虚线显示的，delay表示高亮效果多久会显示出来。
 1:suggest completions while typing:输入时显示代码提示
 2:use escape key to show completion suggestions:使用esc来显示代码提示
 3:automatically insert closing braces:自动插入结束符
 4:enable type-over completions:启动结束符自动完成，即输入{后，自动补齐后面的}
 automatically trim trailing whitespace:自动删除代码两侧的空格

 show iteration counts:显示迭代计算


 可以设置tab和缩进的空格数目。
 line wrapping:换行，可以设置是否允许换行，允许的话，还可以设置换行之后行的缩进字符长度
 syntax-aware indenting:语法换行，根据语法来自动决定换行的行为
 Automatic indent for:自动缩进，设定哪些符号可以自动执行自动缩进功能



 7 Key Bindings快捷键
 8 Source Control源代码管理
 1:enable source control:启用源代码管理，决定了源代码管理是否可用。
 refresh local status automatically:自动刷新本地状态，决定是否自动更新
 refresh server status automatically:自动刷新远程服务器状态，决定远程代码源中代码是否会自动保存
 add and remove files automatically:自动添加和移除文件，当远程代码库更新后，自动添加和移除本地项目所没有的文件
 show local revision on ... side:在...侧显示本地版本，决定本地版本在哪一侧。

 9 components组件 可以下载不同系统的模拟器SDK组件和参考文档。
 10 Locations位置  配置常用的路径
 1:derived data:缓存文件路劲
 2:archives:打包文件路径
 3: command line tools:命令行工具，选择使用哪一个版本的命令行工具来执行程序
 4:custom paths:定义一些路径的别名，方便使用。


 

 
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






 ************  APP-基本要素 *******
0）:  S = TARGET_NAME-->目标工程名    （（随工程创建的时候生产）Target 层级才    有，不能修改 除非删除此Target（随Target内置））

1）:Target - build Setting - Packaging 中 + Asset catalog compiler - options
     1：product bundle identifier：==>PRODUCT_BUNDLE_IDENTIFIER(A)（默认 = 创建时候的设置）
     2：product name： ==> PRODUCT_NAME(B)  （默认 = S ）
     3：Asset Catalog App Icon Set Name  App Icon
2）info.plist 中
     0：Bundle identifier     App标识  （默认 = A =  PRODUCT_BUNDLE_IDENTIFIER）,可以自己改 但不影响 A
     1：Bundle display name  显示的名称  （默认 = B = PRODUCT_NAME） 可以自己改 但不影响 B
     2：Bundle name          App文件夹名 （默认 = B =  PRODUCT_NAME）, 可以自己改 但不影响 B
     3：Executable name      执行程序名

 
(一)Apple ID
     1:未加入开发者计划的 普通 账户
     2:加入 开发者计划的 账户(个人)
     3:加入 开发者计划的 账户(公司)
     4:未加入开发者计划的 但是 某个开发团队的 成员

(二)加入开发者计划后 Apple ID账户的性质
     1:Program Type:
     2:Team Name: 团队名称(自建)
     3:Team ID: 团队编号（是由苹果提供的）
     4:Entity Type:账户类型（Individual 个人），（Company 公司），（Company / Organization）
     5:Team Agent:团队代理
     6:Your Role :你的角色


(三)Bundle ID（bundle identifier）
    1:Bundle ID是用来唯一标识一个app的字符串


(四)APP ID
    1:APP ID是用来标识单个development team(开发组)中一个或一组app的字符串。它由两部分组成，Team ID和bundle ID search string(这里可以理解为就是某个app的bundle ID)，中间由 . 连接
    2:在 Identifiers 中 Explicit App ID：唯一的App ID，这种App ID用于唯一标识一个应用程序，Wildcard App ID：通配符App ID，用于标识一组应用程序
 
(五)Device（设备）
    1:Device 就是运行 iOS 系统用于开发调试 App 的设备。每台 Apple 设备使用UDID(Unique Device Identifier）来唯一标识。
    2:每个开发者 拥有100台设备，第二年续费的时候才能选择是否保留，平时只能禁言跟恢复



(六):Certificates(证书) (ios_development.cer) ----->其作用是 是用来给应用程序签名的
    0:主账号 : 在 环境（某台Mac）=====》 生成的用来(测试，发布)的开发证书
    1:安装后 在 钥匙串中 【iPhone Developer: *@gmail.com】

(七):Provisioning Profile 描述文件  (xxxx.mobileprovision文件) ---->其作用是 决定 Xcode 用 (哪个证书)来签署应用程序,嵌入到 .ipa包
    0:主账号 : 在 环境（某台Mac）--->选择 App IDs + Devices + 对应用途的开发证书=====》生成的用来(测试，发布)的描述文件
    1:被配置到 Code Signing|Provisioning Profile下
 
 Certificates 的生成 过程
 Provisioning Profil 的生成 过程
 
 Certificates + Provisioning Profil 的管理（创建，删除，活跃状态，限制，时效，操作影响）

(六 + 七)1:环境====》 某台Mac + 当前运行的App ID  + 当前Device
        2:签名====》选择主账号 Team +选择开发证书(安装，选择) + 描述文件(安装，选择）
        3:验证
            1:真机测试
            2:打测试包
            3:打发布包


 
(八)各种账号,Mac 设备 下的 依赖
    1:主账号情况下（多台Mac 多台设备）（分不分 个人，公司账号）
        1:主账号 自己测试
        2:空账号 测试
    2:Tema成员账号情况下（多台Mac 多台设备）

(九)在 某项 目的 达成的 情况下 ，删除 更改证书 对之前状态的影响
 
(十) 打包 测试  发布  自动构建测试



 

 ************   文件结构 沙盒 文件操作 位置 ************
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






 Xcode上手之库、框架、包


 APP 的 运行---（AppDelegate--xx--xx）--前后台 手机对他的管理

 版本升级跳转 对应的下载页，消息推送，友盟数据统计，分享，

 协调技术:  1：UI 2:H5,JS 3:三方库引用
 APP内部的所有东西 (基础 + 业务):用户-- 登录-secion 行情：上证 开户 中卓 4：股票账户
 版本管理: git  json标准-请求--抓取--调试
 debug调试 命令行-调式 都是干什么的（的细节）内存分析 程序从 创建 安装运行
 基础视频学习
*/
