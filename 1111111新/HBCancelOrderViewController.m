//
//  HBCancelOrderViewController.m
//  HBStockWarning
//
//  Created by hbzq on 15/10/27.
//  Copyright © 2015年 Touker. All rights reserved.
//


#import "HBCancelOrderViewController.h"
#import "HBNewCancelOrderCell.h"
#import "HBEmptyView.h"
#import "HBAlertViewController.h"
#import "HBCheckTradePasswordVC.h"
#import "HBStockAccountInterface.h"
#import "HBWebViewController.h"
#import "UIViewController+HBTradeCategory.h"
#import "UINavigationBar+Extension.h"
#import "HBCancelOrderToolView.h"
#import "HBTDXWebCallBankInterface.h"

#define BottomViewHeight 60

@interface HBCancelVCRightBarButton : UIButton

@end

@implementation HBCancelVCRightBarButton

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setTitle:@"全部撤单" forState:UIControlStateNormal];
        [self setTitle:@"提交" forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        self.userInteractionEnabled = NO;
        self.alpha = 0.5;
    }
    return self;
}


- (void)setHighlighted:(BOOL)highlighted{
    
}
@end

@interface HBCancelOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic ,strong)HBCancelVCRightBarButton *rightBarButton;
@property(nonatomic ,strong)UIButton *originalBackButton;
@property(nonatomic ,strong)UIButton *leftBarButton;
@property(nonatomic ,strong)HBCancelOrderToolView *toolView;
@property(nonatomic ,strong)HBNewCancelOrderCell *cell;


@property (nonatomic ,strong) HBStockAccountInterface *stockAccountInterface;
@property (nonatomic ,strong) HBOrderInterface *orderInterface;
@property (nonatomic,strong)NSMutableArray<HBCancelOrdersModel*> *delArray;

@property(nonatomic,strong)UIView *footerView;

@property(nonatomic, strong)NSMutableArray<HBCancelOrdersModel*> *dataArray;
@property(nonatomic, strong)UITableView *tableView;
@property (nonatomic ,strong) HBTDXWebCallBankInterface *tdxInterface;

@end
@implementation HBCancelOrderViewController

- (HBTDXWebCallBankInterface *)tdxInterface{
    if (!_tdxInterface) {
        _tdxInterface = [[HBTDXWebCallBankInterface alloc]init];
    }
    return _tdxInterface;
}

- (HBStockAccountInterface *)stockAccountInterface{
    if(!_stockAccountInterface){
        _stockAccountInterface = [HBStockAccountInterface interfaceWithOperationManager:self.operationManager];
    }
    return _stockAccountInterface;
}

- (HBOrderInterface *)orderInterface{
    if (!_orderInterface) {
        _orderInterface = [HBOrderInterface interfaceWithOperationManager:self.operationManager];
    }
    return _orderInterface;
}

- (NSMutableArray<HBCancelOrdersModel*> *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableArray<HBCancelOrdersModel*> *)delArray
{
    if (!_delArray) {
        _delArray = [NSMutableArray array];
    }
    return _delArray;
}

-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, BottomViewHeight)];
        //        _footerView.backgroundColor = [UIColor clearColor];
    }
    return _footerView;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    _rightBarButton.alpha = 0.0;
    [[HBEventAttemperEngine sharedInstance] removeEventWithName:@"HBCancelOrderViewController"];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (!self.hb_tradeViewController.viewDisappear) {
        [HBUMobClick commonTrans_Cancel];
        _rightBarButton.alpha = 0.5;
//        self.hb_tradeViewController.navigationItem.title = @"委托交易";
//        self.hb_tradeViewController.navigationItem.titleView = nil;
        self.hb_tradeViewController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBarButton];
        [self.hb_tradeViewController.navigationController.navigationBar navigationBarColor:[UIColor colorWithHexString:@"#CE3533"]];
