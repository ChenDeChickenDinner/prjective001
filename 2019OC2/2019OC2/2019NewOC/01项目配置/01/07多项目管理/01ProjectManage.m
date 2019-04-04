//
//  01ProjectManage.m
//  2019OC2
//
//  Created by xs on 2019/4/4.
//  Copyright © 2019 Touker. All rights reserved.
//
/**



 Project创建
 1.选择一种target类型创建工程

 Project文件组织
 a.属于各target的资源文件:
 b.Products文件:项目各种target构建出的产品
 c.Frameworks文件:
    1.项目各种target链接时候依赖的系统库,被添加到此
    2.链接的其它工程的库,被添加到此，如果是动态库则还有拷贝进target

 Project添加资源文件
 a.是否需要拷贝资源文件到项目中
 b.是否保留目录结构
 c.是否被添加到某tagerte中

project的 target
1.默认target
2.新增target
 1.可在原类型target上扩展出新target，使用同一套资源文件以及继承其编译设置
 2.跨类型的target新增 只能产生新的资源文件供自己使用




workspace下的project中的target设置

A:target dependencies（target依赖关系）
1.只能选择依赖本项目下的其它target,不能依赖其他项目的target
2.如果依赖的target是库文件 则还需要添加到Link Binary with Libraries中
3.运行本target的时候也会加载运行依赖的target的原码

B：Link Binary with Libraries(链接的库)
 1.本项目中的(静动态库):
 1.1):依赖系统其他库 直接选择添加系统库
 1.2):导入进本项目,add进本target的静态库
 1.3):导入进本项目,add进本target的懂态库,还需要加入加入Embed frameworks

 2.其它项目中的(静动态库):
 0.链接其它项目中的(静动态库),相当于依赖其它项目的targat
 1.将其它项目中的(静动态库)add进本target的Link Binary with Libraries中
 2.此时本target的项目Frameworks文件下会多出对应的链接库
 3.运行本target的时候会动态链接依赖的外部库()
 4.具体操作跟依赖本项目的一样，外部项目的动态库也需要加入本target的Embed frameworks

3.依赖本项目 与其他项目的库文件的区别
 1.本项目的:库都是事先编译好的二进制文件，而且被加入到本target的，不会再Frameworks文件下产生库文件
 2.其他项目的:每次运行都是要重新运行依赖原target的，而且也会被加入到本target的，且会再Frameworks文件下产生库文件

*/
