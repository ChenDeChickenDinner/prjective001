//
//  HBStockWarning
//
//  Created by hbzq on 16/8/12.
//  Copyright © 2016年 hulailn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBExtensiveCellContainerView.h"

 
@interface HBNewCancelOrderCell : UITableViewCell

 
@property (nonatomic, strong) HBCancelOrdersModel *model;
@property(nonatomic,strong) UIButton *selectBtn;

@property (nonatomic, copy) void(^revokeClickHandler)();

@property (nonatomic, strong) void(^cancelAndBuyCallback)(void);
@property (nonatomic, strong) void(^cancelAndNowCallback)(void);
@property (nonatomic, strong) void(^onlyCancelAndNowCallback)(void);
//撤单再买入
@property (weak, nonatomic) IBOutlet UIButton *cancelAndBuyBtn;
//立即撤单
@property (weak, nonatomic) IBOutlet UIButton *cancelAndNow;
@property (weak, nonatomic) IBOutlet UIButton *onlyCancelAndBuyBtn;
//竖线
@property (weak, nonatomic) IBOutlet UIView *verLineView;
@end


