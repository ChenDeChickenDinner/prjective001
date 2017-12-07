/**
 

Target

 (一)General       ----通用选项 (标识,签名,部署,icon,添加库，二进制文件)
 ((二)Capabilities  ----功能选项，设置对象支持的功能
 (三)Resource Tags ----该功能是将资源放到appstore
 (四)Info          ----通用选项 (info.plist，支持的文件类型，导入导出UTIs,APP跳转)
 (五)Build Settings----编译设置 (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)
 (六)Build Phases  ----编译阶段 ，如何定义 build 处理的过程(依赖target,源代码文件,链接的库,拷贝的资源文件)
 (七)Build Rules   ----编译规则




 (一)General       ----通用选项
 1:Identity--身份
 1:display name:项目名称，默认就好 ( CFBundleDisplayName )
 2:Bundle Identifier:包标识符，该ID是唯一的 ( CFBundleIdentidier )
 3:Version:外部版本号，用户能够看到 ( CFBundleShortVersionString )
 4:Build:内部版本号，开发者自己看的，区分测试版本用 ( CFBundleVersion )
 2:Signing--应用程序的签名，如果有开发者账号
 3:Deployment Info--部署信息
 1:Deployment Target:对象支持运行的版本
 2:Devices:支持的设备
 3:Main Interface:启动时加载的主界面，如果使用了storyboard，该值会是Main，如果纯代码编程，则需要设置为空，然后删掉storyboard
 4:Device Orientation:应用支持的方向
 5:Status Bar Style:状态栏的样式
 4:App Icons and Launch Images--图片 +启动图片
 5:Embedded Binaries：绑定的二进制文件，使用了第三方SDK时会需要
 6:Linked Frameworks and Libraries：使用系统自带的SDK时选择，也可以添加第三方框架



 ((二)Capabilities  ----功能选项，设置对象支持的功能
 (三)Resource Tags ----该功能是将资源放到appstore


 (四)Info.pilst          ----通用选项 ( CFBundleInfoDictionaryVersion )
 1:Custom iOS Target Properties -
 0:Bundle display name 显示的名称  = build setting - packaging - Product Name (PRODUCT_NAME)
 1:Bundle identifier 包标识符
 2:Bundle versions string, short 对外版本
 3:Bundle version   编译版本
 4:Bundle name      App文件夹名
 5:Executable file  默认 = $(EXECUTABLE_NAME) 应用程序的可执行文件
 4:InfoDictionary version （ Info.plist格式的版本信息,一般不动）
 1:Main storyboard file base name 应用程序首次启动时载入的xib文件 这个基本用不到 （APP启动时候再学习）
 1:Launch screen interface file base name 同上
 3:Application requires iPhone environment 应用程序是否需要iPhone 环境
 3:Supported interface orientations 设定应用程序的显示模式。
 3:Localization native development region 定位本地开发地区。本地化相关，如要设置拍照下面按钮显示中文
 3:Required device capabilities 指定程序适用于哪些设备

 2:URL Types:让应用程序之间理解和交互数据用的。最多是用在APP之间的跳转的时候。
 3:Document Types:定义了程序能够识别的文档类型，不需要识别文档的应用无需设置
 4:Exported UTLs:导出UTI，定义UTI让应用能够识别对应的文件类型 imported UTLs:和上面对应，用来导入UTI

 (五)Build Settings----编译设置
 A--> Architectures--体系结构(指令集) / Build Locations -- 编译目录(文件目录)
 C--> Build Options   -- 编译选项（编译器选择，debug文件类型，Bitcode，生成的文件类型，私有API验证）
 D--> Deployment (部署) / signing (签名) / Linking (链接)
 G--> Headers(头部) / Kernel Module (内核模块) / Packaging  (包) / Search Paths (搜索路径) / versioning  (版本控制)


 M1-->Asset catalog compiler - options
 M2-->Inerface Builder storyboard compiler - options
 M3-->OSACompile - build options
 M4-->Static Analyzer - Analysis policy
 M5-->Static Analyzer - Generic issues
 M6-->Static Analyzer - issues -OC
 M7-->Static Analyzer - issues -Security
 M8-->User-Defined

 Q1-->Apple LLIV 8.0 - address sanitizer
 Q2-->Apple LLIV 8.0 - code generation
 Q3-->Apple LLIV 8.0 - custom compiler fiags
 Q4-->Apple LLIV 8.0 - language
 Q5-->Apple LLIV 8.0 - language - C++
 Q6-->Apple LLIV 8.0 - language - modules
 Q7-->Apple LLIV 8.0 - language - OC
 Q8-->Apple LLIV 8.0 - perprocessing
 Q9-->Apple LLIV 8.0 - warning policies
 Q10-->Apple LLIV 8.0 - warnings -all languages
 Q11-->Apple LLIV 8.0 - warnings - C++
 Q12-->Apple LLIV 8.0 - warnings - OC
 Q13-->Apple LLIV 8.0 - warnings - OC and ARC











 1:Architectures--体系结构(指令集)
 1:Base SDK 指的是当前编译用的SDK版本
 2:Supported Platforms--支持的平台
 3:Build Active Architecture Only:它只编译当前的architecture版本
 4:Architectures--在这个项目里你想要Xcode编译的目标设备列表
 5:Valid Architectures 该编译项指定可能支持的指令集，该列表和Architectures列表的交集，将是Xcode最终生成二进制包所支持的指令集

 2:Assets ？？
 3：Build Locations：配置构建目录
 1:Build Products Path 产品文件和编译时临时文件都将放在这个目录的子目录中
 2:Intermediate Build Files Path  编译时临时文件的存放位置。编译中间文件格式为product name+.build，如MyProduct.build。
 3:Per-configuration Build Product Path 当前编译设置下的产品存放位置
 4:Per-configuration Intermediate File Path 当前编译设置下编译时临时文件的存放位置
 5:Precompiled Headers Cache Path 存放预编译头文件的位置。通过这个配置，Targets可以互相共享预编译的头文件
 4:Build Options
 0:Build Variants 此项可以设定生成产品的变种
 1:Compiler for C/C++/Objective-C--->选择编译器
 2:Debug Information Format 这个选项决定了记录debug信息的文件格式
 3:Always Embed swift standard libraries 是否 总是嵌入switf标准库
 4:Enable Bitcode 启用Bitcode(一种中间代码)
 5:Enable Testbility 这是单元测试有关选项，项目里如果没有单元测试 就关了吧
 6:Generate Profiling Code 是否生成配置代码。默认选择NO。
 7:Precompiled Header Uses Files From Build Directory 未改动的文件保留成预编译文件
 8:Scan All Source Files for Includes 扫描include文件所包含的所有源文件。
 9:Validate Built Product  这个选项决定了是否在编译的时候进行验证
 10:Require Only App_Extension-Safe API APP 扩展API 的使用
 5:Deployment  部署
 1:Additional Strip Flags
 2:Additional Install Group
 3:Additional Install Owner
 4:Additional Install Permissions
 5:Additional Permissions Files
 6:Deployment Location
 6:Deployment Postprocessing
 6:Install Group
 6:Install Owner
 6:Install Permissions
 6:Installation Build Products Location
 6:Installation Directory
 6:Resources Targted Device Family
 6:Skip Install
 6:Strip Debug Symbols During copy
 6:Strip Linked Product
 6:Strip style
 6:Targeted Device Family
 6:Use Separate Strip
 6:Headers  头部
 1:Run unifdef on product headers
 2:Unifdef Flags for product headers
 7:Kernel Module   内核模块
 module identifier
 module start routine
 module stop routine
 module version
 8:Linking
 1:Bundle Loader
 2:Coppatibility Version
 3:Current Library Version
 4:Dead code stripping
 5:display mangled names
 6:don`t dead- strip inits and terms
 7:dynamic Library install name
 8:dynamic Library install name base
 9:exportd symbols file
 10:generate positioan-dependen executable
 11:initialization routine
 12:link with standard libraries
 13:mach-0 type
 14:order file
 15:other librarian flags
 16:other link flags
 17:Path to link map file
 18:perform single-object prelink
 19: prelink libraries
 21:perserve private external symbols
 22:quote linker arguments
 23:re-Exported framework names
 24:re-Exported library names
 25:re-Exported library paths
 26:Runpath search paths
 27:separately edit symbols
 28:single-object prelink flags
 29:symbol ordering flags
 30: unexported symobls file
 31: warning linker flags
 32: write link map file
 8:Packaging
 convert copied files
 create info.plist section in binary
 defines module
 executable extension
 executable prefix
 expand build setting in info.plist file
 force package info generation
 framework version
 info.plist file
 info.plist other preprocessor flags
 info.plist output encoding
 info.plist preprocessor definitions
 info.plist preprocessor prefix file
 module map file
 preprocess info.plist file
 preserve HFS data
 private headers folder path
 private module map file
 product bundle identifier
 product module name
 product name
 property list output encoding
 public headers folder path
 strings file output encoding
 wrapper extension
 8:Search Paths
 always search user paths
 framework search paths
 header search paths
 linrary search paths
 rez search paths
 use header maps
 user header search paths
 8:signing
 code signing entitlements
 code signing identity
 development team
 other code signing flags
 provisioning profile ()
 provisioning profile(depreacatef)
 8:testing
 8:text- based API
 8:versioning

 Apple LLIV 8.0 - address sanitizer
 Apple LLIV 8.0 - code generation
 Apple LLIV 8.0 - custom compiler fiags
 Apple LLIV 8.0 - language
 Apple LLIV 8.0 - language - C++
 Apple LLIV 8.0 - language - modules
 Apple LLIV 8.0 - language - OC
 Apple LLIV 8.0 - perprocessing
 Apple LLIV 8.0 - warning policies
 Apple LLIV 8.0 - warnings -all languages
 Apple LLIV 8.0 - warnings - C++
 Apple LLIV 8.0 - warnings - OC
 Apple LLIV 8.0 - warnings - OC and ARC

 Asset catalog compiler - options

 Inerface Builder storyboard compiler - options

 OSACompile - build options

 Static Analyzer - Analysis policy
 Static Analyzer - Generic issues
 Static Analyzer - issues -OC
 Static Analyzer - issues -Security

 User-Defined


 (六) Build Rules --- -(编译规则)如何指定哪些文件类型在编译阶段需要被预处理
 1:Target Dependencies：设置依赖target。
 2:Compile Sources：该target需要编译的源代码文件
 3:Link Binary with Libraries：需要链接的库
 4:Copy Bundle Resources：拷贝的资源文件。



 1:target dependencies（target依赖关系）
 这里会告诉 build 系统，build 当前的 target 之前，必须先对这里的依赖性进行 build。
 设置依赖target。是用来管理你的 Target 依赖的。在几年前，基本上都是使用它来做第三方工程依赖的

 2：Compile Sources(编译源文件)
 section 中规定了所有必须参与编译的文件。需要留意的是，这里并没有指明这些文件是如何被编译处理的。关于处理这些文件的更多内容，
 我们将在研究 build rules 和 build settings 时学习到。此处列出的所有文件将根据相关的 rules 和 settings 被处理。

 预处理（Preprocessing）：目标是为每一个实现文件（.m）创建中间文件（intermediate file）

 编译（Compiling）

 3：Link Binary with Libraries(连接二进制文件和库)
 是用来管理二进制库和Framework的
 这里面列出了所有的静态库和动态库，这些库会参与上面编译阶段生成的目标文件进行链接。静态库和动态库的处理过程有非常大的区别
 当编译结束之后，接下来就是将编译所生成的目标文件链接到一块



 4：Copy Bundle Resources(拷贝资源文件)
 是用来设置你需要拷贝到 Main Bundle 里面的资源文件的，里面可能会包括 storyboard，xib，图片文件，JS 文件，CSS 文件，其他的资源包。
 当链接完成之后，build phase 中最后需要处理的就是将静态资源（例如图片和字体）拷贝到 app bundle 中

 扩展设置
 添加运行自定义脚本
 :check pods manifest.lok( CocoaPods 相关的脚本 script execution)


 (七) Build rules --- -
  Build rules 指定了不同的文件类型该如何编译。一般来说，开发者并不需要修改这里面的内容。如果你需要对特定类型的文件添加处理方法，那么可以在此处添加一条新的规则。




 ios 系统 做了哪些事情
 而很多 app 都会使用很多相同的库，如 **UIKit **、 CFNetwork 等。所以，苹果为了加快 app 启动速度、减少内存消耗、减少安装包体积大小，采用了大量 动态库的形式 来优化系统。dyld 的共享缓存 ：在 OS X 和 iOS 上的动态链接器使用了共享缓存，共享缓存存于 /var/db/dyld/。对于每一种架构，操作系统都有一个单独的文件，文件中包含了绝大多数的动态库，这些库都已经链接为一个文件，并且已经处理好了它们之间的符号关系。当加载一个 Mach-O 文件 (一个可执行文件或者一个库) 时，动态链接器首先会检查 共享缓存 看看是否存在其中，如果存在，那么就直接从共享缓存中拿出来使用。每一个进程都把这个共享缓存映射到了自己的地址空间中。这个方法大大优化了 OS X 和 iOS 上程序的启动时间
 */
