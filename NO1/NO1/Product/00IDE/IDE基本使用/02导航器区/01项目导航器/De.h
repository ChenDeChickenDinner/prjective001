/**
 
 2:导航器区域
 1.项目导航器：项目的源码和资源文件。
 1:Group
 1:New Group  创建一个虚拟的文件夹
 2:New Group from Selection  将选择的 文件 添加到一个 虚拟的文件夹中
 2:File
 1:New File : 提供 Xcode模板 创建一个文件
 1:选择文件实际所在的文件夹目录,或者new 一个 folder(文件夹)
 2:Options 选项，选择添加到 哪个Group 哪个 Targets 中
 2:Add File to 当前工程  引用一个选定的文件，注意只是引用 不会复制，若此文件不在本工程中 就需要注意了，引用后源文件删除后会报红
 
 3:直接将文件拖入近工程 choose options for adding these files(选择选项来添加这些文件)
 1:Destination(目的地):Copy items if needed 当此文件不在次项目的文件目录下时候 会copy 一份到项目中，若不选，一旦原文件发生变化则 会报错
 2:Added folders
 1:Create groups  导入文件的时候会是逻辑结构，而不是物理结构 黄色的文件夹结构，和构建的Group是一样的（直接添加它的引用因为groups下的cpp文件是会被编译的）
 2:Create folfer references  创建引入的是蓝色的文件夹结构，物理路径,这些文件不会被编译，所以在使用的时候需要加入其路径 否则编译器就会告诉你找不到xxx.h文件。
 4:http://www.jianshu.com/p/2fb4dd080aef
 3:delete (Remove  References,删除引用 Move to Trash 删除文件)
 4:Sort 排序
 
 */
