//
//  HBTransactionRecordsViewController.h
//  HBStockWarning
//
//  Created by hulailin on 16/6/23.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import "HBBaseViewController.h"

@interface HBTransactionRecordsViewController : HBBaseViewController


/** 交易记录类型(交给子类去实现) */
@property (nonatomic, assign) HBTransactionRecordsType type;


@property (nonatomic ,assign) HBHoldType holdType;

@end
