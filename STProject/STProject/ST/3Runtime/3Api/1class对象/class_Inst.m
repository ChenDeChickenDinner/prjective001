//
//  class_Inst.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "class_Inst.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation class_Inst
+ (void)run{
    
}
- (void)test{
    
}
+ (void)load{
    Class class = [NSObject class];
    Class mettClass = objc_getMetaClass(class_getName(class));
        
    const char *classNameC = class_getName([NSObject class]);

    
    { // 元类对象的检测
        BOOL isMetaCLass = class_isMetaClass(class);
        
        // 检测是否遵守协议
        BOOL isConformsProtocol = class_conformsToProtocol(class, @protocol(NSObject));
        
        // 检测是否实现方法
        BOOL isRespondsSel1 = class_respondsToSelector(class, @selector(NSObject_Instd_Fuc));
        NSLog(@"");
    }

    { // 获取信息
        unsigned int count = 0;
        Protocol *__unsafe_unretained *protocolList = class_copyProtocolList(class, &count);
        objc_property_t *propertyList = class_copyPropertyList(class, &count);
        Ivar *ivarlist = class_copyIvarList(class, &count);
        Method *methodList = class_copyMethodList(class, &count);

    }


}


/*(属性: typedef struct property_t *objc_property_t;
 struct property_t {
     const char *name; // 名称，注意是不是带_下划线的名称
     const char *attributes; //对定义的描述，具体按照type encodings的规则描述
 };
 T:成员变量类型  用TypeEncodings表示的
 C:
 N:
 V:成员变量名
 
 */
+ (void)load1{
    
    
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([NSObject class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = list[i];
        //1.属性名称 不带下划线
        const char *name = property_getName(property);
        //2.属性信息描述
        const char *attributes = property_getAttributes(property);
        NSLog(@"");
        
        unsigned int attribute_tCount = 0;
        objc_property_attribute_t *attributeList = property_copyAttributeList(property, &attribute_tCount);
        for (int i = 0; i < attribute_tCount; i++) {
            objc_property_attribute_t attribute = attributeList[i];
            //1.名称
            const char *name = attribute.name;
            //2.值
            const char *value1 = attribute.value;
            //3.值
            char *value2 = property_copyAttributeValue(property, name);

        }
    }
    objc_property_t property = class_getProperty([NSObject class], "strNSObject");

    
}
/*(成员变量: typedef struct ivar_t *Ivar;
 struct ivar_t {
     int32_t *offset;//代表了这个变量在内存中相对所属对象内存空间起始地址的偏移量,偏移量大小根据类型来定
     const char *name;// 成员变量名 带下划线 _x;
     const char *type;//成员变量类型 用TypeEncodings表示的
     uint32_t size; //大小
     uint32_t alignment_raw;
 };
 访问实例对象的ivar成员变量:
 1.根据isa_t，找到对应的 objc_class,通过 class_ro_t拿到ivars中的ivar
 2.读取 ivar_t 的偏移量
 3.根据 ivar_t 的内存首地址做偏移, 定位 ivar 成员变量的实际内存地址
 */
+ (void)load2{
    Class class = [NSObject class];
    unsigned int outCount = 0;
    Ivar *ivarlist = class_copyIvarList(class, &outCount);
    for (int i = 0; i<outCount ; i++) {
        Ivar ivar = ivarlist[i];
        // 成员变量名 带下划线 _x;
        const char *name = ivar_getName(ivar);
        //成员变量类型 用TypeEncodings表示的
        const char *type = ivar_getTypeEncoding(ivar);
        NSLog(@"name:%s,type:%s",name,type);
    }

    Ivar ivar1 = class_getClassVariable(class, "_str");
    
    Ivar ivar2 = class_getInstanceVariable(class, "_str");
    
}
@end
