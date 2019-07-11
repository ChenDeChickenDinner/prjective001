//
//  object.m
//  2020COC
//
//  Created by xs on 2019/7/11.
//  Copyright © 2019 xax. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface XSInterface:NSObject

@end



@implementation XSInterface




/**
 元类对象:一个类只有一个元类对象
 */
+ (void)func1{
    
}

/**
 类对象:一个类只有一个类对象
 */
+ (void)func2{
    
}
/**
 实例对象:一个类可以有无数个实例对象
 */
+ (void)func3{
    
}





/*OC三大类型的对象
 */
+ (void)test0{
    //3.实例对象(自定义类型):一个类可以有无数个实例对象
    NSObject *object = [[NSObject alloc]init];
    
    //2.类对象(Class类型):一个类只有一个类对象
    Class object_class1 = [NSObject class];
    Class object_class2 = [object class];
    Class object_class3 = object_getClass(object);
    
    //1.元类对象(Class类型):一个类只有一个元类对象
    Class object_meatClass = object_getClass(object_class1);
    
}

//对象的isa
+ (void)test1{
    //isa:实例对象--->类对象--->元类对象
    
    //1.(NSObject).isa-->NSObject.Class
    NSObject *nsobject = [[NSObject alloc]init];
    
    //2.(NSObject.Class).isa-->NSObject.metaClass
    Class  nsobject_class = [NSObject class];
    
    //3.(NSObject.metaClass).isa-->NSObject.metaClass
    Class nsobject_metaClass = object_getClass([NSObject class]);
    
    
    
    //1.(XSInterface.metaClass).isa-->基类的_元类对象(NSObject.metaClass)
    Class xsobject_metaClass2 = object_getClass([XSInterface class]);
    
    //2.(XSInterface.Class).isa-->XSInterface.metaClass
    Class  xsobject_class2 = [XSInterface class];
    
    //3.(XSInterface.instance).isa-->XSInterface.Class
    XSInterface *xsobject2 = [[XSInterface alloc]init];
    
    
}


/*类对象与元类对象的superclass
 1.NSObject类对象的 superclass  = Nil;
 2.NSObject元类对象的 superclass =  NSObject类对象
 
 3.子类(类对象)的 superclass  = 父类(类对象);
 4.子类(元类对象)的 superclass  = 父类(元类对象);
 */
+ (void)test2{
    
}

/*对象的isa与superclass的运用 方法调用的过程:
 1.实例对象
 a.instance-->isa--->Class类对象:找不到
 b.Class->superclass--->父类类对象:父类对象找不到
 c.父类类对象-->superclass--->NSObject.Class基类对象:找不到报方法不存在
 
 2.类对象
 a.Class-->isa--->metaClass元类对象:找不到
 b.metaClass-->superclass--->父类元类对象:找不到
 c.父类元类对象-->superclass--->NSObject基类元类对象:找不到
 d.NSObject基类元类对象-->superclass--->NSObject基类类对象:类方法变对象方法
 */
+ (void)test3{
    
}



@end

