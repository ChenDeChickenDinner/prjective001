//
//  HBConditionalShareView.m
//  HBStockWarning
//
//  Created by xs on 2017/1/11.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "HBConditionalShareView.h"
#import "HBDynamicShareView.h"
#import "HBConditionalTools.h"

@interface HBConditionalShareView ()<UIGestureRecognizerDelegate,HBDynamicShareViewDelegate>

@property (weak, nonatomic)  UIImageView *shareImageView;

@property (weak, nonatomic)  UIView *shareToolsView;

@property (assign, nonatomic)  CGFloat toolHeight;
@property (nonatomic, strong) UIWindow *normalOne;
@end

@implementation HBConditionalShareView


/**
 条件单分享

 @param imageName
 */
+ (void)shareWithImageName:(NSString *)imageName delegate:(id)delegate{
    HBConditionalShareView *shareView = [[HBConditionalShareView alloc]init];
    shareView.shareImageView.image = [UIImage imageNamed:imageName];
    shareView.delegate = delegate;
    
     [shareView callDynamicShare:[UIImage imageNamed:imageName] needQRCode:YES];
    return ;
}
+ (void)shareWithImageName:(NSString *)imageName {
    HBConditionalShareView *shareView = [[HBConditionalShareView alloc]init];
    shareView.shareImageView.image = [UIImage imageNamed:imageName];
    [shareView callDynamicShare:[UIImage imageNamed:imageName] needService:NO];
    return ;
}
/**
 截图分享

 @param image <#image description#>
 */
+ (void) shareWithImage:(UIImage *)image delegate:(id)delegate{


    HBConditionalShareView *shareView = [[HBConditionalShareView alloc]init];

    if (image.size.width > image.size.height) {
        shareView.shareImageView.image = [UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationRight];
    }else{

        shareView.shareImageView.image = image;
    }
    shareView.delegate = delegate;

    [shareView callDynamicShare:image needService:YES];
    return ;
}

- (instancetype)init{

    self = [super init];
    if (self) {

       // UIWindow * window = [[UIApplication sharedApplication] keyWindow];

        self.normalOne =[[UIWindow alloc] initWithFrame:(CGRect)([UIScreen mainScreen].bounds)];
        _normalOne.windowLevel =UIWindowLevelAlert;
        UIViewController * nomalControll =[[UIViewController alloc] init];
        _normalOne.rootViewController =nomalControll;
        [_normalOne makeKeyAndVisible];
        NSLog(@"windowbutton123   %@",_normalOne);
        self.frame = _normalOne.bounds;
        self.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.6];
        self.toolHeight = 177;


        // :添加点击事件
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeView)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];

        [self addShareImagesAndTool];
        
        [nomalControll.view addSubview:self];
    }

    return self;
}

- (void)addShareImagesAndTool{
    
    UIImageView *shareImageView = [[UIImageView alloc]init];
    shareImageView.y = 20;
    shareImageView.width = self.width;
    shareImageView.height = self.height - 20;
    shareImageView.centerX = self.centerX;

    self.shareImageView = shareImageView;

    UIView *shareToolsView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height, self.width, self.toolHeight)];
    self.shareToolsView = shareToolsView;

    [self addSubview:shareImageView];
    [self addSubview:shareToolsView];



}



- (void)layoutSubviews{
    [super layoutSubviews];

    CGFloat imageHeight = self.height  - 20 - self.toolHeight;

    [UIView animateWithDuration:0.25f animations:^{
        self.shareImageView.width = self.width * 0.7;
        self.shareImageView.x = self.width * 0.3 / 2;

        self.shareImageView.height = imageHeight;
        self.shareToolsView.y =  20 + imageHeight;
    } completion:^(BOOL finished) {

    }];
}
- (void)closeView{
    [self removeFromSuperview];
}


- (void)callDynamicShare:(UIImage *)image needQRCode:(BOOL)needQRCode{
    NSData *imageData = UIImagePNGRepresentation(image);
    
    NSArray *array = needQRCode ? @[@"onMenuGenerateQRCode",@"onMenuShareWeChatMoments",@"onMenuShareWeChat",@"onMenuShareQQ",@"onMenuShareQZone",@"onMenuShareWeibo"]:
    @[@"onMenuShareWeChatMoments",@"onMenuShareWeChat",@"onMenuShareQQ",@"onMenuShareQZone",@"onMenuShareWeibo"];
    
    NSDictionary *dic = @{
                          @"platforms":array,
                          @"onMenuShareonlineService":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareWeChatMoments":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareWeChat":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareQQ":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareQZone":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareWeibo":@{
                                  @"imageData":imageData
                                  },
                          
                          };
    
    HBDynamicShareModel *model = [HBDynamicShareModel mj_objectWithKeyValues:dic];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        HBDynamicShareView *shareView = [[HBDynamicShareView alloc]init];
        shareView.textType = HBDynamicShareWithImage;
        shareView.delegate = self;
        shareView.model = model;
        shareView.backgroundAlpha = 0;
        [shareView show];
    });
}

- (void)callDynamicShare:(UIImage *)image needService:(BOOL)service{

    NSData *imageData = UIImagePNGRepresentation(image);

    NSArray *array = service ? @[@"onMenuShareonlineService",@"onMenuShareWeChatMoments",@"onMenuShareWeChat",@"onMenuShareQQ",@"onMenuShareQZone",@"onMenuShareWeibo"]:
    @[@"onMenuShareWeChatMoments",@"onMenuShareWeChat",@"onMenuShareQQ",@"onMenuShareQZone",@"onMenuShareWeibo"];

    NSDictionary *dic = @{
                          @"platforms":array,
                          @"onMenuShareonlineService":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareWeChatMoments":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareWeChat":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareQQ":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareQZone":@{
                                  @"imageData":imageData
                                  },
                          @"onMenuShareWeibo":@{
                                  @"imageData":imageData
                                  },
                          
                          };
    
    HBDynamicShareModel *model = [HBDynamicShareModel mj_objectWithKeyValues:dic];

    dispatch_async(dispatch_get_main_queue(), ^{

        HBDynamicShareView *shareView = [[HBDynamicShareView alloc]init];
        shareView.textType = HBDynamicShareWithImage;
        shareView.delegate = self;
        shareView.model = model;
        shareView.backgroundAlpha = 0;
        [shareView show];
    });
}

- (void)didClickRefreshButton{
    [self deletageResponse];

    if (self.superview) {
        [self removeFromSuperview];
    }
}
- (void)didClickFavorNewsButton//change
{

}
- (void)didFinishShareWithResult:(HBDynamicShareWithResultType) resultType platformType:(HBSharePlatformType)platformType{
    [self deletageResponse];

    if (self.superview) {
        [self removeFromSuperview];
    }
}
- (void)didClickBackgroundView{

    [self deletageResponse];

    if (self.superview) {
        [self removeFromSuperview];
    }
}
- (void)didClickQRCodeButton{
    
    [self deletageResponse];
    if ([self.delegate respondsToSelector:@selector(didClickQRCodeButton)]) {
        [self.delegate didClickQRCodeButton];
    }
    
    if (self.superview) {
        [self removeFromSuperview];
    }
}

- (void)deletageResponse{

    if ([self.delegate respondsToSelector:@selector(closeCallBack)]) {
        [self.delegate closeCallBack];
    }
}

- (void)dealloc {
    //5.2.0以后截屏分享回来出现屏幕卡死，原因为normalOne这个window覆盖在最上面没释放，这里做下释放操作
    _normalOne.hidden = YES;
    _normalOne = nil;
    NSLog(@"HBConditionalShareView  dealloc");
}

@end
