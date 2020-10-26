//
//  XSIMageCollectionViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/24.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSIMageCollectionViewController.h"

@interface XSIMageCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,HXPhotoViewDelegate,HXPhotoEditViewControllerDelegate,HXCustomNavigationControllerDelegate>
@property (strong, nonatomic) UICollectionView *collectionView ;
@property (strong, nonatomic) HXPhotoManager *manager;

@end

@implementation XSIMageCollectionViewController
- (NSMutableArray<XSIMageCollectionViewCellModel *> *)array{
    if (!_array) {
        _array  = [NSMutableArray array];
    }
    return _array;
}
- (void)setInfoModel:(XSHouseInfoShowModel *)infoModel{
    if (self.loadType == XSHouseImageLoadType_Imags) {
        if (infoModel.firstImg) {
            XSIMageCollectionViewCellModel *first = [[XSIMageCollectionViewCellModel alloc]init];
            first.sele = YES;
            first.icon = infoModel.firstImg;
            [self.array addObject:first];
        }

        for (NSString *imgUrlStr in infoModel.contentImg) {
            if ([imgUrlStr containsString:@"http"]) {
                XSIMageCollectionViewCellModel *model = [[XSIMageCollectionViewCellModel alloc]init];
                 model.icon = imgUrlStr;
                [self.array addObject:model];
            }
        }
    }else{
        XSIMageCollectionViewCellModel *first = [[XSIMageCollectionViewCellModel alloc]init];
         first.icon = infoModel.modelImg;
        first.notNeedfirstImage  =YES;
        if (infoModel.modelImg) {
            [self.array addObject:first];
        }
    }
    

}
-(void)dataBlack{
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    if (self.loadType == XSHouseImageLoadType_Imags) {
        NSMutableArray *array = [NSMutableArray array];
        for (XSIMageCollectionViewCellModel *model in self.array) {
            if (model.icon) {
                if (model.sele) {
                       [self.subDict safeSetObject:model.icon forKey:@"firstImg"];
                   }else{
                       [array safeAddObject:model.icon];
                   }
            }
        }
        if (array.count > 0) {
            [self.subDict safeSetObject:[NSArray arrayWithArray:array] forKey:@"contentImg"];

        }else{
            [self.subDict removeObjectForKey:@"contentImg"];
        }

    }else{
        XSIMageCollectionViewCellModel *model = self.array.firstObject;
        if (model.icon) {
            [self.subDict safeSetObject:model.icon forKey:@"modelImg"];
        }
    }
    NSLog(@"%@",self.subDict);
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake((KScreenWidth-50)/3, 110);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    
    XSIMageCollectionViewCellModel *add = [[XSIMageCollectionViewCellModel alloc]init];
    add.add = YES;
    [self.array addObject:add];

    for (XSIMageCollectionViewCellModel *model in self.array) {
        [self modelBlack:model];
    }
    
    [self dataBlack];
      self.collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
      self.collectionView.backgroundColor = XSColor(246, 245, 245);
      self.collectionView.delegate = self;
      self.collectionView.dataSource = self;
      self.collectionView.scrollsToTop = NO;
      self.collectionView.pagingEnabled = NO;
      self.collectionView.scrollEnabled = NO;
      self.collectionView.showsHorizontalScrollIndicator = NO;
      self.collectionView.bounces = NO;
      [self.collectionView registerNib: [UINib nibWithNibName:NSStringFromClass([XSIMageCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"XSIMageCollectionViewCell"];
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
}


- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.collectionView.frame = self.view.bounds;

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    XSIMageCollectionViewCellModel *dataModel = [self.array safeObjectAtIndex:indexPath.row];
    XSIMageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"XSIMageCollectionViewCell" forIndexPath:indexPath];
    cell.model = dataModel;
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    XSIMageCollectionViewCellModel *dataModel = [self.array safeObjectAtIndex:indexPath.row];
    if (dataModel.add) {
        if (self.loadType == XSHouseImageLoadType_Imags && self.array.count >= 6) {
            [ProgressHUD showSuccess:@"最多可以选择五张"];
            return;
        }
        if (self.loadType == XSHouseImageLoadType_door && self.array.count >= 2) {
            [ProgressHUD showSuccess:@"最多可以选择一张"];
            return;
         }
        self.manager = nil;
        HXCustomNavigationController *nav = [[HXCustomNavigationController alloc] initWithManager:self.manager delegate:self];
        nav.modalPresentationStyle = UIModalPresentationOverFullScreen;
        nav.modalPresentationCapturesStatusBarAppearance = YES;
        [self presentViewController:nav animated:YES completion:nil];
    }
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
                     [self addimageWith:responseModel.data];
                 }else{
                     [ProgressHUD showError:@"请重新选择图片"];
                 }
          }];

     } failed:^(NSDictionary * _Nullable info, HXPhotoModel * _Nullable model) {
         STRONG_SELF;
         [ProgressHUD showError:@"请重新选择图片"];
     }];

}
- (void)addimageWith:(NSString *)urlStr{
    if (urlStr.length > 0) {
    XSIMageCollectionViewCellModel *dataModel = [[XSIMageCollectionViewCellModel alloc]init];
    dataModel.icon = urlStr;
    if (self.loadType == XSHouseImageLoadType_door) {
        dataModel.notNeedfirstImage  =YES;
    }

    if (self.loadType == XSHouseImageLoadType_Imags && self.array.count == 1) {
        dataModel.sele = YES;
    }
    [self modelBlack:dataModel];
        
    [self.array removeLastObject];
    [self.array addObject:dataModel];
    if (self.loadType == XSHouseImageLoadType_Imags) {
        XSIMageCollectionViewCellModel *add = [[XSIMageCollectionViewCellModel alloc]init];
        add.add = YES;
        [self.array addObject:add];
    }
    [self.collectionView reloadData];
    [self dataBlack];

    }
 
}
- (void)modelBlack:(XSIMageCollectionViewCellModel *)model{
    WEAK_SELF;
    model.block = ^(XSIMageCollectionViewCellModel * _Nonnull model, NSInteger type) {
        STRONG_SELF;
        if (type == 0) {
            [self delImage:model];
        }else if (type == 1){
            [self settingFirst:model];
        }
    };
}
- (void)delImage:(XSIMageCollectionViewCellModel *)model{
    BOOL defSel = NO;
    if (model.sele) {
        defSel = YES;
    }
    [self.array removeObject:model];
    XSIMageCollectionViewCellModel *fir = self.array.firstObject;
    if (!fir.add  && defSel) {
        fir.sele = YES;
    }
    if (self.loadType == XSHouseImageLoadType_door) {
        XSIMageCollectionViewCellModel *add = [[XSIMageCollectionViewCellModel alloc]init];
        add.add = YES;
        [self.array addObject:add];
    }
    [self dataBlack];
    [self.collectionView reloadData];
}
- (void)settingFirst:(XSIMageCollectionViewCellModel *)model{
    for (XSIMageCollectionViewCellModel *model in self.array) {
        model.sele = NO;
     }
    model.sele  =YES;
    [self.collectionView reloadData];
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
