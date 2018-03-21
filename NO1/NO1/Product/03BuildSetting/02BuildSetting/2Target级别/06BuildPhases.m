/**




 (六) Build Phases --- -编译阶段 (依赖target,源代码文件,链接的库,拷贝的资源文件)


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



 (编译文件)
 PBXBuildFile:一个被加入到某个targets 参加 编译、链接、资源拷贝的对象
 1.一个PBXFileReference文件《被某个target引用，需要参加编译》所产生的对象，不区分 具体的 target，即未被target引用的.m 文件 不算 他只能是PBXFileReference文件
 2.被引用一次就算一个 PBXBuildFile 对象，一个PBXFileReference 原文件可能被多个target引用编译就会产生多个PBXBuildFile 对象
 3.被PBXBuildFile 引用的 PBXFileReference  包括三大类型（Sources/Frameworks/Resources）
 (1).m in Sources
 (2).a / .dylib /.tbd /.framework  in Frameworks
 (3).xib  / .storyboard /.bundle/.json /.html/.p12 / .png /.der  in Resources


 （一个编译单位）BuildPhase
 1.一个target对应一个 编译单位，多个target，则会有多个。
 2.阶段类型
 （1）PBXSourcesBuildPhase:
 1.是什么：一个在编译阶段参加编译的，源文件单位。
 2.包含什么：files-->PBXBuildFile对象  .m源文件.
 3.怎么算进去的：被添加到target 的 complie sources 中

 (2)PBXFrameworksBuildPhase
 1.是什么：一个在编译阶段 参加链接的，链接库单位。
 2.包含什么：files-->PBXBuildFile对象 二进制文件.
 3.怎么算进去的：被添加到target 的 link binary with librarise 中

 (3)PBXResourcesBuildPhase
 1.是什么：一个在编译阶段 参加资源拷贝的，资源库。
 2.包含什么：files-->PBXBuildFile对象  资源文件.
 3.怎么算进去的：被添加到target 的 copy bundle resourecs 中


 */
