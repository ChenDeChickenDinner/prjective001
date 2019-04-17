//
//  workspace利用.m
//  2019OC2
//
//  Created by xs on 2019/4/9.
//  Copyright © 2019 Touker. All rights reserved.
//

1.直接将开源实现文件add进target：每次都编译，未隔离
2.将三方库dd进target：每次不编译，未隔离

1+2:处理多三方库依赖公共库文件
a.依赖的是开源文件
b.依赖的是闭源文件

3.workspace多项目之间依赖，有隔离,每次都编译，未包含公用
1. 静态库.a target 有实现文件被使用时候会运行
2.Framework  target 有实现文件 被使用时候会运行

4.workspace多项目之间依赖，有隔离,每次都不编译，未包含公用
1.想办法 除去  静态库.a target 的实现文件，先做出二进制库 再对外提供

5workspace多项目之间依赖，有隔离,每次都不编译，包含公用处理
1.想办法 除去  静态库.a target 的实现文件，先做出二进制库 再对外提供
2.再制作过程中使用了 公用的 依赖库，怎么处理
