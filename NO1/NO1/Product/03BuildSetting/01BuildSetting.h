//
//  01BuildSetting.h
//  NO1
//
//  Created by xs on 2017/12/1.
//  Copyright © 2017年 Touker. All rights reserved.
//


/**

 TARGET_NAME-->目标工程名（随工程创建的时候生产）Target 层级才有，不能修改 除非删除此Target
 PRODUCT_NAME--> 每个Target提供的一个 宏(可修改）， 默认=当前Target的TARGET_NAME
 Bundle name-->  安装到机子里的App文件夹名 info.plist里 （可修改）默认 = 当前Target的PRODUCT_NAME  ，英文的
 Executable name -– 执行程序名
 Bundle display name--屏幕显示名---每个Target提供的一个宏(可修改），默认=当前Target的PRODUCT_NAME

 1: dSYM


 2:  bitcode
 实际上在Xcode 7中，我们新建一个iOS程序时，bitcode选项默认是设置为YES的。我们可以在”Build Settings”->”Enable Bitcode”选项中看到这个设置。

 不过，我们现在需要考虑的是三个平台：iOS，Mac OS，watchOS。

 对应iOS，bitcode是可选的。
 对于watchOS，bitcode是必须的。
 Mac OS不支持bitcode。
 如果我们开启了bitcode，在提交包时，下面这个界面也会有个bitcode选项：

 3 :Enable Testbility 这是单元测试有关选项，项目里如果没有单元测试 就关了吧


 0:Build Variants 此项可以设定生成产品的变种
 Build Variants的值有三个：
 normal-用于生成普通的二进制文件
 profile-用于可以生成配置信息的二进制文件
 debug-用于生成带有debug标志、额外断言和诊断代码的二进制文件


 2:Debug Information Format 这个选项决定了记录debug信息的文件格式
 这个选项决定了记录debug信息的文件格式。选项有DWARF with dSYM File和DWARF。建议选择DWARF with dSYM File。DWARF是较老的文件格式，会在编译时将debug信息写在执行文件中。


 7:Precompiled Header Uses Files From Build Directory
 预编译build路径中的头文件。由于编译过程比较耗时，且两次编译之间未必会改动所有文件。因此将不会改动的常用文件保留成预编译文件将大大减少编译时的时间。建议这一项选择YES。

 9:Validate Built Product  这个选项决定了是否在编译的时候进行验证
 。验证的内容和app store的审查内容一致。默认选项是debug时不验证，release时验证，这样就保证了每个release版本都会通过validate，让被拒的风险在提交app store之前就暴露出来，减少损失。


 10:Require Only App_Extension-Safe API APP 扩展API 的使用
 因为app extension限制了某些API的使用， ( App Extensions不能使用的一些API ) ，因此在自定义自己的framework后，这个framework可能包含了某些在App Extensions里不能使用的API，因此为了安全起见才会给出这个警告。http://www.th7.cn/system/mac/201409/68944.shtml



 






 target 编辑的体现
















 */
