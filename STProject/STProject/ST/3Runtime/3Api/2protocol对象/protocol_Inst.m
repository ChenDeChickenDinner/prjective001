
//
//  protocol_Inst.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "protocol_Inst.h"

#import <objc/runtime.h>
#import <objc/message.h>
@implementation protocol_Inst

+ (void)load{
 
    Protocol *protocol = @protocol(NSObject);
 
    //协议的C字符串
    const char *protocolNameC = protocol_getName(@protocol(NSObject));
        
    //协议遵守的所有协议
    unsigned int outCount = 0;
    Protocol *__unsafe_unretained *protocolList = protocol_copyProtocolList(protocol, &outCount);
    
    //协议所有的属性
    unsigned int propertyCount = 0;
    objc_property_t *propertyList = protocol_copyPropertyList2(protocol, &propertyCount, YES, YES);
    for (int i = 0 ; i < propertyCount; i++) {
        objc_property_t property = propertyList[i];
    }
    
    //一个属性
    objc_property_t property = protocol_getProperty(protocol, "", YES, YES);
    
    //判断一个协议 proto 是否遵守了另一个协议 other
    protocol_conformsToProtocol(@protocol(NSObject), @protocol(NSObject));
    
    //判断两个协议是否相同
    protocol_isEqual(@protocol(NSObject), @protocol(NSObject));
}
@end
