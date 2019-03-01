//
//  memoryManage.m
//  2019OC
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "memoryManage.h"
@interface memoryManage()
@property(nonatomic,strong) NSObject *objc;
@end



@implementation memoryManage
- (void)test1{
    // 下面对 objc1 objc2都是强引用吗
    NSObject *objc1 = [[NSObject alloc]init];
    NSObject *objc2 = [[NSObject alloc]init];
    __weak typeof(objc2)weakObjc2 = objc2;
    self.objc = objc1;
    self.objc = weakObjc2;// 到底是对weakObjc2 强引用，还是objc2强引用
    
}
@end
