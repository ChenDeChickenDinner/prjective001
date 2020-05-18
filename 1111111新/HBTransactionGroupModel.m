//
//  HBTransactionGroupModel.m
//  HBStockWarning
//
//  Created by hbzq on 16/8/22.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import "HBTransactionGroupModel.h"
#import "HBConditionalDataModel.h"
#import "TdxCore.h"


@implementation HBQueryEntrustStatesModel

@end


@implementation HBTransactionGroupModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"list" : @"HBTransactionRecordModel"};
}
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"counts" : @"count"};
}

- (NSString *)description
{
     return [NSString stringWithFormat:@"< %@ %p> : {month : %@,entrustVOList:%@}",self.class,self,[NSString stringWithFormat:@"%@",self.counts],self.list];
}

@end





@implementation HBTransactionRecordModel

- (void)tdxConversion{
    
    TdxCore *ob = [[TdxCore alloc]init];
   NSString *securityType =    [ob GetBreedTypeStr2:self.exchangeInt.integerValue zqdm:self.code];
    self.securityType = HBSecurityTypeWithTDXType(securityType);
    self.exchange = [self.exchangeInt f100Exchange];
    
//    self.securityType =
    if ([self.entrustTypeDesc isEqualToString:@"买入"]) {
        self.entrustType = HBEntrustTypeBuy;
    }else if ([self.entrustTypeDesc isEqualToString:@"卖出"]){
        self.entrustType = HBEntrustTypeSell;
    }
    if ([self.entrustResultMsg isEqualToString:@"撤单中"]) {
        self.entrustResultCode = HBTransactionStatecancellationsing;
    }
    if ([self.entrustResultMsg containsString:@"-"]) {
        NSArray *arr = [self.entrustResultMsg componentsSeparatedByString:@"-"];
        if (arr.count >1) {
            self.entrustResultMsg  = arr.lastObject;
        }
    }
    {
        NSDictionary *dict = [self.FID tdxFidKeyValue];
        NSString *FID_WTLB = [dict objectForKey:@"FID_WTLB"]; // 委托类型
        NSString *FID_JGSM = [dict objectForKey:@"FID_JGSM"]; // 委托结果说明
        NSString *FID_SBJG = [dict objectForKey:@"FID_SBJG"]; // 委托结果 int

        if (FID_WTLB) {
            self.entrustType = (HBEntrustResponseType)FID_WTLB.integerValue;
        }
        if (FID_SBJG) {
            self.entrustResultCode = (HBTransactionStatus)FID_SBJG.integerValue;
        }
        if (FID_JGSM) {
            self.entrustNote = FID_JGSM;
        }
//        NSLog(@"-----%@",dict);/
    }
    
    if ( self.entrustTypeInt.integerValue == 2) {
           if (![self.entrustTypeDesc containsString_HB:@"撤"]) {
              self.entrustTypeDesc = [NSString stringWithFormat:@"撤%@",self.entrustTypeDesc];
           }
    }
    
    CGFloat value = self.entrustPrice.doubleValue * self.entrustAmount.integerValue ;
    self.entrustTotalPrice = [NSNumber numberWithDouble:[NSString stringWithFormat:@"%.2f",value].doubleValue];
    
    if (self.securityType == HBSecurityStateBond) {
        if ([self.exchange.lowercaseString isEqualToString:@"sh"]) {
            CGFloat value = self.entrustPrice.doubleValue * self.entrustAmount.integerValue * 10;
            self.entrustTotalPrice = [NSNumber numberWithDouble:[NSString stringWithFormat:@"%.2f",value].doubleValue];
        }
    }

    if (self.entrustType == HBEntrustStateReverserepos || self.entrustType == HBEntrustTypeSecuritiesLoan) {
          self.entrustTotalPrice = [NSNumber numberWithDouble:[HBFormatter formatDebtExchange:self.exchange number:self.entrustAmount].doubleValue];
      }
}

- (NSMutableArray *)getDataSource {
    NSMutableArray *dataSource = [NSMutableArray array];
    HBEntrustDetailViewModel *enturstModel = [[HBEntrustDetailViewModel alloc] init];
    enturstModel.list = [self enturstModelInfo];
    [dataSource addObject:enturstModel];
    return dataSource;
}



- (NSArray *)enturstModelInfo {
    NSMutableArray *applyArray = [NSMutableArray array];

    
    [self applyForArray:applyArray];

 
    return [applyArray copy];
}


