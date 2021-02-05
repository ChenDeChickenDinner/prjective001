/*




1.StatefulWidget、StatelessWidget 更像是组合型的 widget
2.RenderObjectWidget 具体实现 layout、paint 工作
      LeafRenderObjectWidget	叶子节点，只提供 paint 能力，如 RawImage，Image 内部的绘制工作全部交由 RawImage。
      SingleChildRenderObjectWidget	仅接收单 child 的 widget，比如 Opacity，改变 child 的透明度。
      MultiChildRenderObjectWidget	提供 layout 能力，接收多 child 的 widget ,比如 Stack 做层叠布局，Flex 做线性布局，常见的子类 Row、Column。

3.ProxyWidget 通常用于数据共享



Widget、Element、RenderObject 三棵树

Widget 表示小控件的视图信息，在 Flutter 体系下设计为不可变，其本身不具备状态存储能力，可以理解成一个配置文件，用完即走，创建开销很小。
RenderObject 真正有布局和绘制能力的对象，比如图像 Image 控件，最终会创建 RenderImage 进行图像渲染；对应于 Android 中的 View。
Element 上述二者之间的桥梁，内部持有 Widget 和 RenerObject 的引用，因此可以快速对其（包括父节点、子节点）进行访问和修改。同时 StatefulElement 可以保存状态，可用于状态管理

UI 渲染就像盖一栋大楼，
Widget 代表图纸，表示我们想造怎样的大楼，
RenderObject 是根据图纸干活的工人，
Element 是监工，负责协调各方资源，统一调配，外部人员有事需要先找这个监工

*  */