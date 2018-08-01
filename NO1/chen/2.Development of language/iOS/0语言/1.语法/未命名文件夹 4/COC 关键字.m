//
//  COC 关键字.m
//  StudyChen
//
//  Created by xs on 2017/5/22.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import<Foundation/Foundation.h>

@interface CABC6 : NSObject
@property (nonatomic, readonly) NSArray<__kindof NSString *> *visibleCells;


@end

@implementation CABC6

short a1; long a2; signed a3;unsigned a4; int a; float b;double c; char d;struct person{};enum persontype{one,tow}; sizoef false ture
extern static  const typedef NS_ENUM
if else for   switch  case  break default continue    return

 void   id  instancetype  self super SEL  nil NULL Nil

@class @selector

@interface  @implementation @end

@private @protected  @package @public

@property  nonatomic atomic retain,strong,weak ,assign,copy,readonly ,readwrite,
@synthesize

@autoreleasepool

@synchronized

@protocol

nullable,nonnull,null_resettable,null_unspecified,inline IMP

_Nonnull _Nullable

__kindof __strong __weak __block _cmd __func__ __unused __typeof__  __autoreleasing __unsafe_unretained __bridge __bridge_transfer

unsafe_unretained
IBOutlet
//
typeof()

- ( NSString * _Nullable)axxa{

    return nil;
}

void tetx(){



}


