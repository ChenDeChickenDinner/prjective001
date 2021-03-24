//
//  MRCProperty.m
//  MRC
//
//  Created by xs on 2021/3/18.
//

#import "MRCProperty.h"

@implementation MRCProperty

+ (void)load{
    
  
    /*
     copy 关键字 ，最后的成员变量都是不可变的
     
     */
    {
        {
            // 不可变进行copy  浅拷贝
            NSDictionary *dict = [[NSDictionary alloc]init];
            
            MRCProperty *pro = [[MRCProperty alloc]init];
            pro.dict1 = dict;

            NSLog(@"dict.p = %p,pro.dict1.p = %p",dict,pro.dict1);
        }

        
        {
            // 可变进行copy  深拷贝
            NSMutableDictionary *mDict = [[NSMutableDictionary alloc]init];
            MRCProperty *pro = [[MRCProperty alloc]init];
            pro.dict1 = mDict;
            NSLog(@"dict.p = %p,pro.dict1.p = %p",mDict,pro.dict1);
        }
    }
    {
        {
            // 不可变进行copy  浅拷贝
            NSDictionary *dict = [[NSDictionary alloc]init];
            MRCProperty *pro = [[MRCProperty alloc]init];
            pro.dict2 = dict;
            
//            [pro.dict2 setObject:@"123" forKey:@"key"];
            NSLog(@"dict.p = %p,pro.dict1.p = %p",dict,pro.dict2);
        }
        {
            NSMutableDictionary *mDict = [[NSMutableDictionary alloc]init];
            MRCProperty *pro = [[MRCProperty alloc]init];
            pro.dict2 = mDict;
//            [pro.dict2 setObject:@"123" forKey:@"key"];
            NSLog(@"dict.p = %p,pro.dict1.p = %p",mDict,pro.dict2);
        }
    }
}
@end
@implementation MRCPropertysub

- (void)dealloc{
    [super dealloc];
    NSLog(@"%p:%s",self,__func__);

}

- (void)run{
    
}
@end
