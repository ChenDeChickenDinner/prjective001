//
//  01Product.h
//  NO1
//
//  Created by xs on 2017/12/1.
//  Copyright © 2017年 Touker. All rights reserved.
//


/**


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
