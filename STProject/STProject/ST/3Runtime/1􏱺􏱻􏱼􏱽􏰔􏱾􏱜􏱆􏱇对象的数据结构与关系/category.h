//
//  category.h
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import <Foundation/Foundation.h>



@interface category : NSObject

@end



//Category 本质是一个结构指针，指向结构体实例 category_t
typedef struct category_t *Category;;

// 结构 category_t
struct category_t {
    const char *name;//分类所属的类的名称
    classref_t cls;//分类所属的类
    struct method_list_t *instanceMethods;//分类里添加的实例方法列表
    struct method_list_t *classMethods;//分类添加的类方法列表
    struct protocol_list_t *protocols;//分类实现的协议列表
    struct property_list_t *instanceProperties;//分类添加的实例属性列表
    struct property_list_t *_classProperties;  //分类添加的类属性列表
    
    //获取方法列表
    method_list_t *methodsForMeta(bool isMeta) {
        if (isMeta) return classMethods;
        else return instanceMethods;
    }
    //获取属性列表
    property_list_t *propertiesForMeta(bool isMeta, struct header_info *hi);
};
