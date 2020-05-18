
//查看gem版本
gem -v

// 更新升级gem，国内需要切换源
sudo gem update --system

//查看ruby版本
ruby -v

//查看ruby源
gem sources -l


//安装CocoaPods
sudo gem install cocoapods
//卸载CocoaPods
sudo gem uninstall cocoapods

pod --version

//所有的第三方开源库的Podspec文件都托管在https://github.com/CocoaPods/Specs
//将所有第三方的Podspec索引文件更新到本地的~/.cocoapods/repos目录下
pod setup
1.如果没有执行过 pod setup，那用户根目录下～找不到.cocoapods/repos目录的，没有创建这个目录。

2.如果执行 pod setup，并且命令没有执行成功，那么会创建~/.cocoapods/repos目录，只不过目录是空的。

3.如果执行 pod setup，并且命令执行成功，说明把github上的Podsepc文件更新到本地，
那么会创建~/.cocoapods/repos目录，
并且repos目录里有一个master目录，这个master目录保存的就是github上所有第三方开源库的Podspec索引文件


pod repo add NAME URL
pod repo list

pod repo update 更新本地仓库
pod repo update ~/.cocoapods/repos/***/ 更新本地指定仓库

pod search 查找某一个开源库。查找开源库之前，默认会执行pod repo update指令
pod search AFNetworking --simple


列出所有项目依赖仓库中的pod依赖库

pod cache



pod init
在当前目录下创建一个podfile文件，我们可以通过将需要的pod依赖库添加到


pod install
会根据Podfile.lock文件中列举的版本号来安装第三方框架
如果一开始Podfile.lock文件不存在, 就会按照Podfile文件列举的版本号来安装第三方框架
安装开源库之前, 默认会执行pod repo update指令
pod install --no-repo-update


pod update
将所有第三方框架更新到最新版本, 并且创建一个新的Podfile.lock文件
安装开源库之前, 默认会执行pod repo update指令
pod update --no-repo-update 这条命令表示只根据本地目录更新库，不需要拉取远程



pod lib create [仓库名]:在本地创建一个基于pod模板的git仓库
pod lib lint:pod本地库验证
pod spec lint:pod远程库验证
pod repo push 索引库名 podspec文件名:命令执行会先将pod索引添加到本地的索引库,然后会自动推送到远程的索引库



pod lib lint （从本地验证你的pod能否通过验证）
pod spec lint （从本地和远程验证你的pod能否通过验证）

pod lib lint --verbose （加--verbose可以显示详细的检测过程，出错时会显示详细的错误信息）
pod lib lint --allow-warnings (允许警告，用来解决由于代码中存在警告导致不能通过校验的问题)
pod lib lint --help （查看所有可选参数，可选参数可以加多个）

