//
//  Protocol.m
//  1111
//
//  Created by xs on 2020/11/16.
//

#import "Protocol.h"

@implementation Protocol

@end



// 获取所有加载的Objective-C框架和动态库的名称 、获取指定类所在动态库
const char *  *  objc_copyImageNames(unsigned int *  outCount);
const char *  *  objc_copyClassNamesForImage(const char *  image,unsigned int *  outCount);
typedef BOOL (*objc_hook_getImageName)(Class  cls, const char *  *  outImageName);
typedef BOOL (*objc_hook_getClass)(const char *  name, Class  *  outClass);
 void objc_setHook_getImageName(objc_hook_getImageName  newValue,objc_hook_getImageName  *  outOldValue);
 void objc_setHook_getClass(objc_hook_getClass  newValue,objc_hook_getClass  *  outOldValue);


// 获取类信息
Class       objc_getClass(const char *  name);
Class       objc_getMetaClass(const char *  name);
Class       objc_getRequiredClass(const char *  name);

Class  *    objc_copyClassList(unsigned int *  outCount);
int         objc_getClassList(Class  *  buffer, int bufferCount);


Class       objc_allocateClassPair(Class  superclass, const char *  name,size_t extraBytes);
void        objc_registerClassPair(Class  cls);
void        objc_disposeClassPair(Class  cls);



// 获取协议信息
Protocol *  objc_getProtocol(const char *  name);
Protocol *  objc_copyProtocolList(unsigned int *  outCount);

Protocol *  objc_allocateProtocol(const char *  name);
void        objc_registerProtocol(Protocol *  proto);





//关联对象
id   objc_getAssociatedObject(id  object, const void *  key);
void objc_setAssociatedObject(id  object, const void *  key,id  value, objc_AssociationPolicy policy);
void objc_removeAssociatedObjects(id  object);

// 异常
void objc_enumerationMutation(id  obj);
void objc_setEnumerationMutationHandler(void (* handler)(id  ));

//设置了消息转发的回调
void objc_setForwardHandler(void *  fwd, void *  fwd_stret);





//对象
BOOL object_isClass(id  obj);

Class  object_setClass(id  obj, Class  cls);
Class  object_getClass(id  obj);

void object_setIvar(id  obj, Ivar  ivar, id  value);
id   object_getIvar(id  obj, Ivar  ivar);




//获取信息
const char *  class_getName(Class  cls);
Class         class_getSuperclass(Class  cls);
size_t        class_getInstanceSize(Class  cls);

//自检
BOOL class_isMetaClass(Class  cls);
BOOL class_conformsToProtocol(Class  cls, Protocol *  protocol);
BOOL class_respondsToSelector(Class  cls, SEL  sel);


//获取属性方法协议
objc_property_t*  class_copyPropertyList(Class  cls, unsigned int *  outCount);
objc_property_t   class_getProperty(Class  cls, const char *  name);


Ivar*  class_copyIvarList(Class  cls, unsigned int *  outCount);
Ivar   class_getInstanceVariable(Class  cls, const char *  name);
Ivar   class_getClassVariable(Class  cls, const char *  name);


Method* class_copyMethodList(Class  cls, unsigned int *  outCount);
Method  class_getClassMethod(Class  cls, SEL  name);
Method  class_getInstanceMethod(Class  cls, SEL  name);

IMP  class_getMethodImplementation(Class  cls, SEL  name);
IMP  class_getMethodImplementation_stret(Class  cls, SEL  name);
IMP  class_replaceMethod(Class  cls, SEL  name, IMP  imp,
                   const char *  types);

Protocol *  class_copyProtocolList(Class  cls, unsigned int *  outCount);





// 动态添加
BOOL class_addProperty(Class  cls, const char *  name,
                 const objc_property_attribute_t *  attributes,
                 unsigned int attributeCount);
BOOL class_addIvar(Class  cls, const char *  name, size_t size,
             uint8_t alignment, const char *  types);
