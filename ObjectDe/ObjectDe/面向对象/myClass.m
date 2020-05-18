//
//  myClass.m
//  ObjectDe
//
//  Created by xs on 2019/11/5.
//  Copyright © 2019 xax. All rights reserved.
//

#import "myClass.h"
/**Class interface

*/
@interface myClass : NSObject
@property(nonatomic,copy) NSString *name;
@end

/**Extension
 
 */
@interface myClass ()
@property(nonatomic,assign) NSInteger age;
@end
@implementation myClass

@end


/**Category

*/
@interface myClass (Category)

@end
@implementation myClass(Category)

@end

/**继承多态

*/
@interface myClassSub : myClass
@end

@implementation myClassSub

@end
