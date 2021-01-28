main(List<String> args) {
  
}

/* 默认构造函数
1.在没有声明构造函数的情况下， Dart 会提供一个默认的构造函数。
2.默认构造函数没有参数
3.一旦实现构造函数则默认的就不存在
 */
class G1{


}

/* 构造函数的写法
1.函数体内 使用 this 关键字引用当前实例
2.函数体内 如果 成员变量与形成命名不冲突 则 this 可以省略
3.语法糖可以直接在形参中 使用 this
4.构造函数不用返回实例对象，除非是工程构造函数
 */
class G2{
 String name;
 int age;
 G2(String a,int age){
   name = a;
   this.age  = age;
 }
//  G2(this.name,this.age);
}
/* 命名构造函数
1.使用命名构造函数可为一个类实现多个构造函数
 */
class G3{
  String name;
  int age;
  G3.func1(String name,int age){
  this.name = name;
  this.age = age;
  }
  G3.func2(String name,int age){
  this.name = name;
  this.age = age;
  }
}
/* 重定向构造函数
1.有时构造函数的唯一目的是重定向到同一个类中的另一个构造函数。 重定向构造函数的函数体为空
2.构造函数的调用在冒号 (:) 之后 ,使用 this 表示类
 */
class G4{
  String name;
  int age;
  G4(this.name,this.age);
  G4.redirectFunc(String a):this(a,10);
}

/* 常量构造函数
1.如果该类生成的对象是固定不变的， 那么就可以把这些对象定义为编译时常量
2.需要定义一个 const 构造函数， 并且声明所有实例变量为 final
3.常量构造函数创建的实例并不总是常量
 */
class G5 {
  final num a,b;
  const G5(this.a,this.b);
}

/* 工厂构造函数
1. 与普通构造函数不同，工厂函数不会自动生成实例,而是通过代码来决定返回的实例对象。
2.工厂构造函数无法访问this，所以一般配合 static
3.被static 修饰的 是属于 类的 ，不是对象的
 */
class G6{
  int age;
  static G6 cache; 
  G6.InstantiateD(int age){
    this.age = age;
  }
  factory G6.sdad(int age){
      G6.cache??=G6.InstantiateD(12);
      // myClass4 这里代表的是类
      // myClass4.age = age;  无法 访问 age，必须是 static的
      return  G6.cache; 
  }
}
/* 默认构造函数的执行
1.默认情况下，子类的构造函数会自动调用父类的默认构造函数
2.其执行顺序为:
a.initializer list （初始化参数列表）
b.super class’s no-arg constructor （父类的无名构造函数）
c.main class’s no-arg constructor （主类的无名构造函数
 */
class G7{
  String name;
  int age;
  G7(this.name,this.age);
  G7.func(String name,int age){
    this.name = name;
    this.age = age;
  }
}

/* 子类调用父类非默认构造函数 
1.如果父类中没有匿名无参的构造函数， 子类则需要手工调用父类的其他构造函数(必须实现构造函数，并且调用父类的)
2.所有的构造函数都要调用父类的构造函数
3.调用父类构造函数的参数无法访问 this 。 例如，参数可以为静态函数但是不能是实例函数
 */
class G8 extends G7{
  G8(String name):super(name,10);
  G8.func1():super.func("123",10){

  }
  // G8.func2(String name,int age){
  //   this.name = name;
  //   this.age = age;
  // }
}

/* 初始化列表
1.除了调用超类构造函数之外， 还可以在构造函数体执行之前初始化实例变量。 各参数的初始化用逗号分隔
2.使用初始化列表可以很方便的设置 final 字段
 */
class myClass2{

  
  String name;
  final int age = 10;
  final int height;
  final int number;



  myClass2(String a,int b):
  name = a??"chen",
  this.height = b,
  number = 30
  {
    this.name = a;
    /* age 为什么不能在这里初始化，他是final的啊，final不是可以在运行时候初始化吗
      1.final是可以在运行时候初始化
      2.但执行到这里的时候对象已经初始化完了，所以不能在此再去初始化height
    */
    // this.age = b;
  }
}
