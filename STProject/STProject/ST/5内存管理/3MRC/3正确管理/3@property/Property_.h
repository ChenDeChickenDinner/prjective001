//
//  MRCProperty.h
//  MRC
//
//  Created by xs on 2021/3/18.
//

#import <Foundation/Foundation.h>

@interface MRCPropertysub : NSObject
- (void)run;
@end
@interface MRCProperty : NSObject
/*retain
 1.只能修饰对象，指针传递保存
 2.旧对象 release，新对象 retain
 
 */
@property(nonatomic,retain) NSObject *ob1;
/*assign
 1.对象与基本数据都能修饰，指针/数据传递保存
 2.无内存管理操作
 
 */
@property(nonatomic,assign) MRCPropertysub *ob2;

/*
 1.只能修饰对象，指针传递保存
 2.旧对象 release，新对象 copy
 3.为什么使用copy:
  a.复制对象，二者保持独立，互不印象，以防外部的原对象修改了影响了属性
  b.[不可变 copy]:浅拷贝
    [可变 copy]:深拷贝
 */
@property(nonatomic,copy) NSString *str1;
/* copy与 NSMutableString 搭配
 1.不要这个搭配使用
 a:NSMutableString 会是属性在编译阶段有可变对象的api
 b:copy关键字实际是进行的不可变拷贝，成员变量实际是不可修改类型的
 */
@property(nonatomic,copy) NSMutableString *str2;



@property(nonatomic,copy) NSDictionary *dict1;
@property(nonatomic,copy) NSMutableDictionary *dict2;

@end


