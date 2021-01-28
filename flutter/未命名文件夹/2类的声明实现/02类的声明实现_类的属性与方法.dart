

/* 类变量和方法
1.使用 static 关键字实现类范围的变量和方法
 */

class G1{
/* 静态变量
  1.静态变量只到它们被使用的时候才会初始化
  */

  static String person;
  static const String person2 = "123"; // 

  /* 静态方法
  1.静态方法（类方法）不能在实例上使用，因此它们不能访问 this 
  2.对于常见或广泛使用的工具和函数， 应该考虑使用顶级函数而不是静态方法
  3.静态函数可以当做编译时常量使用。 例如，可以将静态方法作为参数传递给常量构造函数
   */
  static num add(int a,int b){
    return a+b;
  }
}

main(List<String> args) {
  G1.person;
  G1.add(1,2);
}