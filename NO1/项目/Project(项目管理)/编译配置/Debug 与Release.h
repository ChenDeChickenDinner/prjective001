
编译环境

Debug 与Release 编译配置
1:Debug通常称为调试版本，通过一系列编译选项的配合，编译的结果通常包含调试信息，而且不做任何优化，以为开发人员提供强大的应用程序调试能力,只有Debug版的程序才能设置断点、单步执行、使用TRACE/ASSERT等调试输出语句
2:Release通常称为发布版本，是为用户使用的。所以不保存调试信息，同时，它往往进行了各种优化，以期达到代码最小和速度最优
3. _DEBUG与NDEBUG 这两个是编译器的预处理器定义，默认情况下_DEBUG用于Debug版本，而NDEBUG用于Release版本。
区别具体体现在哪？（固定的区别 跟软区别）


用户自定义的 编译配置 与 系统的 （Debug 与Release）有什么关系





project-buildConfiguration 的体现
.其具体配置由project- info/build settings 中的 设置 来体现

Build Setting=====>编译设置 过滤栏设置：
操作栏：A->Basic:显示最常用的设置/ Customized:只显示已定制的构建设置 / All:显示全部设置 + B->Combined:当个对象的编译设置/Levels:所有对象的编译设置


配置元素: (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)



