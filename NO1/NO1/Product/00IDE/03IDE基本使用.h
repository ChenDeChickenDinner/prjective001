//
//  03IDE基本使用.h
//  NO1
//
//  Created by xs on 2017/12/1.
//  Copyright © 2017年 Touker. All rights reserved.
//

/**
功能分区

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
 3:Metal Library     Metal:iOS8以后苹果出的GPU加速3D绘图的新API，创建Metal库

 Xcode 创建文件界面
 1: iOS watchOS tvOS macOS
 2:Source 1(Cocoa Touch Class +  UI Test Case Class + Unit Test Case Class + Playground + Swift File )
 2(Objective-C File  +  Header File        + C File    + C++ File + Meatl File)
 3:User Interface
 1:Storyboard  View  + Empty +    Launch Screen
 4:Core Data   + Apple Watch + Resource + Other



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
 C 类（Class） / f    结构体（Struct) / Pr    协议（Protocol） /S    联合体（Union）/ U    函数（Function）/ K    类型定义（Typedef）
 E    全局变量（Global Variable） / M    方法（Method） /T    枚举（Enum）/ P    属性（Property）  /V    枚举成员（Case）
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

 1:preferences--偏好设置

 general-普通设置
 1：Show live issues:这个是表示在你编辑代码的时候，是否实时分析你写的代码，并实时的报告错误。一般选中。
 2：Continue build after error:这个一般没有太多的用处，可以忽略。
 3:Locked Files: Automatically unlock files
 4:Find Navigator Detail
 Issue Navigator Detail
 5:Dialog Warnings:
 Identity--身份
 1:Display name
 2:Bundle Identifie
 3：version Build
 Signing--签署 Automaticallu manage signing
 Deployment Info--
 1:Deployment target:
 2:devies
 3:main infterace
 4:device orientation
 5:ststus bar style
 App Icons and Launch Images
 App icons source
 launch images sourc
 launch screen file
 Embedded Binaries
 link Frameworks and libraries


 Project

 Info
 1:iOS Deployment target:
 2:Configurations
 3：Localizations
 Buid Settings



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

 */
