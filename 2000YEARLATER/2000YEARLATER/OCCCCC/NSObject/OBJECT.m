//
//  OBJECT.m
//  2000YEARLATER
//
//  Created by xs on 2020/11/17.
//

#import "OBJECT.h"
@implementation OBJECT
+ (void)test1{
    //    本质上 nil , Nil 和 NULL 是一样的
        Class class1 = Nil;
        Class class2 = nil;

        if (class1 == nil) {
            NSLog(@"class1");
        }

        if (class2 == Nil) {
            NSLog(@"class2");
        }
        NSString *str1 = nil;
        NSString *str2= Nil;
        if (str1 == Nil) {
            NSLog(@"str1");
        }

        if (str2 == nil) {
            NSLog(@"str2");
        }
        char *char1 = NULL;
        char *char2 = nil;
        char *char3 = Nil;
        if (char2 == NULL) {
            NSLog(@"char2 == NULL");
        }

        if (char2 == Nil) {
            NSLog(@"char2 == Nil");
        }
        if (char3 == NULL) {
            NSLog(@"char3 == NULL");
        }

        if (char3 == nil) {
            NSLog(@"char3 == nil");
        }
        NSLog(@"nil is %p",nil);
        NSLog(@"Nil is %p",Nil);
        NSLog(@"Null is %p",NULL);
        NSLog(@"NSNULL is  %@",kCFNull);

    //    nil is 0x0
    //    Nil is 0x0
    //    Null is 0x0
    //    NSNULL is  <null>**
    
}
+ (void)load{
    // 类对象
    Class class = [NSObject class];
    class = Nil;
    
    //实例对象
    /* 实例对象的万能指针 id
     1.id == 万能指针，可以指向任何类型的实例对象
     2.id 是动态数据类型 在编译阶段不能进行类型检测
     */
    id ob1 = [NSObject new];
    ob1 = nil;
    
    /* 带类型检测的对象返回值类型 instancetype
     1.instancetype == id == 万能指针 == 指向一个对象
     2.instancetype 在编译的时候 可以判断对象的真实类型
     3.instancetype 只能用于作为返回值类型
     4.但凡自定义构造方法, 返回值尽量使用instancetype,不要使用id(id不能判断对象的真实类型)
     */
    
    /*当前对象关键字
     self
     1.如果self在 对象方法中, 那么self就是 代表 调用当前对象方法 的 那个对象
     2.如果self在 类方法中, 那么 self 就 代表 调用当前类方法 的那个类
     >  self会自定区分 类方法 和 对象方法, 如果在类方法中 使用self调用对象方法, 那么会直接报错
     >  不能在 对象方法 或者 类方法中利用 self 调用当前的self 所在的方法(查看#warning 死循环)

     super
     1.super在类方法中(父类类对象), 一定会调用父类的类方法
     2.super在对象方法中(父类对象), 一定会调用父类的对象方法
     3.可以利用super 在任意方法中 调用父类中的方法
     */
    {
        /*sel方法 选择器
         1.SEL 是一种 数据类型，typedef struct objc_selector *SEL;
         2.调用方法就是 将方法 包装成 一个 SEL 类型的数据，
         */
        SEL sel = @selector(copy);
        SEL sel2 = NSSelectorFromString(@"copy");
        NSObject *obje = [NSObject new];
//        [obje performSelector:sel2 withObject:nil];
    }

    {
        //函数指针
        IMP func = [NSObject methodForSelector:@selector(superclass)];
//        func();
    }

    {
        // 协议对象
        Protocol *protocol = @protocol(NSObject);
    }
    
}



@end
