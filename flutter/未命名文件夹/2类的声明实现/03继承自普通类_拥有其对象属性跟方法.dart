
/* 普通CLass
1.作为父类:被别人继承 属性与方法
 */
class G2{


  String name1; 
  String _name2; 
  final String name3 = "123"; 

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

 
}

/* 类的继承 
1.实例变量是都被继承存在的，可以直接使用
2.实例方法是都被继承存在的，可以直接使用
*/
class G22 extends G2{

 // 可以添加重名的实例变量,默认值以子类的为准
 String name1 = "G22.name1";


 // 子类可以声明父类的方法,最终还是调用父类的实现
 void test2();

// 子类可以添加同名的方法，并且实现他，子类调用直接调用本身的
 void test3(){
   print("G22_test3");
 }
 //子类可以重写父类的方法
 @override
 void test4(){
   print("G22_test4");
 }
//  使用 super 关键字来引用父类
 void test5(){
   super.test1();
 }
 
}
main(List<String> args) {
  
}