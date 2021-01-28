
/* 
1.每个类都隐式的定义了一个接口，接口包含了该类所有的实例成员及其实现的接口
 */
class G1 {
  String name; // 默认的set get 也是接口
  void test1(){

  }

}
/* 
1.实现属性的 set get
2.实现方法
 */
class G2 implements G1 {
  void test1(){
  print("实现G1Class");
  }
  String get name{
    return "123";
  }
  set name(String name){
    name = name;
  }
}
main(List<String> args) {
  var ob = G2();
  print(ob.name);
  ob.test1();
}