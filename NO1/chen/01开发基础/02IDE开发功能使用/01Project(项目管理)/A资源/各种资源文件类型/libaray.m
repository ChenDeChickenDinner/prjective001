//
//  libaray.m
//  XcodeStudy
//
//  Created by xs on 2017/11/17.
//  Copyright © 2017年 Touker. All rights reserved.
//


/**
库(Library)
说白了就是一段编译好的二进制代码，加上头文件就可以供别人使用。好处（可以不暴露实现，用的时候只需要链接，不会浪费编译时间)

Link 的方式有两种，静态和动态，于是便产生了静态库和动态库


 静态库（http://www.jianshu.com/p/942dad59df2a）
 静态库即静态链接库（Windows 下的 .lib，Linux 和 Mac 下的 .a）。之所以叫做静态，是因为静态库在编译的时候会被直接拷贝一份，复制到目标程序里，这段代码在目标程序里就不会再改变了。

 静态库的好处很明显，编译完成之后，库文件实际上就没有作用了。目标程序没有外部依赖，直接就可以运行。当然其缺点也很明显，就是会使用目标程序的体积增大。



 动态库
 动态库即动态链接库（Windows 下的 .dll，Linux 下的 .so，Mac 下的 .dylib/.tbd）。与静态库相反，动态库在编译时并不会被拷贝到目标程序中，目标程序中只会存储指向动态库的引用。等到程序运行时，动态库才会被真正加载进来。

 动态库的优点是，不需要拷贝到目标程序中，不会影响目标程序的体积，而且同一份库可以被多个程序使用（因为这个原因，动态库也被称作共享库）。同时，编译时才载入的特性，也可以让我们随时对库进行替换，而不需要重新编译代码。动态库带来的问题主要是，动态载入会带来一部分性能损失，使用动态库也会使得程序依赖于外部环境。如果环境缺少动态库或者库的版本不正确，就会导致程序无法运行（Linux 下喜闻乐见的 lib not found 错误）。

 iOS Framework
 除了上面提到的 .a 和 .dylib/.tbd 之外，Mac OS/iOS 平台还可以使用 Framework。Framework 实际上是一种打包方式，将库的二进制文件，头文件和有关的资源文件打包到一起，方便管理和分发


想做成库的方式
1：打包成静态库 .a 文件，同时附上头文件。但是这样的打包方式不够方便，
2:在 iOS 8 之前，iOS 平台不支持使用动态 Framework，想出了各种奇技淫巧去让 Xcode Build 出 iOS 可以使用的 Framework，具体做法参考这里和这里，这种方法产生的 Framework 还有 “伪”(Fake) Framework 和 “真”(Real) Framework 的区别
3：iOS 8/Xcode 6 推出之后，iOS 平台添加了动态库的支持，同时 Xcode 6 也原生自带了 Framework 支持（动态和静态都可以）
 但是这种动态 Framework 和系统的 UIKit.Framework 还是有很大区别。系统的 Framework 不需要拷贝到目标程序中，我们自己做出来的 Framework 哪怕是动态的，最后也还是要拷贝到 App 中（App 和 Extension 的 Bundle 是共享的），因此苹果又把这种 Framework 称为Embedded Framework。



如何制作使用.a / Framework
 使用Xcode构建一个基本的静态库工程。
 依赖于该静态库工程构建一款应用。
 掌握如何将静态库工程转换为完整的、合格的Framework。
 最终，你将看到如何将一个图像文件同Framework一起打包到resource bundle下。




 */
