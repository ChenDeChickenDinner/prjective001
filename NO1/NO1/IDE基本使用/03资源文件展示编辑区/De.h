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



project(编辑配置 + 检查器)

target(编辑配置 + 检查器)

Product(编辑配置 + 检查器)

workspace 管理

工具链

C语言/OC 语言/Foundation/UIKit/控件+ 编辑器/






 五大内存分区
 1、栈区(stack): —由编译器自动分配释放，存放函数的参数值，局部变量的值等。
 2、堆区(heap): 一般由程序员分配释放，若程序员不释放，程序结束时由系统释放。
 3、全局区(静态区,static): 全局变量和静态变量的存储是放在一块的，初始化的全局变量和静态变量在一块区域，未初始化的全局变量和未初始化的静态变量在相邻的另一块区域。程序结束后由系统释放。
 4、文字常量区: 常量字符串就是放在这里的。程序结束后由系统释放。
 5、程序代码区: 存放函数体的二进制代码。







 Build===>
 预编译--->对所有代码，包括头文件、宏定义、条件编译和执行代码，都整合为一个整体。

 编译--->编译过程就是把预处理的文件经过一系列的词法分析、语法分析、语义分析、生成中间代码、生成目标代码 优化后生成相应的汇编文件代码==>汇编代码 .s

 汇编--->汇编器将汇编代码转变成机器可以执行的指令，每一个汇编语句几乎都对应一条机器指令，到这一步，经过预编译、编译和汇编===>目标文件 .o

 链接--->链接过程包括 :将所有的 .o文件和系统函数库组合在一起。  ===>可执行文件文件 .out

 装载--->程序想要运行起来, 就必须被装载进内存中才能被CPU调度到





编译
1:作用，其核心功能是将源代码（C/C++,Java,C#,html等）翻译成目标代码（X86，ARM,IA64等）,源语言---->目标机器
2.编译器的结构
 1:符号表,是一种翻译器的数据结构。在符号表中，程序源代码中的每个标识符都和它的声明或使用信息绑定在一起，比如其数据类型、作用域以及内存地址。
 2:编译前端-->词法分析、语法分析、语义分析中间代码生成（前端处理的是跟源语言有关的属性）======>前端接收源程序产生一个中间表示
 3:编译后端-->代码优化、目标代码生成部分(后端处理跟目标机器有关的属性) ======>后端接收中间表示继续生成一个目标程序

3 编译器的结构实际上是异常复杂的，主要在于三个因素。
 1、高级编程语言本身就异常复杂，就拿C++来说，至今没有一个编译器能够比较完整的支持C++标准语言所规定的所有语言特性。
 2、计算机的 CPU 也同样异常复杂。
 3、要求编译器要支持多种硬件平台，即要求编译器能生成与多种 CPU 匹配的代码。


 预编译:
 1. 展开所有宏定义 头文件、宏定义、条件编译
 2. 整理：删除程序中的注释和多余的空白字符
 3. 添加行号和文件名标识


词法分析
源代码程序被输入到扫描器，扫描器的任务很简单，它只是简单的进行词法分析。运用有限状态机的算法可以很轻松的将源代码的字符序列分割成一系列的记号，字符流。---->记号流


词法分析器
A:关键因素
字符流：即程序员写的代码，与被编译语言密切相关
记号流：编译器内部定义的数据结构，编码所识别出的词法单元Token.
B:做了什么
1：将字符流读入，根据关键字、标识符、标点、字符串、整形数等进行划分，形成记号流（单词）
2:表现形式if(x>5) ====> token{k=IF,lexeme=0};token{k=IPAREN,lexeme=0};token{k=ID,lexeme="X"};

C:实现方式
1.手工编码实现法。这种方法相对复杂，容易出错，但是非常流行的方法，如GCC,LLVM等。
2.词法分析器的生成器。这种方法可快速原型，代码量少，但较难控制细节。

