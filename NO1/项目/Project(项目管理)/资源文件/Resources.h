
《被工程引用管理的所有资源文件及其组织形式》

（文件）PBXFileReference:
1.是什么:用于跟踪项目引用的每一个外部文件(对应到磁盘),比如源代码文件、资源文件、库文件、生成目标文件等。可能此文件不在 项目文件目录下
2.怎么才算:只要一个文件拉入到此工程，被项目“管理”才算。如果某文件在项目目录下 但未添加进来 就不算。
3.元素介绍
path:文件路径
1.项目下的绝对路径:
2.SDK下的资源路径：iPhoneOS.sdk/System/Library/Frameworks/Accelerate.framework

sourceTree:文件来源
1.SDKROOT :SDK
2. "<group>":项目资源

lastKnownFileType : // 文件真实类型 {文件格式 + 本质（干什么的） + 怎么用（被别人用） + 最后变成什么}？？？？？？？？？？？


.h sourcecode.c.h
.m sourcecode.c.objc
.mm sourcecode.cpp.objcpp
.pch sourcecode.c.h
.tbd  sourcecode.text-based-dylib-definition

.der/.p12    file
.xib         file.xib
.storyboard  file.storyboard

.dylib   (compiled.mach-o.dylib)
.framework ==> (rapper.framework)
.bundle (wrapper.plug-in)

.a (archive.ar)

.plist    text.plist.xml
.xcconfig text.xcconfig
.json     text.json
.css      text.css

.png/.jpg  image.png
.app       wrapper.application
.xcassets  folder.assetcatalog
.lproj

（文件夹）PBXGroup:
0.项目管理的文件结构，只有被添加 引用到项目中 由项目管理的才算
1.工程主文件夹，有且只有一个，其包括 所有的 子 文件夹
2.引用的是 PBXFileReference，PBXGroup


（本地化文件夹）PBXVariantGroup:
对不同地区资源文件的引用管理。














