//
//  inheritance(继承).m
//  2020COC
//
//  Created by xs on 2019/7/15.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>

1.子类拥有父类的全部属性、方法


2.子类可以重写父类的方法实现

3.父类指针可以指向子类对象

spuerclass:(一个Class 类型的指针)
1.实例对象:只有Class，无spuerclass
2.子类(类对象):--->父类(类对象)--->基类(类对象)--->无spuerclass
3.子类(元类对象):--->父类(元类对象)--->基类(元类对象)--->基类(类对象)


self:
1.是一个隐私参数,代表当前对象,实例对象，或者类对象
2.执行时调用RT的objc_msgSend();
3. id objc_msgSend(id theReceiver, SEL theSelector, ...)



super:
0.子类调用父类的方法，方法中的self 仍然是当前子类对象
1.是个编译器的指令符号,只是告诉编译器在执行的时候,去调谁的方法
2.执行时调用RT的objc_msgSendSuper();
3.id objc_msgSendSuper(struct objc_super *super, SEL op, ...)
    struct objc_super {
     __unsafe_unretained _Nonnull id receiver; //实例对象 self
     __unsafe_unretained _Nonnull Class super_class; //指向父类
    };
 a:首先从super->super_class指向的父类的方法中查找对应的selector，
 b:找到后再使用 super->receiver 调用对应的selector。





@end



