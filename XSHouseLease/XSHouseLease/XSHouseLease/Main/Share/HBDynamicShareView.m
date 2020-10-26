//
//  HBDynamicShare.m
//  HBStockWarning
//
//  Created by Jimmy on 2017/1/11.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "HBDynamicShareView.h"
#import <shareSDK/ShareSDK.h>
#import "AppDelegate.h"
#import "SDWebImageDownloader.h"
#import "HBShareSDKModel.h"
#import "HBQRCodeFool.h"
#import "HBPhotoTool.h"
#import "HBPromptAlertView.h"
#import "HBPromptProgressModel.h"
//缩放比例,基于750*1334的iphone6的图，375*667
#define K_RealWidth1(iphone6Width)           (round([UIScreen mainScreen].bounds.size.width/750.0 * iphone6Width))
#define K_RealHeight1(iphone6Height)         (iphone6Height/2.0)



@interface HBDynamicShareController : HBBaseViewController

@end


@implementation HBDynamicShareController

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

@end


typedef NS_ENUM(NSInteger, MyLXActionSheetType) {
    MyLXActionSheetType_OnMenuSaveSnap,
    MyLXActionSheetType_OnlineService,
    MyLXActionSheetType_WeixiTimeline,
    MyLXActionSheetType_WeixiSession,
    MyLXActionSheetType_QQFriends,
    MyLXActionSheetType_QQSpace,
    MyLXActionSheetType_SinaWeibo,
    MyLXActionSheetType_SaveSnap,
    MyLXActionSheetType_CopyUrl,
    MyLXActionSheetType_Refresh,
    MyLXActionSheetType_Favor,
    MyLXActionSheetType_QRCode
};



@interface HBDynamicShareView ()

@property (nonatomic,strong) UIView *backGroundView;
@property (nonatomic,assign) CGFloat LXActionSheetHeight;

@property (nonatomic,strong) NSArray<NSString *> *allImageTitleArray;
@property (nonatomic,strong) NSArray<NSString *> *platformsImageArray;
@property (nonatomic,strong) NSArray<NSString *> *functionsImageArray;
@property (nonatomic ,strong)  HBShareSDKModel *shareModel;

@property (nonatomic, strong) NSMutableDictionary *shareParams; //分享的参数
@property (nonatomic, strong) NSDictionary *dataDic; //分享的参数
@property (nonatomic,strong) NSArray<NSString *> *platforms;
@property (nonatomic,strong) NSArray<NSString *> *functions;


//分享的图片对应的名称
@property(nonatomic,strong) NSDictionary *nameAndImageDic;
@property (nonatomic, strong) UIWindow *normalOne;
@property (nonatomic, strong) UIWindow *originWindow;

@end

@implementation HBDynamicShareView

- (void)dealloc
{
    
}

#pragma mark - Public method
-(instancetype)init{
    if (self = [super init]) {
    }
    return self;
}

-(instancetype)initWithModel:(HBDynamicShareModel *)model{
    self.onMenuShareQQ = model.onMenuShareQQ;
    self.onMenuShareWeChat = model.onMenuShareWeChat;
    self.onMenuShareWeChatMoments = model.onMenuShareWeChatMoments;
    self.onMenuShareQZone = model.onMenuShareQZone;
    self.onMenuShareWeibo = model.onMenuShareWeibo;
    self.platforms = model.platforms;
    self.functions = model.functions;
    if (self = [super init]) {
        [self configDynamicUI];
    }
    return self;
}

- (void)setModel:(HBDynamicShareModel *)model{
    _model = model;
    self.onMenuSaveSnap = model.onMenuSaveSnap;
    self.onMenuShareQQ = model.onMenuShareQQ;
    self.onMenuShareWeChat = model.onMenuShareWeChat;
    self.onMenuShareWeChatMoments = model.onMenuShareWeChatMoments;
    self.onMenuShareQZone = model.onMenuShareQZone;
    self.onMenuShareWeibo = model.onMenuShareWeibo;
    self.platforms = model.platforms;
    self.functions = model.functions;
    [self configDynamicUI];
}
+(void)showWithDynamicModel:(HBDynamicShareModel *)model delegate:(UIViewController *)viewController{
    HBDynamicShareView *shareSheet = [[HBDynamicShareView alloc] initWithModel:model];
    shareSheet.delegate = (HBWebViewController *)viewController;
    shareSheet.backgroundAlpha = 0.7;
    [shareSheet show];

}

+(void)showWithDynamicModel:(HBDynamicShareModel *)model{
    HBDynamicShareView *shareSheet = [[HBDynamicShareView alloc] initWithModel:model];
    shareSheet.backgroundAlpha = 0.7;
    [shareSheet show];
}


-(void)setBackgroundAlpha:(CGFloat)backgroundAlpha{
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:backgroundAlpha];
}

