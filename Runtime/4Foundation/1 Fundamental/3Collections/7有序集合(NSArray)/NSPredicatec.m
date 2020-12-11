//
//  NSPredicatec.m
//  Runtime
//
//  Created by xs on 2020/12/10.
//  Copyright © 2020 xax. All rights reserved.
//

#import "NSPredicatec.h"
@interface NSPredicatec ()
@property (nonatomic, strong) NSArray *persons;
@property (nonatomic, strong) NSArray *array1;
@property (nonatomic, strong) NSArray *array2;
@end
@implementation NSPredicatec
- (NSArray *)persons {
    if (!_persons) {
        _persons = @[
                    [Personx personWithName:@"One" age:@11],
                    [Personx personWithName:@"Two" age:@22],
                    [Personx personWithName:@"Three" age:@33],
                    [Personx personWithName:@"Four" age:@44],
                    [Personx personWithName:@"Five" age:@55],
                    [Personx personWithName:@"Six" age:@66],
                    [Personx personWithName:@"Seven" age:@77],
                    [Personx personWithName:@"Eight" age:@88],
                    [Personx personWithName:@"Nine" age:@99]
                    ];
    }
    return _persons;
}

- (NSArray *)array1 {
    if (!_array1) {
        _array1 = @[@"ab", @"abc", @1];
    }
    return _array1;
}

- (NSArray *)array2 {
    if (!_array2) {
        _array2 = @[@"a", @"ab", @"abc", @"abcd"];
    }
    return _array2;
}
/**
 *  打印结果
 *
 *  @param predicate predicate 实例
 */
- (void)logResultWithPredicate:(NSPredicate *)predicate {
    NSArray *filterArray = [self.persons filteredArrayUsingPredicate:predicate];
    if (filterArray.count == 0) return;
    for (Personx *person in filterArray) {
        NSLog(@"personName:%@ - personAge:%@", person.name, person.age);
    }
}
/**
 *  比较运算符
 */
- (void)predicateComparation {
    
    { //比较运算符
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age >= 55"];
        [self logResultWithPredicate:predicate];
    }
    { //集合运算符
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age BETWEEN {11, 55}"];
        [self logResultWithPredicate:predicate];
    }
    { //逻辑表达式
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = 'One' && age = 11"];
        [self logResultWithPredicate:predicate];
    }
    { //字符串间运算符
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS[cd] 'F'"];
        [self logResultWithPredicate:predicate];
    }
    {
        /**
         *  %K : 字段占位符 (K必须是大写)
         *  %@ : 值占位符
         *  $VALUE的用法 : VALUE只是一个普通字符串，当做标识使用，可以任意替换，但要统一
         */
        
        NSString *nameStr = @"name";
        NSString *valueStr = @"Seven";
        NSPredicate *predicate1 = [NSPredicate predicateWithFormat:@"%K CONTAINS %@", nameStr, valueStr];
        [self logResultWithPredicate:predicate1];

        NSPredicate *pred1 = [NSPredicate predicateWithFormat:@"%K > $VALUE", @"age"];
        NSPredicate *predicate2 = [pred1 predicateWithSubstitutionVariables:@{@"VALUE" : @1}];
        [self logResultWithPredicate:predicate2];
    }


    {
        // 取出self.array2中  self.array2 & self.array1都不包含的元素
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)", self.array1];
        NSLog(@"%@", [self.array2 filteredArrayUsingPredicate:predicate]);
        
        // 取出self.array1 & self.array2 都包含的元素
        predicate = [NSPredicate predicateWithFormat:@"SELF IN %@", self.array1];
        NSLog(@"%@", [self.array2 filteredArrayUsingPredicate:predicate]);
        
        // 取出self.array1中  self.array2 & self.array1都不包含的元素
        predicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)", self.array2];
        NSLog(@"%@", [self.array1 filteredArrayUsingPredicate:predicate]);
    }
   
 
}


@end





@implementation Personx

+ (id)personWithName:(NSString *)name
                 age:(NSNumber *)age {
    Personx *person = [[Personx alloc] init];
    person.name = name;
    person.age = age;
    return person;
}
@end
