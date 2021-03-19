//
//  NSMutableArray+Extension.m
//  test
//
//  Created by xs on 2021/3/16.
//

#import "NSMutableArray+Extension.h"
#import <objc/runtime.h>
@implementation NSMutableArray (Extension)


/* 类簇
 1.类簇是Foundation framework框架下广泛使用的一种设计模式。它管理了一组隐藏在公共抽象父类下的具体私有子类。
 2. NSArray 􏱌 NSMutableArray 􏱌 NSDictionary 􏱌 NSMutableDictionary 在实际运行中有真正的子类，方法交换对他们是不管用的
 3.需要找的他们的具体子类
 */
+ (void)load{
    //保证线程安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 要找的正确的类
        Class cla = NSClassFromString(@"__NSArrayM");
        Method method1 = class_getInstanceMethod(cla, @selector(insertObject:atIndex:));
        Method method2 = class_getInstanceMethod(cla, @selector(xs_insertObject:atIndex:));
        
        // 在此利用 class_addMethod做一层验证 下面的class 不能使用簇类了 得使用 [self class]
        if (!class_addMethod([self class], @selector(xs_insertObject:atIndex:), method_getImplementation(method2), method_getTypeEncoding(method2))) {
            method_exchangeImplementations(method1, method2);
        }


    });

    
}
- (void)xs_insertObject:(id)anObject atIndex:(NSUInteger)index{
    if (anObject == nil){
        NSLog(@"anObject = %@",anObject);
        return;
    }
    
    // 调回原方法的实现
    [self xs_insertObject:anObject atIndex:index];
//    [self insertObject:anObject atIndex:index]; 这样调是死循环
}
@end
