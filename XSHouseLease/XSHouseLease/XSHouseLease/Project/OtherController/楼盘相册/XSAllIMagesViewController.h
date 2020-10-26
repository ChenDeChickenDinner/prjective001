//
//  XSIMagesViewController.h
//  XSHouseLease
//
//  Created by xs on 2020/5/11.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSBaseViewController.h"
#import "XSPageViewController.h"
typedef void(^imageBlack)(NSString *str);

NS_ASSUME_NONNULL_BEGIN

@interface XSAllIMagesViewController : XSBaseViewController
@property (nonatomic, copy) NSArray<XSHouseDetailsDataImgsModel *> *array;
@property (nonatomic, strong) NSIndexPath *indexPath;
@end

@interface XSIMagesSubViewController : XSListContentViewController
@property (nonatomic, strong) XSHouseDetailsDataImgsModel *dataModel;
@property (nonatomic, copy) imageBlack imageBlack;
@property (nonatomic, strong) NSIndexPath *indexPath;

@end
NS_ASSUME_NONNULL_END
