/**


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










 */
