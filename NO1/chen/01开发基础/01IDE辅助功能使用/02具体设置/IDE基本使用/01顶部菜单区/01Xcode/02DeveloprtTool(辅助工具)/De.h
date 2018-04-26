/**
 
 xcode->preference
 1 General通用设置
 1：Issues
 show live issues显示当前问题 设置Xcode是否实时监测当前文件中存在的问题
 continue building after errors 出现错误后仍然继续编译，默认情况下，发生错误后，会停止编译
 2:locked files:默认情况下，Xcode会锁定用户正在编辑的文件，防止被其他工具修改，勾选后，会允许其他工具修改
 3:find navigator detail:搜索导航器细节，可以选择搜索到的项目可以占据多少行的显示空间。
 4:issue navigator detail:问题导航器细节，可以选择当前问题占据多少行的显示空间。
 5:dialog warnings:对话框警告，重置不要再询问我，让其再次弹出警告。
 
 2 Accounts账户 用来管理苹果开发者账号以及Git相关的账户信息。
 1:点击+号，会出现添加账户，添加资源仓库，添加服务器三个选项。
 
 3Behaviors行为
 1:编译、测试、运行、CUP帧捕获、搜索、自动集成、文件部分。
 2:每个部分有各种阶段，包括开始、发现问题、成功、失败等阶段。对于每一阶段，我可以依次进行相关行为配置
 1:play sound:阶段完成时播放声音
 2:speak announcement using:使用系统自带的声音为开发者播报当前程序处于何种阶段
 3:notify using bezel or system notifacation:使用系统通知或者提醒卡来通知
 4:bounce Xcode icon in dock if application inactive:如果应用处于未激活状态，在dock中跳动
 5:show...:6个选项，分别设定xcode执行到该阶段时，要显示还是隐藏那些导航栏，那些窗口等
 6:navigate to:执行到该阶段时，跳转到第一条发现的问题还是当前日志
 7:run:执行到该阶段，执行选项所设定的apple script脚本
 
 4 Navigation导航
 1:activation:当打开某个标签页或者窗口时，让其保持活动状态。
 2:navigation:选择在使用导航区域的时候，是用的主编辑器primary还是辅助编focused辑器来打开新的导航文件
 3:optional navigation:当使用optional键来进行导航的时候，是使用同一个助理编辑器打开，还是使用另一个助理编辑器打开，或者另一个标签页或另一个窗口。
 4:double click navigation:双击导航时，使用另一个标签打开还是另一个窗口打开，或者让其和单击的操作相同。
 5 Fonts & Colors字体和颜色
 
 
 6 Text Editing文本编辑
 editing编辑  和  indentation缩进
 1:line numbers:是否显示行号
 2:code folding ribbon：是否显示代码折叠带。代码级别相同的代码段，左侧会有一个灰度不同的色带显示，灰度相同，表示同一个级别。
 3:focus code blocks on hover:是否悬停是聚焦代码块。鼠标悬停时，会有一个矩形边框来聚焦代码所在类别。
 4:page guide at column:页面的最大行长，设定一行最多有多少个字符，如果超出行长，会自动换行
 5:highlight instances of selected symbol:高亮选中的符号，高亮显示的符号是一条虚线显示的，delay表示高亮效果多久会显示出来。
 1:suggest completions while typing:输入时显示代码提示
 2:use escape key to show completion suggestions:使用esc来显示代码提示
 3:automatically insert closing braces:自动插入结束符
 4:enable type-over completions:启动结束符自动完成，即输入{后，自动补齐后面的}
 automatically trim trailing whitespace:自动删除代码两侧的空格
 
 show iteration counts:显示迭代计算
 
 
 可以设置tab和缩进的空格数目。
 line wrapping:换行，可以设置是否允许换行，允许的话，还可以设置换行之后行的缩进字符长度
 syntax-aware indenting:语法换行，根据语法来自动决定换行的行为
 Automatic indent for:自动缩进，设定哪些符号可以自动执行自动缩进功能
 
 
 
 7 Key Bindings快捷键
 8 Source Control源代码管理
 1:enable source control:启用源代码管理，决定了源代码管理是否可用。
 refresh local status automatically:自动刷新本地状态，决定是否自动更新
 refresh server status automatically:自动刷新远程服务器状态，决定远程代码源中代码是否会自动保存
 add and remove files automatically:自动添加和移除文件，当远程代码库更新后，自动添加和移除本地项目所没有的文件
 show local revision on ... side:在...侧显示本地版本，决定本地版本在哪一侧。
 
 9 components组件 可以下载不同系统的模拟器SDK组件和参考文档。
 10 Locations位置  配置常用的路径
 1:derived data:缓存文件路劲
 2:archives:打包文件路径
 3: command line tools:命令行工具，选择使用哪一个版本的命令行工具来执行程序
 4:custom paths:定义一些路径的别名，方便使用。
 
 */
