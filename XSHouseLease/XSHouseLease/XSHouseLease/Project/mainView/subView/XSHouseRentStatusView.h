//
//  XSHouseRentStatusView.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/29.
//  Copyright © 2020 fang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface XSHouseRentStatusView : UIView
@property (nonatomic, strong) NSNumber *status;
@property (nonatomic, copy) clickEditStatus clickEditStatus;
@property(nonatomic,assign) XSBHouseType houseType;
@property(nonatomic,strong)XSHouseInfoShowModel *model;
@end

NS_ASSUME_NONNULL_END