//        self.hb_tradeViewController.navigationController.navigationBar.barTintColor =[UIColor whiteColor];
        self.hb_tradeViewController.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
        [self loadData:NO];
        [self configSwitchAccountPopover];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.hb_tradeViewController) {
        switch (self.hb_tradeViewController.tradeModel.securityType.integerValue) {
            case HBSecurityStateFund:
                self.holdType = HBHoldStateFund;
                break;
            case HBSecurityStateDebt:
                self.holdType = HBHoldStateBond;
                break;                
            default:
                self.holdType = HBHoldStateALL;
                break;
        }
    }
    
    
    self.title = @"撤单";
    // 创建设置导航栏右侧快速登录按钮
    [self loadData:NO];
    //开启定时器
    [self timeToRefresh];
    
    [self setupTableView];
    [self setupNavigationBar];
    [self createBottomTools];

}

//-(void)viewWillLayoutSubviews{
//    self.toolView.frame = CGRectMake(0, self.view.height - 100, KScreenWidth, BottomViewHeight);
//}

-(void)setupTableView{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight - 110)];
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([HBNewCancelOrderCell class]) bundle:nil] forCellReuseIdentifier:@"HBNewCancelOrderCell"];
    WEAK_SELF;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        STRONG_SELF;
        if (![self.tableView isEditing]) {
            [self loadData:NO]; //显示菊花
        }else{
            [self.tableView.mj_header endRefreshing];
        }
    }];
    self.tableView.allowsSelectionDuringEditing=YES;
    self.tableView.backgroundColor = backGroundColor;
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}
-(void)setupNavigationBar{

    _originalBackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _originalBackButton.frame = CGRectMake(0, 0, 20, 20);
    [_originalBackButton setImage:[UIImage imageNamed:@"back_btn_icon"] forState:UIControlStateNormal];
    [_originalBackButton setImage:[UIImage imageNamed:@"back_btn_icon_sel"] forState:UIControlStateHighlighted];
    [_originalBackButton addTarget:self action:@selector(backButtonPress) forControlEvents:UIControlEventTouchUpInside];
    
    _rightBarButton = [[HBCancelVCRightBarButton alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
    [_rightBarButton addTarget:self action:@selector(selectMore:) forControlEvents:(UIControlEventTouchUpInside)];
    
    _leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftBarButton setTitle:@"取消" forState:UIControlStateNormal];
    _leftBarButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [_leftBarButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _leftBarButton.frame = CGRectMake(0, 0, 40, 20);
    [_leftBarButton addTarget:self action:@selector(cancelOperation:) forControlEvents:(UIControlEventTouchUpInside)];
}

//底部工具栏
-(void)createBottomTools
{
    WEAK_SELF;
    self.toolView = [[HBCancelOrderToolView alloc]init];
    [self.toolView setSelectAllClickCallBack:^(BOOL isSelected){
        [weakSelf selectAllRows:isSelected];
    }];
    self.toolView.frame = CGRectMake(0, self.view.height, KScreenWidth, BottomViewHeight);
    [self.view addSubview:self.toolView];
    //默认隐藏
    self.toolView.hidden=YES;
}

//根据参数设置是否全部选中或者取消全部选中
//MARK: 设置全选
-(void)selectAllRows:(BOOL)isSelectAll
{
    [self.delArray removeAllObjects];
    for(HBCancelOrdersModel *m in self.dataArray){
        if (isSelectAll) {
            [self.delArray addObject:m];
            m.selected = YES;
            m.show = YES;
        }else{
            m.selected = NO;
            m.show = YES;
        }
    }
    [self refreshDeleteCountLb];
}

//刷新删除数量Lb
-(void)refreshDeleteCountLb
{
    NSString *text = [NSString stringWithFormat:@"共计选择了 %ld 条记录",(unsigned long)self.delArray.count];
    NSString *delCount = [NSString stringWithFormat:@"%ld",(unsigned long)self.delArray.count];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str addAttribute:NSForegroundColorAttributeName
                value:BarThemeColor
                range:NSMakeRange(6,delCount.length)];
    [self.toolView selectDescText:str];
    [self enableRightBarButton:(self.delArray.count > 0 ? YES : NO)];
    [self.tableView reloadData];
}

//MARK: 抽取设置rightBarButton 属性设置代码
-(void)enableRightBarButton:(BOOL)userInteractionEnabled{
//    _rightBarButton.selected = userInteractionEnabled;
    _rightBarButton.userInteractionEnabled = userInteractionEnabled;
    _rightBarButton.alpha = (userInteractionEnabled ? 1 : 0.5);
}
//是否是自动刷新 相应的隐藏菊花
- (void)loadData:(BOOL)refresh{
    WEAK_SELF;
  
    [self.tdxInterface queryRevokingRecordBytdxBusinessType:HBTDXTransactionRevokingRecord callBackBlock:^(HBTDXNetworkResponse *_Nullable response,NSError * _Nullable error) {
        if (error == nil) {
        if (self.tableView.isEditing) { //正在编辑则不再赋值,为了解决正在编辑时候 突然有数据来 那么编辑按钮就会消失
            return ;
        }
        [self.dataArray removeAllObjects];
        NSArray<HBCancelOrdersModel *> *listModel = [HBCancelOrdersModel mj_objectArrayWithKeyValuesArray:response.dictArray];
 
        NSMutableArray *array = [NSMutableArray array];
        [listModel enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(HBCancelOrdersModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            STRONG_SELF;
            [obj tdxConversion];
            if (self.holdType == HBHoldStateBond) {
              if (obj.securityType == HBSecurityStateDebt) {
                  [array addObject:obj];
              }
            }else{
              [array addObject:obj];
            }
         }];
        [self.dataArray addObjectsFromArray:array];
        [self.tableView reloadData];
        if (self.view.window && self.dataArray.count > 0) {
            //右侧按钮状态
            [self enableRightBarButton:YES];
            _rightBarButton.selected = NO;
        }
            
        }
        [self showCurrentStatus];
        [self.tableView.mj_header endRefreshing];

    }];
    
    
//    [self.orderInterface queryRevokingRecordByType:self.holdType refresh:refresh completion:^(NSMutableArray<HBCancelOrdersModel *> *cancelorderList, NSError *error) {
//        STRONG_SELF;
//        if (!error) {
//            if (self.tableView.isEditing) { //正在编辑则不再赋值,为了解决正在编辑时候 突然有数据来 那么编辑按钮就会消失
//                return ;
//            }
//            [self.dataArray removeAllObjects];
//            self.dataArray = cancelorderList;
//            if (self.view.window) {
//                //右侧按钮状态
//                [self enableRightBarButton:YES];
//                _rightBarButton.selected = NO;
//            }
//            //刷新表格
//            [self.tableView reloadData];
//        }
//        [self showCurrentStatus];
//
//    }];
    
}

- (void)showCurrentStatus{
    HBEmptyViewModel *model = [HBEmptyViewModel emptyViewMessage:@"暂无撤单记录" dataArray:self.dataArray tableView:self.tableView];
    [HBEmptyView emptyViewInfomation:model];
}
#pragma 准备数据
- (void)getData{
    [self loadData:YES];
}

#pragma mark - 取消撤单
//-(void)cancelOperation:(UIButton *)sender{
-(void)cancelOperation:(UIButton *)sender{
    WEAK_SELF;
    NSAttributedString *message = [[NSAttributedString alloc] initWithString:@"是否取消一键撤单?\n" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17],NSForegroundColorAttributeName : RGB_COLOR(47, 47, 47)}];
    HBAlertViewController *alertVC = [HBAlertViewController alertControllerInfomation:[HBAlertInformation informationWithTitle:nil message:message preferredStyle:HBAlertControllerStyleMessage]];
    [alertVC addAction:[HBAlertAction actionWithTitle:@"取消撤单" style:HBAlertActionStyRedCancel handler:^() {
        STRONG_SELF;
        [self.tableView setEditing:NO animated:YES];
        [self loadData:NO];
        //取消后 开始刷新
        [[HBEventAttemperEngine sharedInstance] setValid:YES ForName:@"HBCancelOrderViewController"];
        
        self.tableView.tableFooterView = nil;
        if (self.hb_tradeViewController) {
             self.hb_tradeViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:_originalBackButton];
            [self scrollEnable:YES];
        }
        //隐藏底部toolView
        [self hideToolView];
        //清空删除数组
        [self.delArray removeAllObjects];
        //右侧按钮状态
        [self enableRightBarButton:YES];
        _rightBarButton.selected = NO; 
        //刷新表视图
        [self.tableView reloadData];
    }]];
    [alertVC addAction:[HBAlertAction actionWithTitle:@"继续撤单" style:HBAlertActionStyRedDefault handler:^() {
        
    }]];
    [alertVC showHBAlertViewControllerTarget:self completion:nil];
}
/** 是否允许滚动，enable：YES:允许滚动，NO：不允许滚动 */
- (void)scrollEnable:(BOOL)enable {
    self.hb_tradeViewController.scrollForbid = !enable;
    self.hb_tradeViewController.hb_banRightSliderGesture = !enable;
}

