//
//  MemoryCopy.m
//  2019OC2
//
//  Created by xs on 2019/3/4.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "MemoryCopy.h"
#import "Person.h"

/**
 数组与元素直接的关系
 1.数组指针 控制这 数组对象的 计数器
 2.被添加到数组的元素 都会被 retain一次
 3.被移除的元素 都会被 release一次
 4.只有当数组本身被销毁时候，会对所有元素进行一次release
 */
static void test1(){
    NSMutableArray *array;
    {
        Person *p1 = [[Person alloc]init];
        Person *p2 = [[Person alloc]init];
        array = [[NSMutableArray alloc]init];
        [array addObject:p1];
        [array addObject:p2];
        [p1 release];
        [p2 release];
    }

    {
        NSLog(@"--1111--");
        [array removeLastObject];
        NSLog(@"--2222--");
        [array removeLastObject];
        NSLog(@"--3333--");
    }

    {
        NSLog(@"--array release--begin--");
        [array release];
        NSLog(@"--array release--end--");
    }


    NSLog(@"123\n");
}

/**
 数组与数组之间的流转(添加，流转赋值)
 */
static void test2(){
    NSMutableArray *array1;
    NSMutableArray *array2;

    Person *p = [[Person alloc]init];
    array1 = [[NSMutableArray alloc]init];
    array2 = [[NSMutableArray alloc]init];
    NSLog(@"p.count = %zd\n",[p retainCount]);// p.count = 1
    [array1 addObject:p];
    NSLog(@"p.count = %zd\n",[p retainCount]);// p.count = 2

    {
        /* 被添加一次 就会 被 retain +1;
         <__NSArrayM 0x100514600>(// 同一个数组可以多次添加同一个对象
         <Person: 0x100500400>,
         <Person: 0x100500400>
         )
         */
        [array1 addObjectsFromArray:array1];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count = 3
    }
    {
        // 被添加一次 就会 被retain +1;
        [array2 addObjectsFromArray:array1];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count = 3
    }

    {
        //数组之间的单纯赋值 不会对其内元素有什么影响，只是操作指针转移，若有计时器操作只会影响数组本身的生命周期
        array2 = array1;
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count = 2
    }
}


/**
 copy:产生副本，新建互补影响
 1.能不能修改:
 copy:只要是copy出来的都是不可变的
 mutableCopy:只要是mutableCopy出来的都是可变的
 2.产不产生新对象
 1..只有不可变的对象进行copy才不产生新对象，其余全部产生新对象
 */
static void test3(){
    {
        NSString *str = [NSString stringWithFormat:@"1234"];
        //不可变 拷贝 成不可变，没必要产生新对象
        NSString *str1 = [str copy]; //返回原对象地址
        //不可变 拷贝 成可变,需要产生新对象
        NSString *str2 = [str mutableCopy];
        NSLog(@"str.p = %p,str1.p = %p,str2.p = %p\n",str,str1,str2);
    }

    {
        NSMutableString *str = [NSMutableString stringWithFormat:@"1234"];
        //可变 拷贝 成不可变，需要产生新对象
        NSString *str1 = [str copy];
        //可变 拷贝 成可变,再不能相互影响，需要产生新对象
        NSString *str2 = [str mutableCopy];
        NSLog(@"str.p = %p,str1.p = %p,str2.p = %p\n",str,str1,str2);
    }
}
/**
 数组的copy 对元素计数器的影响
 1.只有当产生了新对象的时候，会对旧数组的元素本身进行一次 retain操作，而不会生成新的的元素对象
 2.只有当新对象完全被释放的时候，当初进行retain操作的旧元素对象才会被release
 3.总结，若产生了新数组对象，如果新对象不销毁，旧数组的元素会一直被新数组引用着
 */
static void test4(){
    {
        Person *p = [[Person alloc]init];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =1

        NSArray *array1 = [[NSArray alloc]initWithObjects:p, nil];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =2

        NSArray *array2 = [array1 copy]; //返回原对象地址(array1与array2 还是同一个对象)
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =2

        [p release];
        NSLog(@"P对象释放:p.count = %zd\n",[p retainCount]);

        [array1 release];//此时数组对象还未被销毁
        NSLog(@"数组1释放:p.count = %zd\n",[p retainCount]);

        [array2 release];//此时数组对象发生销毁，对元素 release一次，P对象销毁-[Person dealloc]
        NSLog(@"数组2释放:p.count = %zd\n",[p retainCount]);
        NSLog(@"-------------");
    }
    //        return 0;
    {
        Person *p = [[Person alloc]init];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count = 1

        // <__NSArrayI 0x100548090>(<Person: 0x100549ae0>)
        NSArray *array1 = [[NSArray alloc]initWithObjects:p, nil];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count = 2


        // <__NSArrayM 0x100642b60>(<Person: 0x100549ae0>)(新数组 老对象 retain+1)
        NSArray *array2 = [array1 mutableCopy];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count = 3

        [p release];
        NSLog(@"P对象释放:p.count = %zd\n",[p retainCount]);

        [array1 release];
        NSLog(@"数组1释放:p.count = %zd\n",[p retainCount]);

        [array2 release];//对象释放
        NSLog(@"数组2释放:p.count = %zd\n",[p retainCount]);// 坏内存访问
        NSLog(@"-------------");

    }
    //        return 0;

    {
        Person *p = [[Person alloc]init];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =1

        NSMutableArray *array1 =[[NSMutableArray alloc]initWithObjects:p, nil];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =2

        NSArray *array2 = [array1 copy];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =3

        [p release];
        NSLog(@"P对象释放:p.count = %zd\n",[p retainCount]);

        [array1 release];
        NSLog(@"数组1释放:p.count = %zd\n",[p retainCount]);

        [array2 release];//对象释放
        NSLog(@"数组2释放:p.count = %zd\n",[p retainCount]);
        NSLog(@"-------------");

    }
    //        return 0;

    {
        Person *p = [[Person alloc]init];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =1

        NSMutableArray *array1 = [[NSMutableArray alloc]initWithObjects:p, nil];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =2

        NSArray *array2 = [array1 mutableCopy];
        NSLog(@"p.count = %zd\n",[p retainCount]);// p.count =3

        [p release];
        NSLog(@"P对象释放:p.count = %zd\n",[p retainCount]);

        [array1 release];
        NSLog(@"数组1释放:p.count = %zd\n",[p retainCount]);

        NSLog(@"数组2准备释放:p.count = %zd\n",[p retainCount]);

        [array2 release]; //对象释放
        NSLog(@"数组2已经释放:p.count = %zd\n",[p retainCount]);

        NSLog(@"-------------");
    }



}

@implementation MemoryCopy

@end
