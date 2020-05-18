        //
//  HBTransactionRecordsViewController.m
//  HBStockWarning
//
//  Created by hulailin on 16/6/23.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import "HBTransactionRecordsViewController.h"
#import "HBEmptyView.h"
#import "HBTransactionRecordsTableViewCell.h"
#import "HBExpandableCellButton.h"
#import "HBTransactionGroupModel.h"
#import "HBAssetsHistoryModel.h"
#import "HBStockExchangeInterface.h"
#import "HBOrderInterface.h"
#import "HBTransactionRecordHeaderView.h"
#import "HBAlertViewController.h"
#import "HBTradeViewController.h"
#import "HBEntrustDetailViewController.h"
#import "HBFundPurchaseRedeemController.h"
#import "HBSCFundPositionController.h"
#import "HBCheckTradePasswordVC.h"
#import "HBWebViewController.h"
#import "UIViewController+HBTradeCategory.h"
#import "HBPickerViewController.h"
#import "HBRecordFilterView.h"
#import "HBBusinessDetailsViewController.h"
#import "HBWKWebController.H"
#import "HBTDXWebCallBankInterface.h"

@interface HBTransactionRecordsViewController ()<HBTransactionRecordsTableViewCellDelegate,UITableViewDelegate,UITableViewDataSource>
{
    int _startPageN;
}
@property (nonatomic ,strong) HBStockExchangeInterface *stockExchangeInterface;
@property (nonatomic ,strong) HBOrderInterface *orderInterface;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic ,strong) UITableView *tableView;
@property (nonatomic, strong) HBTransactionRecordTopHeader * headerView;
/** 打开的cell*/
@property (nonatomic, strong) NSIndexPath *openMenuCellIndexPath;
//@property (nonatomic, copy) NSString *startDateStr;
//@property (nonatomic, copy) NSString *endDateStr;
@property (nonatomic, strong) UIButton *rightBtnIterm;
@property (nonatomic ,strong) HBTDXWebCallBankInterface *tdxInterface;

@end


@implementation HBTransactionRecordsViewController
- (HBTDXWebCallBankInterface *)tdxInterface{
    if (!_tdxInterface) {
        _tdxInterface = [[HBTDXWebCallBankInterface alloc]init];
    }
    return _tdxInterface;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.type == HBTransactionRecordsTodayEntrust || self.type == HBTransactionRecordsTodayDeal) {
         [self loadNewData];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [[HBEventAttemperEngine sharedInstance] removeEventWithName:[NSString stringWithFormat:@"%@%ld",NSStringFromClass(self.class),(long)self.type]];
}

- (HBOrderInterface *)orderInterface{
    if (!_orderInterface) {
        _orderInterface = [HBOrderInterface interfaceWithOperationManager:self.operationManager];
    }
    return _orderInterface;
}
/**
 *  请求管理
*/
-(HBStockExchangeInterface *)stockExchangeInterface{
    if(!_stockExchangeInterface){
        _stockExchangeInterface = [HBStockExchangeInterface interfaceWithOperationManager:self.operationManager];
    }
    return _stockExchangeInterface;
}

- (UIButton *)rightBtnIterm{
    if (!_rightBtnIterm) {
        _rightBtnIterm = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightBtnIterm setImage:[UIImage imageNamed:@"record_filter_btn"] forState:UIControlStateNormal];
        [_rightBtnIterm sizeToFit];
        [_rightBtnIterm addTarget:self action:@selector(rightBarButtonItemPress) forControlEvents:UIControlEventTouchUpInside];
    }
   return  _rightBtnIterm;
}


- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (void)viewDidLoad {
    self.hb_unlockRedConvertBlack =NO;
    [super viewDidLoad];
    _startPageN =1;
    self.view.backgroundColor = backGroundColor;
    //准备数据
    [self setUpTabview];
    if (self.type == HBTransactionRecordsTodayEntrust || self.type == HBTransactionRecordsTodayDeal) {
        [self timeToRefresh];
    }
    [self setupRefresh];
    if (self.type == HBTransactionRecordsHistoryEntrust||self.type ==HBTransactionRecordsHistoryDeal){
        UIView * header =[[UIView alloc] initWithFrame:(CGRect){0,0,KScreenWidth,60}];
        WEAK_SELF;
        __weak HBTransactionRecordTopHeader * headerView =[HBTransactionRecordTopHeader createTransactionRecordTopHeader:header frame:(CGRect){0,0,header.width,header.height}];
        self.headerView =headerView;
        self.headerView.startTimeLabel.text = [HBDateTool dateToStr:[HBDateTool getDateBeforeSeveralMonth:1 inDate:[NSDate date]]];
        self.headerView.endTimeLabel.text = [HBDateTool dateToStr:[NSDate date]];
        headerView.clickStartDateBlock = ^{
            STRONG_SELF;
            HBPickerViewController * pickController =[HBPickerViewController showDatePickerViewTotarget:weakSelf];
            [pickController setPickerViewByDateStr:self.headerView.startTimeLabel.text];
            pickController.sureHandler = ^(HBDatePickerView *pickerView) {
//                self.startDateStr = headerView.startTimeLabel.text;
                headerView.startTimeLabel.text =[pickerView getDateForMyMode];
//                [weakSelf judgeDateWithStartDate:headerView.startTimeLabel.text endDate:headerView.endTimeLabel.text start:YES end:NO];
            };
        };
        headerView.clickEndDateBlock = ^{
            STRONG_SELF;
            HBPickerViewController * pickController =[HBPickerViewController showDatePickerViewTotarget:weakSelf];
            [pickController setPickerViewByDateStr:self.headerView.endTimeLabel.text];
            pickController.sureHandler = ^(HBDatePickerView *pickerView) {
//                self.endDateStr = headerView.endTimeLabel.text;
                headerView.endTimeLabel.text =[pickerView getDateForMyMode];
//                [weakSelf judgeDateWithStartDate:headerView.startTimeLabel.text endDate:headerView.endTimeLabel.text start:NO end:YES];
            };
        };
        headerView.clickSureBlock = ^{
            [weakSelf judgeDateWithStartDate:headerView.startTimeLabel.text endDate:headerView.endTimeLabel.text start:NO end:YES];
        };
        [self loadNewData];
        [self.view addSubview:header];
    }
//    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:self.rightBtnIterm];
//    self.navigationItem.rightBarButtonItem = item1;
}
- (void)rightBarButtonItemPress{
    [HBRecordFilterView showRecordFilterView:(CGRect){0,0,self.view.width,self.view.height} updateFilterData:^HBRecordFilterCellModel *(HBRecordFilterCellModel *cellModel, NSInteger row) {
        cellModel.switchState =NO;
        return cellModel;
    } event:^(HBRecordFilterCellModel *cellModel, NSInteger row) {
        
        
    } hiddenEvent:^{
        
        
    } superView:self.view];
}
- (void)getStartDateAndEndDate:(void(^)(NSDate * startDate,NSDate * endDate))resultBlock
{
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.dateFormat=@"yyyy-MM-dd";
    NSDate *oriStartDate = [dateFormatter dateFromString:self.headerView.startTimeLabel.text];
    NSDate *oriEndDate = [dateFormatter dateFromString:self.headerView.endTimeLabel.text];
    resultBlock(oriStartDate,oriEndDate);
}
- (void)judgeDateWithStartDate:(NSString *)startDateStr endDate:(NSString *)endDateStr start:(BOOL)start end:(BOOL)end
{
    WEAK_SELF;
    [HBDatePickerView getDiffDateByStartDateStr:startDateStr endDateStr:endDateStr resultBlock:^(NSDate *startDate, NSDate *endDate, int diffYear, int diffMon) {
        STRONG_SELF;
        if ([endDate isEarlierThanDate:startDate]) {
            [HBPromptAlertView  alertMessage:@"起始日期不能晚于终止日期"];
//            if (start) {
//                self.headerView.startTimeLabel.text =self.startDateStr;
//            }else{
//                self.headerView.endTimeLabel.text =self.endDateStr;
//            }
            [self.tableView.mj_footer endRefreshing];
            [self.tableView.mj_header endRefreshing];
            return;
        }
        if (diffYear!=0||diffMon>3) {
            [HBPromptAlertView  alertMessage:@"查询间隔不能超过3个月"];
//            if (start) {
//                self.headerView.startTimeLabel.text =self.startDateStr;
//            }else{
//                self.headerView.endTimeLabel.text =self.endDateStr;
//            }
            [self.tableView.mj_footer endRefreshing];
            [self.tableView.mj_header endRefreshing];
            return;
        }
        [self reloadTableViewAndRequestByStartDate:startDate endDate:endDate];
    }];
}
- (void)setUpTabview
{
    float hight =(self.type == HBTransactionRecordsTodayEntrust || self.type == HBTransactionRecordsTodayDeal)?0:60;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, hight, KScreenWidth, KScreenHeight - 64-hight) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = backGroundColor;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (self.type == HBTransactionRecordsHistoryEntrust||self.type ==HBTransactionRecordsHistoryDeal) {
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(uploadMoreData)];
        self.tableView.mj_footer.automaticallyChangeAlpha = YES;
        self.tableView.mj_footer.automaticallyHidden = YES;
    }
    [self.view addSubview:self.tableView];
}
#pragma mark - 数据处理
/**
 * 加载新数据
 */
