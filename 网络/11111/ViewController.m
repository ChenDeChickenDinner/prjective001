//
//  ViewController.m
//  11111
//
//  Created by xs on 2019/3/6.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDelegate>
@property(nonatomic,strong) NSMutableData *data;
@end

@implementation ViewController
- (NSMutableData *)data{
    if (!_data) {
        _data = [[NSMutableData alloc]init];
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}
/*
 1.项目配置证书打包构建发布
 2.git github gitlab macdown
 3.极光后台监控
 3.静态库 cocopos 三方集成



 4.ios功能技术点
 1.通知，推送，应用跳转，
 2.启动图，icon,硬件信息

 5.mac 操作系统

 iOS网络多线程编程
 1.网络请求，抓包，
 2.与后端调通的原则依据，
 3.JSON、XML
 4.认证加密登录

 iOS数据库归档
 3.ios语法框架三方框架
 javascript
 脚本

 监控 调式 性能



 windows网络编程:理解
 1.tcp/ip
 2.URL、HTTP

 数据库理论

 windows操作系统
 java语言基础:
 Java语言 网络编程:
 Java语言 mysql：:


 */
@end
