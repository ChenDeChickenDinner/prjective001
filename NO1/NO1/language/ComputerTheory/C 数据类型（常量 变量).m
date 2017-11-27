//
//  C 数据类型（常量 变量).m
//  StudyChen
//
//  Created by xs on 2017/5/22.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import<Foundation/Foundation.h>

@interface CABC1 : NSObject

@end

@implementation CABC1

@end
/*
 类型修饰符
 1：short 2 字节 （%d）
 2:long / long long (long  int =  %ld)
 3:signed / unsigned (有/无符号位) （%u）
 4:写法上的特殊表示
 a:short = short int  / long = long  int  / long long = long long  int
 b:signed = signed int /  unsigned = unsigned int

 基本数据类型（int float double）
 (1）:int 整型 保存整数值 无小数位，占4个字节 取值范围（-2147483648 - 2147483648）{占位符 %i %d(十进制)、 %o(八进制) 、 %0x(十六进制) %#o 显示前导}
 a:如果给一个整形变量赋的值 太太太大 编译器直接报错
 b:如果给一个整形变量赋的值 是小数 则之后存储 其整数部分，且不会四舍五入（自动类型转换）
 c:如果给一个整形变量赋的值 不太大 则保存的是一个随机数
 (2）:float 单精度浮点型小数，占4个字节 表示的时候小数后面必须带f/F，{占位符 %f， %e， %g，} 只能保证7位有效数字 默认显示6位小数

 (3）:double 双精度浮点型小数，占8个字节 ，{占位符 %f， %e， %g，} 只能保证16位有效数字 默认显示6位小数 double类型数据之间做比较的时候 最好不好做 等于比较
 （A）范围
 1bit（符号位）+ 8bits（指数位）+  23bits（尾数位）
 1bit（符号位）+ 11bits（指数位）+  52bits（尾数位）
 (浮点）数值 =      尾数    ×    底数 ^ 指数，（附加正负号），于是，float的指数范围为-127~128，而double的指数范围为-1023~1024，并且指数位是按补码的形式来划分的。
 其中负指数决定了浮点数所能表达的绝对值最小的数；而正指数决定了浮点数所能表达的绝对值最大的数，也即决定了浮点数的取值范围。
 float的范围为-2^128 ~ +2^128，也即-3.40E+38 ~ +3.40E+38；double的范围为-2^1024~ +2^1024，也即-1.79E+308 ~ +1.79E+308。

 （B）精度 http://www.cnblogs.com/helloaworld/p/5419017.html
 float和double的精度是由尾数的位数来决定的。浮点数在内存中是按科学计数法来存储的，其整数部分始终是一个隐含着的“1”，由于它是不变的，故不能对精度造成影响。
 float：2^23 = 8388608，一共七位，这意味着最多能有7位有效数字，但绝对能保证的为6位，也即float的精度为6~7位有效数字；
 double：2^52 = 4503599627370496，一共16位，同理，double的精度为15~16位。


 (4）:chare 字符型,整数型，占1个字节，{占位符 %c} （-128 - 127）
 a: 哪些是字符{普通字符:0-9,a-z,A-Z,}{特殊字符:- + = # % ? }{转译字符:\n,\t,\b,\101,\134(任何一个字符都可以使用转义字符表示)}
 b: chare类型数据 是以 ASCII码的形式 存放在内存中的。(这些所以的字符在计算机中存储时也要使用二进制数来表示，而具体用哪些二进制数字表示哪个符号===编码)
 　      c:ASCII 码使用指定的7 位或8 位二进制数组合来表示128 或256 种可能的字符。标准ASCII 码也叫基础ASCII码，使用7 位二进制数（剩下的1位二进制为0）来表示所有的大写和小写字母，数字0 到9、标点符号， 以及在美式英语中使用的特殊控制字符。（控制字符，显示字符）
 (5):字符串 在C 语言中 把 （以\0结尾的字符数组） 当做字符串 其占位符 为 %s
 a:字符串 “adv” 即时 字符数组 chare nane[] = "adv" （里面包含 ‘a’ ‘d’ ‘v’ ‘\0’ 四个字符） \0 即是0，起所占字节为 4个字节
 b:字符串 chare nane[8] = "adv" ;chare nane[] = "adv";
 chare nane[8] = {‘a’, ‘d’, ‘v’ ,‘\0} ;
 chare nane[8] = {‘a’, ‘d’, ‘v’ ,0};
 chare nane[8] = {‘a’, ‘d’, ‘v’} ;四种写法实际结果一样 \0是字符串的结束标志
 chare nane[]  = {‘a’, ‘d’, ‘v’} ; 此写法则不能当做是字符串 ，只能是字符数组。
 c:字符串一定要以\0为结束标志，不然把一个没有\0的字符数组 当做 字符串使用是一件危险的事情，比如如下
 chare name1[] = “it”;
 chare name2[] = {'a','b','c'};    printf("%s",name2); 的结果是 abcit, %s会从name2开始输出直到遇到\0
 d:字符串长度，strlen(name1) ,其本质是从name1开始搜索直到遇到\0 ,在这之间有多少个字符数。
 e:字符串的特殊性 “abc”,其本身是一个字符数组，也是一个常量,常量是不可修改的 http://www.jianshu.com/p/21b5b720fb75
 特殊1: char text[] = “hello world!”;
 1:"hello world!"是一个字符串常量，存放在静态数据区，全局的;
 2:char text[]   是一个局部变量(char []型数组)，该局部变量存放在栈中
 3:也就是说char p[]="hello world!";这条语句让"hello world!"这个字符串在内存中有两份拷贝，一份在动态分配的栈中，另一份在静态存储区。所以它是可修改的，且修改的是栈中的“hello world!”
 特殊2: char *text = “hello world!”; 此时 text 是一个char 类型的指针 指向的是 “hello world!”的第一个字符的地址，*text 不能修改


 构造数据类型 (数组，结构体，枚举)
 (1)数组 本质
 1:定义数组时候必须指定其数组元素个数
 2:数组的初始化只能在其定义的时候初始化，且元素只能是常量
 3:基本的初始化写法
 int ages[5] ={1,2,3,,4,5};
 int ages[5] ={1,2,3}; 其余后面是0
 int ages[5] ={[0] = 1,2,[4] = 3};
 int ages[]  = {1,2,3,,4,5};
 4:长度 int count = sizeof(ages)/sizeof(int);
 5:元素是从在内存中是从低到高排列，数组的地址 = 首元素地址 = 数组名（当数组作为参数传递的时候，则是地址传递）

 (2)结构体 本质
 A,需要先定义 再使用，定义类型的时候不分配内存空间，定义变量的时候才分配。各个成员在内存中是连续存储的，成员变量需要用分号隔开，定义也以分号结束
 B:常见的定义方式
 struct person{
 int age;
 double height;
 char  *name;
 };  struct person chen = {10,12,"chen"};  // 先定义类型， 再定义 变量

 struct student{
 int age;
 double height;
 char  *name;
 } suman; suman.age = 10;  // 定义结构体类型的同时定义变量

 struct{
 int age;
 double height;
 char  *name;
 }sonmeone;  sonmeone.age = 10;  //直接定义结构体类型变量，省略类型名


 C:初始化 将各成员的初值，按顺序地放在一对大括号{}中，并用逗号分隔，一一对应赋值。初始化赋值和变量的定义不能分开
 D:成员变量的访问,修改: 一般对结构体变量的操作是以成员为单位进行的，引用的一般形式为：结构体变量名.成员名
 E:结构体作为函数参数，将结构体变量作为函数参数进行传递时，其实传递的是全部成员的值，对其本身无影响
 F:指向结构体的指针，有了指向结构体的指针，那么就有3种访问结构体成员的方式  struct person *p2 = &p;
 a, printf("name=%s, age = %d \n", stu.name, stu.age); 结构体变量名.成员名
 b, printf("name=%s, age = %d \n", (*p).name, (*p).age);(*指针变量名).成员名
 c, printf("name=%s, age = %d \n", p->name, p->age);指针变量名->成员名

 (3)枚举 只有几个固定的取值范围
 A:枚举类型的定义，先定义再使用，将枚举元素作为整型常量处理，称为枚举常量。默认情况下从0开始 +1,也可指定
 B:常见的定义方式 同结构体 enum pernson{ ont,two,three};

 指针数据类型 指针（)
 (1) 本身含义
 int text = 10;int text2 = 10;
 int *p = &text;  定义一个 int 类型的 指针变量，并初始化。此变量有自己的地址，有保存的地址,有保存的地址的值
 (a)  p  = &text2;【p 表示的是此指针变量 保存的地址 ,可取，可修改成保存别的地址】【保存的对象】
 (b) *p = 12; 【*p 表示的是 其保存的地址所对应的数据的值，可取，可修改 】【对象的值】
 (c) &p 【&p 表示的是此 指针变量本身的地址,自己不能修改，除非有 另外一个指针 指向自己】【指针自己的地址】

 (2)指针的类型
  静态类型:在编译的时候就知道这个指针变量所属的类
    * 在编译的时候就知道变量的类型
    * 知道变量中有哪些属性和方法, 可以访问这些属性和方法 访问了不属于静态数据类型的属性和方法，那么编译器就会报错
  动态类型:  指程序直到执行时才确定对象所属的类
 
 (2)  NSObject *p = [NSObject alloc]init];
 a:右边是 对象，在程序运行过程中动态产生，存放的 堆种
 b:左边是 指针，存放在栈中




 常量:则表示一些固定的数据，也就是不能改变的数据。整型常量(int) /浮点型常量(float\double)/字符常量(char)/字符串常量/
 字符串常量属于 全局的，存放在常量区

 变量:

 2:变量的定义
 a:局部变量:不允许定义同名变量【不论其是不是相同类型】
 int a;int a; 错
 int a;double a; 错
 b:全局变量
 1:允许定义同类型同名变量，即时全局变量的重复定义【适用于所有文件】
 static int abc;static int abc; 对
 2:不允许定义不同类型同名变量【同一文件内】
 int abc; static int abc; 错



 3:变量的初始化
 a:变量的初始化只能在其定义的时候初始化
 b:未经过初始化的局部变量其值是不确定的,但未经过初始化的全局变量 根据类型不同值不同 int 默认是0
 4:变量的作用域
 a:局部变量 的作用域为 从定义的那一行开始 到 代码块结束，static修饰的局部变量 则会延长是生命周期直到程序结束
 b:全局变量 根据 其修饰词，分为 所有 本文件可访问，跟 本程序全局可访问
 c:如果在.a 文件定义了一个全局变量，想在.b文件使用（默认是可以使用的，但使用前需要声明一下告诉编译器，因为编译器是单文件编译的）
 d:访问一个变量a,会就近原则访问

 5:变量的存储的位置分






 */
