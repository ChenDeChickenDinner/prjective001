


《被工程引用管理的所有资源文件》

（文件）PBXFileReference: 用于跟踪项目引用的每一个外部文件,比如源代码文件、资源文件、库文件、生成目标文件等。
1.是什么:工程引用的一个文件，包含任何类型/位置,的文件，可能此文件不在 项目文件目录下
2.怎么才算:只要一个文件拉入到此工程，被项目“管理”才算。如果某文件在项目目录下 但未添加进来 就不算。
3.什么结构:
557BB6E11FDA6F07003539FA /* AppDelegate.h */ = { // 对象唯一标识符 + 文件名注释
    isa = PBXFileReference;
    lastKnownFileType = sourcecode.c.h; // 文件真实类型 PBXFileType?
    path = AppDelegate.h;               // 文件位置（内部,绝对路径/外部,全局路径）
    sourceTree = "<group>";             // sourceTree?
};

lastKnownFileType : // 文件真实类型 {文件格式 + 本质（干什么的） + 怎么用（被别人用） + 最后变成什么}

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

（文件夹）PBXGroup:文件或者 文件夹的 集合单位
// 工程主文件夹，有且只有一个
55282EE7205923F5003750A8 = {
    isa = PBXGroup;
    children = (
                55282EF2205923F6003750A8 /* one */,
                55282EF1205923F6003750A8 /* Products */,
                );
    sourceTree = "<group>";
};

// 某个文件夹 被主文件夹 引用
55282EF1205923F6003750A8 /* Products */ = {
    isa = PBXGroup;
    children = (
                55282EF0205923F6003750A8 /* one.app */,
                );
    name = Products;
    sourceTree = "<group>";
};

//(3)
（本地化文件夹）PBXVariantGroup
对不同地区资源文件的引用管理。
