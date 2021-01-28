main(List<String> args) {
  
}
/*限制类型 
1.静态类型检测
2.使用泛型类型的构造函数
 */
void test1(){

  //.使用泛型类型的构造函数
  var names = List<String>();
  names.add("123");
  // names.add(1);

  var dict = Map<int,int>();

  //.运行时中的泛型集合
  print(names is List<String>);
}
/* 使用集合字面量
1.对于 List 或 Set 只需要在声明语句前加 <type> 前缀， 
2.对于 Map 只需要在声明语句前加 <keyType, valueType> 前缀
 */
void test3(){
  var list = <int>[1,2,3];
  var sets = <String>{"123","234"};
  var dict = <int,String>{1:"1",2:"2"};
}

/* 减少重复的代码
1.在多种类型之间定义同一个实现
2.还可以继续使用检查模式和静态分析工具提供的代码分析功能
3.T 是一个备用类型。 这是一个类型占位符，在开发者调用该接口的时候会指定具体类型
 */
abstract class G<T> {
  T getByKey(String key);
  void setByKey(String key, T value);
}

/* 限制泛型类型
1.使用泛型类型的时候， 可以使用 extends 实现参数类型的限制
2.表示 泛型T 是继承自 某父类的，使用的时候只能用父类或其任意子类
 */
class G1 {
  
}
class G2<T extends G1 > {
  
}

/* 泛型函数
这里的 test4 (<T>) 泛型可以在如下地方使用参数 T ：
函数的返回值类型 (T).
参数的类型 (List<T>).
局部变量的类型 (T tmp).
 */
T test4<T>(List<T> ls){
  T tmp = ls.last;
  return tmp;
}