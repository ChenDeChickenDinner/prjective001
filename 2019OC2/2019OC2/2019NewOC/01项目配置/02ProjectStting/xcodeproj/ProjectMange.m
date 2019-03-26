//
//  ProjectMange.m
//  2019OC2
//
//  Created by xs on 2019/3/21.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ProjectMange.h"

@implementation ProjectMange

@end

/Users/xs/Desktop/one/one.xcodeproj（本地项目文件）

工程名.xcodeproj <是个package目录> 显示包内容
A:project.pbxproj （工程描述文件）
B:project.xcworkspace （跟workspace相关的文件）
C:xcuserdata （单个用户的项目文件）



工程名.xcodeproj <是个package目录> 显示包内容
A:project.pbxproj （工程描述文件）
是所有文件、资源、信息/配置的存储库。
1.包含管理 所有的资源文件 + 其组织形式
2.项目级别的 Build Setting
3.targets 到 products 以及其编译设置
4.schemes 配置
5.products 体现

B:project.xcworkspace （跟workspace相关的文件）

C:xcuserdata （单个用户的文件）



(A)workspac（工作空间）
0:一个工作空间 可以管理多个 工程，每个工程 可以管理多个target生成各种形式的product，
1:当一个Project需要用到另一个Project的文件的时候，默认情况下 需要将用到的其它Project的相关文件拷贝一份到自身Project中
2:workspace,即可以单独管理多个项目，又可以通过配置，让各个项目相互依赖




1.简介:它本质上是一种旧风格的 Property List 文件，历史可追溯到 NeXT 的 OpenStep。由于有Xcode工具的存在，我们一般不需要与pbxproj直接打交道，通过General、Build Settungs或者Info等面板，就可以完成项目工程配置信息的修改

2.文件类型，属性列表文件，全名是Property List，它是一种用来存储串行化后的对象的文件，整个的project.pbxproj文件就是一个字典

3.文件结构
{
    archiveVersion = 1; 默认值
    classes = {
    }; 列表    空
    objectVersion = 45;     数字 参考 XcodeCompatibilityVersion 枚举值
    objects = {
        /* ... */
    };
    rootObject = 29B97313FDCFA39411CA2CEA /* Project object */;
}
0. !$*UTF8*$! ===> 文件采用 utf8编码
1.rootObject 根对象，代表一个项目对象，引用 有且只有一个PBXProject类型对象 。
2.具体的配置实现是在 objects这个域里面的，里面每一项的又是一个字典，key是UUID，Value 依然是个字典.
3.objects 中的键值对被分成了若干个 section
4.UUID:objects中根据uuid和对象的关联，就可以唯一标识这个对象，方便对象的相互引用



4.objects 元素类型

//(1)文件
PBXFileReference

//(2)文件夹
PBXGroup

//(3)本地化文件夹
PBXVariantGroup





PBXBuildFile



PBXSourcesBuildPhase

PBXFrameworksBuildPhase

PBXResourcesBuildPhase

PBXShellScriptBuildPhase


XCBuildConfiguration

XCConfigurationList

PBXNativeTarget

PBXProject









//(4)
PBXBuildFile ///文件类型  PBXBuildFile
1.是什么:参与编译构建的 所有资源
2.怎么才算:只要一个文件拉入到此工程就算
3.什么结构:
1.被编译的文件类型 /// (in Sources) + (in Frameworks)  + (in Resources)
.m in Sources
.a / .dylib /.tbd /.framework  in Frameworks
.xib  / .storyboard /.bundle/.json /.html/.p12 / .png /.der  in Resources
557BB6E11FDA6F07003539FA  = { /// 一个资源文件
    isa = PBXBuildFile;
    fileRef = 557BB6E01FDA6F07003539FA; ///引用的 都是 PBXFileReference 中的对象
};


//(5)
buildPhases 构建阶段  /// 引用的 都是 PBXFileReference 中的对象
//(5.1)
PBXSourcesBuildPhase /// (in Sources)
1.是什么:编译阶段 参与 编译的 所有实现文件
2.怎么才算:一个tagaet 对应一个 编译单位 /* Sources */ ;怎么添加的？
2.什么结构:包含所有 被添加到 参与此tagaet的编译阶段 的实现文件（.m）
557BB6951FDA6585003539FA  = {  /// 一个编译 单位
    isa = PBXSourcesBuildPhase;
    buildActionMask = 2147483647;
    files = ( /// （.m）
             557BB6A11FDA6585003539FA /* ViewController.m in Sources */,
             557BB6AC1FDA6585003539FA /* main.m in Sources */,
             557BB69E1FDA6585003539FA /* AppDelegate.m in Sources */,
             );
    runOnlyForDeploymentPostprocessing = 0;
};

