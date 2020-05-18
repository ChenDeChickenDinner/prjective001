
s.name 声明库的名称
s.summary 对这个库的简短说明介绍
s.version 当前库的版本
s.homepage 声明库的主页
s.license 所采用的授权版本
s.author 库的作者
s.platform 库运行的平台和系统的最低版本
s.source 库的仓库地址以及版本号或者committed等
s.source_files 声明库的源代码的位置，库的真正路径（一般是相对路径）所以这个地方不能填错。这个目录下的文件都会进行编译。
s.resources 存放我们不想参与编译的资源文件
s.frameworks声明了库所依赖的系统核心库
s.dependency我们开发的库中也可能还依赖第三方库，例如JSONKit，那么，就可以做如

