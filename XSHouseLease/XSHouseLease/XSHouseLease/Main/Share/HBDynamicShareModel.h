//
//  HBDynamicShareModel.h
//  HBStockWarning
//
//  Created by Jimmy on 2017/1/12.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HBDynamicPlatformModel;

@interface HBDynamicShareModel : NSObject

/*要分享的平台 QQ 微信 微博*/
@property (nonatomic ,strong) NSArray<NSString *> *platforms;
@property (nonatomic ,strong) HBDynamicPlatformModel *onMenuSaveSnap;
@property (nonatomic ,strong) HBDynamicPlatformModel *onMenuShareWeChat;
@property (nonatomic ,strong) HBDynamicPlatformModel *onMenuShareWeChatMoments;
@property (nonatomic ,strong) HBDynamicPlatformModel *onMenuShareQQ;
@property (nonatomic ,strong) HBDynamicPlatformModel *onMenuShareQZone;
@property (nonatomic ,strong) HBDynamicPlatformModel *onMenuShareWeibo;

/*
 刷新 复制功能
 */
@property (nonatomic ,strong) NSArray<NSString *> *functions;


@end

@interface HBDynamicPlatformModel : NSObject

@property (nonatomic ,copy) NSString *title;
@property (nonatomic ,copy) NSString *des;

//网络的url
@property (nonatomic ,copy) NSString *imageUrl;
@property (nonatomic ,copy) NSString *clickUrl;
//本地assets里面的图片
@property (nonatomic ,copy) NSString *image;

//生成的NSData类型的图片
@property (nonatomic ,strong) NSData *imageData;

@end
