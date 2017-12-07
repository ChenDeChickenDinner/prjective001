/**


source:编码文件(编辑配置 + 检查器)

A:identity abd tpye(标识跟类型)
    name 文件名称
    type  文件类型
        location 位置
        absolute path 绝对路径
        relative to group 相对于组
        relative to project 相对于项目
        relative to  developer directory 相对于开发人员目录
        relative to  build products 相对于建立产品
        relative to  adk 相对于 adk
    full path 路径

B: on demand resource tags(标签)

C:target membership (被哪些 target包含，编译)

D: text setting
    A:text encoding （编码方式）
    B:line endings
    C:indent using 缩进使用（spaces/tabs）
    D:widths 宽度设置( tab换行/indent 缩进)
    E:wrap lines(是否)






 user interface:交互文件(编辑配置 + 检查器).xib/.storyboard/

(一)文件配置
 A:identity abd tpye(标识跟类型)
 name 文件名称/ type  文件类型/location 位置/full path 路径

 B: on demand resource tags(标签)

 C:interface builder document(界面构建器文档)
    opens in 以什么xcode 版本打开
    builds for 编译版本
     use auto layout
     use trait variations
     use safe area layout guides
     use as launch screen
    global tint

 D:localization (本地化)

 E:target membership (被哪些 target包含，编译)


(二)quick help
(三)文件属性

A:Custom class
    1:calss
    2:module

B:Identity
    1:restoration id

C: User defined runtime attributes
    1:key path  type value

D:Document
    1:lable
    2: object id
    3: lock
    4: notes
E:Accessibility
     1:accessibility--enabled
     2:lable
     3:hint
     4:identifier

     5:traits
        button/ image / static text/search field/
        plays sound/keyboard key/summary element/user interaction enabled
        updates frequently/starts media session/adjustable/aloows direct interaction
        causes page turn/header/link/selected

(四)控件属性
A:控件

B:Control
     1:alignment(horizontal/vertical)
     2:stats(selected/enabled/highighted)


C:View
    1:content mode
    2:semantic
    3:tag

    4:interaction(user interaction enabled/multiple touch)

    5:alpha
    6:background
    7:tint

    8:drawing(opaque/hidden/clears graphics context/clip to bounds/autoresize subviews)

    9:stretching(x/y/width/height)
    10:installed


(五)控件约束
A:控件

B:View
    1:show(frame rectangle/ alignment rectangle)(x/y/width/height)
    2:arrange
    3:autoressizing
    4:layout margins(default/language directional/fixed)

(六)控件连接器
    1:outlet collections
    2:sent events
    3:referencing outlets
    4:referencing outlet collections



从资源文件到可执行文件的基本概念

有哪些资源文件 文件是什么 怎么被使用的  怎么被编辑设置的
 resource:资源文件(编辑配置 + 检查器)
 编码文件:.h/.m/.main/
 二进制文件:.a/.dylib/.tbd/Framework
 资源文件:.xcassets/bundle/文本/图片/音频
 配置文件:.plist/.xcconfig/





















 */
