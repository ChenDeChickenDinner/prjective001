//
//  03Project的 target.h
//  2019OC2
//
//  Created by xs on 2019/4/9.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

target创建
1.默认target
2.新增target
    1.可在原类型target上扩展出新target，使用同一套资源文件以及继承其编译设置
    2.跨类型的target新增 只能产生新的资源文件供自己使用

target信息
product name:$(TARGET_NAME target的名称)
1.建立target时候起的名称,第一个target的名称默认同工程名相同
2.必须配置一个名称，否则编译不过
3.在build setting 可根据环境中配置

bundle name:$(PRODUCT_NAME 产品的名称)
1.构建出产品后，存放在iOS系统中文件名的名称，在info.plis中设置
2.默认 PRODUCT_NAME = TARGET_NAME
3.若不设置，则为TARGET_NAME

display name:
1.显示到手机屏幕上的名称，在info.plist中设置
2.显示依据display name > bundle name > product name


product bundle identifier:
1.organization identifier +product name:产品唯一标识符
2.在build setting 中可根据环境配置

bundle identifier:$(PRODUCT_BUNDLE_IDENTIFIER)
1.包唯一标识符,默认 = PRODUCT_BUNDLE_IDENTIFIER
2.在info.plist中设置,构建包的最终标识符
