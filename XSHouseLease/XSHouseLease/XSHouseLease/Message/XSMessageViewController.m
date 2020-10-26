//
//  XSMessageViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/16.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSMessageViewController.h"
//#import "YBModelFile.h"
#import "TUIConversationListController.h"
#import "TUIChatController.h"
#import "XSTUIChatController.h"


@interface XSMessageViewController ()<HXPhotoViewDelegate,HXPhotoEditViewControllerDelegate,HXCustomNavigationControllerDelegate,TUIConversationListControllerDelegagte>
@property (strong, nonatomic) HXPhotoManager *manager;

@property (strong, nonatomic)  UIImageView *imageview;

@property (strong, nonatomic) HXPhotoModel *model;

@property (strong, nonatomic) TUIConversationListController *imVc;
@end

@implementation XSMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor redColor];
    self.title  =@"消息";
//   [self loadIM];

}
- (void)viewWillLayoutSubviews{
    self.imVc.view.frame = self.view.bounds;

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadIM];
}

- (void)loadIM{
    if ([XSUserServer sharedInstance].isLogin) {
         if (self.imVc == nil) {
              self.imVc = [[TUIConversationListController alloc] init];
              self.imVc.delegate = self;
              self.imVc.view.frame = self.view.bounds;
             [self.view addSubview:self.imVc.view];
         }

     }else{
         [self.imVc.view removeFromSuperview];
          self.imVc = nil;
     }
     [self.imVc.tableView reloadData];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    TUIConversationListController *vc = [[TUIConversationListController alloc] init];
//    vc.delegate = self;
//    [self.navigationController pushViewController:vc animated:YES];
    
//    TIMConversation *conv = [[TIMManager sharedInstance] getConversation:TIM_C2C receiver:@"abc"];
//    TUIChatController *vc = [[TUIChatController alloc] initWithConversation:conv];
//    [self.navigationController pushViewController:vc animated:YES];

//    if (self.model) {
//         HXPhotoEditViewController *vc = [[HXPhotoEditViewController alloc] init];
//         vc.isInside = YES;
//         vc.delegate = self;
//         vc.manager = self.manager;
//         vc.model = self.model;
//         vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
//         vc.modalPresentationCapturesStatusBarAppearance = YES;
//         [self presentViewController:vc animated:YES completion:nil];
//    }else{
//        HXCustomNavigationController *nav = [[HXCustomNavigationController alloc] initWithManager:self.manager delegate:self];
//        nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
//        nav.modalPresentationCapturesStatusBarAppearance = YES;
//        [self presentViewController:nav animated:YES completion:nil];
//    }

    if (![XSUserServer sharedInstance].isLogin) {
        [XSUserServer needLoginSuccess:nil cancel:nil];
    }

    
}
- (void)conversationListController:(TUIConversationListController *)conversationController didSelectConversation:(TUIConversationCell *)conversation{
    XSTUIChatController *message = [[XSTUIChatController alloc]init];
    message.conversationId = conversation.convData.convId;
    message.title = conversation.convData.title;

//    TIMConversation *conv = [[TIMManager sharedInstance] getConversation:TIM_C2C receiver: conversation.convData.convId];
//    TUIChatController *vc = [[TUIChatController alloc] initWithConversation:conv];
//    vc.title = conversation.convData.title;
    [self.navigationController pushViewController:message animated:YES];
}

- (void)photoNavigationViewController:(HXCustomNavigationController *)photoNavigationViewController didDoneAllList:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photoList videos:(NSArray<HXPhotoModel *> *)videoList original:(BOOL)original{
    HXPhotoModel *model  = photoList.lastObject;
    self.model = photoList.lastObject;
}

- (void)photoEditViewControllerDidClipClick:(HXPhotoEditViewController *)photoEditViewController beforeModel:(HXPhotoModel *)beforeModel afterModel:(HXPhotoModel *)afterModel{
    
    self.imageview.image = afterModel.previewPhoto;

}




- (HXPhotoManager *)manager {
    if (!_manager) {
        _manager = [[HXPhotoManager alloc] initWithType:HXPhotoManagerSelectedTypePhoto];
        _manager.configuration.themeColor = [UIColor orangeColor]; // 主题颜色  默认 tintColor

        _manager.configuration.maxNum = 1;
        _manager.configuration.photoMaxNum = 1;
        _manager.configuration.videoMaxNum = 0;
        
        _manager.configuration.photoCanEdit = YES;///  照片是否可以编辑   default YES
        _manager.configuration.limitPhotoSize = 111; // 限制照片的大小 单位：b 字节 默认 0字节 不限制
        _manager.configuration.clarityScale = [UIScreen mainScreen].bounds.size.width;  //小图照片清晰度 越大越清晰、越消耗性能
        _manager.configuration.selectPhotoLimitSize = NO; // 选择照片时是否限制照片大小
        _manager.configuration.movableCropBox = YES;
        _manager.configuration.movableCropBoxEditSize = NO;

        
        
        
        _manager.configuration.openCamera = YES;  //是否打开相机功能
        _manager.configuration.photoStyle = HXPhotoStyleDefault; // 相册风格
        _manager.configuration.albumShowMode = HXPhotoAlbumShowModeDefault; // 相册风格
        _manager.configuration.editAssetSaveSystemAblum = NO; /// 编辑后的照片/视频是否添加到系统相册中
        _manager.configuration.saveSystemAblum = NO; //拍摄的 照片/视频 是否保存到系统相册  默认NO
        
        
        _manager.configuration.hideOriginalBtn = YES;  //是否隐藏原图按钮  默认 NO
        _manager.configuration.showOriginalBytes = YES; // 原图按钮显示已选照片的大小
        _manager.configuration.originalNormalImageName = nil;  //原图按钮普通状态下的按钮图标名
        _manager.configuration.originalSelectedImageName = nil;  //原图按钮选中状态下的按钮图标名

        _manager.configuration.showOriginalBytesLoading = YES; // 原图按钮显示已选照片大小时是否显示加载菊花
        _manager.configuration.requestImageAfterFinishingSelection = YES; /// 在照片列表选择照片完后点击完成时是否请求图片和视频地址
        _manager.configuration.selectTogether = NO;  // 图片和视频是否能够同时选择 默认 NO
        _manager.configuration.lookGifPhoto = NO;  //是否开启查看GIF图片功能 - 默认开启
       _manager.configuration.cameraCellShowPreview = NO;  //相机cell是否显示预览
        _manager.configuration.downloadICloudAsset = YES; //下载iCloud上的资源  默认YES



        _manager.configuration.bottomViewTranslucent = NO; // 底部视图是否半透明效果 默认YES
    }
    return _manager;
}


@end