#pragma mark - 右导航按钮点击
- (void)selectMore:(UIButton *)sender{
    WEAK_SELF;
    if(!sender.isSelected) //点击全部撤单
    {
        [self scrollEnable:NO];
        sender.selected = !sender.selected;
        [self.tableView setEditing:!self.tableView.isEditing animated:YES];
        
        self.tableView.tableFooterView = self.footerView;
        self.hb_tradeViewController.navigationItem.leftBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:_leftBarButton]];
        
        [[HBEventAttemperEngine sharedInstance] setValid:NO ForName:@"HBCancelOrderViewController"];
        
        for(HBCancelOrdersModel *model in self.dataArray){
            model.show = YES;
            model.cancelTransactionBtnHidden = YES;
            model.hiddenBottonCancelBtns =YES;
        }
        
        //显示底部toolView
        [self showToolView];
        [self.tableView reloadData];
    }
    else //点击提交
    {
        NSAttributedString *message = [[NSAttributedString alloc] initWithString:@"是否提交一键撤单?\n" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17],NSForegroundColorAttributeName : RGB_COLOR(47, 47, 47)}];
        HBAlertViewController *alertVC = [HBAlertViewController alertControllerInfomation:[HBAlertInformation informationWithTitle:nil message:message preferredStyle:HBAlertControllerStyleMessage]];
        [alertVC addAction:[HBAlertAction actionWithTitle:@"取消提交" style:HBAlertActionStyRedCancel handler:^() {
            
        }]];
        [alertVC addAction:[HBAlertAction actionWithTitle:@"确定提交" style:HBAlertActionStyRedDefault handler:^() {
            //如果第一次 或者后台半小时之后 需要再次输入密码
            STRONG_SELF;
            if (([HBUserServer sharedInstance].userModel.tradePassword == nil || [[HBUserDefault getValueForKey:@"BgOver30Minutes"] isEqualToString:@"YES"])) {
                
                HBCheckTradePasswordVC *checkTradePasswordVC = [HBCheckTradePasswordVC createFromStoryboardWithStoryboardName:@"Main"];
                checkTradePasswordVC.passwordSucceedCallBackBlock = ^{
                    [weakSelf revokeAllEntrust:self.delArray];
                    NSLog(@"成功后回调");
                };
 
                [checkTradePasswordVC showCheckTradePasswordTarget:self];
            }
            else
            {
                [self revokeAllEntrust:self.delArray];
                
            }
        }]];
        [alertVC showHBAlertViewControllerTarget:self completion:nil];
        
    }
}

