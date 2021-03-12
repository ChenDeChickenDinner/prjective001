//
//  TypeEncodings.m
//  Runtime
//
//  Created by xs on 2021/3/9.
//

#import "TypeEncodings.h"

@implementation TypeEncodings
/* Type Encodings(编码类型)
 1.用一个C字符串来表示一个数据类型
 Runtime[38906:2064589] char --> c
 Runtime[38906:2064589] int --> i
 Runtime[38906:2064589] short --> s
 Runtime[38906:2064589] long --> q
 Runtime[38906:2064589] long long --> q
 Runtime[38906:2064589] unsigned char --> C
 Runtime[38906:2064589] unsigned int --> I
 Runtime[38906:2064589] unsigned short --> S
 Runtime[38906:2064589] unsigned long --> Q
 Runtime[38906:2064589] float --> f
 Runtime[38906:2064589] bool --> B
 Runtime[38906:2064589] void --> v
 Runtime[38906:2064589] char * --> *
 Runtime[38906:2064589] id --> @
 Runtime[38906:2064589] Class --> #
 Runtime[38906:2064589] SEL --> :
 Runtime[38906:2064589] int[] --> [3i]
 Runtime[38906:2064589] struct --> {person=*i}
 Runtime[38906:2064589] union --> (union_type=*i)
 Runtime[38906:2064589] int[] --> ^i
 */
+ (void)load{

    NSLog(@"char --> %s",@encode(char));
    NSLog(@"int --> %s",@encode(int));
    NSLog(@"short --> %s",@encode(short));
    NSLog(@"long --> %s",@encode(long));
    NSLog(@"long long --> %s",@encode(long long));
    NSLog(@"unsigned char --> %s",@encode(unsigned char));
    NSLog(@"unsigned int --> %s",@encode(unsigned int));
    NSLog(@"unsigned short --> %s",@encode(unsigned short));
    NSLog(@"unsigned long --> %s",@encode(unsigned long long));
    NSLog(@"float --> %s",@encode(float));
    NSLog(@"bool --> %s",@encode(bool));
    NSLog(@"void --> %s",@encode(void));
    NSLog(@"char * --> %s",@encode(char *));
    NSLog(@"id --> %s",@encode(id));
    NSLog(@"Class --> %s",@encode(Class));
    NSLog(@"SEL --> %s",@encode(SEL));
    int array[] = {1,2,3};
    NSLog(@"int[] --> %s",@encode(typeof(array)));
    typedef struct person{
        char *name;
        int age;
    }Person;
    NSLog(@"struct --> %s",@encode(Person));
    
    typedef union union_type{
        char *name;
        int a;
    }Union;
    NSLog(@"union --> %s",@encode(Union));

    int a = 2;
    int *b = {&a};
    NSLog(@"int[] --> %s",@encode(typeof(b)));
    

    
}
/* ObjCTypes运用1：将成员变量的类型利用ObjCTypes表示
【"T@\"NSString\",C,N,V_str"】
 1.开头:首先是以一个T开头的，然后用 ObjCTypes 表示 属性的类型
 2.结尾:以一个V后面带上存储支持的实例变量的名称（带下划线的）
 3.在中间，每个attributes都是以逗号隔开的，包括
 
 attributeList -- T:@"NSString""
 attributeList -- C:
 attributeList -- N:
 attributeList -- V:_str
 */
+ (void)text0{
    
}
/* ObjCTypes运用2： 将方法的 返回值，参数类型利用ObjCTypes表示
 【"^d16@0:8"】
 
 */
+ (void)text1{
    
}
/* NSMethodSignature(方法签名
 顾名思义, NSMethodSignature就是“方法签名”，苹果官方定义该类为对方法的参数类型、返回值类型进行封装 .
 */
+ (void)text2{
    
}
@end
