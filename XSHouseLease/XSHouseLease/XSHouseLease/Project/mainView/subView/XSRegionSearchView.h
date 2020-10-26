//
//  XSRegionSearchView.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/26.
//  Copyright © 2020 fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "XSHouseEnum.h"

NS_ASSUME_NONNULL_BEGIN

@interface XSRegionSearchView : UIView
@property(nonatomic,copy) searchBlack searchBlack;
@property(nonatomic,assign) BOOL search;
@property(nonatomic,copy)   NSString *placeholder;  
-(void)beganEditing;
- (instancetype)initWithFrame:(CGRect)frame type:(XSBHouseType)type;
- (void)setSearchTitle:(NSString *)title;
@end

NS_ASSUME_NONNULL_END
