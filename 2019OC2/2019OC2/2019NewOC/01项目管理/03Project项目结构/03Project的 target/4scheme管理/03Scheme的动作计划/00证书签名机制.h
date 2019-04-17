//
//  00AppleID.h
//  NO1
//
//  Created by xs on 2017/12/7.
//  Copyright © 2017年 Touker. All rights reserved.
//




/**
http://www.jianshu.com/p/746c43ae04e9
 三.开发证书 Certificates 介绍，生产
 1:它是由一个由权威机构——CA机构（CA =CertificateAuthority），又称为数字证书授权中心（数字证书认证机构）颁发（发行）的，人们可以在网上用它来识别对方的身份
 2:数字证书是一个经 CA 数字签名的包 包含:公开密钥拥有者信息以及公开密钥的文件
 3:公开密钥、名称以及 CA 的数字签名
 3:数字证书还有一个重要的特征就是时效性：只在特定的时间段内有效


 3.1):数字证书的概念
 1:它是由一个由权威机构——CA机构（CA =CertificateAuthority），又称为数字证书授权中心（数字证书认证机构）颁发（发行）的，人们可以在网上用它来识别对方的身份
 2:数字证书是一个经 CA 数字签名的包 包含:公开密钥拥有者信息以及公开密钥的文件
 3:公开密钥(公钥）相当于公章 +    名称    +    CA 的数字签名
 3:数字证书还有一个重要的特征就是时效性：只在特定的时间段内有效
 3.2):根证书的概念
 1:根证书是被严格限制和确认的，根证书的颁发者被称之为 Root Certificate Authority（Root CA）。
 2:某一认证领域内的根证书是 CA 认证中心给自己颁发的证书（自行签名），安装根证书意味着对这个 CA 认证中心的信任。

 3.3):可信的根证书列表（一级证书）
 1:可信的根证书列表”是指操作系统开发商通过严格地审核，将安全可靠、可被信任的 CA 机构纳入白名单，并将这些权威可信 CA 的根证书预安装到操作系统中。
 2:现代网络操作系统都会内置一份可信的根证书列表（Firefox 的根证书列表独立于操作系统之外),保证信任链起点的安全
 3:在macOS 的 Keychain Access中，可查看系统根证书（或系统证书）：Apple Root CA

 3.4）iOS（开发）证书的根证书 ---AppleWWDRCA.cer（二级证书）
 1：AppleWWDRCA.cer 是由苹果公司一级认证中心 Apple Certification Authority（Apple Root CA）给下属的二级证书机构Apple Worldwide Developer Relations Certification Authority颁发的证书
 2：iOS 以及 Mac OS X 系统（在安装 Xcode 时）将自动安装AppleWWDRCA.cer这个中间证书（Intermediate Certificates），它实际上就是 iOS（开发）证书的证书，即开发根证书。

 3.5）申请证书，通过 Keychain证书助理从证书颁发机构请求证书
 1: 在 Keychain Access|Keys 中将新增一对非对称密钥对 Public Key（公共秘钥） / Private Key （私有）秘钥
 2:私钥private key始终保存在 Mac OS 的 Keychain Access 中，用于签名（CodeSign）本机对外发布的 App
 3:公钥public key一般随证书（随Provisioning Profile，随 App 安装）散布出去，对 App 签名进行校验认证
 2: 生成 一个 CSR 文件（包含:开发者身份信息 + 公钥 ）
 3: 利用 CSR 文件 在开发者网站 换取 （ios_development.cer）数字证书

 3.6)安装证书: 双击 数字证书 将其 安装到 电脑上 【iPhone Developer: *@gmail.com (**********)】三级来发证书
 1：(利用AppleWWDRCA证书公钥对该开发证书数字签名进行解密和校验。校验成功会标记此证书有效)
 2:最后 每一个三级开发证书安装成功后
 1:在Keys 中 ，创建 CSR 时生成的 Key Pair 中的（私钥）前面的箭头，可以查看到包含其对应（公钥的证书） 私钥 包含证书
 2:在Certificates 中，展开安装的证书（ios_development.cer）前面的箭头，可以看到其对应的（私钥）   证书 包含 私钥


 Provisioning Profiles （xxxx.mobileprovision）   描述文件
 （1）Name：该mobileprovision的文件名。

 （2）UUID：该mobileprovision文件的真实文件名。

 （3）TeamName：Apple ID账号名。

 （4）TeamIdentifier：Team Identity。

 （5）AppIDName：explicit/wildcard App ID name（ApplicationIdentifierPrefix）。

 （6）ApplicationIdentifierPrefix：完整App ID的前缀（TeamIdentifier.*）。

 （7）DeveloperCertificates：包含了可以为使用该配置文件应用签名的所有证书。

 （8）Entitlements键对应的：
 1:keychain-access-groups：
 每个应用程序都有一个可以用于安全保存一些如密码、认证等信息的keychain，一般而言自己的程序只能访问自己的keychain。通过对应用签名时的一些设置，还可以利用keychain的方式实现同一开发者签证（就是相同bundle seed）下的不同应用之间共享信息的操作
 2:application-identifier：带前缀的全名，例如
 3:com.apple.security.application-groups：App Group ID
 4:com.apple.developer.team-identifier：同Team Identifier

 （9）ProvisionedDevices：该mobileprovision授权的开发设备的UDID 。




 (七):Provisioning Profile 描述文件  (xxxx.mobileprovision文件) ---->其作用是 决定 Xcode 用 (哪个证书)来签署应用程序

 1: Profile = (App IDs + Devices +证书 +用途)
 2: 其作用是 决定 Xcode 用 (哪个证书)来签署应用程序，并将其嵌入到 .ipa包，安装应用程序时文件被拷贝到 iOS 设备中，通过它来认证安装的程序


 3:Provisioning Profile被配置到【XcodeTarget|Build Settings|Code Signing|Provisioning Profile】下，然后在Code Signing Identity下拉可选择Identities from Profile "..."（即Provisioning Profile中包含的Certificates）


 4:TeamProvisioning Profile的概念
 1：每个 Apple 开发者账号都对应一个唯一的Team ID，在 Xcode 中添加 Apple Developer Account(账户) 时,自动生成iOS Team Provisioning Profile
 2：其包含:一个为Xcode iOS Wildcard App ID(*)生成的iOS Team Provisioning Profile:*（匹配所有应用程序)
 3：作用:账户里所有的 Development Certificates 和 Devices 都可以使用它在这个 team 注册的所有设备上调试应用程序
 4:  也被配置到【XcodeTarget|Build Settings|Code Signing|Provisioning Profile】下，同时需要在【XcodeTarget|General|Identity】下指定 Team 账号ID。

 */
