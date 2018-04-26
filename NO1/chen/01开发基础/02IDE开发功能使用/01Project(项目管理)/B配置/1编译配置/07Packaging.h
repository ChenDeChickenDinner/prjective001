--> Packaging  (包)
convert copied files:

create info.plist section in binary
启用该设置将在产品的链接创建一个部分包含处理的二进制信息。plist文件为目标。这个设置只适用于命令行工具的目标。

defines module
是否定义模块。默认app类的工程为NO，framwork工程默认为YES。

executable extension:这是用于生成的可执行产品的扩展目标,根据产品类型有一个默认值。

executable prefix:前缀用于生成的可执行的产品目标,根据产品类型有一个默认值。

expand build setting in info.plist file
告诉编译器是否处理info.plist。默认是YES。这是一个很大的特点，因为它避免了有根据您的构建设置和配置不同的Info.plist中，避免您在多个地方修改设置。 但是如果你真的不想要它，只需在项目或目标的构建设置中关闭此设置。


force package info generation:

framework version:框架包被在子文件夹内容版本的版本文件夹及其内容当前版本的链接。

info.plist file
创建工程后默认会创建一个info.plist文件。也可以根据需要进行主动创建。

info.plist output encoding:
property list output encoding:
strings file output encoding:

info.plist other preprocessor flags:
info.plist preprocessor definitions:
info.plist preprocessor prefix file:

module map file:这是LLVM project-relative路径模块映射文件,定义了模块结构的编译器。如果空,它将自动生成合适的产品当DEFINES_MODULE启用。

preprocess info.plist file:预处理的信息。plist文件使用C预处理器。

preserve HFS data:导致资源的复制保护资源叉和查找信息。

private module map file:私有头文件
private headers folder path:私有头文件的存放位置。

public headers folder path:公共头文件路径
设为“include”（具体的头文件路径为：$(BUILT_PRODUCTS_DIR)/include/xx.h）
在最终文件.a同级目录下生成一个include目录
默认：/usr/local/include
Public Headers Folder Path这个路径就是使用这lib的某工程需要依赖的外部头文件.导入这路径后，#include/import "xx.h"才能看到

product bundle identifier：产品bundle的标识


product module name:产品模块名称

product name:产品名称







wrapper extension:打包的扩展名，默认app。

