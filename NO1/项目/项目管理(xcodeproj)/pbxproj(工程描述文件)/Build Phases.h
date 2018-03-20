(编译文件)
 PBXBuildFile:一个被加入到某个targets 参加 编译、链接、资源拷贝的对象
 1.一个PBXFileReference文件《被某个target引用，需要参加编译》所产生的对象，不区分 具体的 target，即未被target引用的.m 文件 不算 他只能是PBXFileReference文件
 2.被引用一次就算一个 PBXBuildFile 对象，一个PBXFileReference 原文件可能被多个target引用编译就会产生多个PBXBuildFile 对象
 3.被PBXBuildFile 引用的 PBXFileReference  包括三大类型（Sources/Frameworks/Resources）
 (1).m in Sources
 (2).a / .dylib /.tbd /.framework  in Frameworks
 (3).xib  / .storyboard /.bundle/.json /.html/.p12 / .png /.der  in Resources


 （一个编译单位）BuildPhase
 1.一个target对应一个 编译单位，多个target，则会有多个。
 2.阶段类型
 （1）PBXSourcesBuildPhase:
 1.是什么：一个在编译阶段参加编译的，源文件单位。
 2.包含什么：files-->PBXBuildFile对象  .m源文件.
 3.怎么算进去的：被添加到target 的 complie sources 中

 (2)PBXFrameworksBuildPhase
 1.是什么：一个在编译阶段 参加链接的，链接库单位。
 2.包含什么：files-->PBXBuildFile对象 二进制文件.
 3.怎么算进去的：被添加到target 的 link binary with librarise 中

 (3)PBXResourcesBuildPhase
 1.是什么：一个在编译阶段 参加资源拷贝的，资源库。
 2.包含什么：files-->PBXBuildFile对象  资源文件.
 3.怎么算进去的：被添加到target 的 copy bundle resourecs 中