- (void)show
{
    self.originWindow =[UIApplication sharedApplication].keyWindow;
    self.normalOne =[[UIWindow alloc] initWithFrame:(CGRect)([UIScreen mainScreen].bounds)];
    _normalOne.windowLevel = UIWindowLevelAlert+1;
    HBDynamicShareController * nomalControll =[[HBDynamicShareController alloc] init];
    HBBaseNavigationController *navC = [[HBBaseNavigationController alloc] initWithRootViewController:nomalControll];
    _normalOne.rootViewController = navC;
    [_normalOne makeKeyAndVisible];
    [nomalControll.view addSubview:self];
}
- (void)show:(UIViewController *)toViewController{
    [toViewController.view addSubview:self];
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    UIView *view = [super hitTest:point withEvent:event];
    return self.normalOne?view:(view==self?nil:view);
}
-(void)configDynamicUI {
    CGFloat boundWidth = [UIScreen mainScreen].bounds.size.width;//320
    CGFloat boundHeight = [UIScreen mainScreen].bounds.size.height;//568
    
    
    self.frame = CGRectMake(0, 0, boundWidth, boundHeight);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:self.backgroundAlpha];
    
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tapGesture];
    
    //初始化LXACtionView的高度为0
    self.LXActionSheetHeight = 200 * HBHeightRate;
    
    //生成LXActionSheetView
    self.backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
    
    self.backGroundView.backgroundColor = [UIColor colorWithHexString:@"E4E4E4"];
    [self addSubview:self.backGroundView];
    
    if (self.platforms.count == 0 && self.functions.count == 0) {  //参数是从H5传过来的
        [self configAsNotShare];
    }else{ //默认全部显示
        [self configAsDynamicShare];
    }

}

