//
//  HBDynamicShare.h
//  HBStockWarning
//
//  Created by Jimmy on 2017/1/11.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBDynamicShareModel.h"

typedef NS_ENUM(NSInteger, HBDynamicShareType) {
    HBDynamicShareTypeAllShare = 0,
    HBDynamicShareTypeWechatAndWechatMomentsShare,
    HBDynamicShareTypeWechatShare,
    HBDynamicShareTypeWechatMomentsShare,
    HBDynamicShareTypeDontShare, //1个button
    HBDynamicShareTypeFundDetailAllShare,
    
    HBDynamicShareTypeAllShareWithMyCommunity,
    HBDynamicShareTypeWechatAndWechatMomentsShareWithMyCommunity,
    HBDynamicShareTypeWechatShareWithMyCommunity,
    HBDynamicShareTypeWechatMomentsShareWithMyCommunity,
    HBDynamicShareTypeDontShareWithMyCommunity, //1个button
    
};
typedef NS_ENUM(NSInteger, HBDynamicShareWithResultType) {
    HBDynamicShareWithResultTypeFail = 0,
    HBDynamicShareWithResultTypeSuccess,
    HBDynamicShareWithResultTypeCancel
    
};
typedef NS_ENUM(NSInteger, HBDynamicShareTextType) {
    HBDynamicShareWithText = 0,
    HBDynamicShareWithImage

};

/**
 分享平台

 - HBPlatformTypeSinaWeibo: 新浪微博
 - HBPlatformSubTypeQZone: QQ空间
 - HBPlatformSubTypeWechatSession: 微信好友
 - HBPlatformSubTypeWechatTimeline: 微信朋友圈
 - HBPlatformSubTypeQQFriend: QQ好友
 */
typedef NS_ENUM(NSInteger,HBSharePlatformType) {
    HBPlatformTypeSinaWeibo = 1,
    HBPlatformSubTypeQZone,
    HBPlatformSubTypeWechatSession,
    HBPlatformSubTypeWechatTimeline,
    HBPlatformSubTypeQQFriend
};

@protocol HBDynamicShareViewDelegate <NSObject>

- (void)didClickRefreshButton;
- (void)didClickFavorNewsButton;

@optional
/** 分享结果回调，带上平台类型 */
- (void)didFinishShareWithResult:(HBDynamicShareWithResultType) resultType platformType:(HBSharePlatformType)platformType;
- (void)didClickBackgroundView;
/**保存到相册*/
- (void)didClickLongSnapView;
/**长截图*/
- (void)didClickSaveSnapButton;

/**生成二维码*/
- (void)didClickQRCodeButton;
@end

@interface HBDynamicShareView : UIView
@property(nonatomic,strong)HBDynamicPlatformModel *onMenuSaveSnap;
@property(nonatomic,strong)HBDynamicPlatformModel *onMenuShareWeChat;
@property(nonatomic,strong)HBDynamicPlatformModel *onMenuShareWeChatMoments;
@property(nonatomic,strong)HBDynamicPlatformModel *onMenuShareQQ;
@property(nonatomic,strong)HBDynamicPlatformModel *onMenuShareQZone;
@property(nonatomic,strong)HBDynamicPlatformModel *onMenuShareWeibo;
@property(nonatomic,weak) id<HBDynamicShareViewDelegate> delegate;
@property(nonatomic,strong) HBDynamicShareModel *model;
@property(nonatomic) CGFloat backgroundAlpha;
@property(nonatomic,assign)HBDynamicShareTextType textType; // 分享内容 类型（一般，图片）

- (void)show;
- (void)show:(UIViewController *)toViewController;
+(void)showWithDynamicModel:(HBDynamicShareModel *)model delegate:(UIViewController *)viewController;

+(void)showWithDynamicModel:(HBDynamicShareModel *)model;
+ (NSString *)platformDescribeWithPlatformType:(HBSharePlatformType)platformType;

@end

