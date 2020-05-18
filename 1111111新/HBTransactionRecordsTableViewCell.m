//
//  HBTransactionRecordsTableViewCell.m
//  HBStockWarning
//
//  Created by hulailn on 16/8/12.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import "HBTransactionRecordsTableViewCell.h"


@interface HBTransactionRecordsTableViewCell()

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


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellMenuHeight;


@end


@implementation HBTransactionRecordsTableViewCell




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.price.adjustsFontSizeToFitWidth = YES;
    self.numberWidth.constant = KScreenWidth / 2 - 20 ;

    self.transactionDirction.layer.borderWidth = 1;
    self.transactionDirction.layer.masksToBounds = YES;
    self.transactionDirction.layer.cornerRadius = 8;
    self.transactionDirction.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self customCell];
    
    self.menuView.block = ^(UIButton *btn){
        if ([self.delegate respondsToSelector:@selector(menuTableViewCell:didSeletedMentItemAtIndex:)])
        {
            [self.delegate menuTableViewCell:self didSeletedMentItemAtIndex:btn.tag - 10];
        }

    };
}



- (void)customCell
{
    //最重要的一句代码！没有的话单元格直接全部显示下拉菜单了！两句随便选一句
    self.layer.masksToBounds = YES;
    //    self.clipsToBounds = YES;
    //设置cell自身属性(必须设置，不然收起下拉菜单动画可能有问题)
    self.selectionStyle = UITableViewCellSelectionStyleNone;
 
    
    //绑定事件
    [self.moreButton addTarget:self
                     action:@selector(moreClick:)
           forControlEvents:UIControlEventTouchUpInside];
    
    
}


/**
 *  下拉菜单按钮
 *
 *  @param sender 下拉菜单按钮
 */
- (void)moreClick:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if ([self.delegate respondsToSelector:@selector(didOpenMenuAtCell:withMoreButton:)])
    {
        [self.delegate didOpenMenuAtCell:self withMoreButton:sender];
    }
}



+ (void)registerNibToTableView:(UITableView *)tableView
{
    [tableView registerNib:[UINib nibWithNibName:@"HBTransactionRecordsTableViewCell" bundle:nil]  forCellReuseIdentifier:NSStringFromClass([HBTransactionRecordsTableViewCell class])];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    //设置单元格菜单是否被打开，其实可以直接使用isSelected代替。
//    self.isOpenMenu = selected;

}

- (void)setUIConfig:(HBTransactionRecordModel *)model type:(HBTransactionRecordsType)type{
    
    if(type == HBTransactionRecordsTodayEntrust){
        //不能撤单 撤单 变重新委托
        if(!model.hasRevoke){

            //重新委托
            UIButton *restartButton = [self.menuView.menuItemsArray objectAtIndex:2];
            [restartButton setTitle:@"重新委托" forState:UIControlStateNormal];
            [restartButton setImage:[UIImage imageNamed:@"orders_restart_send"] forState:UIControlStateNormal];

            if (model.entrustType ==HBEntrustTypeConvertible||model.entrustType ==HBEntrustTypeRecycling) {
                [restartButton setTitle:nil forState:UIControlStateNormal];
                [restartButton setImage:nil forState:UIControlStateNormal];
            }
            
        }else{
            //撤单 orders_restart_send
            UIButton *restartButton = [self.menuView.menuItemsArray objectAtIndex:2];
            [restartButton setTitle:@"撤单" forState:UIControlStateNormal];
            [restartButton setImage:[UIImage imageNamed:@"assets_revoke_icon"] forState:UIControlStateNormal];
        }

    }
    
    
    //不支持的品种 行情按钮禁用
    if (model.securityType == HBSecurityStateError){
        
        
    }else{
        
    }
    
  
}

