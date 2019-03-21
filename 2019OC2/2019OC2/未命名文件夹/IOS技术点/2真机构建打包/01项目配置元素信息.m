//
//  01项目配置元素信息.m
//  2019OC2
//
//  Created by xs on 2019/3/20.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "01项目配置元素信息.h"

@implementation _1________


@end
/* project-targets-scheme
 1.project
 a.管理全部资源
 B.编译环境配置
 1.默认二套编译环境配置 debug/release
 2.在基于二套的基础上可新增其他以来区分项目的开发环境

 2.targets
 1.可根据project资源新建各种类型的target产品

 3.edit/manage Scheme
 1.选取指定的target
 2.取一个产品名称
 3.配置各个阶段的运行环境
 1.build-run(编译运行):
 a.info:选择运行环境
 b.options:
 c.diagnostics:
 4.profile(各种性能分析):可选择运行时候的配置环境
 5.analyze(内存分析):可选择运行时候的配置环境
 6.archive(打包归档):
 a.选择打包环境b.设置归档名称c.选择在组织者中展示归档

 4.选择一个scheme，选择一个运行平台-->做各种操作
 1.在模拟器/真机下(build-run)(运行):
 4.在模拟器/真机下(profile)(分析):
 5.在模拟器/真机下(analyze)(内存监控):
 6.在 Generic iOS Device下(archive)(归档):
 */
/*  可设置的target 基本信息
 project级别:
 0.工程名
 1.可包含多个targets
 2.没有相关名称信息可设置

 target-->可构建出产品的级别:
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


 */