#pragma mark

-(void)performCancelOrderAction{
    
    [self.tableView setEditing:!self.tableView.isEditing animated:YES];
    _rightBarButton.selected = !_rightBarButton.isSelected;
    
    self.tableView.tableFooterView = nil;
    
    //隐藏底部toolView
    [self hideToolView];
    
    self.hb_tradeViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_originalBackButton];
    
    //开启定时器
    [[HBEventAttemperEngine sharedInstance] setValid:YES ForName:@"HBCancelOrderViewController"];
    
    for(HBCancelOrdersModel *model in self.dataArray){
        model.show = NO;
        model.cancelTransactionBtnHidden = NO;
    }
}
#pragma mark -显示工具栏
-(void)showToolView
{
    //全选标记置为否
    [self.toolView btnSelected:YES];
    [self selectAllRows:YES];
    self.toolView.hidden = NO;
    [UIView animateWithDuration:0.3 animations:^{
        CGFloat ypos=_toolView.frame.origin.y;
        ypos = self.view.height - BottomViewHeight;
        _toolView.frame = CGRectMake(0, ypos, KScreenWidth, BottomViewHeight);
    }];
}
#pragma mark -隐藏工具栏
-(void)hideToolView
{
    [UIView animateWithDuration:0.3 animations:^{
        CGFloat ypos = _toolView.frame.origin.y;
        ypos = KScreenHeight;
        _toolView.frame=CGRectMake(0, ypos, KScreenWidth, BottomViewHeight);
    }completion:^(BOOL finished) {
        _toolView.hidden=YES;
    }];
}


