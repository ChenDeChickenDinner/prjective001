//
//  02开发组签名证书.m
//  2019OC2
//
//  Created by xs on 2019/3/20.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "02开发组签名证书.h"

@implementation _2_______



@end
/*
 1.开发者账号
 a.个人账号:
 b.公司账号:
 c.企业账号:不能发布，只能内部使用，灵活使用不用经过市场流程
 d.公司/企业账号 可以创建团队 将开发者的的appleID直接加入team
 */
/* 开发者账号信息
 program resources:项目资源
 membership:会员详细信息
 Program Type:Apple Developer Program
 Team Name: xiaowei chen/HWABAO SECURITIES CO.,LTD
 Team ID:   LG34P76GS7
 Entity Type 账户类型: Individual 个人  Company / Organization 公司组织
 Account Holder账户持有人: xiaowei chen
 Your Roles你的角色: Account Holder、  Developer
 */
/*签名证书 与描述文件
 <A>:certificates:限制哪台电脑可以操作
 1.由当前电脑生成的CSR文件:标识哪一台电脑
 2.证书分类型:
 a.iOS App Development:
    1.调式证书，最多只能由一个电脑生成一个;别人要使用需要从源头导出P12
 b.Ad Hocand App Store:
     1.测试证书与发布证书 最多只能由一个电脑生产2个
     2.证书可以在远端被 撤销删除
 c1.Apple Push Notification service SSL (Sandbox):推送调试证书
 c2.Apple Push Notification service SSL (Sandbox & Production):推送发布证书

 <B>:Identifiers:限制哪个app可以参与调式测试发布
 a.App ID Descriptionx:App ID描述
 b.App ID Suffixx:App ID通配符
 1.Explicit App ID:一个精确的ID
 2.Wildcard App ID:一个模糊的ID
 c.App Servicesx:选择app服务


 <C>:Devices:限制哪台设备可以参与调式测试
 1.Register Device:注册一个设备


 <D>:Provisioning Profiles:最终的描述文件
 1.选择类型
     a.Development: 真机调式(appID/电脑/设备)
     b.Ad Hoc:内部测试(appID/电脑/设备)
     c.App Store:发布市场(appID/电脑)
 2.描述文件可以被编辑或者删除，描述文件存在有效期限
 3.描述文件的生成无数量限制，但其生成依赖电脑证书，一般又生成人复制给使用人一份即可
 4.如果描述文件所依赖的证书被删除，则会进入失效状态

 */
/*
 真机调式:
 【A】Xcode7.0之前:限制(账号/电脑/设备/appID)
 a.真机调式条件
 1.电脑证书:限制电脑
 2.描述文件:限制app以及设备,再跟电脑证书进行匹配
 b.安装选择证书以及描述文件
 1.电脑证书直接安装在电脑的钥匙串中
 2.描述文件安装在/Users/xs/Library/MobileDevice/Provisioning Profiles
 c.Xcode配置选择证书与描述文件
 1.电脑证书:build setting-->code signing identity:选择证书
 2.描述文件:build setting-->provisioning profile(deprecated):选择描述文件(需要登录苹果账号)

 d.他人真机
 1.电脑证书:由别人导出P12文件
 2.描述文件:可下载，或者由他人复制而来，一般不自己再主动生成

 【B】Xcode7.0之前后:
 1.登录一个免费的苹果账号，选择自动管理证书，运行自动下载证书描述文件
 2.进入app选择信任描述文件

 【C】证书或者描述文件更变后的情况
 0.证书或者描述文件到期:运行会失效
 1.证书或者描述文件被编辑或者删除:只要本地的证书跟描述文件没有被删除覆盖则对当前无影响
 2.如果本地的描述文件与电脑证书信息不匹配则无效
 3.一个未注册的设备如何快速调式:后台添加设备，编辑描述文件，更新描述文件
*/
/*构建打包--->api包
 【A】:AdHoc 测试包
 1.电脑证书:ad Hocand App Store类型的
 2.描述文件:Ad Hoc类型的
 【B】:app Store发布包
 1.电脑证书:ad Hocand App Store类型的
 2.描述文件:App Store类型的
 【c】:导出ipa包类型选择:
 1.你当前编译运行选择的是什么类型的描述文件就选择导出什么类型的包
 */
/*真机，打测试包，打发布包总结
 1.电脑证书:都需要找别人要对应类型的P12文件，安装P12
 2.描述文件:自己下载对应类型的描述文件安装
 */
/*ipa安装
1.Xcode-devices-installed apps+
2.iTools-应用-安装
*/
/*ipa扫描安装
1.单环境分发
2.多环境独立
 */
/*实际项目中:configurations、target、scheme、证书描述文件结合

 A.不同配置环境配置签名证书
 1.一个target的各种配置环境可以选择不同的描述文件
 2.但一般不在编译配置上管理不同类型的包,而是选择同一种描述文件

B.项目操作
 1.多个configurations(Debugdev/DebugFz/Debug生产/release生产);
 2.一个target(只有一个产品):在此一般各种环境设置的证书描述文件为同一套(默认是adHoc的)
 3.多个schemes(多个机会):在此只能选择不同的运行环境
     schemeDev:选择Debugdev为运行环境
     schemeFz:选择DebugFz为运行环境
     schemeDebug:选择Debug生产为运行环境
     schemeRelease:选择release生产为运行环境
 C.项目操作总结
     a.平时以adHoc类型作为默认证书描述文件配置
     b.在发布阶段,手动选择正确环境的scheme,选择发布的证书描述文件
 */
/*证书配置
 BuildSetting-signing
 a.Devalopment Team(选择开发组):
 b.Code Signing style(签名管理方式):自动/手动
 c.Code Signing Identity(签名证书):
     1.自动:(iOS Develope/iOS Distribution)
     2.手动:具体某个证书
 d.Provisioning Profile(描述文件):自动

 General-signing:
 a.自动:选择 Team,自动读取描述文件+签名证书,最后结果状态展示提示
 b.手动:各种配置下选择可用的描述文件，自动匹配对应的开发组与签名证书
 */
/*签名证书管理,描述文件等下下载
 2.account主动更新
 A.manage certificates:管理生成电脑证书
 1.可自动生成新的开发或者测试发布证书
 2.一般不进行操作，会有影响描述文件失效的风险

 B.download manual profiles:下载更新描述文件
 1.如果远程没有则不会影响本地的
 2.如果本地没有则更新下载远程的描述文件
 3.如果本地描述文件比远程的旧则会更新下载最新的(前提是同一个描述文件)
 */
