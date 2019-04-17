//
//  NSObjectXS.m
//  Foundation
//
//  Created by xs on 2017/5/25.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "NSObjectXS.h"

@implementation NSObjectXS


/***********	Base class		***********/

//类对象的加载，初始化
+ (void)load;
+ (void)initialize;


// 类对象为 对象分批内存空间
+ (instancetype)new
+ (instancetype)allocWithZone:(struct _NSZone *)zone
+ (instancetype)alloc

//复制对象
- (id)copy;
- (id)mutableCopy;

+ (id)copyWithZone:(struct _NSZone *)zone
+ (id)mutableCopyWithZone:(struct _NSZone *)zone

//初始化对象
- (instancetype)init
//对象的死亡
- (void)dealloc

//类对象 获取类对象
+ (Class)class
+ (Class)superclass;
+ (NSUInteger)hash;

//描述类对象的打印
+ (NSString *)description;
+ (NSString *)debugDescription;


//类对象的比较
+ (BOOL)isSubclassOfClass:(Class)aClass;




/***********	Base class (category)		***********/

@interface NSObject (NSCoderMethods)
+ (NSInteger)version;
+ (void)setVersion:(NSInteger)aVersion;

@property (readonly) Class classForCoder;
- (nullable id)replacementObjectForCoder:(NSCoder *)aCoder;
- (nullable id)awakeAfterUsingCoder:(NSCoder *)aDecoder;

@interface NSObject (NSDeprecatedMethods)
+ (void)poseAsClass:(Class)aClass;


//+ (void)load;
- (void)text1{
/*
 *在程序启动之后，mian函数之前 会加载一遍 compile sources 中的所有类，先父类再子类，再分类，分类按编译顺序调用
 *此时调用时机比较早，运行环境有不确定因素，类可能不可用 只会调用一次
 *且是以 直接使用函数内存地址的方式  方法进行调用
 
 */
}
//+ (void)initialize;
- (void)text2{
/*
  * 在类或它的子类收到第一条消息之前被调用的，并且只会调用一次 ，若分类实现了此方法 那只调用分类的，若有多个分类实现了 只调用最后编译的那个分类的
 */
}


// + (instancetype)allocWithZone:(struct _NSZone *)zone
- (void)text3{
/*
  *目前不推荐使用的实例化方法，alloc 的时候回系统会调用它，目前只在写单例时候重写这个方法 防止 他人通过这个方法实例化对象
 */
}

// - (id)copy; - (id)mutableCopy;
- (void)text4{
/*
  浅拷贝-->不产生新对象 还是原来的对象
  深拷贝-->产生新对象
  单层深拷贝-->产生新对象，但集合内的对象不变

// 非容器类
  * NSString
       *copy   浅拷贝/  mutableCopy 深拷贝
  * NSMutableString
      *copy   深拷贝/  mutableCopy 深拷贝

// 容器类
   *NSArray
       *copy   浅拷贝   /  mutableCopy 单层深拷贝
   *NSSMutableArray
       *copy   单层深拷贝   /  mutableCopy 单层深拷贝
 */
}


// copyWithZone mutableCopyWithZone
- (void)text5{
/*
 */
}


// - (instancetype)init 初始化对象方法
- (void)text6{
/*
 
 - (instancetype)init{
 if (self = [super init]) {}
 return self;
 }

 */
}

// - (void)dealloc 对象释放的时候由系统调用
- (void)text7{
/*
 */
}


// + (BOOL)isSubclassOfClass:(Class)aClass; A
// - (BOOL)isKindOfClass:(Class)aClass; B
// - (BOOL)isMemberOfClass:(Class)aClass; C
- (void)text8{
/*
  * A B 验证 某个类 是否属于aClass 或者其子类
  * 一个类方法，一个对象方法
  * C 只有当类型完全匹配的时候才会返回YES，不认父类
 */
}

//- (BOOL)isEqual:(id)object;


//+ (NSString *)description;
- (void)text9{
/*
 
 *在使用NSObject类替换%@占位符时，会调用description相关方法
 *系统在此方法内部做了对应类的对象 打印对应的东西
 * - (NSString *)descriptionWithLocale:(nullable id)locale;
 * - (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level;
 */
}

@end


























































//// 实例化一个对象
//+ (id)new;
//+ (id)alloc;
//+ (id)allocFromZone:(void *)zone;
//
//- (id)copy;
//- (id)copyFromZone:(void *)zone;
//- (void *)zone;
//
//
//// 初始化一个对象
//+ (id)initialize;
//- (id)init;
//
//// 获取一个对象
//+ (id)class;
//- (id)class;
//+ (id)superclass;
//- (id)superclass;
//- (id)self;
//
//// 识别比较对象
//- (unsigned int) hash;
//- (BOOL) isEqual:anObject;
//
////测试继承关系
//- (BOOL) isKindOf: aClassObject;
//- (BOOL) isMemberOf: aClassObject;
//- (BOOL) isKindOfClassNamed: (const char *)aClassName;
//- (BOOL) isMemberOfClassNamed: (const char *)aClassName;
//
//// 测试类的功能
//+ (BOOL) instancesRespondTo:(SEL)aSelector;
//- (BOOL) respondsTo:(SEL)aSelector;
//
////测试协议的一致性
//- (BOOL) conformsTo: (Protocol *)aProtocolObject;
//+ (BOOL) conformsTo: (Protocol *)aProtocolObject;
//
//// 发送消息在运行时确定
//- (id)perform:(SEL)aSelector;
//- (id)perform:(SEL)aSelector with:anObject;
//- (id)perform:(SEL)aSelector with:object1 with:object2;
//
//// 存档
//- (id)awake;
//- (id)write:(void *)stream;
//- (id)read:(void *)stream;
//+ (int) version;
//+ (id)setVersion: (int) aVersion;

//

//

//

//

//

//
//
