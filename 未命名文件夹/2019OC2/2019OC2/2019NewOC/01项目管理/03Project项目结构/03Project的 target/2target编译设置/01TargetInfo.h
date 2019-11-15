//
//  03Project的 target.h
//  2019OC2
//
//  Created by xs on 2019/4/9.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

target创建
1.默认target
2.新增target
    1.可在原类型target上扩展出新target，使用同一套资源文件以及继承其编译设置
    2.跨类型的target新增 只能产生新的资源文件供自己使用

targetName信息
product name:$(TARGET_NAME target的名称)
1.建立target时候起的名称,第一个target的名称默认同工程名相同
2.必须配置一个名称，否则编译不过
3.在build setting 可根据环境中配置

bundle name:$(PRODUCT_NAME 产品的名称)
1.构建出产品后，存放在iOS系统中文件名的名称，在info.plis中设置
2.默认 PRODUCT_NAME = TARGET_NAME
3.若不设置，则为TARGET_NAME

display name:
1.显示到手机屏幕上的名称，在info.plist中设置
2.显示依据display name > bundle name > product name


product bundle identifier:
1.organization identifier +product name:产品唯一标识符
2.在build setting 中可根据环境配置

bundle identifier:$(PRODUCT_BUNDLE_IDENTIFIER)
1.包唯一标识符,默认 = PRODUCT_BUNDLE_IDENTIFIER
2.在info.plist中设置,构建包的最终标识符



identifier:标识符
version:应用商店版本
build:构建版本
deploument target:最低的部署版本
devices:支持的设备平台
device orientaion:支持的展示方向
1.portrait代表竖屏
2.landscape代表横屏
status bar style:状态栏的显示



App Icons and Launch images:App 图标与启动页

1.app icons source:在所有程序体现的地方所展示的相关图标

    1.AppStore:应用商店的图标 1x
    2.iphone App : 桌面上显示的图标 1x 2x
    3.iphone Spotlight: 搜索时显示的图标  1x 2x
    4.iphone Settings:  设置时显示的图标  1x 2x
    5.iphone Notification:通知中心的图标  1x 2x

2.launch screen file:启动页展示的文件
    1.(默认)新建项目时 Xcode 会自动创建 LaunchScreen.storyboard 且默认使用 Launch Screen File 的方式展示启动图
    2.(其它)直接新建一个 Storyboard 并勾选 Interface Builder Document 下的 Use as Launch Screen
    3.(删除)如果不想通过这种方式选择启动则 只需要删除 Launch Screen File 的内容
    4.(原理)把LaunchScreen截屏,生成一张图片,作为启动界面

3.launch images sourc:启动页展示的图片源
    1.根据系统 设备独自设置启动图,这种方式需要事先提供各个机型的启动图，如果没有则无显示效果
    image.png
    imgae size:1242 x 2688 pixels
    color space: generic RGB
    idiom:iphone
    subtype:iPhone Xs Max
    scale:3x
    extent:full screen
    min version:12.0

4.启动图优先级---->【Launch Screen File】>【Launch images source】


main interface:是否指定主入口
1.main interface与AppDeletage二处只能取一处
