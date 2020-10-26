//
//  XSIMageCollectionViewCell.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/24.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSIMageCollectionViewCell.h"
@implementation XSIMageCollectionViewCellModel
@end

@implementation XSIMageCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleBtn.layer.masksToBounds= YES;
    self.titleBtn.layer.cornerRadius = 5;
    self.titleBtn.layer.borderWidth = 1;
    self.titleBtn.layer.borderColor = [UIColor redColor].CGColor;
    // Initialization code
}
- (void)setModel:(XSIMageCollectionViewCellModel *)model{
    _model = model;
    self.addView.hidden = !model.add;
    [self.myimage sd_setImageWithURL:[NSURL URLWithString:model.icon]];
    [self.title setTitle:model.sele?@"已设为封面":@"设为封面" forState:UIControlStateNormal];
    if (model.sele) {
        self.titleBtn.layer.borderColor = [UIColor clearColor].CGColor;
    }else{
        self.titleBtn.layer.borderColor = [UIColor redColor].CGColor;
    }
    self.titleBtn.hidden = model.notNeedfirstImage;
}
- (IBAction)dele:(id)sender {
    if (!self.model.add) {
        if (self.model.block) {
            self.model.block(self.model,0);
        }
    }

}
- (IBAction)setting:(id)sender {
    if (self.model.block) {
         self.model.block(self.model,1);
     }
}

@end
