
 target:
1.target 种类
 a:application（应用程序）
 b:framwork/library(二进制包)
 c:test bundle(测试包）
 d:application extension(扩展程序)

2.不同种类 target 的组成设置不同
 a:framwork/library(二进制包) ===> 编译设置 编译依赖 编译过程 编译规则
 b:application（应用程序）     ===> 编译设置 编译依赖 编译过程 编译规则 (增加 info + 程序功能选项)


3.组成体现
PBXNativeTarget
55744D2B208F0CFD00DC86F6 / one / = {
    isa = PBXNativeTarget;
    buildConfigurationList = 55744D42208F0CFD00DC86F6 /* Build configuration list for PBXNativeTarget "one" */;
    buildPhases = (
                   55744D28208F0CFD00DC86F6 /* Sources */,
                   55744D29208F0CFD00DC86F6 /* Frameworks */,
                   55744D2A208F0CFD00DC86F6 /* Resources */,
                   55E4CAB62092F61700E56EDE /* CopyFiles */,
                   55E4CAB82092F62000E56EDE /* ShellScript */,
                   55E4CAB92092F62800E56EDE /* Headers */,
                   );
    buildRules = (55E4CAB52092F4EC00E56EDE /* PBXBuildRule */,);
    dependencies = ();
    name = one;
    productName = one;
    productReference = 55744D2C208F0CFD00DC86F6 /* one.app */;
    productType = "com.apple.product-type.application";
};
4.组成解析

A:基本信息
    A1.paroductType:产品类型{APP/Library}
    A2.productName:产品名称
    A3.productReference:产品引用地址

B:编译配置
    B1.buildConfigurationList:产品 使用的 编译配置列表{
    包含哪些编译环境:buildConfigurations = {
                    Debug环境:XCBuildConfiguration
                    Release环境:XCBuildConfiguration
                    };
    默认使用的编译环境:defaultConfigurationName = Release;
    }

C:编译 依赖，任务，规则
    C1:dependencies:产品 使用的 编译依赖{
        a>target dependencies:依赖的target====> 一个 PBXTargetDependency单位}

    C2:buildPhases:产品 使用的 编译任务{
        a1>Sources:编译的实现文件====> 一个 PBXSourcesBuildPhase单位
        a1>Frameworks:链接的系统库====> 一个 PBXFrameworksBuildPhase 单位
        a1>Resources:拷贝的资源文件====> 一个 PBXResourcesBuildPhase单位
        b1>CopyFiles:暴露的头文件====> 一个 PBXCopyFilesBuildPhase单位
        b1>ShellScript:编译的脚本====> 一个 PBXShellScriptBuildPhase单位
        b1>Headers:编译的脚本====> 一个 PBXHeadersBuildPhase单位
    }

    C3:buildRules:产品 使用的 编译规则{
        a>PBXBuildRule:指定特效类型文件的编译方式====> 一个 PBXBuildRule单位
    }


