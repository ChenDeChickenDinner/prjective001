//
//  Build.m
//  XcodeStudy
//
//  Created by xs on 2017/11/16.
//  Copyright © 2017年 Touker. All rights reserved.
//

/**

编译过程 编译、链 、code signing 、packaging

五大内存分区
 1、栈区(stack): —由编译器自动分配释放，存放函数的参数值，局部变量的值等。
 2、堆区(heap): 一般由程序员分配释放，若程序员不释放，程序结束时由系统释放。
 3、全局区(静态区,static): 全局变量和静态变量的存储是放在一块的，初始化的全局变量和静态变量在一块区域，未初始化的全局变量和未初始化的静态变量在相邻的另一块区域。程序结束后由系统释放。
 4、文字常量区: 常量字符串就是放在这里的。程序结束后由系统释放。
 5、程序代码区: 存放函数体的二进制代码。



编译过程

 
编译设置
Build Setting(编译设置)配置每个任务（之前在 build log 输出中看到的任务）的详细内容。

Build Phase（编译构建阶段）如何定义 build 处理的过程

 默认设置
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



Build Rules(编译规则)如何指定哪些文件类型在编译阶段需要被预处理
Build rules 指定了不同的文件类型该如何编译。一般来说，开发者并不需要修改这里面的内容。如果你需要对特定类型的文件添加处理方法，那么可以在此处添加一条新的规则。





ios 系统 做了哪些事情
而很多 app 都会使用很多相同的库，如 **UIKit **、 CFNetwork 等。所以，苹果为了加快 app 启动速度、减少内存消耗、减少安装包体积大小，采用了大量 动态库的形式 来优化系统。dyld 的共享缓存 ：在 OS X 和 iOS 上的动态链接器使用了共享缓存，共享缓存存于 /var/db/dyld/。对于每一种架构，操作系统都有一个单独的文件，文件中包含了绝大多数的动态库，这些库都已经链接为一个文件，并且已经处理好了它们之间的符号关系。当加载一个 Mach-O 文件 (一个可执行文件或者一个库) 时，动态链接器首先会检查 共享缓存 看看是否存在其中，如果存在，那么就直接从共享缓存中拿出来使用。每一个进程都把这个共享缓存映射到了自己的地址空间中。这个方法大大优化了 OS X 和 iOS 上程序的启动时间


 
 */

/**
 TARGET_NAME-->目标工程名（随工程创建的时候生产）Target 层级才有，不能修改 除非删除此Target
 PRODUCT_NAME--> 每个Target提供的一个 宏(可修改）， 默认=当前Target的TARGET_NAME
 Bundle name-->  安装到机子里的App文件夹名 info.plist里 （可修改）默认 = 当前Target的PRODUCT_NAME  ，英文的
 Executable name -– 执行程序名
 Bundle display name--屏幕显示名---每个Target提供的一个宏(可修改），默认=当前Target的PRODUCT_NAME

 1: dSYM


 2:  bitcode
 实际上在Xcode 7中，我们新建一个iOS程序时，bitcode选项默认是设置为YES的。我们可以在”Build Settings”->”Enable Bitcode”选项中看到这个设置。

 不过，我们现在需要考虑的是三个平台：iOS，Mac OS，watchOS。

 对应iOS，bitcode是可选的。
 对于watchOS，bitcode是必须的。
 Mac OS不支持bitcode。
 如果我们开启了bitcode，在提交包时，下面这个界面也会有个bitcode选项：

 3 :Enable Testbility 这是单元测试有关选项，项目里如果没有单元测试 就关了吧


 0:Build Variants 此项可以设定生成产品的变种
 Build Variants的值有三个：
 normal-用于生成普通的二进制文件
 profile-用于可以生成配置信息的二进制文件
 debug-用于生成带有debug标志、额外断言和诊断代码的二进制文件


 2:Debug Information Format 这个选项决定了记录debug信息的文件格式
 这个选项决定了记录debug信息的文件格式。选项有DWARF with dSYM File和DWARF。建议选择DWARF with dSYM File。DWARF是较老的文件格式，会在编译时将debug信息写在执行文件中。


 7:Precompiled Header Uses Files From Build Directory
 预编译build路径中的头文件。由于编译过程比较耗时，且两次编译之间未必会改动所有文件。因此将不会改动的常用文件保留成预编译文件将大大减少编译时的时间。建议这一项选择YES。

 9:Validate Built Product  这个选项决定了是否在编译的时候进行验证
 。验证的内容和app store的审查内容一致。默认选项是debug时不验证，release时验证，这样就保证了每个release版本都会通过validate，让被拒的风险在提交app store之前就暴露出来，减少损失。


 10:Require Only App_Extension-Safe API APP 扩展API 的使用
 因为app extension限制了某些API的使用， ( App Extensions不能使用的一些API ) ，因此在自定义自己的framework后，这个framework可能包含了某些在App Extensions里不能使用的API，因此为了安全起见才会给出这个警告。http://www.th7.cn/system/mac/201409/68944.shtml

 (五)Build Phases  ----编译阶段
 1:Target Dependencies：设置依赖target。
 2:Compile Sources：该target需要编译的源代码文件
 3:Link Binary with Libraries：需要链接的库
 4:Copy Bundle Resources：拷贝的资源文件。

 */
