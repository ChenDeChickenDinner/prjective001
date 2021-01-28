main(List<String> args) {
  
}
/* 赋值运算符 */
void test1(){
  print(2 / 3); // 0.6 
  print(2 % 3); // 2 取余
  print(2 ~/ 3); // 0 取整



  /* 赋值运算符  ??=
  1.如果??=左边的变量为无值，则将右边的值赋值给变量，否则不赋值
  */
  var num1 = null;
  num1??=5;
  print("num1 = $num1");// num1 = 5
  var num2 = 3;
  num2??=5;
  print("num2 = $num2");// num2 = 3
}
/* 表达式 */
void test2(){
 /* 条件表达式: expr1 ?? expr2;
  1.左边不为null则用左边，否则用右边的，只要不为null，其它任意类型的对象都行
  */
  var value1 = null;
  var value2 = value1??10;

  /* 条件表达式: condition ? expr1 : expr2;
  1.condition 必须是一个  bool 值
  2.condition 为非 bool 值时候，编译能通过，但运行报错
  */
  var value3 = true;
  var value4 = null;
  var value5 = value3?20:30;
      // value5 = value4?20:30; 运行报错
     // var value7 = 1?10:20; Conditions must have a static type of 'bool'
  print("value5 = $value5");// value5 = 20
}
/* 类型判定操作符 */
void test3(){

   /* 关键字 
  1.强制类型转换(as):不能在不同类型直接强转 ，
  2.判断对象类型(is):如果对象是指定的类型返回 True
  3.判断对象类型(is!):如果对象是指定的类型返回 False
   */
  num iNum = 1;
  num dNum = 1.2;
  int i = iNum as int;
  double d = dNum as double;
  print([i,d]);

  bool t1 = iNum is int;
  bool t2 = iNum is num;
  bool t3 = iNum is! String;
  print([t1,t2,t3]); // [true, true, true]
}
/* 级联操作符 */
void test4(){

}