- (void)applyForArray:(NSMutableArray *)applyArray{
    
    //交易类型
    if(self.transactionRecordsType == HBTransactionRecordsTodayEntrust || self.transactionRecordsType == HBTransactionRecordsHistoryEntrust ){
        //公共
        if (self.transactionRecordsType == HBTransactionRecordsTodayEntrust) {
            HBEntrustDetailViewModel *model = [[HBEntrustDetailViewModel alloc] init];
            model.titleName = @"委托时间:";
            model.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%@",self.entrustTimeTdx?self.entrustTimeTdx:self.entrustDate]];
            [applyArray addObject:model];
        }else{
            HBEntrustDetailViewModel *model = [[HBEntrustDetailViewModel alloc] init];
            model.titleName = @"委托时间:";
            model.attributedString = [self aAttributedString:[HBDateTool dateWithTime:[NSString stringWithFormat:@"%@",self.entrustDate] WithType:@"2"]];
            [applyArray addObject:model];
        }
        
    }else if(self.transactionRecordsType == HBTransactionConditionalEntrust){
        HBEntrustDetailViewModel *model = [[HBEntrustDetailViewModel alloc] init];
        model.titleName = @"委托时间:";
        model.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%@",self.entrustDate]];
        [applyArray addObject:model];
    }else{
        //公共
        HBEntrustDetailViewModel *model = [[HBEntrustDetailViewModel alloc] init];
        model.titleName = @"成交时间:";
        model.attributedString = [self aAttributedString:[HBDateTool dateWithTime:[NSString stringWithFormat:@"%@",self.transacDate] WithType:@"2"]];
        [applyArray addObject:model];
    }
    
    HBEntrustDetailViewModel *model1 = [[HBEntrustDetailViewModel alloc] init];
    model1.titleName = @"委托类型:";
    model1.attributedString = [self aAttributedString:(self.tradeType?self.tradeType:@"普通交易")];
    [applyArray addObject:model1];

    
    //根据买入方向 确定详情页面展示的数据
        if(self.entrustType == HBEntrustTypeBuy){
            [self addEntrustExchagne:applyArray string:@"买入" color:TextColorRaise];
        }else  if (self.entrustType == HBEntrustTypeSell){
            [self addEntrustExchagne:applyArray string:@"卖出" color:C_blue01Color];
        }else if (self.entrustType == HBEntrustStateReverserepos){
            [self addEntrustExchagne:applyArray string:@"借出" color:TextColorFundTransaction];
        }
        else if (self.entrustType == HBEntrustTypeDistributeNumber){
            [self addEntrustExchagne:applyArray string:@"新股申购" color:TextColorFundTransaction];
        }else if (self.entrustType == HBEntrustTypeRationNumber){
            [self addEntrustExchagne:applyArray string:@"新股申购" color:C_blue01Color];

        } else if(self.entrustType == HBEntrustStateFundSubscribe){
            [self addEntrustExchagne:applyArray string:@"场内申购" color:TextColorFundTransaction];
        }//赎回
        else if (self.entrustType == HBEntrustStateFundRedemption) {
            [self addEntrustExchagne:applyArray string:@"场内赎回" color:TextColorFundTransaction];
        }else if (self.entrustType == HBEntruststateFundSplit){
            [self addEntrustExchagne:applyArray string:@"分拆盲拆" color:TextColorFundTransaction];
        }else if (self.entrustType == HBEntruststateFundCombine){
            [self addEntrustExchagne:applyArray string:@"基金合并" color:TextColorFundTransaction];
        }else if (self.entrustType == HBEntrustTypeSecuritiesLoan){
            [self addEntrustExchagne:applyArray string:@"借出还款" color:TextColorFundTransaction];
        }else if (self.entrustType == HBEntruststateBidDeclaration){
            [self addEntrustExchagne:applyArray string:@"要约申报" color:TextColorFundTransaction];
        }else if (self.entrustType == HBEntruststateRescissionOfAnOffer){
            [self addEntrustExchagne:applyArray string:@"要约解除" color:TextColorFundTransaction];
        }else if (self.entrustType == HBEntrustTypeETFSG){
            [self addEntrustExchagne:applyArray string:@"ETF申购" color:TextColorRaise];
        }else if (self.entrustType == HBEntrustTypeETFSH){
            [self addEntrustExchagne:applyArray string:@"ETF赎回" color:[UIColor hb_colorWithHexString:@"#4783F6" alpha:1]];
        }else if (self.entrustType == HBEntrustTypeETFXJRG){
            [self addEntrustExchagne:applyArray string:@"ETF现金认购" color:TextColorRaise];
        }else if (self.entrustType == HBEntrustTypeJJRG){
            [self addEntrustExchagne:applyArray string:@"基金认购" color:TextColorRaise];
        }else if (self.entrustType == HBEntrustTypeaAfterSell){
            [self addEntrustExchagne:applyArray string:@"盘后卖出" color:TextColorSuspension];
        }else if (self.entrustType == HBEntrustTypeAfterBuy){
            [self addEntrustExchagne:applyArray string:@"盘后买入" color:TextColorSuspension];
        }else{
            [self addEntrustExchagne:applyArray string:@"其它" color:TextColorSuspension];

        }

//    [self addEntrustExchagne:applyArray string:self.entrustTypeDesc color:TextColorSuspension];


    if (self.orderType) { //如果有订单类型
        HBEntrustDetailViewModel *orderTypeModel = [[HBEntrustDetailViewModel alloc] init];
        orderTypeModel.titleName = @"订单类型:";
        orderTypeModel.attributedString = [self aAttributedString:HBUIFactoryNilValueDescription(self.orderType)];
        [applyArray addObject:orderTypeModel];
    }
    
    
    [self addObjectsFromStockArray:applyArray];

    HBEntrustDetailViewModel *modelLast = [[HBEntrustDetailViewModel alloc] init];
    modelLast.titleName = @"订单状态:";
    if(self.entrustResultCode == HBTransactionStateEntrustError){
        modelLast.attributedString = [self aAttributedString:self.entrustResultMsg color:TextColorRaise];
        //委托失败 显示失败原因
        HBEntrustDetailViewModel *modelerror = [[HBEntrustDetailViewModel alloc] init];
        modelerror.titleName = @"失败原因：";
        modelerror.attributedString =  [self aAttributedString:self.entrustNote color:[UIColor blackColor]];
        if (self.entrustNote) {
            [applyArray addObject:modelerror];
        }
        
    }else{
        modelLast.attributedString = [self aAttributedString:self.entrustResultMsg color:C_blue01Color];
    }
    if (self.entrustResultMsg.length) { //有内容才会显示
        [applyArray addObject:modelLast];
    }
}

