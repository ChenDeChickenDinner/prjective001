

projetc  <BuildConfiguration汇总>
配置元素: (指令集,编译目录,编译选项,部署,链接,签名,内核模块,Headers,Packaging,versioning)

--> Architectures:硬件，平台，运行的SDK



--> Build Options  -- 编译选项（编译器选择，debug文件类型，Bitcode，生成的文件类型，私有API验证）


--> Deployment (部署)
--> Linking (链接)
--> Packaging(包)
--> signing (签名)




--> User-Defined(自定义变量)
--> Headers(头部)



TARGET_NAME-->目标工程名（随工程创建的时候生产）Target 层级才有，不能修改 除非删除此Target
PRODUCT_NAME--> 每个Target提供的一个 宏(可修改）， 默认=当前Target的TARGET_NAME
Bundle name-->  安装到机子里的App文件夹名 info.plist里 （可修改）默认 = 当前Target的PRODUCT_NAME  ，英文的
Executable name -– 执行程序名
Bundle display name--屏幕显示名---每个Target提供的一个宏(可修改），默认=当前Target的PRODUCT_NAME



target  <BuildConfiguration汇总>




projetc <BuildConfigurationFile配置文件>



1.BuildConfiguration 包含哪些设置，哪些是不在其管理范围内的
2.一套 BuildConfiguration 在工程上体现在哪

