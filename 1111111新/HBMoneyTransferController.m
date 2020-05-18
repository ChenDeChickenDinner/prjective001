//
//  HBMoneyTransferController.m
//  HBStockWarning
//
//  Created by xs on 2017/9/15.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "HBMoneyTransferController.h"

#import "HBMoneyMangeConfirmView.h"
#import "HBKeyboard.h"
#import "HBWebViewController.h"
#import "HBTDXWebCallBankInterface.h"

@interface HBMoneyTransferController ()<UITextFieldDelegate,HBKeyboardDelegate>

/* 转出账户 */
@property (weak, nonatomic) IBOutlet UIButton *transferOutAccountBtn;

/* 转出账户可用金额 */
@property (weak, nonatomic) IBOutlet UIButton *availableAmountBtn;


/* 转入账户 */
@property (weak, nonatomic) IBOutlet UIButton *transferInAccountBtn;

/* 转账金额 */
@property (weak, nonatomic) IBOutlet UITextField *transferAmountTextField;
@property (weak, nonatomic) IBOutlet UIButton *transferBtn;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineA;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineB;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineC;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *lineD;

/**
 界面数据模型
 */
@property (nonatomic, strong)  HBMoneyTransferModel *transferModel;


/**
 转出可选账户列表
 */
@property (nonatomic, strong) NSMutableArray *dataArrayOut;
@property (nonatomic, strong) HBMoneyMangeConfirmView *alertView;



/**
 转入可选账户列表
 */
@property (nonatomic, strong) NSMutableArray *dataArrayIn;


@property (nonatomic, strong) HBMoneyManageInterface *interface;

@property (nonatomic, strong) HBTDXWebCallBankInterface *tdxInterface;

@end

@implementation HBMoneyTransferController
- (HBTDXWebCallBankInterface *)tdxInterface{
    if (!_tdxInterface) {
        _tdxInterface = [[HBTDXWebCallBankInterface alloc]init];
    }
    return _tdxInterface;
}
- (IBAction)tipViewClick:(UIButton *)sender {

    HBWebViewController *question = [[HBWebViewController alloc] init];
    question.urlString = @"https://gupiao.touker.com/stock/answer/223";
    [self.navigationController pushViewController:question animated:YES];

}

- (HBMoneyManageInterface *)interface{
    if (!_interface) {
        _interface = [HBMoneyManageInterface interfaceWithOperationManager:self.operationManager];
    }
    return _interface;
}


- (HBMoneyMangeConfirmView *)alertViewInit{
    _alertView = [HBMoneyMangeConfirmView viewWithNibField];

    WEAK_SELF;
    _alertView.cancel = ^{
        STRONG_SELF;
        [self.alertView removeFromSuperview];
        self.alertView = nil;
    };

    _alertView.confirm = ^{
        STRONG_SELF;
        [self transferToInAccount];
        [self.alertView removeFromSuperview];
        self.alertView = nil;

    };
    NSString *outAccount = [NSString stringWithFormat:@"转出: %@%@%@",self.transferModel.outAccount.bankBrief,self.transferModel.outAccount.capitalAccount,self.transferModel.outAccount.accountType == HBMoneyManageMainAccount?@"(主)":@"(辅)"];
    NSString *inAccount = [NSString stringWithFormat:@"转入: %@%@%@",self.transferModel.inAccount.bankBrief,self.transferModel.inAccount.capitalAccount,self.transferModel.inAccount.accountType == HBMoneyManageMainAccount?@"(主)":@"(辅)"];
    _alertView.outAccountStr = outAccount;
    _alertView.inAccountStr = inAccount;
    _alertView.money =self.transferModel.transferAmount;
    return _alertView;
}
- (HBMoneyTransferModel *)transferModel{
    if (_transferModel == nil) {
        _transferModel = [[HBMoneyTransferModel alloc]init];
    }
    return _transferModel;
}
- (NSMutableArray *)dataArrayOut{
    if (!_dataArrayOut) {
        _dataArrayOut = [NSMutableArray array];
    }
    return _dataArrayOut;
}
- (NSMutableArray *)dataArrayIn{
    if (!_dataArrayIn) {
        _dataArrayIn = [NSMutableArray array];
    }
    return _dataArrayIn;
}