//撤单再下单弹窗
- (void)showCancelAndBuyAlertWithModel:(HBCancelOrdersModel *)model okCallback:(void(^)())okCallback cancelCallback:(void(^)())cancelCallback{
    NSString *titleStr;
    NSString *titleMessageStr;
    if (model.entrustType==HBEntrustTypeBuy||model.entrustType==HBEntrustTypeAfterBuy) {
        titleStr =@"撤单再买入确认";
        titleMessageStr=@"是否需要撤单再买入？";
    }else if (model.entrustType==HBEntrustTypeSell||model.entrustType==HBEntrustTypeaAfterSell){
        titleStr =@"撤单再卖出确认";
        titleMessageStr=@"是否需要撤单再卖出？";
    }
    NSAttributedString *title = [[NSAttributedString alloc] initWithString:titleStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:RGB_COLOR(47, 47, 47)}];
    NSAttributedString *message = [[NSAttributedString alloc] initWithString:titleMessageStr attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor hb_colorWithHexString:@"4A4A4A" alpha:1]}];
    HBAlertInformation *alertInformatin = [HBAlertInformation informationWithTitle:title message:message preferredStyle:HBAlertControllerStylePithyMessage];
    HBAlertViewController *alertVC = [HBAlertViewController alertControllerInfomation:alertInformatin];
    [alertVC addAction:[HBAlertAction actionWithTitle:@"再考虑下" style:HBAlertActionStyleCancel handler:^{
        if (cancelCallback) {
            cancelCallback();
        }
    }]];
    [alertVC addAction:[HBAlertAction actionWithTitle:@"确认" style:HBAlertActionStyleDefault handler:^{
        if (okCallback) {
            okCallback();
        }
    }]];
    [alertVC showHBAlertViewControllerTarget:self completion:nil];
}
//撤单再买卖 交易密码验证流程
- (void)cancelAndBuyWithCheckTradePasswordWithModel:(HBCancelOrdersModel *)model{
    WEAK_SELF;
    HBCheckTradePasswordVC *checkTradePasswordVC = [HBCheckTradePasswordVC createFromStoryboardWithStoryboardName:@"Main"];
    checkTradePasswordVC.passwordSucceedCallBackBlock = ^{
        STRONG_SELF;
        [self cancelAndBuyWithRevokeEntrust:model successCallback:^{
            HBTradeInfoModel * tradeModel = [[HBTradeInfoModel alloc]init];
            if (model.entrustType==HBEntrustTypeBuy) {
                tradeModel.transactionBehaviourType =HBTradeBehaviour_Buy;
            }else if (model.entrustType==HBEntrustTypeSell){
                tradeModel.transactionBehaviourType =HBTradeBehaviour_Sell;
            }
            tradeModel.tradeProductType = HBTrade_Stock;
            tradeModel.name =model.name;
            tradeModel.code =model.code;
            tradeModel.exchange =model.exchange;
            tradeModel.securityType =[NSString stringWithFormat:@"%d",(int)model.securityType];
            HBTradeViewController * tradeVC = [HBTradeViewController tradeModel:tradeModel tradeType:HBTrade_Stock tradeBehaviour:tradeModel.transactionBehaviourType];
            [self.hb_tradeViewController.navigationController pushViewController:tradeVC animated:NO];
        }];
    };
    
    [checkTradePasswordVC showCheckTradePasswordTarget:self];
}
// 撤单再买卖 撤单接口调用流程
- (void)cancelAndBuyWithRevokeEntrust:(HBCancelOrdersModel *)model successCallback:(void(^)())successCallback{
    [HBPromptProgressHUD showHUDMessage:@"撤单中"];
    WEAK_SELF;
    
    [self.tdxInterface revokingBytdxBusinessType:HBTDXTransactionRevoking account:model.account entrustCode:model.entrustCode code:model.code exchange:model.exchange entrustTypeInt:model.entrustTypeInt callBackBlock:^(HBTDXNetworkResponse * _Nullable response, NSError * _Nullable error) {
        STRONG_SELF;
        [HBPromptProgressHUD hideHUD];
        if (error == nil) {
              [self getData];
              [self.tableView reloadData];
              if (successCallback) {
                  successCallback();
                  [HBPromptAlertView alertMessage:@"该委托已经成功申请撤单"];
              }
        }else{
            [HBPromptAlertView alertMessage:error.domain];
        }
    }];
    
//    [self.orderInterface revokeEntrustCode:model.entrustCode completionBlock:^(HBNetworkResponse *reponseStatus) {
//        STRONG_SELF;
//        [HBPromptProgressHUD hideHUD];
//        if(reponseStatus != nil){
//            if (reponseStatus.result.integerValue == 1){
//                [self getData];
//                [self.tableView reloadData];
//                if (successCallback) {
//                    successCallback();
//                    [HBPromptAlertView alertMessage:@"撤单成功"];
//                }
//            }else{
//                [HBPromptAlertView alertMessage:reponseStatus.message];
//            }
//        }
//    }];
}
//立即撤单交易密码验证流程
-(void)CheckTradePasswordWithModel:(HBCancelOrdersModel *)model{
    WEAK_SELF;
    HBCheckTradePasswordVC *checkTradePasswordVC = [HBCheckTradePasswordVC createFromStoryboardWithStoryboardName:@"Main"];
    checkTradePasswordVC.passwordSucceedCallBackBlock = ^{
        STRONG_SELF;
        [self showAlert:model];
    };

    [checkTradePasswordVC showCheckTradePasswordTarget:self];
}

