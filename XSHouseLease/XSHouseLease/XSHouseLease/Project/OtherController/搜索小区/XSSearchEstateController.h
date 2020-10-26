//
//  XSSearchEstateController.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/4/12.
//  Copyright © 2020 fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^searchBlock)(XSHouseEsModel *model,XSBHouseType houseType);
typedef void(^searchTitleBlock)(NSString *searchStr,XSBHouseType houseType);

@interface XSSearchEstateController : XSBaseViewController
@property (nonatomic ,strong) BRProvinceModel *cityModel;
@property (nonatomic,copy)   searchBlock searchBlock;
@property (nonatomic,copy)   searchTitleBlock searchTitleBlock;

@property(nonatomic,assign) XSBHouseType houseType;
@property(nonatomic,assign) BOOL black;
@end

NS_ASSUME_NONNULL_END