- (void)loadNewData{
    WEAK_SELF;
    if (self.type == HBTransactionRecordsTodayEntrust || self.type == HBTransactionRecordsTodayDeal) {
        [weakSelf reloadTableViewAndRequestByStartDate:nil endDate:nil];
    }else
    {
        self.openMenuCellIndexPath =nil;
        [self getStartDateAndEndDate:^(NSDate *startDate, NSDate *endDate) {
            [weakSelf judgeDateWithStartDate:weakSelf.headerView.startTimeLabel.text endDate:weakSelf.headerView.endTimeLabel.text start:NO end:NO];
        }];
    }
}
- (void)reloadTableViewAndRequestByStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
    if (self.type == HBTransactionRecordsTodayEntrust) {
            NSString *startdate1 = [NSString stringWithFormat:@"%d",[HBDateTool changeDateBy:startDate]] ;
            NSString *enddate1 =[NSString stringWithFormat:@"%d",[HBDateTool changeDateBy:endDate]] ;
           HBTDXCallType type = HBTDXTransactionRecordsTodayEntrust;
           if (self.type == HBTransactionRecordsTodayEntrust) {
               type = HBTDXTransactionRecordsTodayEntrust;
           }else if (self.type == HBTransactionRecordsTodayDeal){
               type = HBTDXTransactionRecordsTodayDeal;
           }else if (self.type == HBTransactionRecordsHistoryEntrust){
               type = HBTDXTransactionRecordsHistoryEntrust;
           }else if (self.type == HBTransactionRecordsHistoryDeal){
               type = HBTDXTransactionRecordsHistoryDeal;
           }
           [self.tdxInterface  entrustQueryForBeginTime:startdate1 endTime:enddate1 positioning:@"" transferType:type callBackBlock:^(HBTDXNetworkResponse *_Nullable response,NSError * _Nullable error) {
               if(error==nil){
                   [self.dataArray removeAllObjects];

                   // 1.
               NSArray<HBTransactionRecordModel *> *listModel = [HBTransactionRecordModel mj_objectArrayWithKeyValuesArray:response.dictArray];
                   
               NSMutableArray *array = [NSMutableArray array];
               //倒序遍历
                [listModel enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(HBTransactionRecordModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    [obj tdxConversion];
                    [array addObject:obj];
                }];
               
        
               if (array.count > 0 ) {
                HBTransactionGroupModel *model = [[HBTransactionGroupModel alloc] init];
                model.list = array;
                self.dataArray = [NSMutableArray arrayWithObject:model];
               }
                
                if(self.dataArray.count > 0){
                  if(self.openMenuCellIndexPath != nil){
                      
                      HBTransactionGroupModel *group = [self.dataArray safeObjectAtIndex:self.openMenuCellIndexPath.section];
                      HBTransactionRecordModel *recordModel = [group.list safeObjectAtIndex:self.openMenuCellIndexPath.row];
                      recordModel.isOpen = YES;
                  }
                }
                HBTransactionGroupModel * groupModel =[self.dataArray safeObjectAtIndex:self.openMenuCellIndexPath.section];
                [HBEmptyView emptyViewInfomation:[HBEmptyViewModel emptyViewMessage:@"无符合条件的记录" dataArray:groupModel.list tableView:self.tableView]];
                [self.tableView reloadData];
                   
               }
               // 结束上拉
               [self.tableView.mj_footer endRefreshing];
               [self.tableView.mj_header endRefreshing];
           }];
    }else{
        _startPageN =1;
         WEAK_SELF;
         int startdate =(self.type==HBTransactionRecordsTodayEntrust || self.type == HBTransactionRecordsTodayDeal)?0:[HBDateTool changeDateBy:startDate];
         int enddate = (self.type==HBTransactionRecordsTodayEntrust || self.type == HBTransactionRecordsTodayDeal)?0: [HBDateTool changeDateBy:endDate];
         [self.orderInterface queryEntrustRecordsWithPage:self.type startDate:startdate endDate:enddate pageNo:1 pageSize:10 completion:^(NSArray<HBTransactionGroupModel *> *data, NSError *error) {
             STRONG_SELF;
             if(error==nil){
                 [self.dataArray removeAllObjects];
                 self.dataArray = [data mutableCopy];
                 if(self.dataArray.count > 0){
                     if(self.openMenuCellIndexPath != nil){
                         HBTransactionGroupModel *group = [self.dataArray safeObjectAtIndex:self.openMenuCellIndexPath.section];
                         HBTransactionRecordModel *recordModel = [group.list safeObjectAtIndex:self.openMenuCellIndexPath.row];
                         recordModel.isOpen = YES;
                     }
                 }
                 HBTransactionGroupModel * groupModel =[self.dataArray safeObjectAtIndex:self.openMenuCellIndexPath.section];
                 [HBEmptyView emptyViewInfomation:[HBEmptyViewModel emptyViewMessage:@"无符合条件的记录" dataArray:groupModel.list tableView:self.tableView]];
                 [self.tableView reloadData];
             }

             // 结束上拉
             [self.tableView.mj_footer endRefreshing];
             [self.tableView.mj_header endRefreshing];
         }];
    }
    
 
}
//上拉加载更多
- (void)uploadMoreData
{
    WEAK_SELF;
    _startPageN +=1;
    [self getStartDateAndEndDate:^(NSDate *startDate, NSDate *endDate) {
        STRONG_SELF;
        [self.orderInterface queryEntrustRecordsWithPage:self.type startDate:[HBDateTool changeDateBy:startDate] endDate:[HBDateTool changeDateBy:endDate] pageNo:_startPageN pageSize:10 completion:^(NSArray<HBTransactionGroupModel *> *data, NSError *error) {
            if(error==nil){
                [self.dataArray addObjectsFromArray:data];
                if(self.dataArray.count > 0){
                    if(self.openMenuCellIndexPath != nil){
                        HBTransactionGroupModel *group = self.dataArray[self.openMenuCellIndexPath.section];
                        HBTransactionRecordModel *recordModel = group.list[self.openMenuCellIndexPath.row];
                        recordModel.isOpen = YES;
                    }
                }
                HBTransactionGroupModel * groupModel =[self.dataArray safeObjectAtIndex:self.openMenuCellIndexPath.section];
                [HBEmptyView emptyViewInfomation:[HBEmptyViewModel emptyViewMessage:@"无符合条件的记录" dataArray:groupModel.list tableView:self.tableView]];
                [self.tableView reloadData];
            }
            // 结束上拉
            [self.tableView.mj_footer endRefreshing];
            [self.tableView.mj_header endRefreshing];
        }];
    }];
    
}
- (void)setupRefresh{
    WEAK_SELF;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        STRONG_SELF;
        [self loadNewData];
    }];
}