- (void)addEntrustExchagne:(NSMutableArray *)applyArray string:(NSString *)string color:(UIColor *)color{
    HBEntrustDetailViewModel *model1 = [[HBEntrustDetailViewModel alloc] init];
    model1.titleName = @"委托方向:";
    model1.attributedString = [self aAttributedString:string color:color];
    [applyArray addObject:model1];
}


/**
 股票相关的插入数组
 */
- (void)addObjectsFromStockArray:(NSMutableArray *)array{
    HBEntrustDetailViewModel *model2 = [[HBEntrustDetailViewModel alloc] init];
    model2.titleName = @"证券代码:";
    model2.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%@.%@",self.code,self.exchange.uppercaseString]];
    
    [array safeAddObject:model2];
    
    HBEntrustDetailViewModel *model3 = [[HBEntrustDetailViewModel alloc] init];
    model3.titleName = @"证券名称:";
    model3.attributedString = [self aAttributedString:self.name];
    [array safeAddObject:model3];
    if(self.transactionRecordsType == HBTransactionRecordsTodayEntrust || self.transactionRecordsType == HBTransactionRecordsHistoryEntrust || self.transactionRecordsType == HBTransactionConditionalEntrust){
        
        HBEntrustDetailViewModel *model4 = [[HBEntrustDetailViewModel alloc] init];
        model4.titleName = @"委托价格:";
        model4.attributedString = [self aAttributedString:[HBUIFactory transitionDecimal:self.entrustPrice securityType:self.securityType exchange:self.exchange]];
         [array safeAddObject:model4];
        HBEntrustDetailViewModel *model5 = [[HBEntrustDetailViewModel alloc] init];
        model5.titleName = @"委托数量:";
        if (self.securityType == HBSecurityStateBond || self.securityType == HBSecurityStateDebt) {
            if ([self.exchange.lowercaseString isEqualToString:@"sz"]) {
                NSString *entrustString = [NSString stringWithFormat:@"%@张",self.entrustAmount.description];
                model5.attributedString = [self aAttributedString:entrustString];
            }else{
                NSString *entrustString = [NSString stringWithFormat:@"%@手",self.entrustAmount.description];
                model5.attributedString = [self aAttributedString:entrustString];
            }
            
        }else{
            NSString *entrustString = [NSString stringWithFormat:@"%@股",self.entrustAmount.description];
            model5.attributedString = [self aAttributedString:entrustString];
        }
        [array safeAddObject:model5];
        
        HBEntrustDetailViewModel *model6 = [[HBEntrustDetailViewModel alloc] init];
        model6.titleName = @"委托金额:";
        
        if (self.entrustPrice.floatValue == 0) {
            model6.attributedString = [self aAttributedString:self.entrustAmount.description];
            [array safeAddObject:model6];
        }else{
            
            if (self.entrustType == HBEntrustStateReverserepos || self.entrustType == HBEntrustTypeSecuritiesLoan) {
                
                model6.attributedString = [self aAttributedString:[HBFormatter formatDebtExchange:self.exchange number:self.entrustAmount]];
                [array safeAddObject:model6];
            }else{
                   model6.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%.2f",[self.entrustTotalPrice floatValue]]];
                  [array safeAddObject:model6];
            }
        }
        
        
        HBEntrustDetailViewModel *model7 = [[HBEntrustDetailViewModel alloc] init];
        model7.titleName = @"冻结资金:";
        model7.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%.2f",fabs(self.frozen.floatValue) ]];
        [array safeAddObject:model7];
        
    }else if(self.transactionRecordsType == HBTransactionRecordsTodayDeal || self.transactionRecordsType == HBTransactionRecordsHistoryDeal){
        HBEntrustDetailViewModel *model4 = [[HBEntrustDetailViewModel alloc] init];
        model4.titleName = @"成交价格：";
        model4.attributedString = [self aAttributedString:[HBUIFactory transitionDecimal:self.transacPrice securityType:self.securityType exchange:self.exchange]];
         [array safeAddObject:model4];
        HBEntrustDetailViewModel *model5 = [[HBEntrustDetailViewModel alloc] init];
        model5.titleName = @"成交数量：";
        if (self.securityType == HBSecurityStateBond  || self.securityType == HBSecurityStateDebt) {
            if ([self.exchange.lowercaseString isEqualToString:@"sz"]) {
                NSString *entrustString = [NSString stringWithFormat:@"%@张",self.transacAmount.description];
                model5.attributedString = [self aAttributedString:entrustString];
            }else{
                NSString *entrustString = [NSString stringWithFormat:@"%@手",self.transacAmount.description];
                model5.attributedString = [self aAttributedString:entrustString];
            }
            
        }else{
            NSString *entrustString = [NSString stringWithFormat:@"%@股",self.transacAmount.description];
            model5.attributedString = [self aAttributedString:entrustString];
        }
        
        [array safeAddObject:model5];
        
        HBEntrustDetailViewModel *model6 = [[HBEntrustDetailViewModel alloc] init];
        model6.titleName = @"成交金额：";
        
        
        if (self.entrustType == HBEntrustStateReverserepos || self.entrustType == HBEntrustTypeSecuritiesLoan) {
            
            model6.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%.2f",self.transacTotalPrice.floatValue]];
            [array safeAddObject:model6];
        }else{
            model6.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%.2f",[self.transacTotalPrice floatValue]]];
             [array safeAddObject:model6];
        }
        if ([self.realCommission floatValue] > 0){
        
            HBEntrustDetailViewModel *model = [[HBEntrustDetailViewModel alloc] init];
            model.titleName = @"实收佣金：";
            model.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%.2f",self.realCommission.floatValue ]];
   
            [array safeAddObject:model];
        }
        
        if ([self.stampTax floatValue] > 0){
            
            HBEntrustDetailViewModel *model = [[HBEntrustDetailViewModel alloc] init];
            model.titleName = @"印花税：";
            model.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%.2f",self.stampTax.floatValue ]];
            [array safeAddObject:model];
        }
        
        if ([self.transferFee floatValue] > 0){
            
            HBEntrustDetailViewModel *model = [[HBEntrustDetailViewModel alloc] init];
            model.titleName = @"过户税：";
            model.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%.2f",self.transferFee.floatValue]];
            [array safeAddObject:model];
        }
      
        
        if ([self.clearingFee floatValue] > 0)
        {
            
            HBEntrustDetailViewModel *model = [[HBEntrustDetailViewModel alloc] init];
            model.titleName = @"结算费：";
            model.attributedString = [self aAttributedString:[NSString stringWithFormat:@"%.2f",self.clearingFee.floatValue ]];
            [array safeAddObject:model];
        }
    }
    
    
    
}


