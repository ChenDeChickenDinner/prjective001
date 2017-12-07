/**
 
 File(文件操作)
 
 
 
工程级别的新建
 1:新增tab(分页)/window（窗口）
 
 2:新建file文件/ group 文件夹/group from selection 由当前选择来创建父级文件夹
 
 3:新建target/project/workspace/playground 项目，工程，工作空间,快速演示工具
 
new project/target
 1:Product Name : 产品名称
 2:Organization Name: 组织名称
 3:Organization Identifier:组织标示符
 4:Bundle Identifier: 包标示符(Xcode会根据产品名称,组织标示符自动生成这个名称)
 5:Language: 语言(包括Swift和Object-C)
 6:Devices:设备类型(可以选择该应用是在ipone上运行还是iPad上运行,还是通用型)
 7:Use Core Data:是否使用苹果自带的永久性存储,在这里先不勾选
 8:Include Unit Tests: 测试模块
 9:Include UI Tests: UI测试模块
 


添加删除文件
add files
 1:由Xcode工具主动添加的
 2:从外部拖入的
    destination:copy items if  needed（是否要在项目目录下复制资源）
     1：选中会拷贝一份与拖入的资源相同的资源。
     2：未选中，则不会进行拷贝，而是对拖入的资源进行引用.
 
    added filders:选择文件夹结构
     1:如果是文件，那么无论选择Create groups还是Create folder references都是一样的。
     2:如果是文件夹:目前都会在文件目录中创建相同的文件夹结构
     create groups 黄色文件夹
     create folder references 蓝色文件夹
    add to targets:是否加入targets参与编译
 
delete files
 remove reference 删除引用，文件不会删除
 move to trash(垃圾) 引用，连同文件一起删除

 

 
 对文件的操作
 save 保存当前编辑
 duplicate 复制一份保存在当前文件的同级目录
 revert to saved 将此文件的修改直接回退到上次保存时
 unlock 要对第三方库或系统文件进行修改时解锁
 export copy导出一份
 
 show in finder 在finder中展示
 open wih extrtnal editor 使用外部编辑器打开

 
 
 工作组
 save as workspace 另存为工作组
 workspace settings 工作组设置
     1:shared workspace settings
 
     2:per-user workspace settings
     build system:
     derived data:
     lssues:
 打印
 page setup... 页面设置，为打印而生
 print... 用打印机打印当前文件
 
 
 */
