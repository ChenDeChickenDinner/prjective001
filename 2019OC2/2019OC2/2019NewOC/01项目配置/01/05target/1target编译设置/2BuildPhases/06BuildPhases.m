/**
Build Phases --- -编译阶段 (依赖target,源代码文件,链接的库,拷贝的资源文件)


 A:target dependencies（target依赖关系）
1.本项目内
2.本项目外

 B：Compile Sources(编译源文件)
 1.add进target的实现文件

 C：Copy Bundle Resources(拷贝资源文件)
 1.add进target的资源文件


 D：Link Binary with Libraries(连接二进制文件和库)

 1.链接的系统的 需要手动添加进来
 2.链接外部的静态库.a add进target
 3.链接外部的静态库.framework add进target
 4.依赖的其它库形式的target也要add进target


E.Embed frameworks
1.链接外部的动态库需要添加到Embed Frameworks
















 */