//- (void)loadMoreData{
//
//}

#pragma mark UITableViewDelegate --


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
     return  self.dataArray.count;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.dataArray.count>0) {
        HBTransactionGroupModel *og = self.dataArray[section];
        return og.list.count;
    }
    return 0;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(self.type == HBTransactionRecordsTodayEntrust || self.type == HBTransactionRecordsTodayDeal){
        return 0;
    }
//    return SectionHeaderViewH;
    return 0;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
 
//    WEAK_SELF;
//    HBTransactionRecordHeaderView *headerView = [HBTransactionRecordHeaderView transactionRecordHeaderView:tableView];
//            [headerView fillData:self.dataArray section:section];

 
    return [[UIView alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //传递模型
    HBTransactionGroupModel *modelA = self.dataArray[indexPath.section];
    HBTransactionRecordModel *modelB = modelA.list[indexPath.row];
    
    if (modelB.isOpen) {
        return 184;
    } else {
        return 140;
    }

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"transactionRecordsCell";
    HBTransactionRecordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HBTransactionRecordsTableViewCell" owner:self options:nil].lastObject;
        [cell selectionCellStyle];
    }
    cell.delegate = self;

    [cell.menuView configTypeArray:self.type];

    HBTransactionGroupModel *og = self.dataArray[indexPath.section];
    
    [cell fillData:og.list[indexPath.row] type:self.type];

    return cell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中
   
    [self didOpenMenuAtCell:indexPath];
    
}