- (void)fillData:(HBTransactionRecordModel *)model type:(HBTransactionRecordsType)type{
    if (model.isOpen) { // 打开
        self.moreButton.selected = YES;
        self.cellMenuHeight.constant = 44.0;
        self.menuView.hidden = NO;
    }else{
        self.moreButton.selected = NO;
        self.cellMenuHeight.constant = 0;
        self.menuView.hidden = YES;
    }
    if (type == HBTransactionRecordsTodayEntrust || type == HBTransactionRecordsHistoryEntrust) { //今日委托，历史委托
                self.price.text = [NSString stringWithFormat:@"委托价格:%@元",[HBUIFactory transitionDecimal:model.entrustPrice securityType:model.securityType exchange:model.exchange]] ;
        
        if (type == HBTransactionRecordsTodayEntrust) {
            NSString *unit = [HBUIFactory getUnitWithExchange:model.exchange securityType:model.securityType];
            if (model.securityType == HBSecurityStateDebt) {
                self.number.text = [NSString stringWithFormat:@"委托金额:%@%@",[HBFormatter formatDebtExchange:model.exchange number:model.entrustAmount],unit];
            }else{
                self.number.text = [NSString stringWithFormat:@"委托数量:%@%@",HBUIFactoryNilValueDescription(model.entrustAmount.description),unit];
            }
  
        }else{
    
            if (model.entrustType == HBEntrustStateReverserepos || model.entrustType == HBEntrustTypeSecuritiesLoan) {
                self.number.text = [NSString stringWithFormat:@"委托金额:%.2f元",model.entrustTotalPrice.floatValue];
            }else{
                NSString *unit = [HBUIFactory getUnitWithExchange:model.exchange securityType:model.securityType];
                self.number.text = [NSString stringWithFormat:@"委托数量:%@%@",HBUIFactoryNilValueDescription(model.entrustAmount.description),unit];
            }
        }
    
    }else{//今日成交，历史成交
        self.price.text = [NSString stringWithFormat:@"成交价格:%@元",[HBUIFactory transitionDecimal:model.transacPrice securityType:model.securityType exchange:model.exchange]] ;
        if (model.entrustType == HBEntrustStateReverserepos || model.entrustType == HBEntrustTypeSecuritiesLoan) { //逆回购
            self.number.text = [NSString stringWithFormat:@"成交金额:%.2f元",model.transacTotalPrice.floatValue];
        }else{
            NSString *unit = [HBUIFactory getUnitWithExchange:model.exchange securityType:model.securityType];
            self.number.text = [NSString stringWithFormat:@"成交数量:%@%@",HBUIFactoryNilValueDescription(model.transacAmount.description),unit];
        }
    }
    
    //今日委托、今日成交 显示时间 取不同的字段
    
    NSString *time;
    if (type == HBTransactionRecordsTodayEntrust || type == HBTransactionRecordsTodayDeal) {
        
        time = @"3"; //只显示时间
        if(type == HBTransactionRecordsTodayEntrust){
            if (model.entrustTimeTdx) {
                self.time.text = [NSString stringWithFormat:@"委托时间:%@",model.entrustTimeTdx] ;
            }else{
                self.time.text = [NSString stringWithFormat:@"委托时间:%@",[HBDateTool dateWithTime:[NSString stringWithFormat:@"%@",model.entrustDate] WithType:time]];
            }
        }else{
            self.time.text = [NSString stringWithFormat:@"成交时间:%@",[HBDateTool dateWithTime:[NSString stringWithFormat:@"%@",model.transacDate] WithType:time]];
        }

    }else{
        time = @"1"; //只显示日期
        //今日委托用 委托时间 字段
        if(type == HBTransactionRecordsHistoryEntrust){
            self.time.text = [NSString stringWithFormat:@"委托时间:%@",[HBDateTool dateWithTime:[NSString stringWithFormat:@"%@",model.entrustDate] WithType:time]] ;
        }else{
            self.time.text = [NSString stringWithFormat:@"成交时间:%@",[HBDateTool dateWithTime:[NSString stringWithFormat:@"%@",model.transacDate] WithType:time]] ;
        }
        
    }
    
    self.name.text = model.name;
    
    self.exchangeMarket.text = [NSString stringWithFormat:@"%@.%@",model.code,model.exchange.uppercaseString];
    

    [self.transactionDirction setTitle:model.entrustTypeDesc forState:UIControlStateNormal];

    
    
    if(model.entrustType == HBEntrustTypeBuy){
        [self transactionTextColor:TextColorRaise];
    }else  if (model.entrustType == HBEntrustTypeSell){
        [self transactionTextColor:TextColorSuspension];
    }else  if (model.entrustType == HBEntrustStateReverserepos){
        [self transactionTextColor:C_blue01Color];
    }else if (model.entrustType == HBEntrustTypeDistributeNumber){
        [self transactionTextColor:C_blue01Color];
    }else if (model.entrustType == HBEntrustTypeRationNumber){
        [self transactionTextColor:C_blue01Color];
    }else if (model.entrustType == HBEntrustTypeStockDividend){
        [self transactionTextColor:C_blue01Color];

    }else if (model.entrustType == HBEntrustTypeSecuritiesLoan){
        [self transactionTextColor:TextColorRaise];

    }else  if (model.entrustType == HBEntrustStateFundSubscribe){
        [self transactionTextColor:TextColorFundTransaction];
    }else if (model.entrustType == HBEntrustStateFundRedemption){
        [self transactionTextColor:TextColorFundTransaction];
    }else if (model.entrustType == HBEntruststateFundSplit){
        [self transactionTextColor:TextColorFundTransaction];
    }else if (model.entrustType == HBEntruststateFundCombine){
        [self transactionTextColor:TextColorFundTransaction];
    }else if (model.entrustType == HBEntrustStateDividend){
        [self transactionTextColor:TextColorRaise];
    }else if (model.entrustType == HBEntruststateBidDeclaration){
        [self transactionTextColor:TextColorSuspension];
    }else if (model.entrustType == HBEntruststateRescissionOfAnOffer){
        [self transactionTextColor:TextColorSuspension];
    }else if (model.entrustType == HBEntrustTypeETFSG){
        [self transactionTextColor:TextColorRaise];
    }else if (model.entrustType == HBEntrustTypeETFSH){
        [self transactionTextColor:[UIColor hb_colorWithHexString:@"#4783F6" alpha:1]];
    }else if (model.entrustType == HBEntrustTypeETFXJRG){
        [self transactionTextColor:TextColorRaise];
    }else if (model.entrustType == HBEntrustTypeJJRG){
        [self transactionTextColor:TextColorRaise];
    }else{
        [self transactionTextColor:TextColorSuspension];
    }
    

    
    if ( model.entrustResultCode == HBTransactionStateEntrustError) {
        self.status.textColor = EntrustError;
    }else{
        self.status.textColor = C_blue01Color;
    }
    
    self.status.text = model.entrustResultMsg;
    
    
    
    [self setUIConfig:model type:type];

}


/**
 显示文字和颜色

 @param text  文字
 @param color color
 */
- (void)transactionTextColor:(UIColor *)color {
    self.transactionDirction.layer.borderColor = color.CGColor;
    [self.transactionDirction setTitleColor:color forState:UIControlStateNormal];
}

@end
