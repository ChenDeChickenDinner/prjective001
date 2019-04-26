//
//  main.m
//  OCGrammar
//
//  Created by xs on 2019/4/19.
//  Copyright © 2019 xs. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if !OBJC_TYPES_DEFINED
        printf("文件名:%s,行数:%d,函数名:%s\n",__FILE__,__LINE__,__func__);

#endif

    }
    return 0;
}