- (void)didOpenMenuAtCell:(HBTransactionRecordsTableViewCell *)menuCell withMoreButton:(UIButton *)moreButton{
   
    NSIndexPath *indexPath = [self.tableView indexPathForCell:menuCell];
    [self didOpenMenuAtCell:indexPath];
   

}

- (void)didOpenMenuAtCell:(NSIndexPath *)indexPath{
    
    if (self.openMenuCellIndexPath) {
          if (self.openMenuCellIndexPath.row == indexPath.row) {
            // ：点的是自己
            HBTransactionGroupModel *group = self.dataArray[self.openMenuCellIndexPath.section];
            HBTransactionRecordModel *model = group.list[self.openMenuCellIndexPath.row];
            model.isOpen = NO;
            [self.tableView reloadRowsAtIndexPaths:@[self.openMenuCellIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            self.openMenuCellIndexPath = nil;
        }
        else{
            //点的是没有打开的indexPath
            HBTransactionGroupModel *modelA = self.dataArray[self.openMenuCellIndexPath.section];
            HBTransactionRecordModel *modelB = modelA.list[self.openMenuCellIndexPath.row];
            modelB.isOpen = NO;

            HBTransactionGroupModel *modelAA = self.dataArray[indexPath.section];
            HBTransactionRecordModel *modelBB = modelAA.list[indexPath.row];
            modelBB.isOpen = YES;
            
            [self.tableView reloadRowsAtIndexPaths:@[self.openMenuCellIndexPath,indexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            //最后点击的indexPath
            self.openMenuCellIndexPath = indexPath;
        }
    }
    else{

        HBTransactionGroupModel *modelA = self.dataArray[indexPath.section];
        HBTransactionRecordModel *model = modelA.list[indexPath.row];
        model.isOpen = YES;
        self.openMenuCellIndexPath = indexPath;
        if (self.openMenuCellIndexPath) {
            [self.tableView reloadRowsAtIndexPaths:@[self.openMenuCellIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            
            [self.tableView scrollToRowAtIndexPath:self.openMenuCellIndexPath
                                  atScrollPosition:UITableViewScrollPositionNone
                                          animated:YES];
        }
        
    }

}

- (void)menuTableViewCell:(HBTransactionRecordsTableViewCell *)menuCell didSeletedMentItemAtIndex:(NSInteger)menuItemIndex{
    
    WEAK_SELF;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:menuCell];
    //传递模型
    HBTransactionGroupModel *og = self.dataArray[indexPath.section];
    HBTransactionRecordModel *model = og.list[indexPath.row];
    
    switch (menuItemIndex) {
        case 0:
        {
//            HBEntrustDetailViewController *entrust = [[HBEntrustDetailViewController alloc] init];
//            model.transactionRecordsType = self.type;
//            entrust.transactionRecordModel = model;
            model.transactionRecordsType = self.type;
            HBBusinessDetailsViewController *detailsViewController =[HBBusinessDetailsViewController  createBusinessDetailsViewController:model];
            [self.navigationController pushViewController:detailsViewController animated:YES];

        }
            break;
        case 1:
        {
           
            
            if (model.entrustType == HBEntrustTypeDistributeNumber || model.entrustType == HBEntrustTypeRationNumber) {
                //不跳转详情
            }else{
                     [HBHttpTool postSSECode:model.code exchange:model.exchange stockName:model.name  followId:model.followId securityType:model.securityType subType:nil viewController:self];
            }
   
        }
            break;
        case 2:
        {
            if (!model.hasRevoke)
            {
                //重新委托 如果是买入的话 那么就是跳到买入的界面选择 如果是卖出跳到卖出的界面
                if(model.entrustType == HBEntrustTypeBuy || model.entrustType == HBEntrustTypeSell || model.entrustType == HBEntrustStateReverserepos){
                    [self checkTradePassworkSuccessBlock:^{
                        STRONG_SELF;
                        [self jumpTradeViewControllerWithTradeModel:[self tradeModelWithTransactionRecordModel:model]];
                    }];
                }  else  if (model.entrustType == HBEntrustTypeSpecified || model.entrustType == HBEntrustTypeUndoSpecified){//指定
                    [self checkTradePassworkSuccessBlock:^{
                        STRONG_SELF;
                        [self jumpTradeViewControllerWithTradeModel:[self tradeModelWithTransactionRecordModel:model]];
                    }];
                }else  if (model.entrustType == HBEntrustStateFundSubscribe){//申购
                    HBFundInfoModel *fundModel = [[HBFundInfoModel alloc] init];
                    fundModel.fundName = model.name;
                    fundModel.exchange = model.exchange.uppercaseString;
                    fundModel.fundCode = model.code;
                    fundModel.securityType = HBSecurityStateFund;
                    [self checkTradePassworkSuccessBlock:^{
                        STRONG_SELF;
                        [self jumpFundPurchaseRedeemVCWithfundModel:fundModel exchangeType:FundExchangeType_Apply];
                    }];
                }else if (model.entrustType == HBEntrustStateFundRedemption){//赎回
                    HBFundInfoModel *fundModel = [[HBFundInfoModel alloc] init];
                    fundModel.fundName = model.name;
                    fundModel.exchange = model.exchange.uppercaseString;
                    fundModel.fundCode = model.code;
                    fundModel.securityType = HBSecurityStateFund;
                    [self checkTradePassworkSuccessBlock:^{
                        STRONG_SELF;
                        [self jumpFundPurchaseRedeemVCWithfundModel:fundModel exchangeType:FundExchangeType_Ransom];
                    }];
                }else if (model.entrustType == HBEntruststateFundSplit){//基金分拆
                    [self checkTradePassworkSuccessBlock:^{
                        STRONG_SELF;
                        [self jumpSCFundPositionVCIsSplit:YES];
                    }];
                }else if (model.entrustType == HBEntruststateFundCombine){//基金合并
                    [self checkTradePassworkSuccessBlock:^{
                        STRONG_SELF;
                        [self jumpSCFundPositionVCIsSplit:NO];
                    }];
                }else if (model.entrustType == HBEntrustTypeDistributeNumber){
                    //不做处理 新股申购
                }else if (model.entrustType == HBEntrustTypeRationNumber){
                    //不做处理
                }else if (model.entrustType == HBEntruststateBidDeclaration||model.entrustType == HBEntruststateRescissionOfAnOffer){
                    NSString * domain;
                    if([HBNetworkConfig config].configType==HBStockNetworkDEV){
                       domain =@"https://m.dev.hbec.com";
                    }else if ([HBNetworkConfig config].configType==HBStockNetworkFZ){
                       domain =@"https://m-wwwtest.touker.com";
                    }else {
                       domain =@"https://m.touker.com";
                    }
                    NSNumber * numerType =model.entrustType == HBEntruststateBidDeclaration?[NSNumber numberWithInt:0]:[NSNumber numberWithInt:1];
                    HBWebViewController * webviewController =[[HBWebViewController alloc] init];
                    webviewController.urlString =[NSString stringWithFormat:@"%@/stock/offer/offer.htm?stockCode=%@&offerType=%@",domain,model.code,numerType];
                    [self.navigationController pushViewController:webviewController animated:YES];
                }else if (model.entrustType ==HBEntrustTypeETFSG||model.entrustType ==HBEntrustTypeETFSH||model.entrustType ==HBEntrustTypeJJRG){
                    NSString * domain;
                    if([HBNetworkConfig config].configType==HBStockNetworkDEV){
                        domain =@"https://m.dev.hbec.com";
                    }else if ([HBNetworkConfig config].configType==HBStockNetworkFZ){
                        domain =@"https://m-wwwtest.touker.com";
                    }else {
                        domain =@"https://m.touker.com";
                    }
                    HBWKWebController * webviewController =[[HBWKWebController alloc] init];
                    webviewController.URLString =[NSString stringWithFormat:@"%@/stock/fund/etf/index.htm",domain];
                    [self.navigationController pushViewController:webviewController animated:YES];
                }else if(model.entrustType ==HBEntrustTypeConvertible||model.entrustType ==HBEntrustTypeRecycling){
                    NSLog(@"暂不支持");
                }
            }else {
                //撤单按钮
                //弹出确认框
                [self CheckTradePasswordWithModel:model];

            }
        }
            break;
        default:
            break;
    }
}
/**
 依据交易记录model和委托类型，创建交易模型
 */
- (HBTradeInfoModel *)tradeModelWithTransactionRecordModel:(HBTransactionRecordModel *)model {
    HBTradeInfoModel * tradeModel = [[HBTradeInfoModel alloc]init];
    if (model.entrustType == HBEntrustTypeBuy) {
        tradeModel.tradeProductType = HBTrade_Stock;
        tradeModel.transactionBehaviourType = HBTradeBehaviour_Buy;
    }else if (model.entrustType == HBEntrustTypeSpecified || model.entrustType == HBEntrustTypeUndoSpecified  ){
        tradeModel.tradeProductType = HBTrade_Stock;
        tradeModel.transactionBehaviourType = HBTradeBehaviour_Buy;
    }else if (model.entrustType == HBEntrustTypeSell){
        tradeModel.tradeProductType = HBTrade_Stock;
        tradeModel.transactionBehaviourType = HBTradeBehaviour_Sell;
    } else if (model.entrustType == HBEntrustStateReverserepos) {
        tradeModel.tradeProductType = HBTrade_NDRR;
        tradeModel.transactionBehaviourType =  HBTradeBehaviour_Loan;
        tradeModel.needInitializeUpdate = YES;
    }
    tradeModel.code = model.code;
    tradeModel.name = model.name;
    tradeModel.securityType = [NSString stringWithFormat:@"%ld",model.securityType];
    tradeModel.exchange =  model.exchange.uppercaseString;
    tradeModel.entrustPrice = model.entrustPrice;
    tradeModel.entrustAmount = model.entrustAmount;
    tradeModel.againTrade = YES;
    return tradeModel;
}
/**
 检测交易密码
 completion：交易密码验证成功回调
 */
- (void)checkTradePassworkSuccessBlock:(void (^)())completion {
    WEAK_SELF;
    HBCheckTradePasswordVC *checkTradePasswordVC = [HBCheckTradePasswordVC createFromStoryboardWithStoryboardName:@"Main"];
    checkTradePasswordVC.passwordSucceedCallBackBlock = completion;
    
    [checkTradePasswordVC showCheckTradePasswordTarget:self];
}
/**
 跳转基金拆分、合并。
 isSplit：是否是拆分。YES:拆分、NO：合并
 */
- (void)jumpSCFundPositionVCIsSplit:(BOOL)isSplit {
    HBSCFundPositionController *SCFundVC = [HBSCFundPositionController createFromStoryboardWithStoryboardName:@"Main"];
    SCFundVC.isSplit = isSplit;
    [self.navigationController pushViewController:SCFundVC  animated:NO];
}
/**
 跳转基金申购、赎回
 fundModel：基金模型
 exchangeType：申购、赎回枚举类型
 */
- (void)jumpFundPurchaseRedeemVCWithfundModel:(HBFundInfoModel *)fundModel exchangeType:(FundExchangeType)exchangeType {
    HBFundPurchaseRedeemController *PurchaseVC = [[HBFundPurchaseRedeemController alloc]initWithModel:fundModel exchangeType:exchangeType];
    [self.navigationController pushViewController:PurchaseVC animated:NO];
}
/**
 跳转tradeVC，如果导航栈中存在则跳转至已经存在VC否则创建跳转
 */
- (void)jumpTradeViewControllerWithTradeModel:(HBTradeInfoModel *)tradeModel {
    __block HBTradeViewController * tradeVC = nil;
    [self.navigationController.viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[HBTradeViewController class]]) {
            tradeVC = obj;
            *stop = YES;
        }
    }];
    if (tradeVC == nil) {
        tradeVC = [HBTradeViewController tradeModel:tradeModel tradeType:tradeModel.tradeProductType tradeBehaviour:tradeModel.transactionBehaviourType];
        [self.navigationController pushViewController:tradeVC animated:YES];
    }else {
        tradeVC.tradeModel = tradeModel;
        [tradeVC setTradeType:tradeModel.tradeProductType tradeBehaviour:tradeModel.transactionBehaviourType];
        [self.navigationController popToViewController:tradeVC animated:YES];
    }
}


#pragma mark - Method
+ (NSAttributedString *)authorityPromptWithTitle:(NSString *)title message:(NSString *)message {
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSAttributedString *AttributedTitle = [[NSAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName:[UIColor colorWithRed:38/255 green:38/255 blue:38/255 alpha:1]}];
    [attributedString appendAttributedString:AttributedTitle];
    NSAttributedString *Attributedmessage = [[NSAttributedString alloc] initWithString:message attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor colorWithRed:83/255 green:83/255 blue:83/255 alpha:1]}];
    [attributedString appendAttributedString:Attributedmessage];
    return attributedString;
}