-(void)configAsDynamicShare{
    CGFloat scrollViewX = 0;
    CGFloat scrollViewY = 40;
    CGFloat scrollViewW = 0;
    CGFloat scrollViewH = 0;
    CGFloat scrollMargin = 5;
    CGFloat imageTitleHeight = 25;
    
    UILabel *shareToLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, KScreenWidth, 20)];
    shareToLabel.text = @"分享到";
    shareToLabel.textAlignment = NSTextAlignmentCenter;
    shareToLabel.font = [UIFont systemFontOfSize:13];
    shareToLabel.textColor = [UIColor grayColor];
    [self.backGroundView addSubview:shareToLabel];
    
    
    CGFloat lineSpace = 20;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsHorizontalScrollIndicator = NO;
    if (ISIPHONE4_7 || ISIPHONE5_5) {
        if (self.platforms.count > 5) {
            scrollView.scrollEnabled = YES;
        }else{
            scrollView.scrollEnabled = NO;
        }
        scrollViewW = (KScreenWidth - scrollMargin * 2)/5.0;

    }else{  // iPhone4 or 5
        scrollViewW = (320 - scrollMargin * 2)/4.5;
        scrollView.scrollEnabled = YES;
    }
    scrollViewH = lineSpace;
    scrollView.frame = CGRectMake(0, scrollViewY, KScreenWidth,scrollViewW + imageTitleHeight + lineSpace);
    [self.backGroundView addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(20 + scrollViewW * (self.platforms.count), scrollViewH);
    
    if (self.platforms.count != 0) {
        for (int i = 0; i < self.platforms.count; i++) {
            
            scrollViewX = i * scrollViewW + scrollMargin;
            UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(scrollViewX, 0, scrollViewW, scrollViewW)];
            shareButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
            [shareButton setImage:[UIImage imageNamed:self.platforms[i]] forState:UIControlStateNormal];
            
            shareButton.backgroundColor = [UIColor clearColor];
            shareButton.tag = [self.allImageTitleArray indexOfObject:(self.platforms[i])];
            [shareButton addTarget:self action:@selector(clickOnButtonWith:) forControlEvents:UIControlEventTouchUpInside];
            
            
            UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(scrollViewX,shareButton.y + shareButton.height , scrollViewW, imageTitleHeight)];
            [lable1 setFont:[UIFont systemFontOfSize:11]];
            [lable1 setText:self.nameAndImageDic[self.platforms[i]]];
            [lable1 setTextAlignment:NSTextAlignmentCenter];
            [lable1 setTextColor:[UIColor grayColor]];
            
            [scrollView addSubview:lable1];
            [scrollView addSubview:shareButton];
        }
        scrollViewH = scrollViewW + imageTitleHeight + lineSpace;

    }
    
    if (self.functions.count > 0) {
        for (int i = 0; i < self.functions.count; i++) {
            scrollViewX = i * scrollViewW + scrollMargin;
            
            UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(scrollViewX, scrollViewH + lineSpace + 20, scrollViewW, scrollViewW)];
            shareButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
            [shareButton setImage:[UIImage imageNamed:self.functions[i]] forState:UIControlStateNormal];
            shareButton.backgroundColor = [UIColor clearColor];
            shareButton.tag = [self.allImageTitleArray indexOfObject:self.functions[i]];
            [shareButton addTarget:self action:@selector(clickOnButtonWith:) forControlEvents:UIControlEventTouchUpInside];
            [self.backGroundView addSubview:shareButton];
            
            UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(scrollViewX,shareButton.y + shareButton.height, scrollViewW, imageTitleHeight)];
            [lable1 setFont:[UIFont systemFontOfSize:11]];
            [lable1 setText:self.nameAndImageDic[self.functions[i]]];
            [lable1 setTextAlignment:NSTextAlignmentCenter];
            [lable1 setTextColor:[UIColor grayColor]];
            [self.backGroundView addSubview:lable1];
        }
        
        scrollViewH = scrollViewH + scrollViewW + imageTitleHeight + lineSpace;
    }
    //高度为 行数(imageArray.count / 5 + 1) * 高度(scrollViewH) + 20 + 取消按钮的高度 K_RealHeight1(100)
    if (self.platforms.count && self.functions.count) {
        UILabel *seperateLine = [[UILabel alloc] initWithFrame:CGRectMake(0, scrollView.height - 12, scrollView.contentSize.width, 0.5)];
        seperateLine.backgroundColor = [UIColor colorWithHexString:@"#C4C4C4"];
        [scrollView addSubview:seperateLine];
    }
    
    self.LXActionSheetHeight = scrollViewH + lineSpace + K_RealHeight1(100);

    //0.048     0.904    0.048
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.LXActionSheetHeight - K_RealHeight1(100), KScreenWidth, K_RealHeight1(100))];
    cancelButton.layer.masksToBounds = YES;
    cancelButton.layer.borderWidth = 0.5f;
    cancelButton.layer.borderColor = [UIColor colorWithRed:189.0f/255.0f green:189.0f/255.0f blue:189.0f/255.0f alpha:1].CGColor;
    cancelButton.backgroundColor = [UIColor whiteColor];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:C_black01Color forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    cancelButton.tag = 100;
    [cancelButton addTarget:self action:@selector(clickOnButtonWith:) forControlEvents:UIControlEventTouchUpInside];
    [self.backGroundView addSubview:cancelButton];
    
    [UIView animateWithDuration:0.25f animations:^{
        [self.backGroundView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-self.LXActionSheetHeight-ISPHONE_X_Bottom_Height, [UIScreen mainScreen].bounds.size.width, self.LXActionSheetHeight+ISPHONE_X_Bottom_Height)];
    } completion:^(BOOL finished) {
    }];

}
-(void)configAsNotShare{
    CGFloat boundWidth = [UIScreen mainScreen].bounds.size.width;//320
    CGFloat boundHeight = [UIScreen mainScreen].bounds.size.height;//568
    self.frame = CGRectMake(0, 0, boundWidth, boundHeight);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:self.backgroundAlpha];
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tappedCancel)];
    [self addGestureRecognizer:tapGesture];
    self.LXActionSheetHeight = K_RealHeight1(340);
    
    //生成LXActionSheetView
    self.backGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
    self.backGroundView.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.9];
    [self addSubview:self.backGroundView];
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(K_RealWidth1(30), K_RealHeight1(40), K_RealWidth1(120), K_RealHeight1(120))];
    [imageView1 setBackgroundColor:[UIColor clearColor]];
    [imageView1 setImage:[UIImage imageNamed:@"webview_share_refresh"]];
    [self.backGroundView addSubview:imageView1];
    UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(K_RealWidth1(30), imageView1.frame.origin.y+imageView1.frame.size.height+5, K_RealWidth1(120), K_RealHeight1(50))];
    [lable1 setFont:[UIFont systemFontOfSize:11]];
    [lable1 setText:@"刷新"];
    [lable1 setBackgroundColor:[UIColor clearColor]];
    [lable1 setTextAlignment:NSTextAlignmentCenter];
    [lable1 setTextColor:[UIColor grayColor]];
    [self.backGroundView addSubview:lable1];
    UIButton *shareButton1 = [[UIButton alloc] initWithFrame:CGRectMake(imageView1.frame.origin.x-20, 10, lable1.frame.origin.y+lable1.frame.size.height, 70)];
    shareButton1.backgroundColor = [UIColor clearColor];
    shareButton1.tag = MyLXActionSheetType_Refresh;
    [shareButton1 addTarget:self action:@selector(clickOnButtonWith:) forControlEvents:UIControlEventTouchUpInside];
    [self.backGroundView addSubview:shareButton1];
    
    //0.048     0.904    0.048
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.LXActionSheetHeight -K_RealHeight1(100), KScreenWidth, K_RealHeight1(100))];
    cancelButton.layer.masksToBounds = YES;
    cancelButton.layer.borderWidth = 0.5f;
    cancelButton.layer.borderColor = [UIColor colorWithRed:189.0f/255.0f green:189.0f/255.0f blue:189.0f/255.0f alpha:1].CGColor;
    cancelButton.backgroundColor = [UIColor whiteColor];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:C_black01Color forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:18];
    cancelButton.tag = 100;
    [cancelButton addTarget:self action:@selector(clickOnButtonWith:) forControlEvents:UIControlEventTouchUpInside];
    [self.backGroundView addSubview:cancelButton];
    
    
    [UIView animateWithDuration:0.25f animations:^{
        [self.backGroundView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-self.LXActionSheetHeight, [UIScreen mainScreen].bounds.size.width, self.LXActionSheetHeight)];
    } completion:^(BOOL finished) {
    }];

}
-(void)configAsDefaultShare{
    CGFloat scrollViewX = 0;
    CGFloat scrollViewY = 40;
    CGFloat scrollViewW = 0;
    CGFloat scrollViewH = 0;
    CGFloat scrollMargin = 5;
    CGFloat imageTitleHeight = 25;
    
    CGFloat lineSpace = 20;
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsHorizontalScrollIndicator = NO;
    if (ISIPHONE4_7 || ISIPHONE5_5) {
        if (self.platforms.count > 5) {
            scrollView.scrollEnabled = YES;
        }else{
            scrollView.scrollEnabled = NO;
        }
        
        scrollViewW = (KScreenWidth - scrollMargin * 2 )/5.0;
        
    }else{  // iPhone4 or 5
        scrollViewW = (320 - scrollMargin * 2)/4.5;
        scrollView.scrollEnabled = YES;
    }
    
    UILabel *shareToLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, KScreenWidth, 20)];
    shareToLabel.text = @"分享到";
    shareToLabel.textAlignment = NSTextAlignmentCenter;
    shareToLabel.font = [UIFont systemFontOfSize:13];
    shareToLabel.textColor = [UIColor grayColor];
    [self.backGroundView addSubview:shareToLabel];

    
    
    scrollViewH = scrollViewW + imageTitleHeight + lineSpace;
    scrollView.frame = CGRectMake(0, scrollViewY, KScreenWidth, scrollViewH);
    [self.backGroundView addSubview:scrollView];
    scrollView.contentSize = CGSizeMake(20 + scrollViewW * 5, scrollViewH);
    
    for (int i = 0; i < self.platformsImageArray.count; i++) {
        scrollViewX = (i % 5) * scrollViewW + scrollMargin;
        UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(scrollViewX, 0, scrollViewW, scrollViewW)];
        shareButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [shareButton setImage:[UIImage imageNamed:self.platformsImageArray[i]] forState:UIControlStateNormal];
        
        shareButton.backgroundColor = [UIColor clearColor];
        shareButton.tag = [self.allImageTitleArray indexOfObject:(self.platformsImageArray[i])];
        [shareButton addTarget:self action:@selector(clickOnButtonWith:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(scrollViewX,shareButton.y + shareButton.height , scrollViewW, imageTitleHeight)];
        [lable1 setFont:[UIFont systemFontOfSize:11]];
        [lable1 setText:self.nameAndImageDic[self.platformsImageArray[i]]];
        [lable1 setTextAlignment:NSTextAlignmentCenter];
        [lable1 setTextColor:[UIColor grayColor]];
        
        [scrollView addSubview:lable1];
        [scrollView addSubview:shareButton];
    }
    
    for (int i = 0; i < self.functionsImageArray.count; i++) {
        scrollViewX = i * scrollViewW + scrollMargin;
        UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(scrollViewX, scrollViewY + scrollViewH, scrollViewW, scrollViewW)];
        shareButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        [shareButton setImage:[UIImage imageNamed:self.functionsImageArray[i]] forState:UIControlStateNormal];
        shareButton.backgroundColor = [UIColor clearColor];
        shareButton.tag = [self.allImageTitleArray indexOfObject:(self.functionsImageArray[i])];
        [shareButton addTarget:self action:@selector(clickOnButtonWith:) forControlEvents:UIControlEventTouchUpInside];
        [self.backGroundView addSubview:shareButton];
        
        UILabel *lable1 = [[UILabel alloc]initWithFrame:CGRectMake(scrollViewX,shareButton.y + shareButton.height, scrollViewW, imageTitleHeight)];
        [lable1 setFont:[UIFont systemFontOfSize:11]];
        [lable1 setText:self.nameAndImageDic[self.functionsImageArray[i]]];
        [lable1 setTextAlignment:NSTextAlignmentCenter];
        [lable1 setTextColor:[UIColor grayColor]];
        [self.backGroundView addSubview:lable1];
    }
    
    UILabel *seperateLine = [[UILabel alloc] initWithFrame:CGRectMake(0, scrollView.height - 12, scrollView.contentSize.width, 0.5)];
    seperateLine.backgroundColor = [UIColor colorWithHexString:@"#C4C4C4"];
    [scrollView addSubview:seperateLine];
    
    
    //高度为 行数(imageArray.count / 5 + 1) * 高度(scrollViewH) + 20 + 取消按钮的高度 K_RealHeight1(100)
    self.LXActionSheetHeight = 2 * scrollViewH + 20 + K_RealHeight1(100);
    
    
    //0.048     0.904    0.048
    UIButton *cancelButton = [[UIButton alloc] initWithFrame:CGRectMake(0, self.LXActionSheetHeight -K_RealHeight1(100), KScreenWidth, K_RealHeight1(100))];
    cancelButton.layer.masksToBounds = YES;
    cancelButton.layer.borderWidth = 0.5f;
    cancelButton.layer.borderColor = [UIColor colorWithRed:189.0f/255.0f green:189.0f/255.0f blue:189.0f/255.0f alpha:1].CGColor;
    cancelButton.backgroundColor = [UIColor whiteColor];
    [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelButton setTitleColor:C_black01Color forState:UIControlStateNormal];
    cancelButton.titleLabel.font = [UIFont systemFontOfSize:16];
    cancelButton.tag = 100;
    [cancelButton addTarget:self action:@selector(clickOnButtonWith:) forControlEvents:UIControlEventTouchUpInside];
    [self.backGroundView addSubview:cancelButton];
    
    [UIView animateWithDuration:0.25f animations:^{
        [self.backGroundView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height-self.LXActionSheetHeight, [UIScreen mainScreen].bounds.size.width, self.LXActionSheetHeight)];
    } completion:^(BOOL finished) {
    }];

}
- (void)clickOnButtonWith:(UIButton *)button
{
    NSLog(@"btn.tag == %ld",(long)button.tag);
    WEAK_SELF;
    switch (button.tag) {
        case MyLXActionSheetType_OnMenuSaveSnap:
        {
            [self clickLongSnapView:button callback:^{
                STRONG_SELF;
                if ([self.delegate respondsToSelector:@selector(didClickLongSnapView)]) {
                    [self.delegate didClickLongSnapView];
                };
            }];
        }
            return;
        case MyLXActionSheetType_OnlineService:
            [self OnLineServiceCalled:self.shareModel];
            return;
        case MyLXActionSheetType_WeixiSession:
            [self ShareToWeixiSession:self.shareModel];
            break;
        case MyLXActionSheetType_WeixiTimeline:
            [self ShareToWeixiTimeline:self.shareModel];
            break;
        case MyLXActionSheetType_QQFriends:
            [self ShareToQQFriends];
            break;
        case MyLXActionSheetType_QQSpace:
            [self ShareToQQSpace];
            break;
        case MyLXActionSheetType_SinaWeibo:
            [self ShareToSinaWeibo];
            break;
        case MyLXActionSheetType_SaveSnap:
            [self longSnapView];
            return;
        case MyLXActionSheetType_CopyUrl:
            [self copyUrl];
            break;
        case MyLXActionSheetType_Refresh:
        if ([self.delegate respondsToSelector:@selector(didClickRefreshButton)]) {
            [self.delegate didClickRefreshButton];
        }
            break;
        case MyLXActionSheetType_Favor:
        if ([self.delegate respondsToSelector:@selector(didClickFavorNewsButton)]) {
            [self.delegate didClickFavorNewsButton];
        }
            break;
        case MyLXActionSheetType_QRCode:
            if ([self.delegate respondsToSelector:@selector(didClickQRCodeButton)]) {
                [self.delegate didClickQRCodeButton];
            }
            break;
            
        default:
            break;
    }
    [self.normalOne setHidden:YES];
    [self.originWindow makeKeyWindow];
    [self tappedCancel];
}
- (void)tappedCancel  //界面消失
{
    if ([HBPromptCustomHUD HUDForView:self]) {
        return;
    }
    if ([self.delegate respondsToSelector:@selector(didClickBackgroundView)]) {
        [self.delegate didClickBackgroundView];
    }
    [UIView animateWithDuration:0.25f animations:^{
        [self.backGroundView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
    }];
}
/**长截图*/
- (void)longSnapView{
    WEAK_SELF;
    [self hiddenShareView:^{
        STRONG_SELF;
        if ([self.delegate respondsToSelector:@selector(didClickSaveSnapButton)]) {
            [self.delegate didClickSaveSnapButton];
        }
    }];
}
- (void)hiddenShareView:(void(^)())callback{
    [self.normalOne setHidden:YES];
    [self.originWindow makeKeyWindow];
    [UIView animateWithDuration:0.25f animations:^{
        [self.backGroundView setFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 0)];
        self.alpha = 0;
    } completion:^(BOOL finished) {
        if (finished) {
            [self removeFromSuperview];
        }
        if (callback) {
            callback();
        }
    }];
}
/**长截图保存到相册*/
- (void)clickLongSnapView:(UIButton *)btn callback:(void(^)())callback{
    WEAK_SELF;
    btn.userInteractionEnabled =NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        btn.userInteractionEnabled =YES;
    });
    if (self.onMenuSaveSnap.imageData) {
        UIImage *snapImage = [UIImage imageWithData:self.onMenuSaveSnap.imageData];
        [HBPhotoTool loadImageFinished:snapImage callback:^(BOOL success, NSError * _Nullable error) {
            NSLog(@"保存结果%@",error);
            STRONG_SELF;
            if(success){
                HBPromptProgressModel *progressModel =[[HBPromptProgressModel alloc] init];
                progressModel.hudW =[NSNumber numberWithFloat:120.f];
                progressModel.hudH =[NSNumber numberWithFloat:120.f];
                progressModel.loadIamgeH =[NSNumber numberWithFloat:50.f];
                progressModel.loadIamgeW =[NSNumber numberWithFloat:50.f];
                progressModel.message=@"已保存至相册";
                progressModel.showLoadAnimation =[NSNumber numberWithBool:NO];
                progressModel.loadingImage =[UIImage imageNamed:@"alert_success"];
                progressModel.alphaValue =[NSNumber numberWithFloat:0];
                [HBPromptCustomHUD showTo:self progressModel:progressModel];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [HBPromptCustomHUD hidebyView:self animation:YES];
                    [self hiddenShareView:nil];
                    if (callback) {
                        callback();
                    }
                });
            }
        }];
    }
}
-(void)OnLineServiceCalled:(HBShareSDKModel *)model //在线客服
{
    [HBUMobClick help_IM];
    [HBCustomerServiceManager showCustomerService];
}

