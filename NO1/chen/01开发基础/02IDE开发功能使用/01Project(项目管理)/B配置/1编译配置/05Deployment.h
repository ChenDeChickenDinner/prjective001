--> Deployment (部署)
1:Additional Strip Flags
2:Additional Install Group
3:Additional Install Owner
4:Additional Install Permissions
5:Additional Permissions Files
6:Deployment Location
6:Deployment Postprocessing
6:Install Group
6:Install Owner
6:Install Permissions
6:Installation Build Products Location
6:Installation Directory
6:Resources Targted Device Family
6:Skip Install
6:Strip Debug Symbols During copy
6:Strip Linked Product
6:Strip style
6:Targeted Device Family
6:Use Separate Strip

Installation Directory:安装目录
静态库编译时，会被安装到默认路径 = $(LOCAL_APPS_DIR)

Skip Install:是否跳过安装
1.如果是NO,可能会被安装到默认路径/usr/local/lib
2.


Deployment -->《部署信息》
1.Deployment Target:       (:支持的最低部署版本（IPHONEOS_DEPLOYMENT_TARGET = 11.1）
2.Deployment Postprocessing:


3.Strip Linked Product：受到Deployment Postprocessing设置选项的影响，其开启才有效
设为YES的时候，app的构建过程多了这样两步，在app构建的开始，会生成一些.hmap辅助文件，在app构建的末尾，会执行Strip操作
当Strip Linked Product设为YES的时候，运行app，断点不会中断，在程序中打印[NSThread callStackSymbols]也无法看到类名和方法名


4.Strip Style：选择不同的Strip Style时，app构建末尾的Strip操作会被带上对应的参数 如果选择debugging symbols的话，函数调用栈中，类名和方法名还是可以看到的。

5.Strip Debug Symbols During Copy:

