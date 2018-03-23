
--> Headers(头部)
1:Run unifdef on product headers
2:Unifdef Flags for product headers





--> User-Defined(自定义变量)
这里用户可以在debug、release或者自己定义的编译模式下设置不同的变量，可以达到一套代码同时支持多个不同版本的目的。比如可以编译出叫APP1和APP2两个名字不一样的APP





--> Search Paths (搜索路径)

always search user paths:是否搜索用户指定的路径，默认是NO；
优先搜索User Header Search Paths路径下的文件，这种情况下如果有同名的头文件，那么User Header Search Paths就会覆盖Header Search Paths里的文件。



framework search paths:工程引用的framework搜索路径
header search paths:工程中引用的头文件搜索路径
linrary search paths:library搜索路径，比如静态.a库
rez search paths
use header maps
user header search paths:设置头文件搜索路径，这个只有当Always Search User Path开启后才有效。


这里有两个很类似的选项，User Header Search Paths和Header Search Path，
一般带Users的是表示用户自定义的头文件的搜索路径。
Header Search Paths 顾名思义就是用来存放 Project 中头文件的搜索根源，没有被add到项目里的头文件，可以通过配置Header Search Paths 来引入头文件，这样的好处可以不让project 包含的文件太多，便于管理。

浅显一点的区别是，编码时候通过 #include 引入头文件的方式有两种 <> 和 ""。<> 是只从 Header Search Paths 中搜索， 而 "" 则能从 Header Search Paths 和 User Header Search Paths 中搜索。换言之 ，假如你把 路径加到 User Header Search Paths 中，那么 你用 #include <file.h> 的方式去引入对应的头文件，就会报错。 如果加到 Header Search Paths, 就没有问题了。

具体一点的区别是，<> 是从系统目录空间 （对应 Header Search Paths）中搜索文件， "" 是从用户目录空间（对应 User Header Search Paths）中搜索文件。如果你把路径加到 User Header Search Paths 中，而 <> 无法从系统目录空间中找到新加的路径，从而报错。

所以如cocoapods这样安装第三方库的话，cocoapods会在Header Search Path写入对应库的路径，比如："${PODS_ROOT}/Headers/Public/AFNetworking"，而User Header Search Paths会是空的。



recursive或non-recursive

在(User) Header Search Path这个里面的每一个路径后面都会有一个选项recursive或non-recursive。这个表示是否递归搜索头文件。

有时候我们在#import的时候编译器会没有代码补全头文件，只能我们手动输入头文件的全名，这样是很不方便的。

比如我们用cocoapods引入某个.framework库的时候，默认路径后面都为non-recursive，也就是不递归搜索头文件，也就不会有代码补全。而且引入也要#import "frameworkName/public.h"这样引入，告诉编译器是哪个framework下的头文件。

但是如果我们在User Header Search Paths下输入${PODS_ROOT}并设置为recursive，那编译器就会帮你找到所有Pods目录下的头文件，包括framework里的所有头文件。这样你在#import的时候就会有自动补全提示了，而且引入framework的头文件也只需要这样引入#import "public.h"。但是这样带来的问题就是会浪费编译器的时间。




--> versioning  (版本控制数据库)



