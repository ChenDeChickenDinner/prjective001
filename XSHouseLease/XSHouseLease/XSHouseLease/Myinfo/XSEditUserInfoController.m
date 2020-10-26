//
//  XSEditUserInfoController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/23.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSEditUserInfoController.h"

@interface XSEditUserInfoController ()<HXPhotoViewDelegate,HXPhotoEditViewControllerDelegate,HXCustomNavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *heardImage;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) HXPhotoManager *manager;

@end

@implementation XSEditUserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的个人信息";

    [self loadData];
}

- (void)loadData{
    self.name.text  = [XSUserServer sharedInstance].userModel.nickName;
     [self.heardImage sd_setImageWithURL:[NSURL URLWithString:[XSUserServer sharedInstance].userModel.icon] placeholderImage:[UIImage imageNamed:@"userIcon"]];
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.heardImage.layer.masksToBounds = YES;
    self.heardImage.layer.cornerRadius = self.heardImage.bounds.size.height/2;
    self.heardImage.layer.borderWidth = 3.0;
    self.heardImage.layer.borderColor = [UIColor whiteColor].CGColor;
}
- (IBAction)logout:(id)sender {
    
    WEAK_SELF;
    UIAlertController *arl =  [UIAlertController alertControllerWithTitle:@"确定退出" message:@"确定退出当前账号吗？" preferredStyle:UIAlertControllerStyleAlert];
      UIAlertAction *can = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
          
      }];
      UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
          STRONG_SELF;
            [XSUserServer exitLogin];
            [self.navigationController popToRootViewControllerAnimated:YES];
       }];
      [arl addAction:can];
      [arl addAction:ok];

      [self presentViewController:arl animated:YES completion:^{
          
      }];
      
}
- (IBAction)imageChange:(id)sender {
    
    HXCustomNavigationController *nav = [[HXCustomNavigationController alloc] initWithManager:self.manager delegate:self];
    nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
    nav.modalPresentationCapturesStatusBarAppearance = YES;
    [self presentViewController:nav animated:YES completion:nil];
        
}
- (void)photoNavigationViewController:(HXCustomNavigationController *)photoNavigationViewController didDoneAllList:(NSArray<HXPhotoModel *> *)allList photos:(NSArray<HXPhotoModel *> *)photoList videos:(NSArray<HXPhotoModel *> *)videoList original:(BOOL)original{
    HXPhotoModel *model  = photoList.lastObject;
    
    HXPhotoEditViewController *vc = [[HXPhotoEditViewController alloc] init];
    vc.isInside = YES;
    vc.delegate = self;
    vc.manager = self.manager;
    vc.model = model;
    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    vc.modalPresentationCapturesStatusBarAppearance = YES;
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)photoEditViewControllerDidClipClick:(HXPhotoEditViewController *)photoEditViewController beforeModel:(HXPhotoModel *)beforeModel afterModel:(HXPhotoModel *)afterModel{
    WEAK_SELF;

    [afterModel requestImageURLStartRequestICloud:nil progressHandler:nil success:^(NSURL * _Nullable imageURL, HXPhotoModel * _Nullable model, NSDictionary * _Nullable info) {
        STRONG_SELF;
         [MBProgressHUD showHUDAddedTo:self.view animated:YES];
          [self.subInfoInterface uploadImage:[UIImage imageNamed:@""] imageUrl:imageURL callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
              [MBProgressHUD  hideHUDForView:self.view animated:YES];

                 if (error == nil && responseModel.code.integerValue == SuccessCode) {
//                     [ProgressHUD showSuccess:@"上传成功"];
                     [XSUserServer sharedInstance].userModel.icon = responseModel.data;
                     [self savecustome];
                 }else{
                     [ProgressHUD showError:@"请重新选择图片"];
                     self.manager = nil;
                 }

          }];

     } failed:^(NSDictionary * _Nullable info, HXPhotoModel * _Nullable model) {
         STRONG_SELF;
         self.manager = nil;
         [ProgressHUD showError:@"请重新选择图片"];
     }];
    
    

}

- (IBAction)nameChange:(id)sender {
    WEAK_SELF;

   UIAlertController *arl =  [UIAlertController alertControllerWithTitle:@"修改昵称" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [arl addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"请输入昵称";
    }];
    
    UIAlertAction *can = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        STRONG_SELF;
        [XSUserServer sharedInstance].userModel.nickName = arl.textFields.lastObject.text;
        [self savecustome];
        NSLog(@"%@",arl.textFields.lastObject.text);
     }];
    [arl addAction:can];
    [arl addAction:ok];

    [self presentViewController:arl animated:YES completion:^{
        
    }];
}
- (void)savecustome{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict safeSetObject:[XSUserServer sharedInstance].userModel.ID forKey:@"id"];
    [dict safeSetObject:[XSUserServer sharedInstance].userModel.nickName forKey:@"nickName"];
    [dict safeSetObject:[XSUserServer sharedInstance].userModel.icon forKey:@"icon"];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    WEAK_SELF;
    [self.subInfoInterface savecustome:dict callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
//        STRONG_SELF;
        
        [MBProgressHUD  hideHUDForView:weakSelf.view animated:YES];
        if (error == nil && responseModel.code.integerValue == SuccessCode) {
            [ProgressHUD showSuccess:@"更新成功"];
            [self loadData];
            [XSUserServer sharedInstance].userModel = [XSUserServer sharedInstance].userModel;
        }else{
            [ProgressHUD showSuccess:@"更新失败请重试"];
        }
    }];
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
        _manager.configuration.editAssetSaveSystemAblum = YES; /// 编辑后的照片/视频是否添加到系统相册中
        _manager.configuration.saveSystemAblum = YES; //拍摄的 照片/视频 是否保存到系统相册  默认NO
        
        
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
