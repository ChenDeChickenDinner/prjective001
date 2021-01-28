

class G1 {
  String name1 = "123";
  void test1(){
   print("test1");

  }
}
/*类扩展()
1.作为类扩展:为其它类增加对象方法
2.语法上可以implements实现其它类，但无意义，自身不能再在扩展其它类
3.自身不能实例化,只能用于扩展其它类，已经不是类了
 */
mixin G_Mixin {

  String name2 = "456";
  /* 
  1.未实现的方法，再被混入时候会要求实现，可以实现不同的扩展者不同的实现
  2.已经实现的方法,直接被拥有
   */
 void G_Mixin_Test1();
 void G_Mixin_Test2(){
   print("G_Mixin_Test2");
 }
}

/* 扩展类
1.会继承 属性
2.会继承 方法
 */
class G2 with G1,G_Mixin {

 //1.实现未实现的方法
  void G_Mixin_Test1(){
   print("G_Mixin_Test1");

  }
 
}

main(List<String> args) {
  var ob = G2();
  print(ob.name1);
  print(ob.name2);
  ob.test1();
  ob.G_Mixin_Test1();
  ob.G_Mixin_Test2();

}