- (NSMutableAttributedString *)aAttributedString:(NSString *)aString{

    return  [self aAttributedString:aString color:[UIColor hb_colorWithHexString:@"#000000" alpha:1]];
}

- (NSMutableAttributedString *)aAttributedString:(NSString *)aString color:(UIColor *)color{
    if (aString == nil) {
        return nil;
    }
    NSMutableAttributedString * aAttributedString = [[NSMutableAttributedString alloc] initWithString:aString];
    //富文本样式
    [aAttributedString addAttribute:NSForegroundColorAttributeName  //文字颜色
                              value:color
                              range:NSMakeRange(0, aString.length)];
    [aAttributedString addAttribute:NSFontAttributeName  //文字颜色
                              value:[UIFont systemFontOfSize:15]
                              range:NSMakeRange(0, aString.length)];
    return aAttributedString;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {name: %@, code: %@ entrustResultMsg: %@}", self.class, self,self.name , self.code,self.entrustResultMsg];
}

+(HBTransactionRecordModel *)transferWithEntrustModel:(HBConditionalEntrustedModel *)model;{
    HBTransactionRecordModel *recordModel = [[HBTransactionRecordModel alloc] init];
    recordModel.entrustDate = model.entrustDate;
    recordModel.entrustType = model.direction.integerValue;
    recordModel.tradeType = @"条件交易";
//    recordModel.orderType = model.;
    recordModel.code = model.stockCode;
    recordModel.exchange = model.exchange;
    recordModel.name = model.stockName;
    recordModel.entrustPrice = model.entrustPrice.toNumberIfNeeded;
    recordModel.entrustAmount = model.entrustAmount.toNumberIfNeeded;
    recordModel.frozen = model.frozen.toNumberIfNeeded;
    
    NSString *actuallyNumber = [HBUIFactory getActuallyNumber:model.entrustAmount securityType:model.securityType.integerValue withExchange:model.exchange];
    recordModel.entrustTotalPrice = [NSString stringWithFormat:@"%.2lf",[model.entrustPrice doubleValue]*[actuallyNumber doubleValue]].toNumberIfNeeded;
    recordModel.entrustResultMsg = (model.abossCode.integerValue == 1?model.entrustResultMsg:model.abossMsg);
    recordModel.entrustResultCode = model.entrustResultCode.integerValue;
    recordModel.orderType = model.orderTypeDesc;
    recordModel.securityType = model.securityType.integerValue;
    return recordModel;
}


