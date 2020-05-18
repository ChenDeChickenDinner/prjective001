//
//  HBTransactionRecordsTableViewCell.h
//  HBStockWarning
//
//  Created by hbzq on 16/8/12.
//  Copyright © 2016年 hulailn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HBExtensiveCellContainerView.h"
#import "HBTransactionGroupModel.h"
@class HBTransactionRecordsTableViewCell;

/**
 *  定义代理
 */
@protocol HBTransactionRecordsTableViewCellDelegate <NSObject>

@optional
- (void)didOpenMenuAtCell:(HBTransactionRecordsTableViewCell *)menuCell withMoreButton:(UIButton *)moreButton;


- (void)menuTableViewCell:(HBTransactionRecordsTableViewCell *)menuCell didSeletedMentItemAtIndex:(NSInteger)menuItemIndex;

@end



@interface HBTransactionRecordsTableViewCell : UITableViewCell



/** 下拉菜单视图*/
@property (weak, nonatomic) IBOutlet HBExtensiveCellContainerView *menuView;

//是否已经打开
@property (assign, nonatomic) BOOL isOpenMenu;
 

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *numberWidth;

@property (weak, nonatomic) IBOutlet UIButton *moreButton;


@property (weak, nonatomic) id <HBTransactionRecordsTableViewCellDelegate> delegate;

- (void)fillData:(HBTransactionRecordModel *)model type:(HBTransactionRecordsType)type;
@end