//(5.2)
PBXFrameworksBuildPhase /// (in Frameworks)
1.是什么:链接阶段的 库单位
2.怎么才算:一个tagaet 对应一个 链接库单位 /* Frameworks */ ;怎么添加的（1.文件在本项目中 2.文件不在本项目中 3.属于系统的）？
2.什么结构:包含所有 被添加到 参与此tagaet的链接阶段 的库（动，静态库、二进制文件）。
557BB6D91FDA6F07003539FA  = { /// 一个链接 单位
    isa = PBXFrameworksBuildPhase;
    buildActionMask = 2147483647;
    files = (  /// (.a / .dylib /.tbd /.framework)
             BFF217D61F59301A002678B5 /* AVFoundation.framework in Frameworks */,
             BFF217D51F592FF5002678B5 /* libsqlite3.0.tbd in Frameworks */,
             BFAE8DFD1E24CE160006E7D4 /* libc++.tbd in Frameworks */,

             );
    runOnlyForDeploymentPostprocessing = 0;
};

//(5.3)
PBXResourcesBuildPhase /// (in Resources)
1.是什么:构建阶段需要复制的资源单位,链接至PBXBuildFile文件
2.怎么才算:一个tagaet 对应一个 资源单位 /* Resources */;
2.什么结构: 包含所有 被添加到 参与此tagaet 构建 的资源文件
557BB6DA1FDA6F07003539FA = { /// 一个资源单位
    isa = PBXResourcesBuildPhase;
    buildActionMask = 2147483647;
    files = ( /// xib/storyboard/bunld/xcassets/plist、json、。。。。 一切 在使用过程中 需要 进行读取的
             557BB6EC1FDA6F07003539FA /* LaunchScreen.storyboard in Resources */,
             557BB6E91FDA6F07003539FA /* Assets.xcassets in Resources */,
             557BB6E71FDA6F07003539FA /* Main.storyboard in Resources */,
             );
    runOnlyForDeploymentPostprocessing = 0;
};

//(5.4)
PBXShellScriptBuildPhase




//(6)
XCBuildConfiguration  编译设置元素
1.是什么:一种编译配置，一种环境配置
2.怎么才算: 在 项目 的 info--Configuration选项下 (new one Configuration)
2.什么结构:
1.perject 项目级别
环境A /环境B

2.terget1 构建目标级别
环境A /环境B

