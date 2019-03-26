Architectures（硬件体系结构）
arm指令集：
每一款机器的运行都依托一个 ARM处理器，而不同硬件的ARM 处理器的 指令集可能 不同。

指令集分类：
32位:armv6/armv7/armv7s: iPhone5, iPhone5C,
64位:arm64:iPhone5S 之后

指令集兼容运行
1.项目不能编译 自己补支持的相关 三方库，包。
2.软件只能运行在 自身所支持的 指令集 的机器上，所有指令集原则上都是向下兼容的
3.iOS模拟器没有运行arm指令集，编译运行的是x86指令集


Architectures 设置
// 有效的指令集范围
1:Valid Architectures  默认设置成："VALID_ARCHS[sdk=*]" = "arm64 armv7 armv7s":限制可能被支持的指令集的范围

// 编译出来的包支持的设备范围
2:Architectures     默认设置 ARCHS = ("$(ARCHS_STANDARD)" armv7,arm64 )
a.指明选定Target要求被编译生成的二进制包所支持的指令集，
b.支持指令集是通过编译生成对应的二进制数据包实现的，如果支持的指令集数目有多个，就会编译出包含多个指令集代码的数据包，
c.如果你的Architectures超出了Valid Architectures的范围，只能取Architectures和Valid Architectures的交集


//平台选择
4.:Supported Platforms  SUPPORTED_PLATFORMS = "iphonesimulator iphoneos"--支持的平台


//基于什么SDK开发
5:Base SDK  指的是当前编译用的SDK版本 SDKROOT = iphoneos;
这决定了你的app所能支持的iOS最高版本。如果你选择了iOS6.1，则你的app只能被iOS 6.1.X以下的系统安装。

//是否只编译当前连接设备所支持的指令集
3.Build Active Architecture Only:一般Debug 设置为YES, Release设置为NO











