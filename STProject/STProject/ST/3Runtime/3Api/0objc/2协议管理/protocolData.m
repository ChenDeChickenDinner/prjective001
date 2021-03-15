//
//  protocolData.m
//  XSD
//
//  Created by xs on 2021/3/11.
//

#import "protocolData.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation protocolData
+ (void)load{
    
    {
        unsigned int outCount = 0;
        Protocol * __unsafe_unretained *protocolList = objc_copyProtocolList(&outCount);
        for (int i = 0; i < outCount; i++) {
            Protocol* protocol = protocolList[i];
        }
    }
    {
        Protocol *protocol = objc_allocateProtocol("NSObject");
        protocol_addProtocol(protocol, @protocol(NSObject));
        protocol_addProperty(protocol, "name", NULL, 1, YES, YES);
        objc_registerProtocol(protocol);

    }
    //C字符串转协议
    Protocol *protocol = objc_getProtocol("NSObject");
}
@end