-(void)ShareToWeixiSession:(HBShareSDKModel *)model //微信好友
{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];

    if (self.onMenuShareWeChat.imageData) {
        UIImage *image = [UIImage imageWithData:self.onMenuShareWeChat.imageData];

        [self WeChatShareImaegParamsct:shareParams forPlatformSubType:SSDKPlatformSubTypeWechatSession image:image];
    }else{

        if (self.onMenuShareWeChat.image) {
            [shareParams SSDKSetupShareParamsByText:self.onMenuShareWeChat.des
                                             images:self.onMenuShareWeChat.image
                                                url:[NSURL URLWithString:self.onMenuShareWeChat.clickUrl]
                                              title:self.onMenuShareWeChat.title
                                               type:SSDKContentTypeAuto];
        }else{
            [shareParams SSDKSetupShareParamsByText: self.onMenuShareWeChat.des
                                             images:self.onMenuShareWeChat.imageUrl
                                                url:[NSURL URLWithString:self.onMenuShareWeChat.clickUrl]
                                              title:self.onMenuShareWeChat.title
                                               type:SSDKContentTypeAuto];
        }
    }
    [ShareSDK share:SSDKPlatformSubTypeWechatSession parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        if (state == SSDKResponseStateSuccess)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeSuccess platformType:HBPlatformSubTypeWechatSession];
            }
            [HBPromptAlertView alertMessage:@"分享成功"];
            
        }
        else if (state == SSDKResponseStateFail)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeFail platformType:HBPlatformSubTypeWechatSession];
            }
            NSString *desc = [error description];
            if(nil != desc && [desc isEqualToString:@"尚未安装微信"]){
                [HBPromptAlertView alertMessage:@"尚未安装微信"];
            }else{
                [HBPromptAlertView alertMessage:error.userInfo[@"error_message"]];
                
            }
            
        }else if (state == SSDKResponseStateCancel)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeCancel platformType:HBPlatformSubTypeWechatSession];
            }

        }

        
    }];
}
-(void)ShareToWeixiTimeline:(HBShareSDKModel *)model //微信朋友圈
{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];

    if (self.onMenuShareWeChatMoments.imageData) {
        UIImage *image = [UIImage imageWithData:self.onMenuShareWeChatMoments.imageData];

        [self WeChatShareImaegParamsct:shareParams forPlatformSubType:SSDKPlatformSubTypeWechatTimeline image:image];
    }else{
        NSString *titleStr = [NSString stringWithFormat:@"%@",self.onMenuShareWeChatMoments.title];
        [shareParams SSDKSetupShareParamsByText:self.onMenuShareWeChatMoments.des
                                         images:self.onMenuShareWeChatMoments.imageUrl
                                            url:[NSURL URLWithString:self.onMenuShareWeChatMoments.clickUrl]
                                          title:titleStr
                                           type:SSDKContentTypeAuto];
    }

    [ShareSDK share:SSDKPlatformSubTypeWechatTimeline parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        if (state == SSDKResponseStateSuccess){
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeSuccess platformType:HBPlatformSubTypeWechatTimeline];
            }
            [HBPromptAlertView alertMessage:@"分享成功"];
            
        }
        else if (state == SSDKResponseStateFail)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeFail platformType:HBPlatformSubTypeWechatTimeline];
            }
            NSString *desc = [error description];
            if(nil != desc && [desc isEqualToString:@"尚未安装微信"]){
                [HBPromptAlertView alertMessage:@"尚未安装微信"];
            }else{
                [HBPromptAlertView alertMessage:@"分享失败"];
                
            }
        }else if (state == SSDKResponseStateCancel)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeCancel platformType:HBPlatformSubTypeWechatTimeline];
            }
        }
        
    }];
    
}
-(void)ShareToQQFriends{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];

    if (self.onMenuShareQQ.imageData) {
        UIImage *dataImage = [UIImage imageWithData:self.onMenuShareQQ.imageData];
        [self QQShareImaegParamsct:shareParams forPlatformSubType:SSDKPlatformSubTypeQQFriend image:dataImage];

    }else{

        if (self.onMenuShareQQ.image) {
            [shareParams SSDKSetupShareParamsByText: self.onMenuShareQQ.des
                                             images:self.onMenuShareQQ.image
                                                url:[NSURL URLWithString:self.onMenuShareQQ.clickUrl]
                                              title:self.onMenuShareQQ.title
                                               type:SSDKContentTypeAuto];
        }else{
            [shareParams SSDKSetupShareParamsByText: self.onMenuShareQQ.des
                                             images:self.onMenuShareQQ.imageUrl
                                                url:[NSURL URLWithString:self.onMenuShareQQ.clickUrl]
                                              title:self.onMenuShareQQ.title
                                               type:SSDKContentTypeAuto];
        }
    }

    [ShareSDK share:SSDKPlatformSubTypeQQFriend parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        if (state == SSDKResponseStateSuccess)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeSuccess platformType:HBPlatformSubTypeQQFriend];
            }
            [HBPromptAlertView alertMessage:@"分享成功"];
            
        }
        else if (state == SSDKResponseStateFail)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeFail platformType:HBPlatformSubTypeQQFriend];
            }
            NSString *desc = [error description];
            if(nil != desc){
                [HBPromptAlertView alertMessage:desc];
            }else{
                [HBPromptAlertView alertMessage:@"分享失败"];
                
            }
        }else if (state == SSDKResponseStateCancel)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeCancel platformType:HBPlatformSubTypeQQFriend];
            }

        }
        
    }];
    
}
-(void)ShareToQQSpace
{
    NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];

    if (self.onMenuShareQZone.imageData){
        UIImage *image = [UIImage imageWithData:self.onMenuShareQZone.imageData];
        [self QQShareImaegParamsct:shareParams forPlatformSubType:SSDKPlatformSubTypeQZone image:image];
    }else{

        if (self.onMenuShareQZone.image) {
            [shareParams SSDKSetupShareParamsByText: self.onMenuShareQZone.des
                                             images:self.onMenuShareQZone.image
                                                url:[NSURL URLWithString:self.onMenuShareQZone.clickUrl]
                                              title:self.onMenuShareQZone.title
                                               type:SSDKContentTypeAuto];
        }else{
            [shareParams SSDKSetupShareParamsByText: self.onMenuShareQZone.des
                                             images:self.onMenuShareQZone.imageUrl
                                                url:[NSURL URLWithString:self.onMenuShareQZone.clickUrl]
                                              title:self.onMenuShareQZone.title
                                               type:SSDKContentTypeAuto];
        }
    }


    [ShareSDK share:SSDKPlatformSubTypeQZone parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
        if (state == SSDKResponseStateSuccess)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeSuccess platformType:HBPlatformSubTypeQZone];
            }
            [HBPromptAlertView alertMessage:@"分享成功"];
            
        }
        else if (state == SSDKResponseStateFail)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeFail platformType:HBPlatformSubTypeQZone];
            }
            NSString *desc = [error description];
            if(nil != desc){
                [HBPromptAlertView alertMessage:desc];
            }else{
                [HBPromptAlertView alertMessage:@"分享失败"];
                
            }
        }else if (state == SSDKResponseStateCancel)
        {
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeCancel platformType:HBPlatformSubTypeQZone];
            }
        }
        
    }];
}
-(void)ShareToSinaWeibo
{

    if (self.onMenuShareWeibo.image) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];

        [shareParams SSDKEnableUseClientShare];

        [shareParams SSDKSetupShareParamsByText:[NSString stringWithFormat:@"%@ %@",self.onMenuShareWeibo.des,self.onMenuShareWeibo.image]
                                             images:@[self.onMenuShareWeibo.image]
                                                url:[NSURL URLWithString:self.onMenuShareWeibo.clickUrl]
                                              title:self.onMenuShareWeibo.title
                                               type:SSDKContentTypeAuto];
        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            if (state == SSDKResponseStateSuccess)
            {
                if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                    [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeSuccess platformType:HBPlatformTypeSinaWeibo];
                }
                [HBPromptAlertView alertMessage:@"分享成功"];
                
            }
            else if (state == SSDKResponseStateFail)
            {
                if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                    [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeFail platformType:HBPlatformTypeSinaWeibo];
                }
                NSLog(@"error = %@",error);
                [HBPromptAlertView alertMessage:@"分享失败"];

            }else if (state == SSDKResponseStateCancel)
            {
                if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                    [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeCancel platformType:HBPlatformTypeSinaWeibo];
                }
                
            }
        }];
        return;
        
    }
    
    if (self.onMenuShareWeibo.imageData) {
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        [shareParams SSDKEnableUseClientShare];
        UIImage *image = [UIImage imageWithData:self.onMenuShareWeibo.imageData];

        [self SinaShareImaegParamsct:shareParams forPlatformSubType:SSDKPlatformTypeSinaWeibo image:image];
        [shareParams SSDKEnableUseClientShare];

        [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            if (state == SSDKResponseStateSuccess)
            {
                if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                    [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeSuccess platformType:HBPlatformTypeSinaWeibo];
                }
                [HBPromptAlertView alertMessage:@"分享成功"];
                
            }
            else if (state == SSDKResponseStateFail)
            {
                if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                    [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeFail platformType:HBPlatformTypeSinaWeibo];
                }
                NSLog(@"error = %@",error);
//                NSString *desc = [error description];
//                if(nil != desc){
//                    [HBPromptAlertView alertMessage:desc];
//                }else{
//                    [HBPromptAlertView alertMessage:@"分享失败"];
//                    
//                }
                [HBPromptAlertView alertMessage:@"分享失败"];

            }else if (state == SSDKResponseStateCancel)
            {
                if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                    [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeCancel platformType:HBPlatformTypeSinaWeibo];
                }
            }
        }];

        return;
    }
    
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:[NSURL URLWithString:self.onMenuShareWeibo.imageUrl] options:SDWebImageDownloaderUseNSURLCache progress:nil completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
        if (error) {
            NSLog(@"error = %@",error);
            if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeFail platformType:HBPlatformTypeSinaWeibo];
            }
            [HBPromptAlertView alertMessage:@"分享失败"];
        }
        else{
            NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
            [shareParams SSDKSetupShareParamsByText:[NSString stringWithFormat:@"%@ %@",self.onMenuShareWeibo.des,self.onMenuShareWeibo.clickUrl]
                                             images:@[image]
                                                url:[NSURL URLWithString:self.onMenuShareWeibo.clickUrl]
                                              title:self.onMenuShareWeibo.title
                                               type:SSDKContentTypeAuto];
            [shareParams SSDKEnableUseClientShare];

            [ShareSDK share:SSDKPlatformTypeSinaWeibo parameters:shareParams onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
                if (state == SSDKResponseStateSuccess)
                {
                    if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                        [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeSuccess platformType:HBPlatformTypeSinaWeibo];
                    }
                    [HBPromptAlertView alertMessage:@"分享成功"];
                    
                }
                else if (state == SSDKResponseStateFail)
                {
                    if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                        [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeFail platformType:HBPlatformTypeSinaWeibo];
                    }
                    NSLog(@"error = %@",error);
//                    NSString *desc = [error description];
//                    if(nil != desc){
//                        [HBPromptAlertView alertMessage:desc];
//                    }else{
//                        [HBPromptAlertView alertMessage:@"分享失败"];
//                        
//                    }
                    [HBPromptAlertView alertMessage:@"分享失败"];

                }else if (state == SSDKResponseStateCancel)
                {
                    if ([self.delegate respondsToSelector:@selector(didFinishShareWithResult:platformType:)]) {
                        [self.delegate didFinishShareWithResult:HBDynamicShareWithResultTypeCancel platformType:HBPlatformTypeSinaWeibo];
                    }
                    
                }
            }];
        }
    }];
    
}

