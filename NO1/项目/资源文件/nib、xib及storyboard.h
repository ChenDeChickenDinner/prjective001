
iOS之nib、xib及storyboard的区别
nib
是3.0版本以前的产物，在终端下我们可以看到，NIB其实是一个文件夹，里面有可执行的二进制文件，二进制格式不好管理，也不方便版本控制

xib
是一个XML格式的纯文本描述文件，可以实现可视化编程。，在工程编译的时候再转换成 nib。Xib就是一个描述文档


storyboard
是多个xib文件集合的描述文件，也采用xml格式



xib和nib都是Interface Builder的图形界面设计文档，nib这个名字来自于NeXTSTEP系统，在NeXTSTEP被Apple收购之前，一直使用nib作为Interface Builder的图形文档，nib的发展经过了nib2.0,nib3.0，到NeXTSTEP被Apple收购之后，带有NeXTSTEP标志的nib被换成了xib

与nib不同的是，xib是一个XML格式的纯文本文件，而nib是一个二进制文件，xib比nib有个很明显的好处，就是xib可以很方便地进行diff操作。由于xib是文本文件，所以在版本控制和管理方面比nib更有优势。然而，不论在 Interface Builder中选择的是nib还是xib格式，Xcode编译后都将得到一个供程序运行时使用的经过编译的二进制nib文件。现在最新版本的Xcode在创建项目时，已经默认使用xib格式的文档了。

实际上，nib的生成过程就是一个序列化的过程，

nib文件的生成要经历两种序列化。

1.  IB所用的文档的序列化，序列化的结果就是这个XML文件。它保存的是所有界面的资源信息和各个对象之间的关系。

2.  编译时对这个xml文件进行的序列化，序列化的结果是二进制的nib文件。



写过IBPlugin的人应该知道，所有的控件必须支持initWithCoder和encodeWithCoder的NSCoding规范，这个就是用来被NSKeyedArchiver序列化用的。

编译时对xml文件做了如下操作

1.  读取xml文件，生成所有界面对象，生成所有object（即自定义的controller类等），设置好各个obejct之间的联系（IBAction，IBOutlet）

2.  对这一坨对象进行序列化，即调用encodeWithCoder方法来序列化，生成二进制nib文件为什么要生成二进制文件，因为从二进制文件生成类实例更快一些。

而在程序运行时，对nib文件进行反序列化的过程

运行时对nib的操作
1.  反序列化，调用所有对象的initWithCoder方法
2.  某些类的initWithFrame，init之类的方法被调用，生成所有类实例

3.  发送awakeFromNib消息，每个类实例的awakeFromNib被调用



引用《Cocoa Programming for Mac OSX》一书的说法，Interface Builder 把窗口、菜单栏以及窗口上的各种控件的对象都“冻结”在了一个 NIB文档里面了；程序运行时，这些对象将会“苏醒”。

猜测nib2.0/3.0时代的多出来的二进制文件应该就是被编译序列化之后的文件，即nib2.0/3.0的nib文件由界面信息文件和运行时二进制文件组成。
由以上的可以看出，凡是被拖到nib里面的对象都会被自动创建实例，无需你代码手动创建（扫盲了。。。），需要用到的话，添加一个IBOutlet即可。





Nib文件是保存由Interface Builder创建的对象及对象间关系的一种资源文档。Nib文件中的对象包括:接口对象(可视化对象–窗口,视图,控件,菜单等；非可视化对象–窗口控制器,视图控制器,程序委托代理等)和占位符对象(File’s Owner,First  Responder,Application)。它描述了对象，以及对象间的关系。对象间的关系包括：连接Nib文件的所有者-File’s Owner,属性实例变量绑定，动作方法绑定和委托绑定。当Nib文件被加载后，接口对象被创建，占位符对象并不会被创建。应该在你的代码中创建此占位符对象，并把它传递给nib的加载代码。

1、将Nib文件内容与相关资源加载到内存

将全部的Nib对象图(object graph)的原始数据加载到内存，但是数据是序列化(unarchived)的。
将所有与Nib文件相关的自定义图片资源加载到内存，且被添加到Cocoa image cache。
将所有与Nib文件相关的声音资源加载到内存，且被添加到Cocoa sound cache。
2、反序列化Nib对象图数据，初始化对象。每个新对象如何初始化取决于对象类型以及序列化的方式。

通常情况下，对象通过initWithCoder:初始化。在iOS中，任何服从NSCoding协议的对象都通过initWithCoder方法初始化。这包括UIView和UIViewController的所有的子类，无论Xcode库的默认类还是自定义类。
OS X中自定义View通过initWithFrame:初始化，但是iOS中不使用此方法初始化自定义类。
其他自定义对象，通过init方法进行初始化。
3、重建Nib中对象的所有的联系(action、outlet)，包括与File’s Owner与其他占位对象的联系

outlet connections：在iOS中，nib加载代码利用setValue:forKey:重新连接outlet。在iOS中设置一个outlet会对所有的注册观察者发送一个KVO通知，这些通知有可能在所有的对象联系重建之前发出，并且肯定会发生在对象的任一awakeFromNib被调用之前。
action connections：在iOS中，nib加载代码会调用UIControl的addTarget:action:forControlEvents:方法来设置action。如果target参数为nil，action会由responder chain处理。
4、向Nib中相应的对象发送awakeFromNib消息。在iOS中，此消息仅发送给由nib加载代码初始化的对象，File’s Owner、First Responser、任一占位对象都接收不到awakeFromNib消息。

5、显示那些可见属性为YES的对象。

总结：
A. 加载Nib文件->创建对象alloc->初始化init->创建对象间的连接->向创建的对象发送awakeFromNib消息。
B. 在执行初始化init方法期间，所有的IBOutlet实例变量都为nil，只有创建了nib文件中的所有对象(包括窗口、文本编辑框、按钮…),所有连接才算完成。

C. 一旦建立了所有的连接(即对象地址连接到实例变量),会向所有的对象发送消息awakeFromNib。在awakeFromNib方法中，实例变量已连接，实例变量有效。
