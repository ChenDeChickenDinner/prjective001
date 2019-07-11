//
//  04ProjectXcodeproj.m
//  2019OC2
//
//  Created by xs on 2019/3/26.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "04ProjectXcodeproj.h"

https://www.jianshu.com/p/828c279df498

Project文件组织
a.属于各target的资源文件:
b.Products文件:项目各种target构建出的产品
c.Frameworks文件:
    1.项目各种target链接时候依赖的系统库,被添加到此
    2.链接的其它工程的库,被添加到此，如果是动态库则还有拷贝进target


workspace文件组织
    1.Project文件组织
    2.Project文件组织



Project添加资源文件
a.是否需要拷贝资源文件到项目中
b.是否保留目录结构
c.是否被添加到某tagerte中




//1.所有参与编译链接的文件
PBXBuildFile:一个被添加到某个tagerte的文件(所有类型的文件)

//2.buildSetting(BuildConfiguration)在编译环境下的编译设置
XCBuildConfiguration:【一个XCBuildConfiguration】
a.buildSettings={一套buildSetting设置};
b.name = Debug/Release;

XCConfigurationList:所有的编译配置
a.Project的(Debug/Release)【1个XCConfigurationList】
b.Target的(Debug/Release)【1个XCConfigurationList】



//3.buildPhases(编译依赖 链接依赖 资源依赖)
PBXSourcesBuildPhase:一个源文件单位(包含被添加进garget的所有实现文件)【Sources】

PBXFrameworksBuildPhase:一个链接库单位(包含garget所有需要链接的库)【Frameworks】

PBXResourcesBuildPhase:一个资源拷贝单位(包含被添加进garget的所有资源文件)【Resources】



//5.Target
PBXNativeTarget
buildConfigurationList = 4B7F0FC91A41261700586554 //  引用的是哪一套编译配置 引用的是
buildPhases = ( //  编译资源 引用的
buildRules = ( // 编译规则 引用的 是哪些x
dependencies = ( // 依赖项  引用的 是哪些 PBXTargetDependency
                
name = HBStockWarning; //Target名称
productName = HBStockWarning; // 产品名称
productReference = // 目标文件 引用的是  PBXFileReference
productType = // 产品 类型





//6.Project
PBXProject:
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
knownRegions = (  /// 不同区域的本地资源文件列表);

mainGroup = 4B7F0F9D1A41261700586554; /// 项目引用的的主要文件组织，引用  PBXGroup 类型 对象
productRefGroup = 4B7F0FA71A41261700586554 /* Products */; /// 产品引用的文件组织 PBXGroup 类型
projectDirPath = ""; /// 项目路径 目前为空
projectRoot = ""; /// 项目的根目录  目前为空
targets = ( /// 此项目 包含的所以 target, 引用 PBXNativeTarget类型 对象
           4B7F0FA51A41261700586554 /* HBStockWarning */,
           );
};
