//
//  XSIMageCollectionViewController.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/24.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSBaseViewController.h"
#import "XSIMageCollectionViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSIMageCollectionViewController : XSBaseViewController
@property (nonatomic, strong) NSMutableArray<XSIMageCollectionViewCellModel *> *array;
@property (weak, nonatomic) XSHouseInfoShowModel *infoModel;
@property(nonatomic,strong) NSMutableDictionary *subDict;

@property (nonatomic, assign) XSHouseImageLoadType loadType;
//-(NSDictionary *)dataBlack;
@end

NS_ASSUME_NONNULL_END
