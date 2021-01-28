main(List<String> args) {
  
}

class G2{


  String name1; // 默认值是null
  String _name2; // 私有变量，默认值是null
  final String name3 = "123"; // 常量
  // const String name4 = "123";  const 不能修饰成员变量

  /* set get相关:
  1.所有实例变量都生成隐式 getter 方法。 非 final 的实例变量同样会生成隐式 setter 方法
  2.使用 get 和 set 关键字实现 Getter 和 Setter ，能够为实例创建额外的属性
    a.重点1:是另外创建属性
    b.重点2:能多做一些操作
   */
  set name4(String name){
    name4 = name;
  }
  String get name4{
   return "456";
  }

 
  // void test0(); 若父类不存在，方法必须有实现 

  void test1(){
    print("test1");
  }
  void test2(){
    print("test2");
  }
  void test3(){
    print("test3");
  }
  void test4(){
    print("test4");
  }

/*  @deprecated  @override @todo

 */
  @Override
  @Deprecated
  @Todo
 
}
