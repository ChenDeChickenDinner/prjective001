/**




 (六) Build Phases --- -编译阶段 (源代码文件,链接的库,拷贝的资源文件)
Build Phases是Xcode在build的时候执行的一些任务


 1：Compile Sources(编译源文件)
 section 中规定了所有必须参与编译的文件。需要留意的是，这里并没有指明这些文件是如何被编译处理的。关于处理这些文件的更多内容，
 此处列出的所有文件将根据相关的 rules 和 settings 被处理。
PBXSourcesBuildPhase

 2：Link Binary with Libraries(连接二进制文件和库)
 当编译结束之后，接下来就是将编译所生成的目标文件链接到一块
 这里面列出了所有的静态库和动态库，这些库会参与上面编译阶段生成的目标文件进行链接。静态库和动态库的处理过程有非常大的区别
PBXFrameworksBuildPhase


 3：Copy Bundle Resources(拷贝资源文件)
 当链接完成之后，build phase 中最后需要处理的就是将静态资源（例如图片和字体）拷贝到 app bundle 中,这些资源文件是数据文件，应用程序在运行时需要使用.
 默认情况下，添加到项目中的文件，如不是源代码文件，将添加到这个构建阶段,里面可能会包括 storyboard，xib，图片文件，JS 文件，CSS 文件，其他的资源包。
PBXResourcesBuildPhase



4.new run script phase :添加运行自定义脚本

PBXShellScriptBuildPhase
    isa = PBXShellScriptBuildPhase;
    buildActionMask = 2147483647;
    files = ();
    inputPaths = ( // 输入地址);
    name = "chenxaiowei "; //:脚本任务名称
    outputPaths = ( // 输出地址);
    runOnlyForDeploymentPostprocessing = 0;
    shellPath = /bin/sh; // 脚本位置
    shellScript = abcd; // 脚本代码
};

5.new copy files phase: 打成库时候暴露的头文件信息

 PBXCopyFilesBuildPhase
    isa = PBXCopyFilesBuildPhase;
    buildActionMask = 8;
    dstSubfolderSpec = 7; // 类型
    dstPath = 123321; // 地址
    files = ();       //文件
    runOnlyForDeploymentPostprocessing = 1;
};



6.new headers phase:打成framewrok库的时候设置头文件
 PBXHeadersBuildPhase
    isa = PBXHeadersBuildPhase;
    buildActionMask = 2147483647;
    files = (); //
    runOnlyForDeploymentPostprocessing = 0;
};
 a:public
 b:private
 c:project



 



 */