BOOL class_addMethod(Class  cls, SEL  name, IMP  imp,
               const char *  types);
BOOL class_addProtocol(Class  cls, Protocol *  protocol);

//创建对象 替换属性
id  class_createInstance(Class  cls, size_t extraBytes);
void class_replaceProperty(Class  cls, const char *  name,
                     const objc_property_attribute_t *  attributes,
                     unsigned int attributeCount);















//获取协议信息
Protocol*  protocol_copyProtocolList(Protocol *  proto,unsigned int *  outCount);
objc_property_t*  protocol_copyPropertyList2(Protocol *  proto,unsigned int *  outCount,
                          BOOL isRequiredProperty, BOOL isInstanceProperty);

objc_property_t   protocol_getProperty(Protocol *  proto,
                    const char *  name,
                    BOOL isRequiredProperty, BOOL isInstanceProperty);


struct objc_method_description *  protocol_copyMethodDescriptionList(Protocol *  proto,
                                  BOOL isRequiredMethod,
                                  BOOL isInstanceMethod,
                                  unsigned int *  outCount);

struct objc_method_description protocol_getMethodDescription(Protocol *  proto, SEL  aSel,
                             BOOL isRequiredMethod, BOOL isInstanceMethod);


const char *  protocol_getName(Protocol *  proto);

// 协议自检
BOOL protocol_conformsToProtocol(Protocol *  proto,Protocol *  other);
BOOL protocol_isEqual(Protocol *  proto, Protocol *  other);

//动态添加
void protocol_addProtocol(Protocol *  proto, Protocol *  addition);

void protocol_addProperty(Protocol *  proto, const char *  name,
                    const objc_property_attribute_t *  attributes,
                    unsigned int attributeCount,
                    BOOL isRequiredProperty, BOOL isInstanceProperty);

void protocol_addMethodDescription(Protocol *  proto, SEL  name,const char *  types,
                             BOOL isRequiredMethod, BOOL isInstanceMethod);

















// 属性
objc_property_attribute_t *  property_copyAttributeList(objc_property_t  property,
                          unsigned int *  outCount);

const char *  property_getName(objc_property_t  property);

const char *  property_getAttributes(objc_property_t  property);

char *  property_copyAttributeValue(objc_property_t  property,
                           const char *  attributeName);



//Ivar
const char *  ivar_getName(Ivar  v);

const char *  ivar_getTypeEncoding(Ivar  v);

ptrdiff_t ivar_getOffset(Ivar  v);
















//注册一个方法，将方法名映射到一个选择器，并返回这个选择器
SEL  sel_registerName(const char *  str);
//获取方法名的C字符串
const char *  sel_getName(SEL  sel);
//比较两个选择器
BOOL sel_isEqual(SEL  lhs, SEL  rhs);


//创建一个指针函数的指针，该函数调用时会调用特定的block
IMP  imp_implementationWithBlock(id  block);
//返回与IMP(使用imp_implementationWithBlock创建的)相关的block
id  imp_getBlock(IMP  anImp);
//解除block与IMP(使用imp_implementationWithBlock创建的)的关联关系，并释放block的拷贝
BOOL imp_removeBlock(IMP  anImp);



SEL           method_getName(Method  m);
IMP           method_getImplementation(Method  m);
const char *  method_getTypeEncoding(Method  m);
//.获取函数描述
struct objc_method_description *  method_getDescription(Method  m);

//.获取返回类型
char *  method_copyReturnType(Method  m);
void    method_getReturnType(Method  m, char *  dst, size_t dst_len);

//.获取参数个数
unsigned int method_getNumberOfArguments(Method  m);

//.获取参数类型
char *  method_copyArgumentType(Method  m, unsigned int index);
void    method_getArgumentType(Method  m, unsigned int index,
                      char *  dst, size_t dst_len);

//.设置函数实现IMP
IMP  method_setImplementation(Method  m, IMP  imp);
//.交换函数的实现IMP
void method_exchangeImplementations(Method  m1, Method  m2);