// 多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    HBCancelOrdersModel *model = self.dataArray[indexPath.row];
    if (model.hiddenBottonCancelBtns||model.entrustResultCode==HBTransactionStatecancellationsing) {
        return 140;
    }else{
        return 185+11.5;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"HBNewCancelOrderCell";
    HBNewCancelOrderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[HBNewCancelOrderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        [cell selectionCellStyle];
    }
    
    WEAK_SELF;
    // 2:给模型
    HBCancelOrdersModel *model = self.dataArray[indexPath.row];
    cell.model = model;

    cell.cancelAndBuyCallback = ^{
        STRONG_SELF;
        if(model.entrustType==HBEntrustTypeBuy||model.entrustType==HBEntrustTypeSell||
           model.entrustType==HBEntrustTypeAfterBuy||model.entrustType==HBEntrustTypeaAfterSell){
            [self showCancelAndBuyAlertWithModel:model okCallback:^{
                [self cancelAndBuyWithCheckTradePasswordWithModel:model];
                
            } cancelCallback:nil];
        }
    };
    cell.cancelAndNowCallback = ^{
        STRONG_SELF;
        //撤单埋点
        [HBUMobClick commonTrans_CancelSubmit];
        [self CheckTradePasswordWithModel:model];
    };
    cell.onlyCancelAndNowCallback = ^{
        //撤单埋点
        [HBUMobClick commonTrans_CancelSubmit];
        [self CheckTradePasswordWithModel:model];
    };
    self.cell = cell;
    return cell;
}


