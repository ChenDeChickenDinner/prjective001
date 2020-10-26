//
//  XSHouseDetailsController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/28.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSHouseDetailsController.h"
#import "XSHouseInfoShowModel.h"
#import "XSHouseInfoShowCell.h"
#import "XSHouseMasterInfoView.h"
#import "XSLPDTViewController.h"
#import "XSDoorViewController.h"
#import "XSImagesViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
@interface XSHouseDetailsController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet XSHouseMasterInfoView *callView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *array;
@property(strong, nonatomic) XSHouseInfoShowModel *dataModel;

@property(strong, nonatomic) XSHouseDetailsDataModel *NewDetailsModel;
@property(nonatomic,strong) UIBarButtonItem *watchItem;
@property(nonatomic,strong) UIBarButtonItem *shareItem;


@end

@implementation XSHouseDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"房屋详情";

    self.array = [NSMutableArray array];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.backgroundColor = XSColor(246, 246, 246);
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    WEAK_SELF;
    self.tableView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        STRONG_SELF;
        [self gethouseDetails];
    }];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    
    
    [self gethouseDetails];

 
}
- (UIBarButtonItem *)watchItem{
    if (_watchItem == nil) {
        _watchItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:self.dataModel.watch?@"watch_Q":@"watch_QN"] style:UIBarButtonItemStyleDone target:self action:@selector(watch)];
    }
    return _watchItem;
}
- (UIBarButtonItem *)shareItem{
    if (_shareItem == nil) {
        _shareItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"sharexcx"] style:UIBarButtonItemStyleDone target:self action:@selector(shareHouse)];
    }
    return _shareItem;
}
- (void)shareHouse{

    //1.开启图片上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.view.width, 300), NO, 0);
    //2.获取当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //UIView之所以能够显示，是因为它内部有一个层layer，通过渲染的形式绘制上下文
    [self.view.layer renderInContext:ctx];
    //生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
//    UIGraphicsEndImageContext();

    CGSize size = CGSizeMake(250, 200);
    UIGraphicsBeginImageContext(size);
    [newImage drawInRect:CGRectMake(0,0, size.width, size.height)];
    newImage =UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imageData = [newImage sd_imageDataAsFormat:SDImageFormatPNG compressionQuality:1];

    
    
    
    //    /hire-house/detail/index租房详情
    //    /search-house/two-hand/detail/index二手房详情
    //    /search-house/new-hand-detail/index 新房详情
        NSMutableDictionary * params = [NSMutableDictionary dictionary];
    NSString *title = self.dataModel.title?self.dataModel.title:@"";
    NSString *description = self.dataModel.titleDetail?self.dataModel.titleDetail:@"";
    NSURL *url = [NSURL URLWithString:XSJSQURL];
    NSString *path = nil;
    if (self.dataModel.houseType == XSBHouseType_old) {
        path = [NSString stringWithFormat:@"/search-house/two-hand/detail/index?id=%@",self.dataModel.house_id];
    }else if (self.dataModel.houseType == XSBHouseType_New){
        path = [NSString stringWithFormat:@"/search-house/new-hand-detail/index?id=%@",self.dataModel.house_id];
    }else{
        path = [NSString stringWithFormat:@"/hire-house/detail/index?id=%@",self.dataModel.house_id];
    }

    [params SSDKSetupWeChatMiniProgramShareParamsByTitle:title description:description webpageUrl:url path:path thumbImage:nil hdThumbImage:imageData userName:XSXCX withShareTicket:YES miniProgramType:0 forPlatformSubType:SSDKPlatformSubTypeWechatSession];
                [ShareSDK showShareActionSheet:nil //(第一个参数要显示菜单的视图,
                         customItems:@[@(SSDKPlatformSubTypeWechatSession)]
                         shareParams:params
                  sheetConfiguration:nil
                      onStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType,NSDictionary *userData,SSDKContentEntity *contentEntity,NSError *error,BOOL end)
                 {
        switch (state) {
                     case SSDKResponseStateSuccess:
                             NSLog(@"成功");//成功
                             break;
                     case SSDKResponseStateFail:
                        {
                             NSLog(@"--%@",error.description);//失败
                             break;
                        }
                     case SSDKResponseStateCancel:
                     break;
                     default:
                     break;
                 }
        }];
}
- (void)gethouseDetails{
    WEAK_SELF;
    [self.subInfoInterface houseDetailsWithHouseType:self.houseType  house_id:self.houseid  callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;
            [self.tableView.mj_header endRefreshing];
            if (error == nil) {
                if (responseModel.code.integerValue == SuccessCode) {
                    XSHouseInfoShowModel *model = [XSHouseInfoShowModel mj_objectWithKeyValues:responseModel.data];
                    model.houseType = self.houseType;
                    model.source = self.source;
                    [self assemblyCellDataArrayWithData:model];
   
                }
            }
    }];
}

