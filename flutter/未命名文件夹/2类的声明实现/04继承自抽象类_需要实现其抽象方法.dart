

/* 抽象Class
1.不能实例化，可以利用工厂方法
2.再一个可以实例一个其子类
 */
abstract class G1{

  String name = "123";
  void G1_Test1(); 

  
  void G1_Test2(){ 
     print("G_Abstract_Test2");
  }
  
}
/* 继承自抽象类 
0.一旦继承某个抽象类,子类拥有其全部的对象属性与方法
1.未实现的方法要求实现
2.有实现的方法可以直接使用
 */
class G2 extends G1 {
  void G1_Test1(){
    print("实现抽象方法");
  }
}

main(List<String> args) {
  var ob = G2();
  print(ob.name);
  ob.G1_Test1();
  ob.G1_Test2();

}