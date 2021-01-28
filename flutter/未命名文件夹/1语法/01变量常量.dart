main(List<String> args) {
  test3();
}

/* 面向对象 
1.任何保存在变量中的都是一个 对象;
2.并且所有的对象都是对应一个 类 的实例。 无论是数字，函数和 null 都是对象;
3.所有对象继承自 Object 类
4.未初始化的变量默认值是 null。即使变量是数字 类型默认值也是 null，因为在 Dart 中一切都是对象，数字类型 也不例外。
5.使用对象的 runtimeType 属性， 可以在运行时获取对象的类型， runtimeType 属性回返回一个 Type 对象。

1.尽管 Dart 是强类型的，但是 Dart 可以推断类型，所以类型注释是可选的
2.如果要明确说明不需要任何类型， 需要使用特殊类型 dynamic 

1.Dart 支持泛型，如 List <int> （整数列表）或 List <dynamic> （任何类型的对象列表）
 */
void test(){

}
/* 推导式定义 */
void test1(){
  
  //.var 变量 默认值为 Null类型的 null,可以使用
  var value;
  print(value); // null
  print(value.runtimeType); // Null

  //.未初始化的var变量可以更变类型
  value = null; // Null 类型
  value = 10;
  value = "123";

  //.初始化的var变量不可以更变类型(除了 null)
  var value2 = 10;
  value2 = null; 
  // value2 = "123"; 不能

  
  var value3 = null;
  value3 = 1;
  print(value3.runtimeType);

 

}
/* 明确式定义 */
void test2(){
  

  // 1.类型数据严格一致

  //1. Null 对象 默认值 是 null
  Null ob ;
  print(ob);
  ob = null;

  //2.非 Null类型变量 未经初始化不能使用(限制，最新的测试版本才是这样的---尴尬)
  Object ob2;
  print(ob2); //编译成功
  ob2 = Object();
  print(ob2); // Instance of 'Object'

  //3.对象赋值严格遵守类型一致，除非是动态类型
  String str;
  // str = null; null 是 Null类型的对象，不是 String 类型的
  str = "123";
  str = null;
  //4.对象如何置为空？
}
/* 动态数据类型 */
void test3(){
  /*  对象类型
  1.存在静态类型检测
  2.声明的变量初始化后，变量的类型仍可改变
   */
  Object ob = [1,2,3];
  print(ob.runtimeType);//List<int>
  ob = 1;
  String str = ob.toString();
  print(ob.runtimeType);// int

  ob = "123";
  print(ob.runtimeType);//String

  /*  动态类型
  1.不存在静态类型检测
  2.声明的变量初始化后，变量的类型仍可改变
  */
  dynamic ob2 = [2,3,4];
  print(ob2.runtimeType);//List<int>
  ob2 = 10;
  print(ob2.runtimeType);;// int
  ob2 = "123";
  print(ob2.runtimeType);//String

}

/* const 常量  */
void test4(){

    //.类型声明可以省略
    const int value1 = 10;
    const value2 = 10;

    //.编译时期就要确定的常量 
    const data1  = 10;
    // const data2  = DateTime.now();

    //.const的不可变性是可传递的，
    const List ls = [1,2,3];
    // ls[1] = 4; 运行是报错

    //.相同的是重复引用
    const b1 = [11 , 22];
    const b2 = [11 , 22];
    print(identical(b1, b2));//true

    //.Const还可以 用来创建常量值，
    //.声明 const 的初始化表达式中 const 可以被省略
    var foo = const [];
    final bar = const [];
    const baz = [];




    //.Const还可以 声明创建常量值的构造函数

}
/* const 常量  */
void test5(){

    final int value3 = 10;
    final value4 = 10;
    
    //3.编译时常量 && 运行时常量
    final data1  = 10;
    final data2  = DateTime.now();

    //4.const的不可变性是可传递的，final不是
    final List ls2 = [1,2,3];
    ls2[1] = 4; // 可以修改

    // 值相同时final在内存中重复创建
    final a1 = [11 , 22];
    final a2 = [11 , 22];
    print(identical(a1, a2));//false
}