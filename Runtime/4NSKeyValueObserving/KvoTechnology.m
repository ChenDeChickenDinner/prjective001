//
//  KvoTechnology.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "KvoTechnology.h"
@interface school2 :NSObject
@property (nonatomic,assign) int age;
@end
@implementation school2
@end

@interface KvoTechnology()
@property (nonatomic,assign) int age;
@property (nonatomic,strong) school2 *value;
@end


@implementation KvoTechnology
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
@end