@end


@implementation HBEntrustDetailViewModel


@end



@implementation HBEntrustConditionalModel

// 是否是有些的引导过过
- (BOOL)showGuide{

    if ([self.minVersion compare:XcodeAppVersion options:NSNumericSearch] ==NSOrderedDescending) {
        return NO;
    }else{
        return YES;
    }
}

- (HBNewConditionTradeType)showtype{

    if ([self.strategyType isEqualToString:@"100"]) {
        return HBNewConditionTradeType_PRICE;

    }else if ([self.strategyType isEqualToString:@"101"]){
        return HBNewConditionTradeType_RISEDOWN;

    }else if ([self.strategyType isEqualToString:@"102"]){
        return HBNewConditionTradeType_TIME;

    }else if ([self.strategyType isEqualToString:@"103"]){
        return HBNewConditionTradeType_TURNPOINT_BUY;

    }else if ([self.strategyType isEqualToString:@"104"]){
        return HBNewConditionTradeType_TURNPOINT_SALE;

    }else if ([self.strategyType isEqualToString:@"105"]){
        return HBNewConditionTradeType_BATCHING_BUY;

    }else if ([self.strategyType isEqualToString:@"106"]){
        return HBNewConditionTradeType_BATCHING_SALE;

    }else if ([self.strategyType isEqualToString:@"107"]){
        return HBNewConditionTradeType_GRID;

    }else if ([self.strategyType isEqualToString:@"108"]){
        return HBNewConditionTradeType_Aply;

    }else if ([self.strategyType isEqualToString:@"109"]){
        return HBNewConditionTradeType_NEWPROFITLOSE;

    }else{
        return 0;
    }
    
}
@end

@implementation HBNewTransactionRecordModel

@end
