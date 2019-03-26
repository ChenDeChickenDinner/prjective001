 (3)--> Build Options  -- 编译选项（编译器选择，debug文件类型，Bitcode，生成的文件类型，私有API验证）


1:Always Embed swift standard libraries ( ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;)
是否 总是嵌入switf标准库,对于未使用swift代码的情况可以设置为NO。(ALWAYS_EMBED_SWIFT_STANDARD_LIBRARIES = YES;)

2.Build Variants   ( BUILD_VARIANTS = (normal,profile) )
1.此项可以设定生成产品的变种。您可以创建额外的产品变种作为特殊用途。例如，您可以使用编译配置文件的名称来创建一个高度定制的二进制文件。
2.选项，normal-用于生成普通的二进制文件； profile-用于可以生成配置信息的二进制文件； debug-用于生成带有debug标志、额外断言和诊断代码的二进制文件。


3:Compiler for C/C++/Objective-C ( GCC_VERSION = 000;)
选择使用的编译器。目前Xcode8.2默认使用APPLE LLVM 8.0版本的编译器。

4:Debug Information Format （DEBUG_INFORMATION_FORMAT = dwarf）
这个选项决定了记录debug信息的文件格式,选项有DWARF with dSYM File和DWARF。建议选择DWARF with dSYM File。DWARF是较老的文件格式，会在编译时将debug信息写在执行文件中。

5:Enable Bitcode(ENABLE_BITCODE = YES;)
1.Bitcode(一种中间代码形式)
2.包含bitcode配置的程序将会在App store上被编译和链接。bitcode允许苹果在后期重新优化我们程序的二进制文件，而不需要我们重新提交一个新的版本到App store上。
3.当我们提交程序到App store上时，Xcode会将程序编译为一个中间表现形式(bitcode)。然后App store会再将这个botcode编译为可执行的64位或32位程序。

6:enable index-while-building functionlity( COMPILER_INDEX_STORE_ENABLE = YES;) ?
控制编译器是否应该发出索引数据而构建。


6:Enable Testability (ENABLE_TESTABILITY = YES;)
这个设置被激活时,该产品将由选项适合运行自动化测试,可以访问私有接口等测试。这可能导致测试运行速度低于他们会没有启用可测试性。


7:excluded source file names ?
8:included source file name  ?

9:Generate Profiling Code( GENERATE_PROFILING_CODE = YES;)
激活这个设置会导致编译器和链接器生成分析代码。例如,GCC会生成代码适合使用gprof了(1)。



10:Precompiled Header Uses Files From Build Directory(PRECOMPS_INCLUDE_HEADERS_FROM_BUILT_PRODUCTS_DIR = YES;)
预编译build路径中的头文件。由于编译过程比较耗时，且两次编译之间未必会改动所有文件。因此将不会改动的常用文件保留成预编译文件将大大减少编译时的时间。建议这一项选择YES。

11:Require Only App_Extension-Safe(APPLICATION_EXTENSION_API_ONLY = NO;) ?
如果我们要想应用扩展使用内嵌框架，那么首先要配置一下。将target的Require Only App-Extension-Safe API选项设置为Yes。如果你不这样设置，那么Xcode会向你提示警告：linking against dylib not safe for use in application extensions。


12:Scan All Source Files for Includes ( SCAN_ALL_SOURCE_FILES_FOR_INCLUDES = YES;)?
扫描include文件所包含的所有源文件。


13: Validate Built Product(VALIDATE_PRODUCT = NO;)
这个选项决定了是否在编译的时候进行验证。验证的内容和app store的审查内容一致。默认选项是debug时不验证，release时验证。
