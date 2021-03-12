
#import "KvoDocument.h"
@implementation school2
@end

@implementation KvcKvo

- (void)kvcIos{
    school2 *value = [[school2 alloc]init];
    /*
     1.按照 setKey:、_setKey:顺序查找方法
     2.查看accessInstanceVariablesDirectly方法的返回值(默认返回值是YES)
     3.按照_key、_isKey、key、isKey顺序查找成员变量,直接赋值
     4.调用setValue:forUndefinedKey:并抛出异常NSUnknownKeyException
     */
    [value setValue:@10 forKey:@"age"];
    [value setValue:@10 forKeyPath:@"age"];
    /*
     1.按照getKey、key、 isKey、_key顺序查找方法
     2.查看accessInstanceVariablesDirectly方法的返回值
     3.按照_key、_isKey、key、isKey顺序查找成员变量,直接取值
     4.调用valueForUndefinedKey:并抛出异常NSUnknownKeyException
     */
    int age1 = [[value valueForKey:@"age"] intValue];
    int age2 = [[value valueForKeyPath:@"age"] intValue];

}

/**
 对对象的属性进行监听
 1.同一个类 添加了监听的对象 可以监听，没添加的不会监听
 2.添加了监听的对象的isa 指向的是 NSKVONotifying_XXXX 类对象
 3.NSKVONotifying_XXXX
a.runtime生成的这个类 的isa 以及superClass 指向被添加对象的原父类
b.监听原理 伪代码
- (void)setAge:(int)age{
    _NSSetIntValueAndNotify();
}
void _NSSetIntValueAndNotify(){
    [self willChangeValueForKey:@"age"];
    [super setAge:age];
    [self didChangeValueForKey:@"age"];
}
- (void)didChangeValueForKey:(NSString *)key{
    // 通知监听器，某某属性值发生了改变
    [oberser observeValueForKeyPath:key ofObject:self change:nil context:nil];
}

c.其它方法
 - (Class)class {
  // 屏幕内部实现，隐藏了NSKVONotifying_MJPerson类的存在
 return [MJPerson class];
 }
 - (void)dealloc{
 // 收尾工作
 }
 - (BOOL)_isKVOA{
 return YES;
 }
 */
- (void)kvoIos{
    school2 *value = [[school2 alloc]init];
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [value addObserver:self forKeyPath:@"age" options:options context:nil];

}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);

}
- (void)dealloc{
    [self.value removeObserver:self forKeyPath:@"age"];
}

- (void)arrayKvo{
//https://www.jianshu.com/p/fb3c1563bd72
//- addObserver:forKeyPath:options:context:
//- removeObserver:forKeyPath:
//- removeObserver:forKeyPath:context:
//- removeObserver:fromObjectsAtIndexes:forKeyPath:context:
//
//- addObserver:toObjectsAtIndexes:forKeyPath:options:context:
//
//- removeObserver:fromObjectsAtIndexes:forKeyPath:

}
- (void)setKvo{
//    - addObserver:forKeyPath:options:context:
//    - removeObserver:forKeyPath:context:
//    - removeObserver:forKeyPath:

}
@end
