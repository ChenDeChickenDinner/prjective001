/**
 
 Xcode

 Commdent B :--->直接编译，链接====>生成 .app 文件
 Archives:  --->直接编译，链接====>生成 .xcarchive 文件
 export: --->导出 ====>生成 .ipa 文件

 1：前提条件是什么/ 2：生成过程中做了什么，验证了什么/ 3：包，包含什么，适用于什么场景

 原始操作
 1:源文件 xx.c || 2:cc- c xx.c ===编译===>xx.o || 3:cc xx.o ===链接==>a.out || 4:./ 或者 直接双击 a.out ===运行可执行文件==>
 2:每次编译，链接所产生的新文件都会覆盖之前的文件
 3:若 直接  有 源文件 一步到 可执行文件。目标文件则不会产生出来
 4:可执行文件 的文件名 可随便起，切可以不要文件后缀 .out





 1:哪些可设置选项，此设置选项 作业与什么阶段


 Xcode-Project 设置
 （1）Info:
 1:Deployment Target：定义了我们这个工程在部署时使用的最低 iOS SDK 版本。

 
 2:Configurations：定义了我们在编译的时候可以使用的配置

     Configurations :一种编译配置 （在project 层级体现），每个targets 都拥有这几种配置
     1:可以产生 多种配置，这些配置的不同主要体现在 Build Setting 中的设置不同（开发阶段，测试阶段，发布阶段，各自可选择某个配置以来满足不同开发阶段的不同需求）
     2:创建后 在 某个 targets 的 Build Setting 设置 各自的 参数配置
     3:在 Edit Scheme 设置中 程序 运行的各个阶段 (Build - Run - Test - Profile - Analyze - Archive)选择不同的编译配置
     4:系统默认 有Debug和Release 二种配置
     5:Debug通常称为调试版本，通过一系列编译选项的配合，编译的结果通常包含调试信息，而且不做任何优化，以为开发人员提供强大的应用程序调试能力,只有Debug版的程序才能设置断点、单步执行、使用TRACE/ASSERT等调试输出语句
     6:Release通常称为发布版本，是为用户使用的。所以不保存调试信息，同时，它往往进行了各种优化，以期达到代码最小和速度最优
     7:主要区别 与 具体 设置的地方 ( http://www.51testing.com/html/93/352093-844586.html ) 最重要  _DEBUG与NDEBUG 这两个是编译器的预处理器定义，默认情况下_DEBUG用于Debug版本，而NDEBUG用于Release版本。它们可以说是重要的无以复加。因为，assert系列的断言仅仅在_DEBUG下生效


 3:Localizations：定义了我们应用的本地化语言

 （二）Build Setting=====>编译设置 过滤栏设置：
 A->Basic:显示最常用的设置/ Customized:自定义的设置 / All:显示全部设置
 B->Combined:当个对象的编译设置/Levels:所有对象的编译设置








 */
