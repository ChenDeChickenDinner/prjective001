//
//  HBStockWarning
//
//  Created by hulailn on 16/8/12.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import "HBNewCancelOrderCell.h"


@interface HBNewCancelOrderCell()

@property (weak, nonatomic) IBOutlet UILabel *name;
/** code.市场 */
@property (weak, nonatomic) IBOutlet UILabel *exchangeMarket;
/** 反向 */
@property (weak, nonatomic) IBOutlet UIButton *transactionDirction;
/** 价格 */
@property (weak, nonatomic) IBOutlet UILabel *price;

/** 数量 */
@property (weak, nonatomic) IBOutlet UILabel *number;
/** 时间 */
@property (weak, nonatomic) IBOutlet UILabel *time;
/** 成交状态 */
@property (weak, nonatomic) IBOutlet UILabel *status;
@property (weak, nonatomic) IBOutlet UIButton *cancelTransactionBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *numberPriceDistance; //数量和价格之间的距离,屏幕不同,距离有别
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *edgeDistance;

@end


@implementation HBNewCancelOrderCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

    self.price.adjustsFontSizeToFitWidth = YES;
    
    if (ISIPHONE4_7 || ISIPHONE3_5) {
        _numberPriceDistance.constant = 10;
    }
    //选择按钮
    self.selectBtn=[[UIButton alloc]initWithFrame:CGRectMake(-20, 0, 20, 140)];
    [self.selectBtn setImage:[UIImage imageNamed:@"assets_unchosen"] forState:UIControlStateNormal];
    [self.selectBtn setImage:[UIImage imageNamed:@"assets_chosen_red"] forState:UIControlStateSelected];
    self.selectBtn.imageView.contentMode = UIViewContentModeCenter;
    [self.contentView addSubview:self.selectBtn];
    //默认隐藏
    self.selectBtn.hidden=NO;
    
    self.cancelTransactionBtn.layer.borderColor = [UIColor colorWithHexString:@"4883F6"].CGColor;
    [self.cancelTransactionBtn setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor] size:CGSizeMake(50, 25)] forState:UIControlStateNormal];
    [self.cancelTransactionBtn setTitleColor:[UIColor colorWithHexString:@"4883F6"] forState:UIControlStateNormal];
    
    [self.cancelTransactionBtn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"4883F6"] size:CGSizeMake(50, 25)] forState:UIControlStateHighlighted];
    [self.cancelTransactionBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
   
 
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    self.transactionDirction.layer.cornerRadius = self.transactionDirction.height/2;
    for(UIView* view in self.subviews)
    {
        if([[[view class] description] isEqualToString:@"UITableViewCellReorderControl"])
        {
            [view removeFromSuperview];
        }
    }
}
+ (void)registerNibToTableView:(UITableView *)tableView
{
    [tableView registerNib:[UINib nibWithNibName:@"HBNewCancelOrderCell" bundle:nil]  forCellReuseIdentifier:NSStringFromClass([HBNewCancelOrderCell class])];
    
}

/**
 显示文字和颜色
 
 @param text  文字
 @param color color
 */
- (void)transactionText:(NSString *)text color:(UIColor *)color {
    [self.transactionDirction setTitle:text forState:UIControlStateNormal];
    self.transactionDirction.layer.borderColor = color.CGColor;
    self.transactionDirction.layer.borderWidth = 1.0;
    [self.transactionDirction setTitleColor:color forState:UIControlStateNormal];
    
}

