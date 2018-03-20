Architectures（硬件体系结构）
arm指令集：
每一款机器的运行都依托一个 ARM处理器，而不同硬件的ARM 处理器的 指令集可能 不同。

指令集分类：
32位
armv6、
armv7、
armv7s: iPhone5, iPhone5C,

64位
arm64:iPhone5S 之后

指令集兼容运行
1.项目不能编译 自己补支持的相关 三方库，包。
2.软件只能运行在 自身所支持的 指令集 的机器上，所有指令集原则上都是向下兼容的
3.iOS模拟器没有运行arm指令集，编译运行的是x86指令集


Architectures 设置
// 硬件
1:Valid Architectures  默认设置成："VALID_ARCHS[sdk=*]" = "arm64 armv7 armv7s";
限制可能被支持的指令集的范围

2:Architectures     默认设置 ARCHS = ("$(ARCHS_STANDARD)" armv7,arm64 )
指明选定Target要求被编译生成的二进制包所支持的指令集，
支持指令集是通过编译生成对应的二进制数据包实现的，如果支持的指令集数目有多个，就会编译出包含多个指令集代码的数据包，

如果你的Architectures超出了Valid Architectures的范围，只能取Architectures和Valid Architectures的交集
一般来说，不需要修改Valid Architectures，你只要设置Architectures成你需要的架构版本就可以了
Valid Architectures默认设置成：arm64、armv7、armv7s，Architectures只设置成：armv7、arm64；这就是说，项目虽然支持市面上大部分手机的处理器架构版本，但是最终只比编译了两个版本

3.Build Active Architecture Only
指明是否只编译当前连接设备所支持的指令集(该选项起作用的条件有两个，必须同时满足才会起作用，1. 其值设置为YES；2. XCode成功连接调试设备)
一般Debug 设置为YES, Release设置为NO。 Debug时一般只会连接一个手机，这时设置为YES, 就只会生成这个手机处理器指令集的二进制包，这样debug时比较快。但Release时是需要发布ipa包给各种各样的手机使用的，所以必须设置NO为所有指令集的手机生成二进制包。


//平台
4.:Supported Platforms  SUPPORTED_PLATFORMS = "iphonesimulator iphoneos";
--支持的平台

//编译SDK
5:Base SDK  指的是当前编译用的SDK版本 SDKROOT = iphoneos;

6:Additional SDKs 在编译的时候需要附加的SDK。(ADDITIONAL_SDKS = "";)


lipo 工具





(2)--> Asset--资源
1.Asset Pack Manifest URL Prefix( 资源包清单的下载路径URL前缀)
2.Embed Asset Packs In Product Bundle( 是否将资源包嵌入产品的bundle中)
3.Enable On Demand Resources( 是否开启按需获取资源功能)
4.On Demand Resources Initial Install Tags( 按需加载资源时的初始安装资源文件标签)
5.On Demand Resources Prefetch Order( 按需加载资源时预加载的标签顺序)
