
// 1:资源=====》有哪些资源
A1 = （文件）PBXFileReference:
1.是什么:用于跟踪项目引用的每一个外部文件(对应到磁盘),比如源代码文件、资源文件、库文件、生成目标文件等。可能此文件不在 项目文件目录下
2.怎么才算:只要一个文件拉入到此工程，被项目“管理”才算。如果某文件在项目目录下 但未添加进来 就不算。

A2 = （文件夹）PBXGroup:
0.项目管理的文件结构，只有被添加 引用到项目中 由项目管理的才算
1.工程主文件夹，有且只有一个，其包括 所有的 子 文件夹
2.引用的是 PBXFileReference，PBXGroup

A3 = （本地化文件夹）PBXVariantGroup:
对不同地区资源文件的引用管理。

A4 = (编译文件资源)
PBXBuildFile:一个被加入到某个targets 参加 编译、链接、资源拷贝的对象
1.一个PBXFileReference文件《被某个target引用，需要参加编译》所产生的对象，不区分 具体的 target，即未被target引用的.m 文件 不算 他只能是PBXFileReference文件
2.被引用一次就算一个 PBXBuildFile 对象，一个PBXFileReference 原文件可能被多个target引用编译就会产生多个PBXBuildFile 对象
3.被PBXBuildFile 引用的 PBXFileReference  包括三大类型（Sources/Frameworks/Resources）
(1).m in Sources
(2).a / .dylib /.tbd /.framework  in Frameworks
(3).xib  / .storyboard /.bundle/.json /.html/.p12 / .png /.der  in Resources


// 2:配置====》有哪些使用方案

B1 = Build Setting（编译设置）:项目定义的多种编译环境（configurations），目前项目默认自带二个 Debug 与Release
    XCBuildConfiguration
    1.是什么：一种编译方案
    2.包含什么：键值对，都是对（硬件平台SKD/安需加载资源/资产目录编译选项/编译文件路径/编译选项/部署信息/链接/包/搜索路径/签名/语言/预编译/...）的设置
    3.怎么算进去的：由项目创建生成的
    4.各种 类型 Target 的Build Setting区别

B2 = Dependencies（依赖关系）：在编译本产品之前 需要编译的 依赖产品
    PBXTargetDependency
    1.是什么：一个产品编译依赖
    2.包含什么：1.引用哪个target 2.目标容器(PBXContainerItemProxy)是哪个
    3.怎么算进去的：

B3 = BuildPhases (编译阶段执行的任务，编译的源文件，链接的库，拷贝的资源文件，执行的脚步任务)：
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

    (4)PBXShellScriptBuildPhase
    1.是什么：任务脚本
    2.包含什么：文件，输入，输出，执行代码
    3.怎么算进去的：被添加到target 的 new run script phase 中

    (5)PBXCopyFilesBuildPhase
    1.是什么：构建阶段复制文件信息。
    2.包含什么：文件
    3.怎么算进去的：被添加到target 的 new copy files phase 中

B4 = BuildRules()：指定了不同的文件类型该如何编译。一般来说，开发者并不需要修改这里面的内容。如果你需要对特定类型的文件添加处理方法，那么可以在此处添加一条新的规则。
    PBXBuildRule
    1.是什么：一种编译规则
    2.包含什么：被指定的文件类型、输出文件、执行代码
    3.怎么算进去的：被添加到target 的 Build rules  中



// 3:产品
PBXNativeTarget


// 4:项目
PBXProject


// 5:项目管理维护
// 6:工作平台管理维护

