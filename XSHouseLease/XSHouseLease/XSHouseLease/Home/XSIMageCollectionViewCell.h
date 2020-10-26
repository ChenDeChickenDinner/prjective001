//
//  XSIMageCollectionViewCell.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/24.
//  Copyright © 2020 fang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XSIMageCollectionViewCellModel :NSObject
@property (copy, nonatomic) NSString *icon;
@property (assign, nonatomic) BOOL sele;
@property (assign, nonatomic) BOOL add;
@property (assign, nonatomic) BOOL notNeedfirstImage;

@property (copy, nonatomic) void (^block)(XSIMageCollectionViewCellModel *model,NSInteger type);
@end
@interface XSIMageCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@property (weak, nonatomic) IBOutlet UIView *addView;
@property (weak, nonatomic) IBOutlet UIImageView *myimage;
@property (weak, nonatomic) IBOutlet UIButton *title;
@property (strong, nonatomic) XSIMageCollectionViewCellModel *model;
@end

NS_ASSUME_NONNULL_END