- (void)setModel:(HBCancelOrdersModel *)model{
    if (model.entrustType==HBEntrustTypeBuy|| model.entrustType==HBEntrustTypeAfterBuy) {
        [self.cancelAndBuyBtn setTitle:@"撤单再买入" forState:UIControlStateNormal];
    }else if (model.entrustType==HBEntrustTypeSell|| model.entrustType==HBEntrustTypeaAfterSell){
        [self.cancelAndBuyBtn setTitle:@"撤单再卖出" forState:UIControlStateNormal];
    }
    
    
    
    
    if (model.entrustType==HBEntrustTypeBuy||model.entrustType==HBEntrustTypeSell||
        model.entrustType==HBEntrustTypeAfterBuy||model.entrustType==HBEntrustTypeaAfterSell) {
        self.onlyCancelAndBuyBtn.hidden =YES;
        self.cancelAndBuyBtn.hidden =NO;
        self.cancelAndNow.hidden =NO;
        self.verLineView.hidden =NO;
    }else{
        self.onlyCancelAndBuyBtn.hidden =NO;
        self.cancelAndBuyBtn.hidden =YES;
        self.cancelAndNow.hidden =YES;
        self.verLineView.hidden =YES;
    }
    if(model.entrustResultCode==HBTransactionStatecancellationsing){
        model.hiddenBottonCancelBtns =YES;
    }
    if (model.hiddenBottonCancelBtns) {
        self.onlyCancelAndBuyBtn.hidden =YES;
        self.cancelAndBuyBtn.hidden =YES;
        self.cancelAndNow.hidden =YES;
    }
    _model = model;
        
    
    self.price.text = [NSString stringWithFormat:@"委托价格：%@元",[HBUIFactory transitionDecimal:model.entrustPrice securityType:model.securityType exchange:model.exchange]] ;

    
    if (model.entrustNumberTdx) {
        if(model.securityType == HBSecurityStateBond){
            if ([model.exchange.lowercaseString isEqualToString:@"sz"]) {
              self.number.text = [NSString stringWithFormat:@"委托数量：%@张",HBUIFactoryNilValueDescription(model.entrustNumberTdx.description)];
            }else{
              self.number.text = [NSString stringWithFormat:@"委托数量：%@手",HBUIFactoryNilValueDescription(model.entrustNumberTdx.description)];
            }
        }else{
            self.number.text = [NSString stringWithFormat:@"委托数量：%@股",HBUIFactoryNilValueDescription(model.entrustNumberTdx.description)];
        }
    }else{
        if (model.entrustType == HBEntrustStateReverserepos || model.entrustType == HBEntrustTypeSecuritiesLoan) {
            NSString *str = [HBFormatter formatDebtExchange:model.exchange.uppercaseString number:@(model.entrustAmount.floatValue)];
            self.number.text = [NSString stringWithFormat:@"委托金额：%@元",str];
        }else if(model.securityType == HBSecurityStateBond){
            if ([model.exchange.lowercaseString isEqualToString:@"sz"]) {
              self.number.text = [NSString stringWithFormat:@"委托数量：%@张",HBUIFactoryNilValueDescription(model.entrustAmount.description)];
            }else{
              self.number.text = [NSString stringWithFormat:@"委托数量：%@手",HBUIFactoryNilValueDescription(model.entrustAmount.description)];
            }
        }else{
            self.number.text = [NSString stringWithFormat:@"委托数量：%@股",HBUIFactoryNilValueDescription(model.entrustAmount.description)];
        }
        
    }



    self.time.text = [NSString stringWithFormat:@"委托时间：%@",model.entrustTimeTdx];
        
   
    self.name.text = model.name;
    
    self.exchangeMarket.text = [NSString stringWithFormat:@"%@.%@",model.code,model.exchange.uppercaseString];
    
//    [self transactionText:model.entrustResultMsg color:nil];
    
    
    if(model.entrustType == HBEntrustTypeBuy){
        [self transactionText:@"买入" color:TextColorRaise];
    }else  if (model.entrustType == HBEntrustTypeSell){
        [self transactionText:@"卖出" color:TextColorSuspension];
    }else if (model.entrustType == HBEntrustTypeDistributeNumber){
        [self transactionText:@"新股申购" color:C_blue01Color];
    }else if (model.entrustType == HBEntrustTypeRationNumber){
        [self transactionText:@"配售申购" color:C_blue01Color];
    }else  if (model.entrustType == HBEntrustStateFundSubscribe){
        [self transactionText:@"场内申购" color:TextColorFundTransaction];
    }else if (model.entrustType == HBEntrustStateFundRedemption){
        [self transactionText:@"场内赎回" color:TextColorFundTransaction];
    }else if (model.entrustType == HBEntruststateFundSplit){
        [self transactionText:@"分拆盲拆" color:TextColorFundTransaction];
    }else if (model.entrustType == HBEntruststateFundCombine){
        [self transactionText:@"基金合并" color:TextColorFundTransaction];
    }else if (model.entrustType == HBEntrustStateReverserepos){
        [self transactionText:@"借出" color:C_blue01Color];
    }else if (model.entrustType == HBEntrustTypeSecuritiesLoan){
        [self transactionText:@"借出还款" color:TextColorRaise];
    }else if (model.entrustType == HBEntruststateBidDeclaration){
        [self transactionText:@"要约申报" color:TextColorSuspension];
    }else if (model.entrustType == HBEntruststateRescissionOfAnOffer){
        [self transactionText:@"要约解除" color:TextColorSuspension];
    }else if (model.entrustType == HBEntrustTypeETFSG){
        [self transactionText:@"ETF申购" color:TextColorRaise];
    }else if (model.entrustType == HBEntrustTypeETFSH){
        [self transactionText:@"ETF赎回" color:[UIColor hb_colorWithHexString:@"#4783F6" alpha:1]];
    }else if (model.entrustType == HBEntrustTypeETFXJRG){
        [self transactionText:@"ETF现金认购" color:TextColorRaise];
    }else if (model.entrustType == HBEntrustTypeJJRG){
        [self transactionText:@"基金认购" color:TextColorRaise];
    }else if (model.entrustType == HBEntrustTypeaAfterSell){
        [self transactionText:@"盘后卖出" color:TextColorSuspension];
    }else if (model.entrustType == HBEntrustTypeAfterBuy){
        [self transactionText:@"盘后买入" color:TextColorSuspension];
    }else{
        if (model.entrustTypeDesc) {
            [self transactionText:model.entrustTypeDesc color:TextColorSuspension];

        }else{
            [self transactionText:@"其它" color:TextColorSuspension];
        }
    }
    
    if ( model.entrustResultCode == HBTransactionStateEntrustError) {
        self.status.textColor = EntrustError;
    }else{
        self.status.textColor = C_blue01Color;
    }
    
    self.status.text = model.entrustResultMsg;
    self.selectBtn.hidden = !model.show;
    self.selectBtn.selected = model.selected;
    //在显示删除时 不显示... low又怎样，你咬我啊
    self.edgeDistance.constant = model.show?-50:15;
//    self.number.adjustsFontSizeToFitWidth = YES;
    self.cancelTransactionBtn.hidden = model.cancelTransactionBtnHidden;
    
    if(model.entrustResultCode == HBTransactionStatecancellationsing){
        self.cancelTransactionBtn.hidden = YES;
    }else{
        self.cancelTransactionBtn.hidden = NO;
    }
}

//撤单再买入
- (IBAction)cancelAndBuyEvent:(id)sender {
    if (self.cancelAndBuyCallback) {
        self.cancelAndBuyCallback();
    }
}

//立即撤单
- (IBAction)cancelAndNowEvent:(id)sender {
    if (self.cancelAndNowCallback) {
        self.cancelAndNowCallback();
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}

- (void)transactionTextColor:(UIColor *)color {
    self.transactionDirction.layer.borderColor = color.CGColor;
    [self.transactionDirction setTitleColor:color forState:UIControlStateNormal];
}
@end
