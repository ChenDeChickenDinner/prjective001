https://www.jianshu.com/p/5d987d82d4d9

ZCPKit
┗━━━━Classes
     ┗━━━━ZCPKit.h
     ┗━━━━ZCPKit.m
┗━━━━Frameworks
     ┗━━━━MyFramework.framework
┗━━━━Libraries
     ┗━━━━libZCPKit.a
┗━━━━Resources
     ┗━━━━MyRes.bundle

name：框架名
version：当前版本
summary：简要描述
description：详细描述


homepage：页面链接
license：开源协议
author：作者
source：源码git地址


platform：支持最低ios版本


source_files：源文件（可以包含.h和.m）
public_header_files：头文件(.h文件)
resources：资源文件（配置的文件都会被放到mainBundle中）
resource_bundles：资源文件（配置的文件会放到你自己指定的bundle中）
frameworks：依赖的系统框架
vendored_frameworks：依赖的非系统框架
libraries：依赖的系统库
vendored_libraries：依赖的非系统的静态库
dependency：依赖的三方库




libraries：配置依赖的系统库（要注意，这里的写法需要忽略lib前缀）写法：
libraries = 'c++', 'sqlite3', 'stdc++.6.0.9', 'z'

frameworks：配置依赖的系统框架 写法：
frameworks = 'AVFoundation', 'CoreGraphics', 'Security', 'SystemConfiguration'


source_files：配置三方库的源文件（.h或.m文件）写法：
source_files = 'Classes/ZCPKit.{h,m}' // 直接指定文件名
或：
source_files = 'Classes/*.{h,m}' // Classes文件夹下的所有匹配文件
source_files = 'Classes/**/*.{h,m}' // Classes所有路径下的所有匹配文件

public_header_files：配置公有的头文件（.h文件）写法：
public_header_files = 'Classes/ZCPKit.h' // 直接指定文件名
或：
public_header_files = 'Classes/*.h' // Classes文件夹下的所有匹配文件
public_header_files = 'Classes/**/*.h' // Classes所有路径下的所有匹配文件






vendored_frameworks：配置需要引用的非系统框架
vendored_frameworks = 'Frameworks/MyFramework.framework'

vendored_libraries：配置需要引用的非系统静态库（要注意，这里的.a静态库名字必须要带lib前缀，如果引用的静态库名字没lib前缀会导致编译报错，只需要重命名加上即可）
vendored_libraries = 'Frameworks/libZCPKit.a'




resources：配置资源文件（.bundle，.png，.txt等资源文件，这些资源文件会被放到mainBundle中，要注意避免发生命名重复的问题）
resources = 'Resources/MyRes.bundle'

resource_bundles：配置指定bundle的资源文件（可以解决resources导致的命名冲突问题）
resource_bundles = {
    'ZCPKitBundle' => ['Resources/MyRes.bundle'],
}


dependency：依赖的三方库，pod库或者可以是自身的subspec写法：
dependency 'AFNetworking', '~>3.1.0' // pod三方库
dependency 'Util' // 自身的subspec
或
dependency 'AFNetworking'




https://blog.csdn.net/jike_yangyujing/article/details/85068576

https://www.jianshu.com/p/abb4ffe60e6a

libraries = 'c++', 'sqlite3', 'stdc++.6.0.9', 'z'
frameworks = 'AVFoundation', 'CoreGraphics', 'Security', 'SystemConfiguration'


source_files = 'Classes/**/*.{h,m}' // Classes所有路径下的所有匹配文件
public_header_files = 'Classes/**/*.h' // Classes所有路径下的所有匹配文件

vendored_frameworks = 'Frameworks/MyFramework.framework'
vendored_libraries = 'Frameworks/libZCPKit.a'

resources = 'Resources/MyRes.bundle'
resource_bundles = {
    'ZCPKitBundle' => ['Resources/MyRes.bundle'],
}
dependency 'AFNetworking', '~>3.1.0' // pod三方库




Pod::Spec.new do |s|
  # 项目的名称
  s.name             = 'DownLoader'
  # 项目的版本号，通过项目git的tag标签进行对应，这里的标签代表的版本
  s.version          = '0.1.1'
  # 项目简单的描述信息
  s.summary          = '简单的下载器##0.1.1'

  # 项目的详细描述信息，注意，这里的文字的长度，一定要比上面的s.summary长，不然会认为格式不合格
  s.description      = <<-DESC
简单的下载器，支持断点下载
                       DESC
  # 项目的网页主页信息，这里可以直接写自己的远程仓库的主页的地址
  s.homepage         = 'https://coding.net/u/WANG19931123/p/DownLoader'
  # 截图
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  # 开源协议
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  # 作者信息
  s.author           = { 'zy_ios@163.com' => 'zy_ios@163.com' }

  # 这个比较重要，指的就是git的对应的远程仓库的地址以及版本号，版本号直接获取的是上面的s.version
  # 项目地址，这里不支持ssh的地址，验证不通过，只支持HTTP和HTTPS，最好使用HTTPS
  s.source           = { :git => 'https://WANG19931123:password@git.coding.net/WANG19931123/DownLoader.git', :tag => s.version.to_s }
  # 多媒体介绍地址
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  # 支持的平台及版本
  s.ios.deployment_target = '8.0'
  # 代码源文件地址，**/*表示Classes目录及其子目录下所有文件，如果有多个目录下则用逗号分开，如果需要在项目中分组显示，这里也要做相应的设置
  # s.source_files = 'DownLoader/Classes/**/*'

  s.subspec 'Category' do |category|
  category.source_files = 'DownLoader/Classes/Category/**/*'
  category.dependency 'AFNetworking', '~> 3.0'
  category.dependency 'YYModel
  end

  s.subspec 'DownLoader' do |downLoader|
  downLoader.source_files = 'DownLoader/Classes/DownLoader/**/*'
  end

  # 资源文件地址
  # s.resource_bundles = {
  #   'DownLoader' => ['DownLoader/Assets/*.png']
  # }
  # 公开头文件地址
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # 所需的framework，多个用逗号隔开
  s.frameworks = 'UIKit'
  # 依赖关系，该项目所依赖的其他，当在加载的时候也会一块把相关的依赖的库加载下来，如果有多个需要填写多个
  # s.dependency 'AFNetworking', '~> 2.3'
  # 是否使用ARC，如果指定具体文件，则具体的问题使用ARC
  s.requires_arc = true
end
