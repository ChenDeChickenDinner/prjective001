/**



 (一)General======>通用选项 (标识,签名,部署,icon,添加库，二进制文件)
 
 1:Identity--身份
     1:display name:项目名称，默认就好 ( CFBundleDisplayName )
     2:Bundle Identifier:包标识符，该ID是唯一的 ( CFBundleIdentidier )
     3:Version:外部版本号，用户能够看到 ( CFBundleShortVersionString )
     4:Build:内部版本号，开发者自己看的，区分测试版本用 ( CFBundleVersion )
 2:Signing--应用程序的签名，如果有开发者账号
     1:Code Signing Entitlements 授权机制
     1:在Xcode的capabilities选项卡下选择一些选项后，Xcode就会生成这样一段XML，Xcode会自动生成一个entitlements文件，然后再需要的时候往里面添加条目。当构建整个应用时，这个文件也会提及给codesign作为应用所需要拥有哪些授权的参考。这些授权信息必须都在开发者中心的AppID中启用，并且包含在配置文件中
     2:Code Signing Identity  配置证书
     3:Development Team  开发者所在的群组
     4:Other Code Signing Flags
     5：Provisioning profile + Provisioning profile (Deprecated) 配置描述文件 自动
 3:Deployment Info--部署信息
     1:Deployment Target:对象支持运行的版本
     2:Devices:支持的设备
     3:Main Interface:启动时加载的主界面，如果使用了storyboard，该值会是Main，如果纯代码编程，则需要设置为空，然后删掉storyboard
     4:Device Orientation:应用支持的方向
     5:Status Bar Style:状态栏的样式
 4:App Icons and Launch Images--图片 +启动图片
 5:Embedded Binaries：绑定的二进制文件，使用了第三方SDK时会需要
 6:Linked Frameworks and Libraries：使用系统自带的SDK时选择，也可以添加第三方框架






 */