-(void)CheckTradePasswordWithModel:(HBTransactionRecordModel *)model{
    WEAK_SELF;
    HBCheckTradePasswordVC *checkTradePasswordVC = [HBCheckTradePasswordVC createFromStoryboardWithStoryboardName:@"Main"];
    checkTradePasswordVC.passwordSucceedCallBackBlock = ^{
        STRONG_SELF;
        [self showAlert:model];
    };

    [checkTradePasswordVC showCheckTradePasswordTarget:self];
}

- (void)showAlert:(HBTransactionRecordModel *)model
{

    
    WEAK_SELF;
    HBAlertInformation *alertInfomation = [HBAlertInformation informationWithTitle:[[NSAttributedString alloc] initWithString:@"确认撤销此笔委托单?" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:[UIColor colorWithRed:83/255 green:83/255 blue:83/255 alpha:1]}]  message:nil preferredStyle:HBAlertControllerStyleMessage];
    HBAlertViewController *authority = [HBAlertViewController alertControllerInfomation:alertInfomation];
    [authority addAction:[HBAlertAction actionWithTitle:@"取消" style:HBAlertActionStyRedCancel handler:^{}]];
    [authority addAction:[HBAlertAction actionWithTitle:@"确认撤销" style:HBAlertActionStyRedDefault handler:^{
        [weakSelf revokeEntrust:model];
    }]];
    [authority showHBAlertViewControllerTarget:self completion:nil];
}

