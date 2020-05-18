





4.
//进入项目的根目录
cd ~/Desktop/Projects/JYCocoaPodsTest
//新建一个名为Podfile的文件
1 touch Podfile



2. Podfile.lock文件
最后一次更新Pods时, 保存所有第三方框架的版本号

3. pods目录
保存通过pod install或者pod update下载下来的第三方开源库的源代码


4. xxx.xcworkspace文件
重新生成一个工作空间，打开这个工程文件来进行开发


 platform :iOS, '7.0'
指定了开源库应该被编译在哪个平台以及平台的最低版本。
若不指定平台版本，官方文档里写明各平台默认值为iOS：4.3,OS X：10.6,tvOS：9.0,watchOS：2.0



source: 是指定pod的来源。如果不指定source，默认是使用CocoaPods官方的source。(建议使用默认设置)
# 使用其他来源地址
source 'https://github.com/artsy/Specs.git’
# 使用官方默认地址（默认）
source 'https://github.com/CocoaPods/Specs.git'

workspace : 默认情况下，我们不需要指定，直接使用与Podfile所在目录的工程名一样就可以了

target ‘A'do
    pod 'AFN'
end
target: 在制定的快内定义pod target和指定的依赖范围吗


inhibit_all_warnings!
屏蔽cocoapods库里面的所有警告
这个特性也能在子target里面定义,如果你想屏蔽某pod里面的警告也是可以的: pod 'JYCarousel', :inhibit_warnings => true


use_frameworks!
*通过指定 use_frameworks! 要求生成的是framework而不是静态库，swift没有静态库。
*如果使用use_frameworks!命令会在Pods工程下的Frameworks目录下生成依赖库的framework*
*如果不使用use_frameworks!命令会在Pods工程下的Products目录下生成.a的静态库*

//指定某个pod使用模块化
user_modular_headers!
*使用此命令表示所有cocoapods静态库都是用模块化Headers
*pod 'SSZipArchive', :modular_headers => true
*pod 'SSZipArchive', :modular_headers => false


pod： 指明项目依赖，一个依赖是由一个pod名称和一个可选版本定义
a. 如果不添加版本号，pod默认使用最新的 如：pod ’SSZipArchive’
b. 如果项目需要一个指定的pod，需要添加版本号，如： pod ‘objection’, ‘0.9’
c. 指定版本范围
pod 'Masonry'
pod 'JPush','~> 3.3.0'


configurations
(编译配置) 默认情况下，依赖项会被安装在所有target的build configrations中
//为了调试或者其他原因，他们可以在给定的configurations中启用
pod 'PonyDebugger', :configurations => ['Debug', 'Beta']
//或者，你可以至指定一个build configration
pod 'PonyDebugger', :configuration => ‘Debug'

source：
默认被指定的依赖项会在全局级别的指定源中匹配搜索。可以为特依赖关系指定源
//指定特定源中搜索，并忽略任何全局源*
pod 'PonyDebugger', :source => 'https://github.com/CocoaPods/Specs.git'

path
使用本地文件
pod 'JYCarousel', :path => '/Users/Dely/Desktop/JYCarousel'


Subspecs：
当使用依赖库名字引入依赖库时，也会默认安装依赖库中的所有子模块。
//指定引用指定子模块
pod 'QueryKit', :subspecs => ['Attribute', 'QuerySet']

使用仓库中的master分支:
pod 'JYCarousel', :git => 'https://github.com/Delyer/JYCarousel.git'

使用仓库的其他分支:
pod 'JYCarousel', :git => 'https://github.com/Delyer/JYCarousel.git' :branch => 'release'

使用仓库的某个tag:
pod 'JYCarousel', :git => 'https://github.com/Delyer/JYCarousel.git', :tag => '0.0.1'

或者指定一个提交记录:
pod 'JYCarousel', :git => 'https://github.com/Delyer/JYCarousel.git', :commit => '5e473f1e0530bb3799f2f0d70554b292570bd8f0'


podspec
podspec :name => 'QuickDialog'
podspec :path => '/Documents/PrettyKit/PrettyKit.podspec'

pod 'JSONKit', :podspec => 'https://example.com/JSONKit.podspec'