-(void)copyUrl{
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    if (self.platforms.count) {
        if (self.onMenuShareWeChat) {
            [pasteboard setString:self.onMenuShareWeChat.clickUrl];
        }else if (self.onMenuShareWeChatMoments){
            [pasteboard setString:self.onMenuShareWeChatMoments.clickUrl];
        }else if (self.onMenuShareQQ){
            [pasteboard setString:self.onMenuShareQQ.clickUrl];
        }else if (self.onMenuShareQZone){
            [pasteboard setString:self.onMenuShareQZone.clickUrl];
        }else if (self.onMenuShareWeibo){
            [pasteboard setString:self.onMenuShareWeibo.clickUrl];
        }
    }else{
        [pasteboard setString:@"https://m.touker.com/stock/download"];
    }
    [HBPromptAlertView alertMessage:@"已复制链接"];
}
#pragma mark -lazy load
-(NSArray<NSString *> *)allImageTitleArray{
    if (!_allImageTitleArray) {
        _allImageTitleArray = [NSArray arrayWithObjects:@"onMenuSaveSnap",@"onMenuShareonlineService",@"onMenuShareWeChatMoments",@"onMenuShareWeChat",@"onMenuShareQQ",@"onMenuShareQZone",@"onMenuShareWeibo",@"onMenuShareLongPic",@"onMenuCopyUrl",@"onMenuRefresh",@"onMenuFavor",@"onMenuGenerateQRCode", nil];
        
    }
    return _allImageTitleArray;
}
-(NSArray<NSString *> *)platformsImageArray{
    if (!_platformsImageArray) {
        _platformsImageArray = [NSArray arrayWithObjects:@"onMenuSaveSnap",@"onMenuShareonlineService",@"onMenuShareWeChatMoments",@"onMenuShareWeChat",@"onMenuShareQQ",@"onMenuShareQZone",@"onMenuShareWeibo", nil];
        
    }
    return _platformsImageArray;
}
-(NSArray<NSString *> *)functionsImageArray{
    if (!_functionsImageArray) {
        _functionsImageArray = [NSArray arrayWithObjects:@"onMenuShareLongPic",@"onMenuCopyUrl",@"onMenuRefresh",@"onMenuFavor", nil];
        
    }
    return _functionsImageArray;
}
-(NSDictionary *)nameAndImageDic{
    if (!_nameAndImageDic) {
        _nameAndImageDic = @{@"onMenuSaveSnap":@"保存至相册",@"onMenuShareonlineService":@"在线客服",@"onMenuShareWeChatMoments":@"微信朋友圈",@"onMenuShareWeChat":@"微信好友",@"onMenuShareQQ":@"QQ好友",@"onMenuShareQZone":@"QQ空间",@"onMenuShareWeibo":@"新浪微博",@"onMenuShareLongPic":@"分享长图",@"onMenuCopyUrl":@"复制链接",@"onMenuRefresh":@"刷新",@"onMenuFavor":@"收藏",@"onMenuGenerateQRCode":@"生成二维码"};
    }
    return _nameAndImageDic;
}
-(NSMutableDictionary *)shareParams{
    if (!_shareParams) {
        _shareParams = [NSMutableDictionary dictionary];
        if (self.shareModel.imageName) {
            [_shareParams SSDKSetupShareParamsByText: self.shareModel.detail
                                              images:self.shareModel.imageName
                                                 url:[NSURL URLWithString:self.shareModel.url]
                                               title:self.shareModel.title
                                                type:SSDKContentTypeAuto];
        }else{
            [_shareParams SSDKSetupShareParamsByText: self.shareModel.detail
                                              images:self.shareModel.imageUrl
                                                 url:[NSURL URLWithString:self.shareModel.url]
                                               title:self.shareModel.title
                                                type:SSDKContentTypeAuto];
        }
        
    }
    return _shareParams;
}