3.terget2 构建目标级别
环境A /环境B
557BB6F01FDA6F07003539FA  = { // 一个编译配置
    isa = XCBuildConfiguration;
    buildSettings = {/// 编译参数};
        name = Debug; /// 配置所属环境 配置名
    };





    //(7)
    XCConfigurationList构建配置相关元素的列表
    1.是什么: 一套编译配置（包含所有环境下的配置）
    2.怎么才算:每 增加 一个 project/targets 都算一个套配置
    2.什么结构:
    4B7F0FA11A41261700586554 /* Build configuration list for PBXProject "HBStockWarning" */ = {
        isa = XCConfigurationList;
        buildConfigurations = ( /// 引用的是 XCBuildConfiguration
                               4B7F0FC71A41261700586554 /* DebugDEV */,
                               4B3E238B1CC86D54000E26A2 /* Debug */,
                               5D1113391CC76B61007E54FA /* DebugFZ */,
                               4B7F0FC81A41261700586554 /* Release */,
                               5D1113E01CCDB2A6007E54FA /* ReleaseEnterprise */,
                               );
        defaultConfigurationIsVisible = 0;
        defaultConfigurationName = Debug;
    };
    4B7F0FC91A41261700586554 /* Build configuration list for PBXNativeTarget "HBStockWarning" */ = {
        isa = XCConfigurationList;
        buildConfigurations = (
                               4B7F0FCA1A41261700586554 /* DebugDEV */,
                               4B3E238E1CC86D54000E26A2 /* Debug */,
                               5D11133C1CC76B61007E54FA /* DebugFZ */,
                               4B7F0FCB1A41261700586554 /* Release */,
                               5D1113E31CCDB2A6007E54FA /* ReleaseEnterprise */,
                               );
        defaultConfigurationIsVisible = 0;
        defaultConfigurationName = Debug;
    };

    //(8)
    PBXNativeTarget
    1.是什么:  一个 对应可以生成可执行二进制程序或库文件的本地构建目标对象
    2.怎么才算: (new  one Target)
    2.什么结构:

    4B7F0FA51A41261700586554 /* HBStockWarning */ = { /// 一个二进制 产品
        isa = PBXNativeTarget;
        buildConfigurationList = 4B7F0FC91A41261700586554 ///  引用的是哪一套编译配置 引用的是 XCConfigurationList
        buildPhases = ( ///  编译资源 引用的 是哪些
                       E8F258048DDBF3F3061ACA19 /* [CP] Check Pods Manifest.lock */,
                       4B7F0FA21A41261700586554 /* Sources */,
                       4B7F0FA31A41261700586554 /* Frameworks */,
                       4B7F0FA41A41261700586554 /* Resources */,
                       6764B8586A1A541E13384BAC /* [CP] Embed Pods Frameworks */,
                       FAEF4BA67C896D3EF1E14F9E /* [CP] Copy Pods Resources */,
                       );
        buildRules = ( ///  编译规则 引用的 是哪些
                      );
        dependencies = ( /// 依赖项  引用的 是哪些
                        );
        name = HBStockWarning; /// Target名称
        productName = HBStockWarning; /// 产品名称
        productReference = 4B7F0FA61A41261700586554 /* HBStockWarning.app */; /// 目标文件 引用的是  PBXFileReference
        productType = "com.apple.product-type.application"; /// 产品 类型 （APP/.....）
    };


    //(9)
PBXProject:
    1.是什么:  工程，对应构建可执行的二进制目标程序或库，里面包含了编译工程所需的全部信息
    2.怎么才算: 只有一个
    2.什么结构:

    isa = PBXProject; /// 类型
    attributes = { /// 包含一些编译器的基本信息，版本，以及项目中的target，每一个target一个UUID
        CLASSPREFIX = HB; /// 类名前缀
        LastUpgradeCheck = 0820;
        ORGANIZATIONNAME = Touker; /// 组织名称
        TargetAttributes = { /// 所有 targets信息
            4B7F0FA51A41261700586554 = {  /// 此target UUID
                CreatedOnToolsVersion = 6.1.1; /// 创建项目的Xcode 版本
                DevelopmentTeam = QG479838Q3; /// 开发组
                ProvisioningStyle = Automatic; /// 签名方式（自动/手动）
                SystemCapabilities = {  ///系统所包含的功能
                    com.apple.BackgroundModes = {
                        enabled = 1; /// 后台模式
                    };
                    com.apple.Keychain = {
                        enabled = 1; ///钥匙串
                    };
                    com.apple.Push = {
                        enabled = 1; /// 推送功能
                    };
                    com.apple.SafariKeychain = {
                        enabled = 1; ///
                    };
                };
            };
        };
    };
    buildConfigurationList = 4B7F0FA11A41261700586554 ; /// 引用的是哪一套编译配置 引用的是 XCConfigurationList
    compatibilityVersion = "Xcode 3.2"; /// 应该是兼容版本 目前看来是 Xcode 3.2
    developmentRegion = English; /// 语言版本，English英语
    hasScannedForEncodings = 0; /// 是否已经扫描了文件编码信息
    knownRegions = (  /// 不同区域的本地资源文件列表
                    en,
                    Base,
                    "zh-Hans",
                    );
    mainGroup = 4B7F0F9D1A41261700586554; /// 项目引用的的主要文件组织，引用  PBXGroup 类型 对象
    productRefGroup = 4B7F0FA71A41261700586554 /* Products */; /// 产品引用的文件组织 PBXGroup 类型
    projectDirPath = ""; /// 项目路径 目前为空
    projectRoot = ""; /// 项目的根目录  目前为空
    targets = ( /// 此项目 包含的所以 target, 引用 PBXNativeTarget类型 对象
               4B7F0FA51A41261700586554 /* HBStockWarning */,
               );
};

