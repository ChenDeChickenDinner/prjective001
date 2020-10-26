//
//  UITabBar+DLBadge.h
//  自定义TabBar小红点
//
//  Created by laidongling on 17/7/12.
//  Copyright © 2017年 LaiDongling. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (DLBadge)

@property(nonatomic,assign) CGSize badgeSize;        //小红点size
@property(nonatomic,strong)UIImage *badgeImage;      //小红点图片
@property(nonatomic,strong)UIColor *badgeColor;      //小红点颜色

//显示小红点
- (void)showBadgeOnItemIndex:(NSUInteger )index;

//隐藏小红点
- (void)hiddenRedPointOnIndex:(NSUInteger )index animation:(BOOL )animation;

@end
