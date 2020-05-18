//
//  HBMoneyCollectionController.m
//  HBStockWarning
//
//  Created by xs on 2017/9/14.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "HBMoneyCollectionController.h"
#import "HBMoneyManageAccountAuxiliaryCell.h"
#import "HBMoneyMangeConfirmView.h"
#import "HBTDXWebCallBankInterface.h"


@interface HBMoneyCollectionController ()<UITableViewDelegate,UITableViewDataSource>



@property (weak, nonatomic) IBOutlet UIButton *CollectionBtn;
@property (weak, nonatomic) IBOutlet UITableView *listTableView;


@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong)  HBMoneyManageAccountSubModel *mainAccountModel;
@property (nonatomic, assign) BOOL collectionBtnCleck;


@property (nonatomic, strong) HBMoneyManageInterface *interface;

@property (nonatomic, strong) HBMoneyMangeCollectionView *alertView;

@property (nonatomic, strong) HBMoneyTransferHeardView *m_heardView;

@property (nonatomic, strong) HBTDXWebCallBankInterface *tdxInterface;


@end

@implementation HBMoneyCollectionController
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (HBTDXWebCallBankInterface *)tdxInterface{
    if (!_tdxInterface) {
        _tdxInterface = [[HBTDXWebCallBankInterface alloc]init];
    }
    return _tdxInterface;
}
- (HBMoneyManageInterface *)interface{
    if (!_interface) {
        _interface = [HBMoneyManageInterface interfaceWithOperationManager:self.operationManager];
    }
    return _interface;
}
- (HBMoneyTransferHeardView *)m_heardView{
    if (!_m_heardView) {
        _m_heardView = [HBMoneyTransferHeardView viewWithNibField];
        _m_heardView.frame = CGRectMake(0, 0, KScreenWidth, 260);
    }

    return _m_heardView;
}
- (HBMoneyMangeCollectionView *)alertView{
    if (!_alertView) {
        _alertView = [HBMoneyMangeCollectionView viewWithNibField];
        CGFloat money = 0;
        NSMutableArray *array = [NSMutableArray array];
        for (HBMoneyManageAccountSubModel *model in self.dataArray) {
            if (model.isSelected) {
                money += model.availableAmountStr.doubleValue;
                [array addObject:model];
            }
        }
        _alertView.money = [NSString stringWithFormat:@"%.2f",money];

        _alertView.dataArray = array;
    }
    return _alertView;
}
- (void)loadNewData{

    WEAK_SELF;
    [self.interface queryDepositoryAccountInfoCompletion:^(NSMutableArray<HBMoneyManageAccountsModel *> *models, NSError *error) {

        SA_RESTART;
        if (error == nil) {

            NSMutableArray *newArray = [NSMutableArray arrayWithArray:models];
            HBMoneyManageAccountSubModel *mainModel = nil;
            HBMoneyManageAccountSubModel *mainModelCopy = nil;

            for (HBMoneyManageAccountSubModel *model in newArray) {
                if (model.accountType == HBMoneyManageMainAccount) {
                    mainModel = model;
                    mainModelCopy = [HBMoneyManageAccountSubModel modelWithModel:model];
                }
            }
            if (mainModel) {
                [newArray removeObject:mainModel];
            }

            [self setDataArray:newArray withMainAccountModel:mainModelCopy];



            if (self.viewLoaded) {
                self.m_heardView.mainAccountModel = self.mainAccountModel;
                [self.listTableView reloadData];
            }
        }

    }];
}
/**
 @param array 辅资金账户列表
 @param mainAccountModel 主资金账户
 */
- (void)setDataArray:(NSMutableArray<HBMoneyManageAccountSubModel *> *)array withMainAccountModel:(HBMoneyManageAccountSubModel *)mainAccountModel{
    [self.dataArray removeAllObjects];
    [self.dataArray addObjectsFromArray:array];
    self.mainAccountModel = mainAccountModel;

}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppearWithWhiteNavigationBar:animated];

    if (self.dataArray.count ==0) {
        [self loadNewData];
    }
}
- (void)viewDidLoad {
    [super viewDidLoadWithWhiteNavigationBar];
    self.title = @"资金归集";

    self.hb_navBarStatus =kNavBarWhiteState;

    
    

    self.CollectionBtn.layer.masksToBounds = YES;
    self.CollectionBtn.layer.cornerRadius = 5.0;
    self.listTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.listTableView.tableHeaderView = self.m_heardView;

    self.m_heardView.mainAccountModel = self.mainAccountModel;

    [self.listTableView reloadData];

    // 归集按钮初始化不能点击
    self.collectionBtnCleck = NO;
}