/**
 传递过来的账户列表
 */
- (void)sendAccountListArray:(NSMutableArray<HBMoneyManageAccountSubModel *>  *)countArray{


    for (HBMoneyManageAccountSubModel *model in countArray) {
        HBMoneyManageAccountSubModel *newModel=  [HBMoneyManageAccountSubModel modelWithModel:model];
        [self.dataArrayOut addObject:newModel];
    }

    for (HBMoneyManageAccountSubModel *model in countArray) {
        HBMoneyManageAccountSubModel *newModel=  [HBMoneyManageAccountSubModel modelWithModel:model];
        [self.dataArrayIn addObject:newModel];
    }


}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppearWithWhiteNavigationBar:animated];
}
- (void)viewDidLoad {
    [super viewDidLoadWithWhiteNavigationBar];
    self.title = @"资金划转";

    self.lineA.constant = 0.5;
    self.lineB.constant = 0.5;
    self.lineC.constant = 0.5;
    self.lineD.constant = 0.5;
    self.transferBtn.layer.masksToBounds = YES;
    self.transferBtn.layer.cornerRadius = 5.0;

    
    HBKeyboard *keyBoard = [[HBKeyboard alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 260) type:HBCustomKeyBoardTypePrice];
    keyBoard.maxInputDotNumber  = 2;
    keyBoard.delegate = self;
    keyBoard.textField = self.transferAmountTextField;


    self.transferAmountTextField.delegate = self;
    if (@available(iOS 13.0, *)) {
    }else{
        [self.transferAmountTextField setValue:HBColor(153, 153, 153) forKeyPath:@"_placeholderLabel.textColor"];
    }

    self.transferOutAccountBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.transferInAccountBtn.titleLabel.adjustsFontSizeToFitWidth = YES;

    [self setDataWithTransferModel];

}

/**
 转出账户选择
 */
- (IBAction)chooseTransferOutAccount:(UIButton *)sender {

    [self chooseTransferWithOperationList:self.dataArrayOut withTitleStr:@"选择转出账户"];

}
/**
 转入账户选择
 */
- (IBAction)chooseTransferInAccount:(UIButton *)sender {
    [self chooseTransferWithOperationList:self.dataArrayIn withTitleStr:@"选择转入账户"];

}


/**
 选择账户操作
 */
