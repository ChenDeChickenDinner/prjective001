//
//  objectInit.m
//  ursInclude
//
//  Created by xs on 2018/11/30.
//  Copyright © 2018 Touker. All rights reserved.
//

#import "NSObject_chen.h"
@implementation objectInitChild
+ (void)load{
    [super load];
}
@end
@implementation objectInit
/** 类的加载 与初始化
 A.加载
 1.加载:当程序运行后 所以的类都会被加载一次 系统自动调用+load 方法，重写的话 无需[super load]
 2.+load 方法是在所有类被加入到runtime以后，main函数执行之前被系统自动调用的。
 3.调用顺序 父类->子类->分类(多分类，按照编译顺序)
 4.如果子类重写的时候调用了 [super load]，load方法会被调用二次，SO 在 load 方法中要防止 多次调用
 B.初始化
 1.+ initialize 在类第一次接收到消息之前被系统自动调用，无需手动调用，重写的话 无需[super load]
 2.调用顺序 分类/父类->子类,有分类覆盖则调用分类的，没有分类，则先调用父类再子类
 3.如果子类没有重写+initialize 方法，那么父类可能被调用多次
 */
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    });
}
// 一个类的 initialize 只会被执行一次，如果子类未出现 则父类会调用二次 ，二次的调用着 分别是父类对象 跟 子类对象
+ (void)initialize{
    if (self == [objectInit class]) {
    }
}


/** 类实例化对象*/

/** allocWithZone
 1.开辟内存返回一个未经初始化的实例对象
 2.NSZone是用来分配和管理一段内存空间的一个结构体。
 3.allocWithZone: 传入nil,系统处理，此方法一般不使用
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    // 实际过程中 zone 是nil的
    return [super allocWithZone:zone];
}
/** alloc
 1.开辟内存返回一个未经初始化的实例对象
 2.内部会调用 allocWithZone 方法
 */
+ (instancetype)alloc{
    return [super alloc];
}

/** init
 1.初始化成员变量
 */
- (instancetype)init{
    // 移动要 调用 super init 经过系统初始化
    self = [super init];
    if (self) {
    }
    return self;
}


/** 类，实例对象的描述信息
 */
- (void)info{
    Class classObje1 = [objectInit class];
    Class classObje2 = [objectInit superclass];
    Class classObje3 = [self class];
    Class classObje4 = [self superclass];

    NSUInteger hash1 = [objectInit hash];
    NSUInteger hash2 = [self hash];

    NSString *description1 = [objectInit description];
    NSString *description2 = [self description];

}
/** 方法
 A.SEL: 可以以字符串形式将方法包装成 SEL 类型数据
 B.IMP: 是一个函数指针
 */

- (void)chen{
    NSLog(@"%s\n",__func__);
}
+ (void)xiao{
    NSLog(@"%s\n",__func__);
}
- (void)chen:(NSString *)str1 xiao:(NSString *)str2{
    NSLog(@"%s\n",__func__);
}
- (void)test1{
    //1.包装方法
    SEL sel1 = @selector(chen);
    SEL sel2 = NSSelectorFromString(@"chen:xiao:");
    NSString *selStr = NSStringFromSelector(sel2);
    NSLog(@"selStr = %@\n",selStr); // chen:xiao:

    // 2.触发方法
    [self performSelector:sel1];// 只能调用无参方法
    [self performSelector:sel2 withObject:nil withObject:nil];

    /**3.检测是否实现方法
     1.respondsToSelector 用object调用,判断实例对象是否实现了相应的实例方法
     2.respondsToSelector 用class调用,判断class是否实现了相应的类方法
     3.instancesRespondToSelector 只能用类来调用,判断该类的实例对象是否实现了相应的实例方法
     */
    BOOL isResponds1 = [self respondsToSelector:sel1];
    BOOL isResponds2 = [objectInit respondsToSelector:@selector(chen)]; // NO
    BOOL isResponds3 = [objectInit respondsToSelector:@selector(xiao)]; // YES
    BOOL isResponds4 = [objectInit instancesRespondToSelector:@selector(chen)];// YES

    /** 将方法转换成函数指针
     1.methodForSelector 对象掉是只能将实例方法 转换成IMP
     2.methodForSelector 类对象掉只能将类方法 转换成IMP
     3.instanceMethodForSelector ,只能类掉，且只能将实例方法 转换成IMP
     */
    IMP func1 = [self methodForSelector:@selector(chen)];
    IMP func2 = [objectInit methodForSelector:@selector(xiao)];
    IMP func3 = [objectInit instanceMethodForSelector:@selector(chen)];
    func1(); func2(); func3();

}

/** 是否遵守了某协议
 1. @protocol(协议名) 包装一个协议
 2. Protocol * 协议的基类
 3. 类，实例对象是否遵守了某协议
 */
- (void)test2{
    Protocol *protocol = @protocol(objectInitProtocol);
    NSLog(@"protocol = %@\n",protocol);
    BOOL isConform1 = [objectInit conformsToProtocol:protocol];
    BOOL isConform2 = [[[objectInit alloc]init] conformsToProtocol:protocol];

    NSLog(@"isConform1 = %d,isConform2 = %d\n",isConform1,isConform2);
}


/** 对象比对
 1. == (对于基本类型, ==运算符比较的是值; 对于对象类型, ==运算符比较的是对象的地址(即是否为同一对象))
 2.isEqual(如果内容相同,也能比对成功)
 */
- (void)test3{
    NSArray *array1 = @[@1,@2];
    NSArray *array2 = @[@1,@2];
    NSLog(@"array1 == array2? = %@",array1==array2?@"YES":@"NO"); // NO
    NSLog(@"array1 isEqual array2? = %@",[array1 isEqual:array2]?@"YES":@"NO"); // YES
    NSLog(@"array1 isEqualTo array2? = %@",[array1 isEqualTo:array2]?@"YES":@"NO");// YES
}

/** 类型判断
 1.isKindOfClass 用来判断某个对象是否属于某个类，或者是属于某个类的子类。
 2.isMemberOfClass 确定一个对象是否是当前类的成员. 注意是当前类
 3.isSubclassOfClass 判断当前类是否为aClass类的子类
 */
- (void)test4{
    objectInit *obje =  [objectInit new];
    BOOL bool1 =  [obje isKindOfClass:[NSObject class]];
    BOOL bool2 =  [obje  isMemberOfClass:[NSObject class]];
    BOOL bool3 = [objectInitChild isSubclassOfClass:[objectInit class]];
    NSLog(@"%d,%d,%d\n",bool1,bool2,bool3);//  1,0,1
}
+ (void)chenxiawei{
    objectInit *obje =   [objectInit new];
    [obje test4];
}
@end


/*
 A. @protocol NSCopying
 - (id)copyWithZone:(nullable NSZone *)zone;


 B. @protocol NSMutableCopying
 - (id)mutableCopyWithZone:(nullable NSZone *)zone;

 */
/*
 A. @protocol NSCoding
 - (void)encodeWithCoder:(NSCoder *)aCoder;
 - (nullable instancetype)initWithCoder:(NSCoder *)aDecoder;


 B. @protocol NSSecureCoding <NSCoding>
 @property (class, readonly) BOOL supportsSecureCoding;
 */