- (void)setCollectionBtnCleck:(BOOL)collectionBtnCleck{
    _collectionBtnCleck = collectionBtnCleck;

    if (_collectionBtnCleck) {
        self.CollectionBtn.alpha = 1.0;
        self.CollectionBtn.userInteractionEnabled = YES;
    }else{
        self.CollectionBtn.alpha = 0.5;
        self.CollectionBtn.userInteractionEnabled = NO;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135.0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"检测一次");
    [self checkMoneyCollection];

    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HBMoneyManageAccountAuxiliaryCell *cell = [HBMoneyManageAccountAuxiliaryCell cellWithtableView:tableView];
    HBMoneyManageAccountSubModel *model = self.dataArray[indexPath.row];
    cell.model = model;

    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];// 取消选中

    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionNone
                                  animated:NO];

    HBMoneyManageAccountSubModel *model = self.dataArray[indexPath.row];
    if (!model.isSelected) {
        if (model.availableAmountStr.doubleValue > 0) {
            model.isSelected = !model.isSelected;
        }else{
            [HBPromptAlertView alertMessage:@"暂无可用资金"];
        }

    }else{
        model.isSelected = !model.isSelected;
    }

//    model.isSelected = !model.isSelected;


    [self.listTableView reloadData];
}


/**
 验证是否选中一个辅资金账户
 */
- (void)checkMoneyCollection{
    BOOL isCleck = NO;
    for (HBMoneyManageAccountSubModel *model in self.dataArray) {
        if (model.isSelected) {
            isCleck = YES;
            break;
        }
    }

    self.collectionBtnCleck = isCleck;
}


/**
发起资金归集弹窗确认
 */
- (IBAction)moneyCollection:(UIButton *)sender {

    
    WEAK_SELF;
    self.alertView.cancel = ^{
        STRONG_SELF;
        [self.alertView removeFromSuperview];
        self.alertView = nil;
    };
    
    self.alertView.confirm = ^{
        STRONG_SELF;
        [self transferToMainAccount];
        [self.alertView removeFromSuperview];
        self.alertView = nil;
        
    };
    
    [HBAlertViewController showHBAlertView:self.alertView target:self completion:nil];

}
/**
 发起资金归集请求
 */
- (void)transferToMainAccount{
    WEAK_SELF;

    
    int num = 0;
    for (int i = 0; i<self.dataArray.count; i++) {
        HBMoneyManageAccountSubModel *model = [self.dataArray safeObjectAtIndex:i];
        if (model.isSelected) {
            num ++;
        }
    }
    if (self.dataArray.count == num) {
        // 归集
        [HBPromptProgressHUD showHUDAddedTo:self.view message:nil];
        [self.tdxInterface transferDepositoryAccountTransferOutAccount:nil inAccount:nil mainAccount:nil transferAmount:nil transferType:HBTDXCallTypeMoneyCollection callBackBlock:^(HBTDXNetworkResponse *_Nullable response,NSError * _Nullable error) {
            STRONG_SELF;
             [HBPromptProgressHUD hideHUDForView:self.view];
            if (!error) {
                NSArray<HBTDXTransferResultsModel *> *listModel = [HBTDXTransferResultsModel mj_objectArrayWithKeyValuesArray:response.dictArray];
                [self successful:listModel.firstObject.abossMessage transferType:HBMoneyTransferCollection];
            }else{
                [self failure:error.domain transferType:HBMoneyTransferCollection];
            }
        }];
    }else{
        // 划转
        //主资金账户号
        NSString *mainAccount = self.mainAccountModel.capitalAccount;
        //辅资金账户号数组
        for (HBMoneyManageAccountSubModel *model in self.dataArray) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                STRONG_SELF;
                if (model.isSelected) {
                        [self transferOutAccount:model.capitalAccount inAccount:self.mainAccountModel.capitalAccount transferAmount:model.availableAmount.stringValue];
                    }
            });
    
        }
    }



}
- (void)transferOutAccount:(NSString  * _Nullable)outAccount inAccount:(NSString * _Nullable)inAccount  transferAmount:(NSString * _Nullable)transferAmount{
    WEAK_SELF;
    [self.tdxInterface transferDepositoryAccountTransferOutAccount:outAccount inAccount:inAccount mainAccount:nil transferAmount:transferAmount transferType:HBTDXCallTypeMoneyTransfer callBackBlock:^(HBTDXNetworkResponse *_Nullable response,NSError * _Nullable error) {
         STRONG_SELF;
         if (!error) {
             NSArray<HBTDXTransferResultsModel *> *listModel = [HBTDXTransferResultsModel mj_objectArrayWithKeyValuesArray:response.dictArray];
             [self successful:listModel.firstObject.abossMessage transferType:HBMoneyTransferDelivery];
         }else{
             [self failure:error.domain transferType:HBMoneyTransferDelivery];
         }
     }];
}
@end
