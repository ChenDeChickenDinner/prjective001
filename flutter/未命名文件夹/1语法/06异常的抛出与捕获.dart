
/* 异常的抛出
1.异常的抛出会导致代码终止执行
2.利用 throw 关键字 主动抛出异常
3.Dart 程序可以抛出任何 对象，可以自定义异常类型
4.高质量的生产环境代码通常会实现 Error 或 Exception 类型的异常抛出
5.抛出异常是一个表达式， 所以可以在 => 语句中使用，也可以在其他使用表达式的地方抛出异常
 */
void test1(){

  /* 
  1.执行到这一行 程序终止
  2.Unhandled exception:
  123
   */
  throw "这是一个异常"; 

  throw null; 

  throw FormatException('Expected at least 1 section');
}
/*异常的捕获 
1.on 指定捕获的异常类型
2.catch 可以处理该异常
3.rethrow  重新抛出异常
 */
void test2(){
  try {
    /* 运行的代码块
    1.若没有异常则正常执行
    2.若有异常则走下面
     */
  } on Error{
    /*  on  指定异常类型
    1.检测到是 Error 类型的异常则来到这里
     */
  } on Exception catch(e,s){
    /* catch() 
    2.可以带有一个或者两个参数， 
    第一个参数为抛出的异常对象， 
    第二个为StackTrace对象堆栈信息
    */
    print(e);
    print(s);

  }catch (e,s) {
    // 未指定的异常类型都被捕获到这里
    print(e);
    print(s);
    rethrow; 
  }
}


/* 运用
1.try 只能管 其 内部的范围，之前的管不了
2.try 内部的代码，执行的时候一旦遇到第一个异常就会
1.内部异常之后的代码停止运行
2.抛出异常，让分支处理
3.若分支没有重新抛出则继续执行后续代码
 */
main(List<String> args) {
    // throw "这是一个try之前的异常"; 

    print("执行代码1");

    try {
      print("被捕获的范围开始");
      throw "这是一个try内的异常"; 
      throw "这是一个try内的异常"; 
      throw Error();
      print("被捕获的范围结束");

    }  on Error{
      print("Error异常被捕获");
      
    }catch (e) {
      print("其它异常被捕获");
    }
    print("执行代码2");
}