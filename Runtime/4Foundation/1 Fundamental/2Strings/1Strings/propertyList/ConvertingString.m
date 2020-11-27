//
//  ConvertingString.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//

#import "ConvertingString.h"
//将字符串内容转换为属性列表
@implementation ConvertingString
+ (void)load{
    /**
     这个方法的作用就是将字符串转化为propertyList文件，返回的类型是NSString、NSData、NSArray、NSDictionary，这个返回的类型由最顶层的元素决定。如果转化失败则报错NSParseErrorException

     */
    
    NSString *str =
    @"<dict>"
    @"<key>CFBundleDevelopmentRegion</key>"
    @"<string>en</string>"
    @"<key>CFBundleExecutable</key>"
    @"<string>$(EXECUTABLE_NAME)</string>"
    @"<key>CFBundleIdentifier</key>"
    @"<string>com.$(PRODUCT_NAME:rfc1034identifier)</string>"
    @"<key>CFBundleInfoDictionaryVersion</key>"
    @"<string>6.0</string>"
    @"<key>CFBundleName</key>"
    @"<string>$(PRODUCT_NAME)</string>"
    @"<key>CFBundlePackageType</key>"
    @"<string>APPL</string>"
    @"<key>CFBundleShortVersionString</key>"
    @"<string>1.0</string>"
    @"<key>CFBundleSignature</key>"
    @"<string>????</string>"
    @"<key>CFBundleVersion</key>"
    @"<string>1</string>"
    @"<key>LSRequiresIPhoneOS</key>"
    @"<true/>"
    @"<key>UILaunchStoryboardName</key>"
    @"<string>LaunchScreen</string>"
    @"<key>UIMainStoryboardFile</key>"
    @"<string>Main</string>"
    @"<key>UIRequiredDeviceCapabilities</key>"
    @"<array>"
    @"<string>armv7</string>"
    @"</array>"
    @"<key>UISupportedInterfaceOrientations</key>"
    @"<array>"
    @"<string>UIInterfaceOrientationPortrait</string>"
    @"<string>UIInterfaceOrientationLandscapeLeft</string>"
    @"<string>UIInterfaceOrientationLandscapeRight</string>"
    @"</array>"
    @"</dict>";
    
    id p = [str propertyList];
    NSLog(@"[str propertyList] = %@",p);

    
    /**
     与上一个方法相比，这个只能返回字典类型，要转化的字符串必须满足下边几个条件：

     键值必须以等号连接；
     每一个键值对都是以分号结尾；
     值不显示时可以省略，同时等号也是可以省略的；
     键值都分别用分号隔开；
     也可以包含注释
     */
    
    NSString *str2 =
    @"/* Question in confirmation panel for quitting. */"
    @"\"Confirm Quit\" = \"Are you sure you want to quit?\";"
    @""
    @"/* Message when user tries to close unsaved document */"
    @"\"Close or Save\" = \"Save changes before closing?\";"
    @""
    @"/* Word for Cancel */"
    @"\"Cancel\";";
    
    id p2 = [str2 propertyListFromStringsFileFormat];
    NSLog(@"[str propertyList] = %@",p2);
}
@end
