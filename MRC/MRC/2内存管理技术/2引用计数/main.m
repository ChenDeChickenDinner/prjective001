//
//  main.m
//  MRC
//
//  Created by xs on 2021/3/18.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "MRCProperty.h"


/*

 3:管理规则
 1.自己生成的对象，自己持有:
 2.非自己生成的对象，自己也能持有:
 3.不再需要自己持有的对象时释放:
 4.非自己持有的对象无法释放:
 


 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        { //正确使用 1.管理好计算器-避免内存泄露
            {
                /* 1.自己生成的对象，自己持有:单一对象
                 1.使用alloc、new、copy、mutableCopy名称开头的方法创建的对象，
                 2.自己持有,释放
                 */
                Person *person = [[Person alloc]init];
                [person release];
            }
            
            {
                /*2非自己生成的对象，自己也能持有:对象引用对象
                 1.在set持有时候，做好计数器管理 释放旧的/持有新的
                 2.在自己dealloc时候，释放持有的
                 */
                Car *car1 = [[Car alloc]init];
                Car *car2 = [[Car alloc]init];

                Person *person = [[Person alloc]init];
                [person setCar:car1];
                [person setCar:car2];

                [car1 release];
                [car2 release];

                [person release];

            }
        }
        {  //正确使用 2.管理好指针对象-避免野指针的使用
            { // 当指针指向的对象计数器已经为0，已经成为野指针 再操作会崩溃(坏内存访问--野指针)
                Person *person = [[Person alloc]init];
                [person release];
    //            [person retain]; //EXC_BAD_ACCESS
    //            [person release]; //EXC_BAD_ACCESS
    //            [person run]; //EXC_BAD_ACCESS

            }
            { // 清空野指针
                Person *person = [[Person alloc]init];
                [person release]; // 野指针,指针有值，但在具体使用的时候 是无法预料的内存地方
                person = nil;  //指针置为空，再向空对象发消息，则无效，不会造成坏内存访问
                [person release];
                [person run];

            }
        }

 

    }
    NSLog(@"333");

    return 0;
}
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
void copy(){
    {// NSString NSMutableString
        
        
        
    }
    {// NSArray NSMutableArray
        
        
    }
    {// NSDictionary NSMutableDictionary
     

        
    }
    return;
}

