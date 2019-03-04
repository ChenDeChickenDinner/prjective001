//
//  MemoryMangeARC.m
//  2019OC2
//
//  Created by xs on 2019/3/2.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "MemoryMangeARC.h"
#import "MemoryMangeNature.h"



@implementation MemoryMangeARC



/**ARC下对象的流转(赋值，入参，返回值)
 1.指针内存修饰符
 2.各种场景下的释放时机
 3.编译器完成的事情
 */
static void test1(){
    __weak Person *p1 = [[Person alloc]init];
    __strong Person *p2 = [[Person alloc]init];
}

- (void)test1{
    // 下面对 objc1 objc2都是强引用吗
    NSObject *objc1 = [[NSObject alloc]init];
    NSObject *objc2 = [[NSObject alloc]init];
    __weak typeof(objc2)weakObjc2 = objc2;
    self.objc = objc1;
    self.objc = weakObjc2;// 到底是对weakObjc2 强引用，还是objc2强引用

}
@end


