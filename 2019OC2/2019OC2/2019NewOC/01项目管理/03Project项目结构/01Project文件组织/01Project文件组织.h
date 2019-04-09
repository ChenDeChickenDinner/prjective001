//
//  01Project文件组织.h
//  2019OC2
//
//  Created by xs on 2019/4/9.
//  Copyright © 2019 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>

Project文件组织
a.属于各target的资源文件:
b.Products文件:项目各种target构建出的产品
c.Frameworks文件:
1.项目各种target链接时候依赖的系统库,被添加到此
2.链接的其它工程的库,被添加到此，如果是动态库则还有拷贝进target
