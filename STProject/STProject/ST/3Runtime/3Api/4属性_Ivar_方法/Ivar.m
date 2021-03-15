//
//  Ivar.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "Ivar.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation Ivar1

/*(成员变量: typedef struct ivar_t *Ivar;
 struct ivar_t {
     int32_t *offset;//代表了这个变量在内存中相对所属对象内存空间起始地址的偏移量,偏移量大小根据类型来定
     const char *name;// 成员变量名 带下划线 _x;
     const char *type;//成员变量类型 用TypeEncodings表示的
     uint32_t size; //大小
     uint32_t alignment_raw;
 };
 访问实例对象的ivar成员变量:
 1.根据isa_t，找到对应的 objc_class,通过 class_ro_t拿到ivars中的ivar
 2.读取 ivar_t 的偏移量
 3.根据 ivar_t 的内存首地址做偏移, 定位 ivar 成员变量的实际内存地址
 */


+ (void)load{
    Class class = [NSObject class];
    unsigned int outCount = 0;
    Ivar *ivarlist = class_copyIvarList(class, &outCount);
    for (int i = 0; i<outCount ; i++) {
        Ivar ivar = ivarlist[i];
        // 成员变量名 带下划线 _x;
        const char *name = ivar_getName(ivar);
        //成员变量类型 用TypeEncodings表示的
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"name:%s,type:%s",name,type);
    }

}
@end
