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



库：
1.是什么：是程序代码的集合
2.分类：
开源库：源代码是公开的，可以看到每个实现文件（.m文件）的实现 ===》(被别人使用)
闭源库：不公开源代码，是经过编译后的二进制文件，看不到具体的实现 ===》(被别人使用，但隐藏其实现部分)


闭源库：
1.从本质上来说是一种可执行代码的二进制格式，可以被载入内存中执行。
2.库的组成依赖

3.库分静态库和动态库两种，是相对编译期和运行期的的角度来说的
静态库：在链接阶段，会将目标文件与静态库，一起链接打包到可执行文件中，如果多个程序用到，都会将其打包进自己的可执行文件中。程序运行阶段就不需要它了；
               1.一起与目标文件打包==》造成可执行文件 偏大
               2.谁用到谁就要将其 拷贝打包一份==>造成多次拷贝
               3.被打进可执行文件中，运行则不需要它==》若库发生变化 则需要重新 编译

动态库：动态库把对一些库函数的链接载入推迟到程序运行的时期（公用一份，不用拷贝，节省空间，增量更新）



iOS中二进制文件形式
.a 是一个纯二进制文件，要有 .h 文件以及资源文件配合。
.framework 本身已经包含了.h和其它文件，可以直接使用

iOS中静态库和动态库的存在的形式
静态库：以.a  + 个人打的framework
动态库：以.tbd/.dylib +  系统的framework

 iOS中动态库的使用
 iOS8 之前，苹果不允许第三方框架使用动态方式加载。
 iOS8 开始，允许开发者有条件地创建和使用动态框，但和系统的framework不同，其被放到 app  main bundle 的根目录 中，运行在沙盒里，而不是系统中。
               a:使用自定义的动态库的方式来动态更新只能用在 in house(企业发布) 和develop 模式中
               b:不能在使用到 AppStore，




4.被运行 运用的条件








framwork/library被运用
1.同一个项目中
a:系统的
1.在PBXFileReference中 增加 系统库文件夹:path = System/Library/Frameworks/AVFoundation.framework;
2.在PBXBuildFile 中  增加 对 引用文件的引用，作为编译文件
3.在PBXFrameworksBuildPhase中 增加 对 编译文件的 引用，作为链接文件

b:三方的
2.同一个xcworkspace，不同项目中

*/
