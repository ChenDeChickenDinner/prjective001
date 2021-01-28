main(List<String> args) {
  
}
/* 条件判断 */
void test1(){
  bool ob = true;
  if (ob) {
    print(1111);
  } else {
    print(222);
  }

  int value = 10;
  switch (value) {
    case 1:
      print(1);
      break;
    default:
  }

}
/* 循环 */
void test2(){

  for (var i = 0; i <= 10; i++) {
    
  }
  for (var ob in [1,2,3,4]) {
    print(ob);
  }
  int a = 0;
  
  while (a <= 10) {
    print(a);
    a++;
  }
  int b = 0;
  
  do {
    print(b);    
    a++;
  } while (b <= 10);
}