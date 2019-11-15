//
//  团队cocoapods操作.m
//  2019OC2
//
//  Created by xs on 2019/4/9.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "团队cocoapods操作.h"

@implementation __cocoapods__

@end
项目团队管理(Podfile.lock/pod install/pod update)
1.
提醒一下，即使你没有把Pods文件夹提交到你的共享仓库，你都应该总是commit并push你的Podfile.lock文件。

否则的话，将会破坏pod install能够锁定pod库的已安装版本的整个逻辑
2.在Podfile中使用确定的版本是不够的
2.保存一致

