

main(List<String> args) {
  var value = test51();
  print(value);
}

/* 标准函数
1.dart 没有
 */
void test(){

}
/* 返回值省略 */
test1(){

}
/* 必传参数 */
void test2(int a,int b){
  
}

/* 位置可选参数 */
void test3([int age ,double height]){

}
/* 名称可选参数 */
void test4({int age,double height}){

}
// 可选参数可以是命名参数或者位置参数，但一个参数只能选择其中一种方式修饰
// void testK(String name,[int a],,{int b}){

// }


/* 箭头函数
1.后面的表达式就是函数的返回值
2.返回值结果类型 要符合 函数返回值类型
 */
void test5()=>print("箭头函数");
int test51()=>6; 
// int test52()=>print("箭头函数");  编译错误
// int test52()=>return 6; 编译错误
/* 匿名函数 */
void test6(){
  (){
  print("匿名函数");
  };
}

/* 函数形参:Function 对象
1.局限性，无法传参，无返回值
 */
void test71(Function func){
func();
}

/* 函数别名
1.只能在函数体外定义
 */
typedef int myFunc(int a,int b);

typedef Compare = int Function(Object a, Object b);
typedef Compare2<T> = int Function(T a, T b);

/* 函数形参:函数别名
1.灵活
 */
void test72(myFunc func){
func(1,2);
}
/* 函数block */
void test8(){
  myFunc fun = (int a,int b){
     print(a + b);
    return a + b;
  };
  test72(fun);
  
}
/* 可选参数的默认值
1.在定义方法的时候，可以使用 = 来定义可选参数的默认值。 默认值只能是编译时常量。 如果没有提供默认值，则默认值为 null
 */
void testS1( [String name = "123"]){

}
/* 闭包
1.闭包 即一个函数对象，即使函数对象的调用在它原始作用域之外， 依然能够访问在它词法作用域内的变量。
 */
Function testS2(num a){
return (num i){
  return a + i;
};
}

void testS3(){
  //1.创建一个对象
  var fun1 = testS2(1);
  fun1(3);
}