-(void)WeChatShareImaegParamsct:(NSMutableDictionary *)shareParams forPlatformSubType:(SSDKPlatformType)platformSubType image:(id)image{

    if (image) {
        [shareParams SSDKSetupWeChatParamsByText:@"华宝智投" title:@"华宝智投" url:nil thumbImage:nil image:image musicFileURL:nil extInfo:nil fileData:nil emoticonData:nil sourceFileExtension:nil sourceFileData:nil type:SSDKContentTypeImage forPlatformSubType:platformSubType];
        //微信新接口
//        [shareParams SSDKSetupWeChatParamsByText:<#(NSString *)#> title:<#(NSString *)#> url:<#(NSURL *)#> thumbImage:<#(id)#> image:<#(id)#> musicFileURL:<#(NSURL *)#> extInfo:<#(NSString *)#> fileData:<#(id)#> emoticonData:<#(id)#> sourceFileExtension:<#(NSString *)#> sourceFileData:<#(id)#> type:<#(SSDKContentType)#> forPlatformSubType:<#(SSDKPlatformType)#>]
//    [shareParams SSDKSetupWeChatParamsByText:@"华宝智投" title:@"华宝智投" url:nil thumbImage:nil image:image musicFileURL:nil extInfo:nil fileData:nil emoticonData:nil type:SSDKContentTypeImage forPlatformSubType:platformSubType];

    }

}

