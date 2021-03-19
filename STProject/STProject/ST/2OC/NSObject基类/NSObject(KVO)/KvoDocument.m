//
//  person_observer.m
//  test
//
//  Created by xs on 2021/3/16.
//

#import "person_observer.h"


@implementation person_observer
//默认 yes, 默认自动观察所有属性（这个方法的优先级 大于 下面的）
+ (BOOL)automaticallyNotifiesObserversForKey:(NSString *)key{
    
    return NO;
}
//返回YES, 能被默认观察到age
+ (BOOL)automaticallyNotifiesObserversOfName{
    return YES;
}
//返回NO, 则不能被默认观察到age
+ (BOOL)automaticallyNotifiesObserversOfAge{
    return NO;
}
@end


/*
 作用：
 1.对一个类的某个对象的属性添加监听，本类的其它未添加监听的对象无影响
 2.系统默认对象的所有属性 都能被观察到,除非特别设置
 
 
 原理:
 1.一旦对某个对象添加了监听，则利用runtime 动态的生成一个中间类 NSKVONotifying_XXXX
 2.被监听的这个对象的isa 指向 这个中间类，这个中间类是原类的子类
 3.这个中间类 其中实现了 监听属性的set 方法，在set 方法中利用Foundation框架的_NSSetIntValueAndNotify 方法向监听对象发送消息
 NSKVONotifying_XXXX中的伪代码
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
 
 4.主动调用下面的的这个2个方法能手动触发KVO的监听回调
 - (void)willChangeValueForKey:(NSString *)key;
 - (void)didChangeValueForKey:(NSString *)key;
 */
@implementation personTest
- (instancetype)init
{
    self = [super init];
    if (self) {
        person_observer *person = [[person_observer alloc]init];
        [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
        self.person = person;
        person.name = @"123";

        
        person_observer *person2 = [[person_observer alloc]init];

    }
    return self;
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"name"]) {
        id old = [change objectForKey:NSKeyValueChangeOldKey];
        id new = [change objectForKey:NSKeyValueChangeNewKey];

        NSLog(@"监听到%@的%@属性值改变了 - %@ - %@", object, keyPath, change, context);
    }
}
- (void)dealloc
{
    [self.person removeObserver:self forKeyPath:@"name"];
}
@end