//编辑样式
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleNone;
}

//移动
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //交换数据
    [self.dataArray exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    
}

//选中时执行的逻辑
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.tableView.isEditing){
        HBCancelOrdersModel *model = self.dataArray[indexPath.row];

        model.selected == YES ?(model.selected = NO) : (model.selected = YES);
        
        [self.delArray containsObject:model] ? [self.delArray removeObject:model] : [self.delArray addObject:model];

        [self.toolView btnSelected:(self.delArray.count==self.dataArray.count)];
        //刷新删除数Lb
        [self refreshDeleteCountLb];
    }
}
#pragma mark 确认框
- (void)showAlert:(HBCancelOrdersModel *)model
{
    WEAK_SELF;
    NSAttributedString *message = [[NSAttributedString alloc] initWithString:@"确认撤销此笔委托单?\n" attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:17],NSForegroundColorAttributeName : RGB_COLOR(47, 47, 47)}];
    HBAlertViewController *alertVC = [HBAlertViewController alertControllerInfomation:[HBAlertInformation informationWithTitle:nil message:message preferredStyle:HBAlertControllerStyleMessage]];
    [alertVC addAction:[HBAlertAction actionWithTitle:@"取消" style:HBAlertActionStyRedCancel handler:^() {
        
    }]];
    [alertVC addAction:[HBAlertAction actionWithTitle:@"确认撤单" style:HBAlertActionStyRedDefault handler:^() {
        STRONG_SELF;
        [self revokeEntrust:model];
    }]];
    [alertVC showHBAlertViewControllerTarget:self completion:nil];
    
}

