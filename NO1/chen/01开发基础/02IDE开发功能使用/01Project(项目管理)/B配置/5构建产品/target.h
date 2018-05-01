/
 target:
1.target 种类
 a:application（应用程序）
 b:framwork/library(二进制包)
 c:test bundle(测试包）
 d:application extension(扩展程序)

2.不同种类 target 的组成设置不同
 a:framwork/library(二进制包) ===> 编译设置 编译依赖 编译过程 编译规则
 b:application（应用程序）     ===> 编译设置 编译依赖 编译过程 编译规则 (增加 info + 程序功能选项)


3.设置修改体现
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

a.paroductType:产品类型
a.productName:产品名称
a.productReference:产品引用地址
b.buildConfigurationList:产品 使用的 编译配置列表
b:dependencies:产品 使用的 编译依赖
b:buildPhases:产品 使用的 编译任务
b:buildRules:产品 使用的 编译规则



*/
