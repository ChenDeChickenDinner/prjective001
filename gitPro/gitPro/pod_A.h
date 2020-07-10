
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



pod repo list
pod repo add nameUrl


pod repo update 更新本地仓库
pod repo update ~/.cocoapods/repos/***/ 更新本地指定仓库

pod repo push 索引库名 podspec文件名:命令执行会先将pod索引添加到本地的索引库,然后会自动推送到远程的索引库


pod search 查找某一个开源库。查找开源库之前，默认会执行pod repo update指令
pod search AFNetworking --simple






列出所有项目依赖仓库中的pod依赖库

pod cache
pod cache clean --all 


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
pod lib lint --verbose （加--verbose可以显示详细的检测过程，出错时会显示详细的错误信息）
pod lib lint --allow-warnings (允许警告，用来解决由于代码中存在警告导致不能通过校验的问题)
pod lib lint --help （查看所有可选参数，可选参数可以加多个）

pod spec lint --allow-warnings


pod repo push myrepo ZCPKit.podspec --allow-warnings

.在A私有库中引入了B私有库，导致pod lib lint不通过的问题在调用命令时需要添加B私有库所在的repo源地址
pod lib lint <文件名>.podspec --sources='<私有库所在repo的source>,https://github.com/CocoaPods/Specs.git'

//强制覆盖之前已经生成过的二进制库
--force

//生成静态.framework
--embedded

//生成静态.a
--library

//生成动态.framework
--dynamic

//动态.framework是需要签名的，所以只有生成动态库的时候需要这个BundleId
--bundle-identifier

//不包含依赖的符号表，生成动态库的时候不能包含这个命令，动态库一定需要包含依赖的符号表。
--exclude-deps

//表示生成的库是debug还是release，默认是release。--configuration=Debug
--configuration


--no-mangle
//表示不使用name mangling技术，pod package默认是使用这个技术的。我们能在用pod package生成二进制库的时候会看到终端有输出Mangling symbols和Building mangled framework。表示使用了这个技术。
//如果你的pod库没有其他依赖的话，那么不使用这个命令也不会报错。但是如果有其他依赖，不使用--no-mangle这个命令的话，那么你在工程里使用生成的二进制库的时候就会报错：Undefined symbols for architecture x86_64。

--subspecs

//如果你的pod库有subspec，那么加上这个命名表示只给某个或几个subspec生成二进制库，--subspecs=subspec1,subspec2。生成的库的名字就是你podspec的名字，如果你想生成的库的名字跟subspec的名字一样，那么就需要修改podspec的名字。
这个脚本就是批量生成subspec的二进制库，每一个subspec的库名就是podspecName+subspecName。

--spec-sources

//一些依赖的source，如果你有依赖是来自于私有库的，那就需要加上那个私有库的source，默认是cocoapods的Specs仓库。--spec-sources=private,https://github.com/CocoaPods/Specs.git。