@end
/* 类型 对象  方法  参数 返回值 修饰符(声明 创建 代表 东西)

 void 
 void * 


 Class id SEL 可做 参数，返回值，指针

 self super   代表当前对象

 id instancetype __kindof
  *id 在编译的时候不能判断对象的真实性  instancetype在编译的时候可以判读对象的真实类型
  *静态类型可以更早的发现错误（在编译阶段而不是在运行阶段）
  *静态变量类型能够提高可读性 如果没有使用多态，尽量使用静态类型
  * __kindof 泛型 ,放在类型之前，其修饰作用,表示当前类或者它的子类,修饰参数，返回值，属性

 nil (id)0 ====> Objective-C对象的字面零值 【对象为空】
 Nil  (Class)0 ===>Objective-C类的字面零值 【类对象为空】
 NULL (void *)0 ===>C指针的字面零值，       【指针为空】
 NSNull [NSNull null] ====> 用来表示零值的单独的对象【空对象】

@Class 声明某个类
@interface @implementation @end 声明 实现 一个类
@property  @synthesize 声明实现一个 成员变量
@protocol 声明一个协议

@private @protected  @package @public 对成员变量的作用域的修饰
@required @optional 对协议方法修饰

@selector() 创建一个方法
@autoreleasepool{} 创建一个自动释放池
 

 
nonatomic atomic retain,strong,weak ,assign,copy,readonly ,readwrite,unsafe_unretained，nullable， nonnull
 
 
 

A:nullable B:_Nullable C:__nullable : 对象可以是 NULL 或 nil
A:nonnull  B:_Nonnull  C:__nonnull :  对象不应该为空
     *A  写法 :当用做 方法或者返回参数的修饰符时候 房子类名之前，也可以放在@property的（）中
     *BC 写法:参数，返回值，属性修饰 都房子* 与变量名中间
     *对于 双指针类型对象 、Block 的返回值、Block 的参数等，这时候只能用带下划线的
 
null_resettable :get方法:不能返回为空，set方法可以为空
 
null_unspecified _Null_unspecified __null_unspecified 不确定是否为空
 

// 指针所有权修饰符:
_strong :声明其是一个强指针 ,一直持有对象，所有的指针默认都是强指针
__weak  :声明其是一个弱指针,只引用对象, 当weak指针指向的数据释放后，weak指针自动变为nil
__unsafe_unretained: 是不安全的所有权修饰符,当指针指向的对象被释放后 再使用指针 可能会造成崩溃 ，赋值给附有__strong修饰符的变量时有必要确保被赋值对象却是存在【】
__autoreleasing : 将对象加入自动释放池, http://www.jianshu.com/p/139d9288d2de

*__strong修饰符、 __weak修饰符、 __autoreleasing修饰符一起可以保证将附有这些修饰符的自动变量初始化为nil。声明在栈中的指针默认值都会是nil

 __unused:可以修饰 变量， 参数 其 未使用不参与编译的作用，无警告

__block:声明其实一个。。。
__typeof__:

 typeof:


 _cmd __func__


 inline 内联函数 有宏一样的效果
 *在编译时将函数体嵌入在每一个调用处
 *会检测参数类型是否正确，能对返回值进行类型强制转换，不需要预编译
 *关键优点 inline函数避免了普通函数的在汇编时必须调用call的缺点,取消了函数的参数压栈,减少了调用的开销,提高效率,



__bridge，__bridge_transfer和__bridge_retained  是ARC下OC对象和Core Foundation对象之间的桥梁 http://www.jianshu.com/p/11c3bc21f56e



 特殊关键字
 1:extern  static 对函数的作用
 extern（外部）
 a: 在函数声明之前加上此修饰 表面此函数是外部函数。可供其他文件使用,一般默认的都是外部函数，此关键字忽略不写
 b: 本文件要想使用其他文件的外部函数，必须进行声明【函数可重复声明】
 c: 注意程序中部允许有重名的外部函数
 static（内部）在函数声明之前加上此修饰 表面此函数是内部函数(静态函数)。只能本文件使用

 2:exten  static 对全局变量的作用【全局变量允许重复声明】
 a:使用前提 在C 中  默认情况下，一个函数不可以访问在它后面定义的全局变量，再其之前再定义一次达到声明的效果
 b: static int text; 只能用来定义一个内部全局变量，使用之前重复定义可达到声明的效果
 C: exten int text; 只能用来声明已经定义过而且能够访问的变量 ,并不能定义一个变量,先在当前文件查找有没有全局变量，没有找到，才会去其他文件查找，可以 在本文件想使用其他文件定义的全局变量,的时候使用

 3:const 修饰 变量， 被const修饰的变量是只读的，const仅仅用来修饰右边的变量,在编译时被处理，会编译检查，会报编译错
 a:使用规则:   a1:对基本数据类型的 变量 来说 const 的位置 只有在其变量前面 都可以 不论是在 数据类型 之前 还是之后，都是一样的效果;
 a2:但对指针类型的变量而言 其位置的不同 也有三种不同的效果: int a = 10; int *p = &a;
 1: int * const p = &a ====》 此时 p 的值是不允许修改的，就是说不能再指向其他地址
 2: int const *p = &a ====》 此时 *p 的值是不允许修改的，就是说不能修改其所指向其他地址的值，但能改指向的地址
 3: const int *p = &a ====》 此时 p / *p 的值都是可以修改的
 b:实际使用 常常与 extern static结合使用 生成可全局使用不可修改的全局常量
 extern  char *const text = "abc";
 4:typedef 可以使用typedef关键字为各种数据类型定义一个新名字(别名)。



 【C】 @property 的修饰关键字

 1:内存管理相关
 *:retain release旧值，retain 新值【适用于OC对象】【MRC情况下】
 *:assign （直接指针赋值）属性的默认修饰 可用于 基本数据 或者对象，当用于对象时候，对对象的计数器不影响，当对象被释放掉后可能会造成 也指针错误
 *:unsafe_unretained 等价于 assign；
 *:weak (弱指针） 只用来修饰对象，对对象的计数器不影响 当weak指针指向的数据释放后，weak指针自动变为nil
 * strong(强指针) 对对象的计数器 + 1;持有此对象
 * copy 对对象进行拷贝，但是并不是所有的拷贝都产生了新的对象


 2:多线程管理
 a:nonatomic ，生成set方法的时候 不加锁，高性能
 b:atomic 加锁，低性能

 3：是否生成set方法
 a:readonly:只读，只生成get的声明 实现
 b:readwrite :可读可写，同时生成set get 声明 实现


 4：set get 方法名称
 a:setter = abc: 更改set的方法名
 b:getter = abc  更改get的方法名



 @Class
 *解决循环拷贝问题
 *提高性能，当引用的类的头问题改了，引用的.h不用再次拷贝
 *.h 文件中 只#import 父类的头文件

 */
