
--> Headers(头部)
1:Run unifdef on product headers
2:Unifdef Flags for product headers





--> User-Defined(自定义变量)
这里用户可以在debug、release或者自己定义的编译模式下设置不同的变量，可以达到一套代码同时支持多个不同版本的目的。比如可以编译出叫APP1和APP2两个名字不一样的APP





--> Search Paths (搜索路径)

always search user paths:是否搜索用户指定的路径，默认是NO；
framework search paths:工程引用的framework搜索路径
header search paths:工程中引用的头文件搜索路径
linrary search paths:library搜索路径，比如静态.a库
rez search paths
use header maps
user header search paths:设置头文件搜索路径，这个只有当Always Search User Path开启后才有效。

--> versioning  (版本控制)
--> Kernel Module (内核模块)
