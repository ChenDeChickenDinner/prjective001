//
//  01DataType.m
//  2009OC
//
//  Created by xs on 2019/1/23.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "01DataType.h"

@implementation _1DataType
+ (void)load{
}

/**
 基本数据类型
 */
static void test1(){
    /*
     int32_t 是int的别名
     NSInteger 是long的别名
     int64_t 是long long的别名
     */
    /* OC中的基本数据类型  NSInteger NSUInteger  CGFloat
     1. NSInteger = int/long
     2. NSUInteger = unsigned int/ unsigned long
     3. static const NSInteger NSNotFound = NSIntegerMax;
     3. CGFloat = float/double;也就是说在64位系统下,CGFLOAT是double类型,32位系统下是float类型.
     */
    /*
     #define NSIntegerMax    LONG_MAX
     #define NSIntegerMin    LONG_MIN
     */
}


/**
 布尔类型
1.判断真假的依据是 0 为假 非0 即为真
 */
static void test2(){


    /* bool
     1.C++ 布尔型变量，真正的逻辑型变量
     2.占1个字节,取值范围:false(0)/true(1)
     3.赋值: 转换后0为false，非0为true
     3.结果真假判断:true 为 真，false为假;
     */

    bool value1  = -9;
    size_t bit1 = sizeof(value1);
    printf("bit1= %lu\n",bit1);

    /* _Bool
     #define bool _Bool
     #define true 1
     #define false 0
     0.C99之前无布尔类型
     1.C99标准定义了一个新的关键字_Bool(本质是宏)，提供了布尔类型
     2.占1个字节
     3.结果值：0为false，非0为true
     */
    _Bool value2 = -9;
    size_t bit2 = sizeof(value2);
    printf("bit2= %lu\n",bit2);


    /* OC BOOL
     typedef bool BOOL;
     typedef signed char BOOL;
     #define YES ((BOOL)1);
     #define NO  ((BOOL)0);
     A.OBJC_BOOL_IS_BOOL 平台下: typedef bool BOOL
         1.占 1个字节
         2.取值:(false(0)/true(1))
     B.在 OBJC_BOOL_IS_CHAR平台下: typedef signed char BOOL;
       a.存储
         1.1个字节内(-128 ~ 127）
         2.超过一个字节:只会存储低字节的值
         3.当遇到 0 跟 1 会转换为 YES(0)或NO(0)
       b.结果
         1.1(YES)  2.0(NO)   3.范围内其它值
         4.SO 当 if(BOOL value == YES) 时候 会出现一些意外情况(非0 不是真)
     C.总结
         if (处于64位iPhone 或者 iWatch) {
         　　BOOL就是bool （非0即真）
         } else {
         　　BOOL就是signed char （1个字节。-128 ~ 127）
         }
     */





}
/**
 枚举数据类型
 */
static void test3(){
    //1.显示约定枚举值的类型
    typedef enum PersonType5:NSUInteger{
        haha1  = 0,      // 0000 0
        haha2  = 1 << 0, // 0001 1
        haha3  = 1 << 1, // 0010 2
        haha4  = 1 << 2, // 0100 4
    }myPersonType5;

    //2.位掩码的用处原理
    myPersonType5 value1 = haha2|haha3; // 按位或    有1为1,否则为0 (0001 | 0010) => 0011 => 3
    // 按位与 同1为1,否则为0
    if (value1 & haha2) {  // 0011 & 0001 = 0001 真
        NSLog(@"value1 == haha2");
    }else if (value1 & haha3){ // 0011 & 0010 = 0010 真
        NSLog(@"value1 == haha3");
    }else{
    }

    //3.NS_ENUM 与 NS_OPTIONS 宏都可以定义枚举 (枚举值类型，枚举类型)
    /*
     1.NS_ENUM  一般用来声明基于整形的枚举
     2.NS_OPTIONS  一般用来声明基于位掩码的声明
     */
    typedef NS_ENUM(NSInteger,PersonType6) {
        man6 ,
        woman6
    };
    typedef NS_OPTIONS(NSUInteger, PersonType7) {
        man7  = 1 << 0,
        woman7= 1 << 1
    };



}

/**
 对象数据类型
 */
static void test5(){

    /*
     空指针
     */
    int *pointerInt = NULL;//基本数据类型为空
    NSURL *url = nil;      //对象指针为空
    Class  class = Nil;    //类指针为空

    /* 空对象
     */
    NSNull *value = [NSNull null];

    /* 实例对象的万能指针 id

     1.id == 万能指针，可以指向任何类型的实例对象
     2.id 是动态数据类型 在编译阶段不能进行类型检测
       */
     id  value2 = [NSObject new];

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

    /*
     @()代表NSNumber对象
     @""代表NSString对象
     @[]代表NSArray对象
     @{}代表NSDictionary对象
     */

}

/**
 OC对函数指针的包装
 */
static void test61(){
    /** 将方法转换成函数指针
     1.methodForSelector 对象掉是只能将实例方法 转换成IMP
     2.methodForSelector 类对象掉只能将类方法 转换成IMP
     3.instanceMethodForSelector ,只能类掉，且只能将实例方法 转换成IMP
     */
    NSObject *obje = [NSObject new];
    IMP func1 = [obje methodForSelector:@selector(copy)];
    IMP func2 = [NSObject methodForSelector:@selector(superclass)];
    IMP func3 = [NSObject instanceMethodForSelector:@selector(copy)];
    func1(); func2(); func3();
}
/**
  OC对方法的包装
 */
static void test6(){
    /*sel类型数据
     1.SEL 是一种 数据类型，typedef struct objc_selector *SEL;
     2.调用方法就是 将方法 包装成 一个 SEL 类型的数据，
     */
    SEL sel = @selector(copy);
    SEL sel2 = NSSelectorFromString(@"copy");
    NSObject *obje = [NSObject new];
    [obje performSelector:sel2 withObject:nil];
}
/**
 协议数据类型
 */
static void test7(){
    // 1.协议对象
    Protocol *protocol = @protocol(NSObject);

    // 2.当做参数传递
}
- (void)checkProtocol:(Protocol *)protocol{
    NSObject *objc = [NSObject new];
    [objc conformsToProtocol:protocol];
}
/**
 block数据类型
 */
static void test8(){

}
@end