- (void)navItem{
    self.watchItem = nil;
    if (![self.dataModel.customerId isEqual:[XSUserServer sharedInstance].userModel.ID]) {
        self.navigationItem.rightBarButtonItems = @[self.watchItem,self.shareItem];
    }else{
        self.navigationItem.rightBarButtonItem = self.shareItem;
    }
}
// 组装数据
-(void)assemblyCellDataArrayWithData:(XSHouseInfoShowModel *)dataModel{
    self.dataModel = dataModel;
    [self navItem];
    self.callView.hidden = NO;
    self.callView.model = dataModel;
    if ([dataModel.customerId isEqual:[XSUserServer sharedInstance].userModel.ID]) {
        [self.callView removeFromSuperview];
    }
    
    WEAK_SELF;
    self.dataModel.clickBlack = ^(XSHouseInfoModel *model, id data, XSBHouseKeyValueEditStatus editStatus) {
        STRONG_SELF;
        if (editStatus== XSBHouseKeyValueIntroduce ||
            editStatus == XSBHouseKeyValueInfoSMore ||
            editStatus == XSBHouseKeyValueInfoNMore ||
            editStatus == XSBHouseKeyValueInfoLDIX) {
            XSHouseIntroduceController *vc = [[XSHouseIntroduceController alloc]init];
            vc.dataModel = self.dataModel;
            vc.houseType = self.houseType;
            vc.infoType = editStatus;
            [self.navigationController pushViewController:vc animated:YES];
        }else if(editStatus== XSBHouseKeyValueInfoNMore){
            NSLog(@"XSBHouseKeyValueInfoNMore");

        }else if(editStatus== XSBHouseKeyValueInfoDoorInfo){
            NSLog(@"XSBHouseKeyValueInfoDoorInfo");
            XSDoorViewController *vc =  [[XSDoorViewController alloc]init];
            vc.forms = self.dataModel.forms;
            [self.navigationController pushViewController:vc animated:YES];
        }else if(editStatus== XSBHouseKeyValueInfoLPIX){
            NSLog(@"XSBHouseKeyValueInfoLPIX");
            XSLPDTViewController *vc =  [[XSLPDTViewController alloc]init];
            vc.dynamics = self.dataModel.dynamics;
            [self.navigationController pushViewController:vc animated:YES];

        }else if(editStatus== XSBHouseKeyValueInfoDoorImageInfo){
            NSLog(@"XSBHouseKeyValueInfoDoorImageInfo");
            NSMutableArray *array = [NSMutableArray array];
            for (XSHouseDetailsDataImgsModel *model in self.dataModel.imgs) {
                if (model.contentImg.count > 0) {
                    [array addObject:model];
                }
            }
            XSHouseDetailsDataImgsModel *imageModel = [[XSHouseDetailsDataImgsModel alloc]init];
            imageModel.name = @"户型图";
            NSMutableArray *Marray = [NSMutableArray array];
            for (XSHouseDetailsDataFormsModel *model in self.dataModel.forms) {
                [Marray addObject:model.formImg];
            }
            imageModel.contentImg = Marray;
            if (Marray.count > 0) {
                [array addObject:imageModel];
            }
//            [array addObject:imageModel];

            XSImagesViewController *vc = [[XSImagesViewController alloc]init];
            vc.dataSource = array;
            [self.navigationController pushViewController:vc animated:YES];
   
        }else if (editStatus== XSBHouseKeyValueInfoSC){
            NSNumber *tag = (NSNumber *)data;
            NSIndexPath *path= [NSIndexPath indexPathForRow:tag.integerValue inSection:0];
            [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:NO];
        }
        
        
    };
    [self.array removeAllObjects];
    NSError *error;
    NSString *file  = nil;
    if (self.houseType==XSBHouseType_old) {
        file  = @"XSSecondHouseDetailsInfo";
    }else if (self.houseType==XSBHouseType_New){
        file  = @"XSNewHouseDetailsInfo";
    }else{
        file  = @"XSRentHouseDetailsInfo";
    }

    NSString *path = [[NSBundle mainBundle]pathForResource:file ofType:@"json"];
    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableLeaves error:&error];
    NSMutableArray *modelArray = [XSHouseInfoShowModel mj_objectArrayWithKeyValuesArray:dataArray];

    [self.array addObjectsFromArray:modelArray];
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XSHouseInfoCellModel *dataModel = [self.array safeObjectAtIndex:indexPath.row];
    return dataModel.cellHeight?dataModel.cellHeight.floatValue:53.0;
}
- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XSHouseInfoShowModel *model = [self.array safeObjectAtIndex:indexPath.row];
    
    XSHouseInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:model.cellClass];
    if (!cell) {
         NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"XSHouseInfoShowCell" owner:self options:nil];
          cell = [array safeObjectAtIndex:[XSHouseInfoCell indexForClassName:model.cellClass]];
    }
    [cell updateWithModel:self.dataModel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    XSHouseInfoShowModel *model = [self.array safeObjectAtIndex:indexPath.row];

}


  
- (void)watch{
    WEAK_SELF;
    if ([XSUserServer sharedInstance].isLogin) {
          [self.subInfoInterface rentWatchHouseWithHouse_id:self.houseid houseType:self.houseType watch:!self.dataModel.watch callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
              STRONG_SELF;
              if (error == nil ) {

                  if (responseModel.code.intValue == SuccessCode) {
                      self.dataModel.watch = !self.dataModel.watch;
                      [self navItem];
                      [ProgressHUD showSuccess:self.dataModel.watch?@"关注成功":@"已取消关注"];
                  }else{
                      [ProgressHUD showError:@"稍后再试"];
                  }
              }
          }];
    }else{
          [XSUserServer needLoginSuccess:^{
              STRONG_SELF;

              [self gethouseDetails];
          } cancel:^{
              
          }];

    }

}
@end