-(void)QQShareImaegParamsct:(NSMutableDictionary *)shareParams forPlatformSubType:(SSDKPlatformType)platformSubType image:(id)image{

    if (image) {
        [shareParams SSDKSetupQQParamsByText:@"华宝智投" title:@"华宝智投" url:nil thumbImage:nil image:image type:SSDKContentTypeImage forPlatformSubType:platformSubType];
    }
}

-(void)SinaShareImaegParamsct:(NSMutableDictionary *)shareParams forPlatformSubType:(SSDKPlatformType)platformSubType image:(id)image{

    if (image) {
        [shareParams SSDKSetupSinaWeiboShareParamsByText:@"华宝智投" title:@"华宝智投" images:image video:nil url:nil latitude:0 longitude:0 objectID:nil isShareToStory:NO type:SSDKContentTypeImage];
//        [shareParams SSDKSetupSinaWeiboShareParamsByText:@"华宝智投" title:@"华宝智投" image:image url:nil latitude:0 longitude:0 objectID:nil type:SSDKContentTypeImage];
    }
}
-(UINavigationController *)theTopviewControler{

   return [HBAppLaunch sharedInstance].mainTabBarViewController.selectedViewController.navigationController;

}

+ (NSString *)platformDescribeWithPlatformType:(HBSharePlatformType)platformType {
    switch (platformType) {
        case HBPlatformTypeSinaWeibo:
            return @"Weibo";
        case HBPlatformSubTypeWechatSession:
            return @"WeChat";
        case HBPlatformSubTypeQZone:
            return @"QZone";
        case HBPlatformSubTypeQQFriend:
            return @"QQ";
        case HBPlatformSubTypeWechatTimeline:
            return @"WeChatMoments";
        default:
            return nil;
    }
}

@end
