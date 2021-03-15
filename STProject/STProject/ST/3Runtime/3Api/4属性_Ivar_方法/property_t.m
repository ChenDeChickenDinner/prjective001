//
//  objc_property_t.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "property_t.h"
#import <objc/runtime.h>
#import <objc/message.h>
@implementation objc_property_t1

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

+ (void)load{
    
    
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
@end
