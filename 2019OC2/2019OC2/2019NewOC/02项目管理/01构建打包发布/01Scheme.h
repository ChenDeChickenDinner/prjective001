//
//  01Product.h
//  NO1
//
//  Created by xs on 2017/12/1.
//  Copyright © 2017年 Touker. All rights reserved.
//


/**



 1：前提条件是什么/ 2：生成过程中做了什么，验证了什么/ 3：包，包含什么，适用于什么场景




 Xcode
 Commdent B :--->直接编译，链接====>生成 .app 文件
 Archives:  --->直接编译，链接====>生成 .xcarchive 文件
 export: --->导出 ====>生成 .ipa 文件






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





 
 在 Edit Scheme 设置中 程序 运行的各个阶段 (Build - Run - Test - Profile - Analyze - Archive)选择不同的编译配置
 产品细节（包含什么，名字，签名，证书，版本，图片，id）

配置-编译-链接-生成各形式产品（配置的那些参数 到最后的ipa包中 都去哪里）

 各种产品形式（analyze/archive/ipa/.app/）

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
 */
