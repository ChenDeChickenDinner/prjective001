
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

B1 = Build Setting（编译设置）:
    XCBuildConfiguration
    1.是什么：一种编译方案
    2.包含什么：键值对，都是对（硬件平台SKD/安需加载资源/资产目录编译选项/编译文件路径/编译选项/部署信息/链接/包/搜索路径/签名/语言/预编译/...）的设置
    3.怎么算进去的：有且只由项目创建生成的
    4.各种 类型 Target 的Build Setting区别

    buildConfigurationList:
    1.是什么：一套编译方案,项目定义的多种编译环境（configurations），目前项目默认自带二个 Debug 与Release
    2.包含什么：XCBuildConfiguration
    3.怎么算进去的：project 有一套,每个target各继承一套


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
1.是什么：一个 对应可以生成可执行二进制程序或库文件的本地构建目标对象
2.包含什么：各个环境下的编译配置、编译依赖、编译任务、编译规则
3.怎么算进去的：由项目生成的

// 4:项目
PBXProject

mainGroup  // 项目引用的的主要文件组织，引用  PBXGroup 类型 对象
productRefGroup // 产品引用的文件组织 PBXGroup 类型
projectDirPath = "" // 项目路径 目前为空
projectRoot = "" // 项目的根目录  目前为空

knownRegions // 不同区域的本地资源文件列表
developmentRegion = English // 语言版本，English英语


buildConfigurationList = () // 引用的是哪一套编译配置 引用的是 XCConfigurationList
targets = ()   // 此项目 包含的所以 target, 引用 PBXNativeTarget类型 对象
attributes = { // 属性
   类名前缀： CLASSPREFIX = HB
    组织名称: ORGANIZATIONNAME = Touker
    targets信息:TargetAttributes = {
        PBXNativeTargetA:target属性
            创建项目的Xcode 版本: CreatedOnToolsVersion = 6.1.1;
            开发组：            DevelopmentTeam = QG479838Q3;
            签名方式:           ProvisioningStyle = Automatic;
            系统所包含的功能：   SystemCapabilities = { }
    }
}










































// 5:本项目中的 各种 依赖管理 原理(pbxproj)
A.资源引用管理（读取到）怎么才能找到  依据是什么

.h 头文件
1.被工程引用 形成 PBXFileReference 不需要提供搜索路径, 就能 被 #import  到；#import <> 用于包含系统文件 #import""用于包含本项目中的文件
2.未被引用  需要 在 Header Search Paths 添加路径后才可被  #import""/<>;
3.最后不会被打进包中

.m 实现文件:
1.被工程引用 ,被添加到  Build Phases 形成PBXFileReference-->PBXBuildFile-->PBXSourcesBuildPhase，参与编译
2.并不用指明路径
3.最后会被一起打进包中

.a/.Framework 库文件
1.被工程引用 ,被添加到  Build Phases 形成PBXFileReference-->PBXBuildFile-->PBXFrameworksBuildPhase，参与链接
2.并在 Library/Framework Search Paths 中添加路径 链接的时候 才能被找到 才能（在本项目中的自身生成路径，不在本项目中 需要手动指明路径）
3.最后会被一起打进包中

资源文件
1.被工程引用 ,被添加到   Build Phases，形成PBXFileReference-->PBXBuildFile-->PBXResourcesBuildPhase，参与资源拷贝
2.在项目中的资源文件 都会 打进 mainBundle 中，并不用指明路径
3.最后会被一起打进包中


1.project中 引用 静态库:将 打包 制作好的 .a / .Framework 静态库 拖入工程中 使用
    1.需要导入 链接库，配置搜索路径
    2.在自身的 Frameworks 文件夹下 会生产 实体的 garter

2.xcworkspace + project （各种 跨 project 的引用）
    0.好处，模块隔离、同一工作环境、自动编译依赖
    1.自己手a动 管理 多个 project 的使用处理===>引出 xcworkspace 真正作用 做了哪些处理
        a.被引用的 只能是 被引用project 下的target(.a/.Framework)，不能是 其他project 资源文件中的 东西

        b.引用步骤:
            1.被添加库 要做好自身的设置---->一个target的生产设置
                a:选择 实现方式（1：灵活的.m 暴露形式 2：稳定的 静态库形式）有2吗
                b:编译配置（Build Setting +BuildPhases ）BuildPhases 问题？
                    b.被引用的 target 中 引用的（三方私有的，开源的 ）库 最后跑哪去哪，会不会被打进 主工程中，要不要告知 主工程添加
                    0.在单项目中 是把 三方库单独提供出来，让主项目一起链接进去
                    1.在多项目中，因为 只能 将 其它 项目的target 的（.a/.Framework）链接到主项目中，那被链接的库的 依赖库 怎么处理
                    2.针对 此问题，pod 是怎么解决的
            3.添加头文件搜索路径 ；添加链接依赖库，不用添加库搜索路径（暂不知道为什么)
            4.当被引用的 库 的原文件发布变化 会重新编译 再通过给主工程使用（对应稳定的模块，可以经过处理后）
            5.在自身的 Frameworks 文件夹下 不会生产 实体的 garter，其实体在被引用的项目Products中


    2.利用 pod 自动管理 多个 project 的使用处理==>引出pod 是干嘛的

    3. xcworkspace  + pod + 私有库 更新===>利用多种工具特效 达到 一些 目的






// 7:工具处理依赖关系 cocopoads
