//
//  CopyFunc.m
//  MRC
//
//  Created by xs on 2021/3/22.
//

#import "CopyFunc.h"
/*copy、mutableCopy
 1.作用：拷贝一个副本
 
 2.原则：
 2个对象之间互不影响
 
 3.新对象是否可变:
 copy、
 mutableCopy、
 
 
 浅拷贝:
 不可变对象--->不可变拷贝
 1.原对象本身是不可变的；
 2.目标对象也是不可变的；
 3.所以没有必要生成新对象，直接是指针拷贝，原对象的引用计算器+1就行
 
 深拷贝:
 不可变对象--->可变拷贝:需要生成新对象
 可变对象--->不可变拷贝:需要生成新对象
 可变对象--->可变拷贝:需要生成新对象
 
 NSArray         （copy）           不可变（__NSArrayI）
 NSArray         （mutableCopy）    可变（__NSArrayM）
 NSMutableArray  （copy）           不可变（__NSArrayI）
 NSMutableArray  （mutableCopy）    可变（__NSArrayM）


 
 NSDictionary           （copy）           不可变（__NSSingleEntryDictionaryI）
 NSDictionary           （mutableCopy）    可变（__NSDictionaryM）
 NSMutableDictionary    （copy）           不可变（__NSFrozenDictionaryM）
 NSMutableDictionary    （mutableCopy）    可变（__NSDictionaryM）
 */
@implementation CopyFunc
+ (void)load{
    {// NSString NSMutableString
        
        
        
    }
    {// NSArray NSMutableArray
        
        
    }
    {// NSDictionary NSMutableDictionary
     

        
    }
}
@end


