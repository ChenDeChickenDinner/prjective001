//
//  KvcTechnology.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "KvcTechnology.h"

@interface school1 :NSObject
@property (nonatomic,assign) int age;
@end
@implementation school1
@end
@implementation KvcTechnology
- (void)kvcIos{
    school1 *value = [[school1 alloc]init];
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
- (void)arrayKvc{

//    - setValue:forKey:
//    - valueForKey:
 
}

- (void)setKvc{

//    - setValue:forKey:
//    - valueForKey:
 
}
@end
