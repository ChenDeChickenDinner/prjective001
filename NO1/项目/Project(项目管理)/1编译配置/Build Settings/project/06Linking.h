--> Linking (链接)
一个程序从简单易读的代码到可执行文件往往要经历以下步骤：
源代码 > 预处理器 > 编译器 > 汇编器 > 机器码 > 链接器 > 可执行文件
源文件经过一系列处理以后，会生成对应的.obj文件，然后一个项目必然会有许多.obj文件，并且这些文件之间会有各种各样的联系，例如函数调用。链接器做的事就是把这些目标文件和所用的一些库链接在一起形成一个完整的可执行文件。

Other Linker Flags
有时候我们在安装第三方Pod的时候，在运行时会出现selector not recognized这样的崩溃。那可能就是因为这个第三方Pod里面有分类，Objective-C的链接器并不会为每个方法建立符号表，而是仅仅为类建立了符号表。这样的话，如果静态库中定义了已存在的一个类的分类，链接器就会以为这个类已经存在，不会把分类里的方法加入到这个类的method list里面。这样的话，在最后的可执行文件中，就会缺少分类里的代码，这样函数调用就失败了。

所以我们需要在Other Linker Flags里加入需要链接的静态库和对应的参数，这里的参数主要有以下三个:

-ObjC
加了这个参数后，链接器就会把静态库中所有的Objective-C类和分类都加载到最后的可执行文件中，虽然这样可能会因为加载了很多不必要的文件而导致可执行文件变大，但是这个参数很好地解决了我们所遇到的问题。

-all_load
当静态库中只有分类而没有类的时候，-ObjC参数就会失效了。这时候，就需要使用-all_load或者-force_load了。
-all_load会让链接器把所有找到的目标文件都加载到可执行文件中，但是千万不要随便使用这个参数！假如你使用了不止一个静态库文件，然后又使用了这个参数，那么你很有可能会遇到ld: duplicate symbol错误，因为不同的库文件里面可能会有相同的目标文件，所以建议在遇到-ObjC失效的情况下使用-force_load参数。

-force_load
-force_load所做的事情跟-all_load其实是一样的，但是-force_load需要指定要进行全部加载的库文件的路径，这样的话，你就只是完全加载了一个库文件，不影响其余库文件的按需加载。

一般我们在使用cocoapods的安装第三方库时，cocoapods默认会生成静态库，所以cocoapods会把这些静态库加入到Other Linker Flags里面，cocoapods安装完后我们能看到Other Linker Flags里有$(inherited)、-ObjC、-|libName、-framework换行 "framworkName"这些参数。每一个"framworkName"上面都会有一个-framework。

其实我们把除$(inherited)外的都删了也不会有错，删了之后我们把鼠标悬浮在Other Linker Flags的参数上面，还是能看到跟之前一样的配置，只是双击点进去就没了。应该就是$(inherited)继承了上一层的配置，但是这个上一层在哪呢？

1:Bundle Loader

2:Coppatibility Version

3:Current Library Version

4:Dead code stripping

5:display mangled names

6:don`t dead- strip inits and terms

7:dynamic Library install name

8:dynamic Library install name base

9:exportd symbols file

10:generate positioan-dependen executable

11:initialization routine

12:link with standard libraries

13:mach-0 type

14:order file

15:other librarian flags

16:other link flags

17:Path to link map file

18:perform single-object prelink

19: prelink libraries

21:perserve private external symbols

22:quote linker arguments

23:re-Exported framework names

24:re-Exported library names

25:re-Exported library paths

26:Runpath search paths

27:separately edit symbols

28:single-object prelink flags

29:symbol ordering flags

30: unexported symobls file

31: warning linker flags

32: write link map file

