//
//  HBConditionalShareView.h
//  HBStockWarning
//
//  Created by xs on 2017/1/11.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HBConditionalShareViewDeletage <NSObject>

@optional

- (void)closeCallBack;
- (void)didClickQRCodeButton;
@end


@interface HBConditionalShareView : UIView
@property (nonatomic, weak) id<HBConditionalShareViewDeletage> delegate;
/* 分享,没有咨询服务**/
+ (void)shareWithImageName:(NSString *)imageName;
/* 分享,带生成二维码**/
+ (void)shareWithImageName:(NSString *)imageName delegate:(id)delegate;

+ (void)shareWithImage:(UIImage *)image delegate:(id)delegate;
- (void)closeView;

@end