- (void)chooseTransferWithOperationList:(NSMutableArray *)list withTitleStr:(NSString *)str{

    // 1:弹出选择列表
    HBAlertViewController * bankListAlertVC = [HBAlertViewController alertControllerInfomation:[HBAlertInformation informationWithTitle:[[NSAttributedString alloc]initWithString:str] message:nil preferredStyle:HBAlertControllerStyleActionSheet]];
    WEAK_SELF;
    [list enumerateObjectsUsingBlock:^(HBMoneyManageAccountSubModel* _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {


        HBAlertAction *action = [HBAlertAction actionWithTitle:obj.bankBrief icon:obj.iconUrl style:HBAlertActionStyleDefault handler:^{
            STRONG_SELF;


            // 选中的坐选中操作
            obj.isSelected = YES;

            // 全部选中状态清空
            for (HBMoneyManageAccountSubModel *model in list) {
                if (model != obj) model.isSelected = NO;
            }

            // 选择确认模型赋值
            if (list == self.dataArrayOut) {
                self.transferModel.outAccount = obj;
            }else if(list == self.dataArrayIn){
                self.transferModel.inAccount = obj;
            }

            // 3:一主一副交互处理
            if ([self isOneMainOneAuxiliaryAccount]) {

                // 若当前操作的是转出列表，则循环转入列表，将不同的账户赋值到主模型，再将转入列表的模型算中状态 更新

                NSMutableArray *enumerateArray = list == self.dataArrayOut?self.dataArrayIn:self.dataArrayOut;

                for(HBMoneyManageAccountSubModel *model in enumerateArray) {

                    // 1:清空循环的列表模型的选中状态
                    model.isSelected = NO;


                    // 当循环到此账户与选中账户为不同类型 则拿次账户信息操作
                    if (model.accountType != obj.accountType) {
                        model.isSelected = YES;

                        if (list == self.dataArrayOut) {
                            // 当前操作的是转出列表 ，则给转入赋值
                            self.transferModel.inAccount = model;

                        }else if(list == self.dataArrayIn){
                            // 当前操作的是入列表 ，则给转出赋值
                            self.transferModel.outAccount = model;

                        }

                    }
                }

            }

            // 4:UI设置
            [self setDataWithTransferModel];

        }];
        action.isSelected = obj.isSelected;
        
        [bankListAlertVC addAction:action];
    }];
    [bankListAlertVC showHBAlertViewControllerTarget:self completion:nil];

}


/**
 判断是否只有 一主一副
 */
- (BOOL)isOneMainOneAuxiliaryAccount{
    if (self.dataArrayOut.count == 2) {
        HBMoneyManageAccountSubModel *modelA = self.dataArrayOut.firstObject;
        HBMoneyManageAccountSubModel *modelB = self.dataArrayOut.lastObject;

        if (modelA.accountType == HBMoneyManageMainAccount && modelB.accountType == HBMoneyManageAuxiliaryAccount ) {
            return YES;

        }else if (modelB.accountType == HBMoneyManageMainAccount && modelA.accountType == HBMoneyManageAuxiliaryAccount){
            return YES;
        }
    }


    return NO;
}


/**
 划转金额编辑结束
 */
- (void)textFieldDidEndEditing:(UITextField *)textField{

    if (textField.text.doubleValue > 0) {
        self.transferModel.transferAmount = [NSString stringWithFormat:@"%.2f",textField.text.doubleValue];
    }else{
        self.transferModel.transferAmount = nil;
    }
    [self setDataWithTransferModel];

}





/**
 整体UI布局
 */
- (void)setDataWithTransferModel{


    if (self.transferModel.outAccount) {
        NSString *imageName  = self.transferModel.outAccount.accountType == HBMoneyManageAuxiliaryAccount?@"HBMoney_ AuxiliaryAccountTitle":@"HBMoney_ MainAccountTitle";

        NSString *accountName = [NSString stringWithFormat:@"%@%@",self.transferModel.outAccount.bankBrief,self.transferModel.outAccount.capitalAccount];
        [self.transferOutAccountBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self.transferOutAccountBtn setTitle:accountName forState:UIControlStateNormal];
        [self.transferOutAccountBtn setTitleColor:HBColor(47, 47, 47) forState:UIControlStateNormal];
        self.transferOutAccountBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

        [self.availableAmountBtn setTitle:self.transferModel.outAccount.convertibleAmountStr forState:UIControlStateNormal];

    }else{
        [self.transferOutAccountBtn setImage:nil forState:UIControlStateNormal];
        [self.transferOutAccountBtn setTitle:@"请选择转出帐户" forState:UIControlStateNormal];
        [self.transferOutAccountBtn setTitleColor:HBColor(153, 153, 153) forState:UIControlStateNormal];
        self.transferOutAccountBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);

        [self.availableAmountBtn setTitle:@"- -" forState:UIControlStateNormal];

    }

    if (self.transferModel.inAccount) {
        NSString *imageName  = self.transferModel.inAccount.accountType == HBMoneyManageAuxiliaryAccount?@"HBMoney_ AuxiliaryAccountTitle":@"HBMoney_ MainAccountTitle";

        NSString *accountName = [NSString stringWithFormat:@"%@%@",self.transferModel.inAccount.bankBrief,self.transferModel.inAccount.capitalAccount];
        [self.transferInAccountBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        [self.transferInAccountBtn setTitle:accountName forState:UIControlStateNormal];
        [self.transferInAccountBtn setTitleColor:HBColor(47, 47, 47) forState:UIControlStateNormal];
        self.transferInAccountBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);

    }else{
        [self.transferInAccountBtn setImage:nil forState:UIControlStateNormal];
        [self.transferInAccountBtn setTitle:@"请选择转入帐户" forState:UIControlStateNormal];
        [self.transferInAccountBtn setTitleColor:HBColor(153, 153, 153) forState:UIControlStateNormal];
        self.transferInAccountBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);

    }


    self.transferAmountTextField.text = self.transferModel.transferAmount?self.transferModel.transferAmount:nil;


    // 校验划转按钮是否可以点击
    [self checkTransferbtn];

}