/**
 *  撤单
 */
- (void)revokeEntrust:(HBTransactionRecordModel *)model{
    
    WEAK_SELF;
     [HBPromptProgressHUD showHUDMessage:@"撤单中"];
     [self.tdxInterface revokingBytdxBusinessType:HBTDXTransactionRevoking account:model.account entrustCode:model.entrustCode code:model.code exchange:model.exchange entrustTypeInt:model.entrustTypeInt.stringValue callBackBlock:^(HBTDXNetworkResponse * _Nullable response, NSError * _Nullable error) {
         STRONG_SELF;
         [HBPromptProgressHUD hideHUD];
         if (error == nil) {
            [self loadNewData];
            [HBPromptAlertView alertMessage:@"该委托已经成功申请撤单"];
             
         }else{
             [HBPromptAlertView alertMessage:error.domain];
         }
     }];
    
//    WEAK_SELF;
//    [self.orderInterface revokeEntrustCode:[NSString stringWithFormat:@"%@",model.entrustCode] completionBlock:^(HBNetworkResponse *reponseStatus) {
//        STRONG_SELF;
//        if (reponseStatus != nil) {
//            [HBPromptAlertView alertMessage:@"该委托已经成功申请撤单"];
//            [self loadNewData];
//
//            [self.tableView reloadData];
//        }
//
//    }];
}

#pragma mark timer
-(void)timeToRefresh {

    //在刷新时间段才刷新
    if ([self stockInfoGetIsValidRefresh]) {
        WEAK_SELF;
        [[HBEventAttemperEngine sharedInstance] registerAction:^{
            STRONG_SELF;
            [self loadNewData];
            
        } timer:(int)[self timeIntervalRefreshCount] name:[NSString stringWithFormat:@"%@%ld",NSStringFromClass(self.class),(long)self.type]];
        
    }
}
@end
