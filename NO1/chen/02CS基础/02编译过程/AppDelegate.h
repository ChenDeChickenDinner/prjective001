
No2.编译，链接，装载，Xcode build 工具调式，性能监控分析。
B3调式Prouct(Test)
编译链接 == 事件导航器（显示在工具区找到的任何事件。比如编译错误、语法错误、库链接异常，以及错误提示等）
DeBug运行  ==断点导航器（显示应用程序中标记的所有断点信息）(调式控制区 UI展示界面)
运行监控   ==调试导航器（显示应用程序在调试状态下资源占用状态以及堆栈信息。） Profile  + Analyze 性能检测 内存泄漏  instrument（运行分析工具）
测试    ==测试导航器（显示单元测试用例以及测试结果，还可以快速执行单元测试。）  Accessibility Inspector(检测工具)
日志   ==事件导航器（显示在工具区找到的任何事件。比如编译错误、语法错误、库链接异常，以及错误提示等）  destination create bot



Xcode会在文件系统中集中的缓存临时信息。

每次对Xcode iOS项目进行clean、build或者在iOS虚拟机上launch，Xcode都会在DeriveData文件夹中进行读写操作。换句话说，就是将Derived Data的读写从硬盘移动到内存中。
DeriveData文件夹中包含了所有的build信息、debug- 和 release- built targets以及项目的索引。当遇到零散索引（odd index）问题（代码块补全工作不正常、经常性的重建索引、或者运行项目缓慢）时，它可以有效地删除衍生数据。删除这个文件夹将会导致所有Xcode上的项目信息遭到破坏。