/**
 校验划转按钮是否可以点击
 */
- (void)checkTransferbtn{
    NSString *outAccount = self.transferModel.outAccount.capitalAccount;
    NSString *convertibleAmountStr = self.transferModel.outAccount.convertibleAmountStr;
    NSString *inAccount = self.transferModel.inAccount.capitalAccount;
    NSString *transferAmount = self.transferModel.transferAmount;

    if (outAccount && convertibleAmountStr.doubleValue > 0 && inAccount && transferAmount) {
        self.transferBtn.alpha = 1.0;
        self.transferBtn.userInteractionEnabled = YES;
    }else{
        self.transferBtn.alpha = 0.5;
        self.transferBtn.userInteractionEnabled = NO;
    }

}
/**
 校验是否可以发送划转请求
 */
- (BOOL)checkTransferRequest{

    // 1:验证二个账户是否相同
    if ([self.transferModel.outAccount.capitalAccount isEqualToString:self.transferModel.inAccount.capitalAccount]) {

        [HBPromptAlertView alertMessage:@"账户选择重复"];
        return NO;
    }

    // 2:验证二个账户是不是都是 辅资金账户
    if (self.transferModel.outAccount.accountType == HBMoneyManageAuxiliaryAccount && self.transferModel.inAccount.accountType == HBMoneyManageAuxiliaryAccount) {
        [HBPromptAlertView alertMessage:@"辅资金账户间不可相互划转"];
        return NO;
    }

    // 3:验证划转金额是否合法 最大值
    if (self.transferModel.transferAmount.doubleValue > self.transferModel.outAccount.convertibleAmountStr.doubleValue) {

        [HBPromptAlertView alertMessage:@"超过可用资金"];

        return NO;

    }
    
    return YES;
}
/**
 划转请求弹窗确认
 */
- (IBAction)transferRequest:(UIButton *)sender {

    [self.view endEditing:YES];

    // 1:验证参数是否合法，弹窗再次确定
    if ([self checkTransferRequest]) {
        [HBAlertViewController showHBAlertView:[self alertViewInit] target:self completion:nil];
    }


}


/**
 划转请求
 股东代码是必传的吗，如果是必传的 ，是不是只要是这个客户随便的一个股东账号就行 ？
 */
- (void)transferToInAccount{
    [HBPromptProgressHUD showHUDAddedTo:self.view message:nil];
    WEAK_SELF;
    [self.tdxInterface transferDepositoryAccountTransferOutAccount:self.transferModel.outAccount.capitalAccount inAccount:self.transferModel.inAccount.capitalAccount mainAccount:nil transferAmount:self.transferModel.transferAmount transferType:HBTDXCallTypeMoneyTransfer callBackBlock:^(HBTDXNetworkResponse *_Nullable response,NSError * _Nullable error) {
         STRONG_SELF;
         [HBPromptProgressHUD hideHUDForView:self.view];
         if (!error) {
             NSArray<HBTDXTransferResultsModel *> *listModel = [HBTDXTransferResultsModel mj_objectArrayWithKeyValuesArray:response.dictArray];
             [self successful:listModel.firstObject.abossMessage transferType:HBMoneyTransferDelivery];
         }else{
             [self failure:error.domain transferType:HBMoneyTransferDelivery];
         }
     }];
    
    
//    NSMutableArray *array = [NSMutableArray arrayWithObject:self.transferModel.outAccount.capitalAccount];

//
 
//    [self.interface transferDepositoryAccountTransferOutAccount:array transferInAccount:self.transferModel.inAccount.capitalAccount transferAmount:self.transferModel.transferAmount transferType:@"1" completion:^(HBMoneyTransferResultsModel *resultsModel, NSError *error) {
//        STRONG_SELF;
//        [HBPromptProgressHUD hideHUDForView:self.view];
//
//        if (error == nil) {
//
//            [self moneyCollectionResults:resultsModel andTransferType:HBMoneyTransferDelivery];
//
//        }
//
//    }];

 
}

@end
