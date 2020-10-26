//
//  XSHouseCollectionViewCell.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/9.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSHouseCollectionViewCell.h"

@implementation XSHouseCollectionViewCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.title.text = @"";
    self.info.text = @"";
    self.price.text = @"";
    
    self.MyimageView.layer.masksToBounds = YES;
    self.MyimageView.layer.cornerRadius = 3;
}

- (void)setDataModel:(XSHouseInfoShowModel *)dataModel{
    _dataModel = dataModel;
    self.title.text = dataModel.title;
    self.info.text = [NSString stringWithFormat:@"%@万",dataModel.totalPrice];
    self.price.text = [NSString stringWithFormat:@"%.0f元/平",dataModel.unitPrice.floatValue];
    [self.MyimageView sd_setImageWithURL:[NSURL URLWithString:dataModel.firstImg]];
    
}

@end