-(void)backButtonPress
{
    [self.hb_tradeViewController.navigationController popViewControllerAnimated:YES];
}
#pragma mark 撤单
- (void)revokeEntrust:(HBCancelOrdersModel *)model
{
    WEAK_SELF;

    [self.tdxInterface revokingBytdxBusinessType:HBTDXTransactionRevoking account:model.account entrustCode:model.entrustCode code:model.code exchange:model.exchange entrustTypeInt:model.entrustTypeInt callBackBlock:^(HBTDXNetworkResponse * _Nullable response, NSError * _Nullable error) {
        STRONG_SELF;
        if (error == nil) {
            [HBPromptAlertView alertMessage:@"该委托已经成功申请撤单"];
            [self getData];

            [self.tableView reloadData];
        }else{
            [HBPromptAlertView alertMessage:error.domain];
        }
    }];
    
//    [self.orderInterface revokeEntrustCode:model.entrustCode completionBlock:^(HBNetworkResponse *reponseStatus) {
//        STRONG_SELF;
//        if(reponseStatus != nil){
//            if (reponseStatus.result.integerValue == 1){
//                [HBPromptAlertView alertMessage:@"该委托已经成功申请撤单"];
//                [self getData];
//
//                [self.tableView reloadData];
//            }else
//            {
//                [HBPromptAlertView alertMessage:reponseStatus.message];
//            }
//        }
//
//
//    }];
}
#pragma mark 撤单
- (void)revokeAllEntrust:(NSArray <HBCancelOrdersModel *>*)modelArray
{
//    [HBPromptProgressHUD showHUDMessage:@"撤单中..."];
//    NSMutableArray *entrustCodes = [NSMutableArray array];
//
//    for (HBCancelOrdersModel *model in modelArray) {
//        [entrustCodes addObject:model.entrustCode];
//    }
//    WEAK_SELF;
//    [self.orderInterface revokeAllEntrustCode:entrustCodes.copy completionBlock:^(HBNetworkResponse *reponseStatus, NSError *error1) {
//        STRONG_SELF;
//        [HBPromptProgressHUD hideHUD];
//        if (error1 == nil) {
//            [self scrollEnable:YES];
//            //执行删除
//            [self performCancelOrderAction];
//            [self.dataArray removeObjectsInArray:self.delArray];
//            [self loadData:NO];
//            //清空删除数组
//            [self.delArray removeAllObjects];
//
//        }
//
//    }];;
    WEAK_SELF;
 
    [HBPromptProgressHUD showHUDMessage:@"撤单中..."];
    __block  NSMutableArray<HBCancelOrdersModel *> *array = [NSMutableArray array];
    for (int i= 0; i < modelArray.count; i++) {
        [NSThread sleepForTimeInterval:0.2];
        HBCancelOrdersModel *model = [modelArray safeObjectAtIndex:i];
        [self.tdxInterface revokingBytdxBusinessType:HBTDXTransactionRevoking account:model.account entrustCode:model.entrustCode code:model.code exchange:model.exchange entrustTypeInt:model.entrustTypeInt callBackBlock:^(HBTDXNetworkResponse * _Nullable response, NSError * _Nullable error) {
               STRONG_SELF;
               if (error == nil) {
                   NSLog(@"i = %d,成功",i);
               }else{
                   NSLog(@"i = %d,失败",i);
                   [array addObject:model];
               }
            if (i == (modelArray.count - 1)) {
                if (array.count <=0) {
                    [HBPromptProgressHUD hideHUD];
                     [self scrollEnable:YES];
                      //执行删除
                      [self performCancelOrderAction];
                      [self.dataArray removeObjectsInArray:self.delArray];
                      [self loadData:NO];
                      //清空删除数组
                      [self.delArray removeAllObjects];
                     [self.tableView reloadData];
                     [HBPromptAlertView alertMessage:@"全部撤单申请成功"];

                }else{
                    [self againRevoking:array];
                    NSLog(@"第二次开始");

                }
            }
           }];
    }

    
}
- (void)againRevoking:(NSArray *)againArray{
    WEAK_SELF;
   __block  NSMutableArray<HBCancelOrdersModel *> *array = [NSMutableArray array];
    for (int i= 0; i < againArray.count; i++) {
        [NSThread sleepForTimeInterval:0.2];
        HBCancelOrdersModel *model = [againArray safeObjectAtIndex:i];
        [self.tdxInterface revokingBytdxBusinessType:HBTDXTransactionRevoking account:model.account entrustCode:model.entrustCode code:model.code exchange:model.exchange entrustTypeInt:model.entrustTypeInt callBackBlock:^(HBTDXNetworkResponse * _Nullable response, NSError * _Nullable error) {
            [HBPromptProgressHUD hideHUD];

               STRONG_SELF;
               if (error == nil) {
                   NSLog(@"i = %d,成功",i);
               }else{
                   NSLog(@"i = %d,失败",i);
                   [array addObject:model];
               }
            if (i == (againArray.count - 1)) {
                if (array.count <=0) {
                    [HBPromptAlertView alertMessage:@"全部撤单申请成功"];
                }else{
                    [HBPromptAlertView alertMessage:@"部分撤单申请失败"];
                }
              [self scrollEnable:YES];
              //执行删除
              [self performCancelOrderAction];
              [self.dataArray removeObjectsInArray:self.delArray];
              //清空删除数组
              [self.delArray removeAllObjects];
              [self.tableView reloadData];

              [self loadData:NO];

            }
           }];
    } 

}
#pragma mark timer
-(void)timeToRefresh {
    
    //在刷新时间段才刷新
    if ([self stockInfoGetIsValidRefresh]) {
        WEAK_SELF;
        [[HBEventAttemperEngine sharedInstance] registerAction:^{
            STRONG_SELF;
            [self getData];
            
        } timer:(int)[self timeIntervalRefreshCount] name:@"HBCancelOrderViewController"];
        
    }
}


- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
