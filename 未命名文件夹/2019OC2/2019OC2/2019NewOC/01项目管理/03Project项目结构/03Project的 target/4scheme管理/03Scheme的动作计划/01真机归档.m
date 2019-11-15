//
//  ViewController.m
//  01TargetInfo
//
//  Created by xs on 2019/4/12.
//  Copyright © 2019 xs. All rights reserved.
//



https://help.apple.com/developer-account/#/dev4c557019f

(一)Apple ID
1:未加入开发者计划的 普通 账户
2:加入 开发者计划的 账户(个人):
3:加入 开发者计划的 账户(公司):
4:加入 开发者计划的 账户(企业):不能发布，只能内部使用，灵活使用不用经过市场流程
5:未加入开发者计划的 但是 某个开发团队的 成员:公司/企业 账户可以创建团队

(二)开发者账户信息
program resources:项目资源
membership:会员详细信息
    1.Program Type:Apple Developer Program
    2.Team Name: xiaowei chen/HWABAO SECURITIES CO.,LTD
    3.Team ID:   LG34P76GS7
    4.Entity Type 账户类型: Individual 个人  Company / Organization 公司组织
    5.Account Holder账户持有人: xiaowei chen
    6.Your Roles你的角色: Account Holder、  Developer



                                                     
(三)电脑CSR文件
 1.钥匙串-证书助理-从证书机构颁发证书->CSR文件标识哪一台电脑
                                                     
                                                     

                                                     
(四)AppIDs:限制哪个app可以参与调式测试发布
 a.App ID Descriptionx:App ID描述 无用参数 只作为开发人员区分使用
 b.App ID Suffixx:App ID通配符
 1.Explicit App ID:一个精确的ID(具体功能调式必须是确定的)
 2.Wildcard App ID:一个模糊的ID(简单调式)
 c.App Servicesx:选择app服务
 
 
 
(五):Devices:限制哪台设备可以参与调式测试
1:Device 就是运行 iOS 系统用于开发调试 App 的设备。每台 Apple 设备使用UDID(Unique Device Identifier）来唯一标识。
2:每个开发者 拥有100台设备，第二年续费的时候才能选择是否保留，平时只能禁言跟恢复
3.UUID
                                                     
                                                     
                                                     
 <A>:certificates(签名证书):限制哪台电脑可以操作
 1.证书类别
 a.iOS App Development:调式证书，最多只能由一个电脑生成1个;别人要使用需要从源头导出P12
 b.Ad Hocand App Store:测试证书与发布证书 最多只能由一个电脑生产2个
    1.一般 内部测试一个 ，发布市场一个 最后隔离开来 不能共用一个
 c1.Apple Push Notification service SSL (Sandbox):推送调试证书
 c2.Apple Push Notification service SSL (Sandbox & Production):推送发布证书
 2.证书信息
 Name: xiaowei chen
 Type:iOS Development
 Expires:Apr 13, 2020
 Created By:xiaowei chen (2332204966@qq.com)
 3.证书操作:Revoke 远端删除
                                                     
                                                     
<B>:Provisioning Profiles:最终的描述文件

1.Development: 真机调式(1.选择appID/2.选择电脑描述文件(唯一1个)/3.选择设备)
2.Ad Hoc:      内部测试(1.选择appID/2.选择电脑描述文件(最多有2个选择)/3.选择设备)
3.App Store:   发布市场(1.选择appID/2.选择电脑描述文件(最多有2个选择))
4.注意点:
 a.描述文件的操作(编辑(三个信息都可以重新编辑) 删除 下载)，描述文件存在有效期限
 b.描述文件的生成无数量限制，但其生成依赖电脑证书，一般又生成人复制给使用人一份即可
 c.如果描述文件所依赖的证书被删除，则会进入失效状态
5.文件信息
 Name:develop
 Type:iOS Development
 App ID:all (com.chen.*)
 Certificates:1 total
 Devices:2 total
 Enabled Services:None
 Status:Active
 Expires:Apr 13, 2020
 Created By:xiaowei chen (2332204966@qq.com)
                                                     
<C>:Xcode证书与描述文件管理
1.配置选项
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
2.存储位置
    1.电脑证书直接安装在电脑的钥匙串中
    2.描述文件安装在/Users/xs/Library/MobileDevice/Provisioning Profiles
                                                     
3.签名证书管理,描述文件等下下载
 A.manage certificates:管理生成电脑证书
 1.可自动生成新的开发或者测试发布证书
 2.一般不进行操作，会有影响描述文件失效的风险
 
 B.download manual profiles:下载更新描述文件
 1.如果远程没有则不会影响本地的
 2.如果本地没有则更新下载远程的描述文件
 3.如果本地描述文件比远程的旧则会更新下载最新的(前提是同一个描述文件)
                                                     
                                                     
 真机调式:
 
 【A】真机调
 1.电脑证书:限制电脑
 2.描述文件:限制app以及设备,再跟电脑证书进行匹配

 【B】他人真机
 1.电脑证书:由别人导出P12文件
 2.描述文件:可下载，或者由他人复制而来，一般不自己再主动生成

 【C】证书或者描述文件更变后的情况
 0.证书或者描述文件到期:运行会失效
 1.证书或者描述文件被编辑或者删除:只要本地的证书跟描述文件没有被删除覆盖则对当前无影响
 2.如果本地的描述文件与电脑证书信息不匹配则无效
 
 【D】新设备快速真机
 3.一个未注册的设备如何快速调式:后台添加设备，编辑描述文件，更新描述文件


归档出APIh包
1.测试AdHoc
     1.电脑证书:ad Hocand App Store类型的(本机直接下载，他机器P12)
     2.描述文件:Ad Hoc类型的
2.发布AppStore
     1.电脑证书:ad Hocand App Store类型的(本机直接下载，他机器P12)
     2.描述文件:App Store类型的

单环境下三种包的出法技巧
1.automatically manage signing 自动管理签名
2.直接把所以类型的证书 与描述文件安装
3.归档选择类型后选择自动管理签名

多环境下三种包的出法技巧
1.快速出dev环境的测试包，快速出生产环境的发布包
2.环境跟包的类型无直接关系，你当前构建的scheme选择的是什么环境就是什么环境
3.通过configuration，在debug /release基础上区分多开发环境
4.通过scheme 制作多个构建计划
     schemeDev:选择Debugdev为运行环境
     schemeFz:选择DebugFz为运行环境
     schemeDebug:选择Debug生产为运行环境
     schemeRelease:选择release生产为运行环境
5.选择不同的scheme构建出不同类型的包



多渠道分发测试
 https://fir.im 认证过
 https://www.pgyer.com
 102332021@qq.com zxcvbnm123...