D:运行形式
1.一种，把词法分析器当成语法分析的一部分,词法分析器不断地被语法分析器调用，每调用一次词法分析器将从源程序的字符序列拼出一个单词，并将其Token值返回给语法分析器。
2.一种，把词法分析器当成编译程序的独立部分，词法分析器不是被语法分析器不断地调用，而是一次扫描全部单词完成编译器的独立一遍任务

 总:词法分析是将输入的符号流转换成一个个独立的token，这个token解析的过程，它前面是什么符号，后面是什么符号，完全没有关系。




语法分析
1.按照源语言的语法规则，从词法分析的结果中识别出相应的语法范畴，如“程序”，“语句”，“表达式”等等，同时进行语法检查。---->语法树


语法分析器

B:做了什么
1.按照源语言的语法规则，从词法分析的结果中识别出相应的语法范畴，同时进行语法检查
2.由语法分析器生成的语法树就是以表达式为节点的树，语法树将字符串格式的源代码转化为树状的数据结构，更容易被计算机理解和处理

C:实现方式
目前，已存在许多语法分析的方法。但就产生语法树的方向而言，可大致把他们分为自底向上和自顶向下两大类。目前比较流行LL分析法和LR分析法
1.自上而下语法分析方法
2.自下而上语法分析方法



语义分析
1。是对，结构上正确的源程序,按照语法分析器识别的语法范畴进行语义检查和处理, 进行类型类型检测,并报告错误。---->中间代码
2.经过语义分析之后，在语法分析生成的语法树的基础上进一步对表达式做一些标识。
3.这里要说明一下编译器分析的语义都是静态语义，静态语义是指在编译器件可以确定的语义，与之对应的动态语义只能在运行期间才能被确定。
 静态语义分析通常包括声明、类型匹配、类型转换等





词法分析====>注重的是每个单词是否合法，以及这个单词属于语言中的哪些部分。
语法分析====>注重的是一个一个的推导式，是将词法分析中得到的单词按照语法规则进行组合。
语义分析====>就是要了解各个推导式之间的关系是否合法，主要体现在推导式中使用的终结符和非终结符之间的关系，也就是它们的类型。所以语义分析注重的一个方面是类型检测。



中间代码
 1.是介于源代码 跟 目标代码之间的一种代码形式，它既不 依赖 具体的 程序语言，也不依赖具体的目标机，它仅仅只是描述了代码要做的事情。
 2.对不同的程序语言进行编译时，可以采用同一种形式的中间代码，同一种形式的中间代码可以换成不同目标机 的目标代码
 3.在中间代码上可以进行各种 不依赖目标机的优化，这些优化程序可以在不同的程序语言 和不同的目标机的编译程序中重复使用

4.形式，中间语言有多种形式，常见的有逆波兰记号、四元式、三元式和树。




目标代码生成与优化
1.经过上面生成中间代码步骤之后，这一步骤属于编译器后端。该步骤主要的任务是生成并优化目标代码，目标代码亦称为汇编代码（其实和汇编代码非常接近）
2.二进制机器码，后缀为 .o 的目标文件。

代码生成器
1.将中间代码转换成目标机器代码，此过程依赖目标机器，应为不同的机器有不同的寄存器、整数数据类型和浮点数据类型等。

目标代码优化器
2.主要是对目标代码进行优化，如：选择合适的寻址方式、使用位移代替乘法运算、删除多余的指令等






 编译器--的结果
 1.编译时编译器只对单个文件进行处理，

 产生的问题
 1.如果该文件里面需要引用到其他文件中的符号（例如全局变量或者函数），那么这时在这个文件中该符号的地址是没法确定的，

 解决
 1.链接的过程实际上是为了解决多个文件之间符号引用的问题,链接器把所有的目标文件连接到一起的时候才能确定最终的地址


链接
链接器主要是将有关的目标文件彼此相连接生成可加载、可执行的目标文件。链接器的核心工作就是符号表解析和重定位。















 */
