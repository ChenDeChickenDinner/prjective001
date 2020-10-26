//
//  XSHouseCollectionViewCell.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/9.
//  Copyright © 2020 fang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XSHouseCollectionViewCell : UICollectionViewCell
@property (nonatomic, strong) XSHouseInfoShowModel *dataModel;

@property (weak, nonatomic) IBOutlet UIImageView *MyimageView;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *info;
@property (weak, nonatomic) IBOutlet UILabel *price;
@end

NS_ASSUME_NONNULL_END
