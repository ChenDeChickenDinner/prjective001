//
//  ARC_.m
//  MRC
//
//  Created by xs on 2021/3/22.
//

#import "ARC_.h"
/*
 ARC:
 是llvm 与runtime 结合共同实现的
 
 在 ARC 环境下，id 类型和对象类型，类型前必须加上所有权的修饰符。
 所有权修饰符总共有4种：
 __strong
 __weak
 __unsafe_unretained
 __autoreleasing
 
 
 
 __strong：
 1.__strong 表示强引用，对应定义 property 时用到的 strong。当对象没有任何一个强引用指向它时，它才会被释放；
 2.如果在声明引用时不加修饰符，那么引用将默认是强引用。
 3.当需要释放强引用指向的对象时，需要保证所有指向对象强引用置为 nil
 
 __weak:
 1.__weak 表示弱引用，对应定义 property 时用到的 weak。弱引用不会影响对象的释放，纯粹的拿到操作权.
 2.而当对象被释放时，所有指向它的弱引用都会自定被置为 nil，这样可以防止野指针
 
 __unsafe_unretained:
 1.__unsafe_unretained 表示弱引用，对应定义 property 时对应的是 unsafe_unretained.弱引用不会影响对象的释放，纯粹的拿到操作权
 2.而当指向的对象被释放时依然原原本本地指向原来的对象地址，不会被自动置为 nil，所以成为了野指针
 3.ARC 是在 iOS5 引入的，而 __unsafe_unretained 这个修饰符主要是为了在 ARC 刚发布时兼容 iOS4 以及版本更低的系统，因为这些版本没有弱引用机制
 
 __autoreleasing:
 1.在 ARC 模式下，我们不能显示的使用 autorelease 方法了，但是 autorelease 的机制还是有效的，
 2.通过将对象赋给 __autoreleasing 修饰的变量就能达到在 MRC 模式下调用对象的 autorelease 方法同样的效果
 3.__autoreleasing 修饰的对象会被注册到 Autorelease Pool 中，并在 Autorelease Pool 销毁时被释放。

 4.注意：定义 property 时不能使用这个修饰符，因为任何一个对象的 property 都不应该是 autorelease 类型的

 
 */
@implementation ARC_

@end
