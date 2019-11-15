//
//  01UIApplicationMain.m
//  2019OC2
//
//  Created by xs on 2019/4/9.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "01UIApplicationMain.h"

1.执行main 函数


2.执行UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));函数
    nil参数:字符串类型
    1.默认就是一个 UIApplication 对象
    2.可以通过修改nil参数，实现进入自己定义的UIApplication类

    NSStringFromClass([AppDelegate class]):
    1.UIApplication的代理对象
    2.可以通过修改，实现进入自己定义的代理对象

3.UIApplicationMain函数底层做了些什么
1.创建一个application对象
2.设置了代理
3.创建了一个事件循环（Runloop）
4.读取info.plist文件（只读）
  1.根据是否有启动页设置展示启动页
  2.根据是否有main interface设置 创建window加载main故事版
5.程序加载完成通知AppDelegate代理对象didFinishLaunchingWithOptions
  1.如果既有设置main interface 又在didFinishLaunchingWithOptions中创建了window，则程序中会存在二个



