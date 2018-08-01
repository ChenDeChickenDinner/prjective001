

Apple LLVM - Language

1.Prefix Header:预编头文件

2.Precompile Prefix Header:
设为YES时，pch文件会被预编译，预编译后的pch会被缓存起来，从而提高编译速度。需要编译的pch文件在Prefix Header中注册即可。
设为NO时，头文件pch不会被预编译，而是在每个用到它导入的框架类库中编译一次。每个引用了pch内容的.m文件都要编译一次pch，这会降低项目的编译速度。

3.Public Headers Folder Path:对外公开头文件路径


Apple LLVM - Code Generation
1.Generate Debug Symbols:YES时，每个源文件在编译成.o文件时，编译参数多了-g和-gmodules两项，编译产生的.o文件会大一些，当然最终生成的可执行文件也大一些。
当Generate Debug Symbols设置为NO的时候，在Xcode中设置的断点不会中断。但是在程序中打印[NSThread callStackSymbols]，依然可以看到类名和方法名

2.Debug Information Level
的默认值为Compiler default，还有一个选项是Line tables only；为Line tables only的时候，然后构建app，每个源文件在编译时，都多了一个编译参数：-gline-tables-only


--> User-Defined(自定义变量)
这里用户可以在debug、release或者自己定义的编译模式下设置不同的变量，可以达到一套代码同时支持多个不同版本的目的。比如可以编译出叫APP1和APP2两个名字不一样的APP



Apple LLVM -Preprocessing:
1.Preprocessor Macros(定义全局宏):GCC_PREPROCESSOR_DEFINITIONS = ("DEBUG=1",..)


--> Search Paths (搜索路径)
https://www.jianshu.com/p/9f9c1fd2e8b5
always search user paths:是否搜索用户指定的路径，默认是NO；已经被废弃


这里有两个很类似的选项，User Header Search Paths和Header Search Path，
1.没有被add到项目里的头文件，可以通过配置这二项来引入头文件.
2.Header Search Paths:是从系统目录空间中搜索文件；
3.User Header Search Paths:是从用户目录空间中搜索文件；
4.<> 是只从 Header Search Paths 中搜索
5."" 则能从 Header Search Paths 和 User Header Search Paths 中

设置路径
1.$(SRCROOT) / $(PROJECT_DIR) 基本没啥区别，都是指向本 *.xcodeproj所在的路径
2.通过../来调到上一层路径,返回上上层文件夹用../../
3.在若在本项目下的 库 被 添加尽量 会自动生成 路径
4.若不是在本项目下的 库 被添加进来 则需要手动设置 路径(提供方法1 方法2 正确设置 相对路径，只有在跟一个目录下，即使工程位置变得 也无影响)

recursive或non-recursive
recursive：遍历该目录，non-recursive：默认路径设置；不遍历该目录。如果路径的属性为recursive，那么编译的时候在找库的路径的时候，会遍历该目录下的所有子目录的库文件。PS：在搭建项目的时候，可以创建一个专门放库文件的文件夹并且设置其属性为recursive。$(PROJECT_DIR)/相当于遍历项目文件同级下的所有路径(不推荐使用，项目大的话，影响编译的速度)。

在(User) Header Search Path这个里面的每一个路径后面都会有一个选项recursive或non-recursive。这个表示是否递归搜索头文件。

有时候我们在#import的时候编译器会没有代码补全头文件，只能我们手动输入头文件的全名，这样是很不方便的。

比如我们用cocoapods引入某个.framework库的时候，默认路径后面都为non-recursive，也就是不递归搜索头文件，也就不会有代码补全。而且引入也要#import "frameworkName/public.h"这样引入，告诉编译器是哪个framework下的头文件。

但是如果我们在User Header Search Paths下输入${PODS_ROOT}并设置为recursive，那编译器就会帮你找到所有Pods目录下的头文件，包括framework里的所有头文件。这样你在#import的时候就会有自动补全提示了，而且引入framework的头文件也只需要这样引入#import "public.h"。但是这样带来的问题就是会浪费编译器的时间。

