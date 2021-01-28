


// part 'String.dart';
main(List<String> args) {
  
}

/* 
1.dart中任何一个dart文件都是一个库

2.使用库
1.自己的库 : import '路径/文件名.dart';（系统文件路径）
2.系统的库 : import '路径/文件名.dart';（特殊的dart: 方案）
3.三方的库 : import 'package:路径/文件名.dart';（package: 方案）

3.指定库前缀
1.如果导入两个存在冲突标识符的库， 则可以为这两个库，或者其中一个指定前缀
2. import 'package:lib2/lib2.dart' as lib2;

导入库的一部分
1.show:只导入什么 ---import 'package:lib1/lib1.dart' show foo;
2.hide:隐藏什么  ---import 'package:lib2/lib2.dart' hide foo;

延迟加载库
1.Deferred loading (也称之为 lazy loading) 可以让应用在需要的时候再加载库
2.要延迟加载一个库，需要先使用 deferred as 来导入 ---import 'package:greetings/hello.dart' deferred as hello;
3.当需要使用的时候，使用库标识符调用 loadLibrary() 函数来加载库 ---await hello.loadLibrary();
4.在前面的代码，使用 await 关键字暂停代码执行一直到库加载完成
  a.延迟加载库的常量在导入的时候是不可用的。 只有当库加载完毕的时候，库中常量才可以使用
  b.在导入文件的时候无法使用延迟库中的类型。 如果你需要使用类型，则考虑把接口类型移动到另外一个库中， 让两个库都分别导入这个接口库
  c.Dart 隐含的把 loadLibrary() 函数导入到使用 deferred as 的命名空间 中。 loadLibrary() 方法返回一个 Future。


本地多库整合
定义库名:library myLibrary;
导入库:export 'String.dart';


使用三方库
pubspec.yaml声明需要引用的库

实现库
有关如何实现库包的建议，请参考 Create Library Packages 这里面包括：
如何组织库的源文件。
如何使用 export 命令。
何时使用 part 命令。
何时使用 library 命令。

 */
