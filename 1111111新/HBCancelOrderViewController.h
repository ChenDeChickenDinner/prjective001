//
//  HBCancelOrderViewController.h
//  HBStockWarning
//
//  Created by hbzq on 15/10/27.
//  Copyright © 2015年 Touker. All rights reserved.
//  

#import "HBBaseViewController.h"
#import "HBTradingBaseViewController.h"

@interface HBCancelOrderViewController : HBTradingBaseViewController



/**
 交易记录 类型 0 全部 1基金
 */
@property (nonatomic ,assign)HBHoldType holdType;
@end
