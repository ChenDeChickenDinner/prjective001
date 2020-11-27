//
//  StringPaths.m
//  Runtime
//
//  Created by xs on 2020/11/27.
//  Copyright © 2020 xax. All rights reserved.
//




#import "StringPaths.h"
//https://www.jianshu.com/p/d91c0c2da5c1
//https://www.jianshu.com/p/8f049d61e795
@implementation StringPaths
+ (void)load{
    NSString *path = @"/Users/xs/Desktop/Snip20201124_10.png";
    NSLog(@"路径:%d", path.absolutePath);//一个布尔值，指示接收方是否代表绝对路径。
    
    NSLog(@"路径:%@", path.pathComponents);//解析路径,返回构成路径的各个部分.
    NSLog(@"路径:%@", path.lastPathComponent);//提取路径中的最后一个组成部分
    NSLog(@"路径:%@", path.pathExtension);//从路径中最后一个组成部分中提取扩展名
    
    NSLog(@"路径:%@", path.stringByAbbreviatingWithTildeInPath);//将路径中用波浪号（〜）字符替换当前路径的当前主目录部分
    NSLog(@"路径:%@", path.stringByExpandingTildeInPath);//将路径中的代字符扩展成用户主目录(~)或指定用户的主目录(~user)

    NSLog(@"路径:%@", path.stringByDeletingLastPathComponent);//删除路径中的最后一个组成部分
    NSLog(@"路径:%@", path.stringByDeletingPathExtension);//从文件的最后一部分删除扩展名

    NSLog(@"路径:%@", path.stringByResolvingSymlinksInPath);//尝试解析路径中的符号链接
    NSLog(@"路径:%@", path.stringByStandardizingPath);//解析路径中的~,(..)父目录,(.)当前目录和符号链接来标准化路径.


  

        
}
//扩展路径 该方法的作用是为路径增加一个component

+ (void)demoStringByAppendingPathComponent{
    /*
     1.请注意，此方法仅适用于文件路径
     */
    NSString *path = NSHomeDirectory();
    NSString *f1 = [path stringByAppendingPathComponent:@"ReadMe.txt"];
    NSLog(@"path = %@", path);//   path = /Users/xs
    NSLog(@"path = %@", f1); //    path = /Users/xs/ReadMe.txt
}


//扩展类型 该方法的作用就是返回一个新的字符串，通过向接收者附加一个扩展分隔符，后跟一个给定的扩展名

+ (void)demoStringByAppendingPathExtension{
    /*
     1.请注意，此方法仅适用于文件路径
     2./tmp/===> /tmp.tiff  字符串被附加到最后一个非空路径组件
     */
    NSString *path = NSHomeDirectory();
    NSLog(@"path = %@", path); //   path = /Users/xs
    NSLog(@"path = %@", [path stringByAppendingPathExtension:@"ppngg"]); // path = /Users/xs.ppngg
}
//删除最后一个路径 通过从接收器中删除最后一个路径组件，以及任何最终的路径分隔符创建的一个新字符串
+ (void)demoStringByDeletingLastPathComponent{
    NSString *path = NSHomeDirectory();
    NSLog(@"path = %@", path); // path = /Users/xs
    NSLog(@"path = %@", [path stringByDeletingLastPathComponent]); // path = /Users
}
// 该属性的作用就是用波浪号（〜）字符替换当前路径的当前主目录部分
+ (void)demoStringByAbbreviatingWithTildeInPath{
    
     /*
      基于当前字符串对象的新字符串。
      如果新字符串指定了当前主目录中的文件，路径的主目录部分将被替换为波浪号（〜）字符。
      如果字符串未在当前主目录中指定文件，则此方法返回一个新的字符串对象，该对象的路径与当前字符串中的路径不变。
      请注意，此方法仅适用于文件路径。 它不适用于URL的字符串表示。
      对于MacOS中的沙盒应用程序，当前主目录与用户的主目录不同。
      对于沙盒应用程序，主目录是应用程序的主目录。
      因此，如果您为沙盒应用程序指定了/Users/<current_user>/file.txt的路径，则返回的路径将与原始路径保持不变。
      但是，如果您为不在沙箱中的应用程序指定了相同的路径，则此方法将以波形符代替路径的/ Users / <current_user>部分

      */
    NSString *f1 = [NSHomeDirectory() stringByAppendingPathComponent:@"ReadMe.txt"];

    NSLog(@"路径:%@", f1); //路径:/Users/xs/ReadMe.txt
    NSLog(@"路径:%@", f1.stringByAbbreviatingWithTildeInPath);// 路径:~/ReadMe.txt
}

/*
 1.该属性的作用就是：通过从接收器中去除多余路径组件而制成的新字符串。
 2.也可以这么理解：通过尝试解析~、..（父目录符号）、.（当前目录符号）和符号链接来标准化路径。
 */
+ (void)demoStringByStandardizingPath{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"ReadMe.txt"];
    NSLog(@"路径:%@", path);
    NSLog(@"路径:%@", path.stringByAbbreviatingWithTildeInPath);
    NSLog(@"%@", path.stringByStandardizingPath);
}

/*
 返回一个字符串数组，通过单独附加到接收器中给定数组中的每个字符串。
 */
+ (void)demoStringsByAppendingPaths{
    NSArray *arr = @[@"lucy", @"Developer", @"CoreSimulator"];
    
    NSArray *resultArr = [@"Users" stringsByAppendingPaths:arr];
    
    NSLog(@"resultArr = %@", resultArr);
}
@end
