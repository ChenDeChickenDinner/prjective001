//
//  XSHouseRentStatusView.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/29.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSHouseRentStatusView.h"
@interface XSHouseRentStatusModel :NSObject
@property(nonatomic,copy) NSString *title;
@property(nonatomic,strong) UIColor *titleColor;
@property (nonatomic, strong) NSNumber *status; // 利用tag展示
@property(nonatomic,assign) XSEDITTYPE editTpye;

@end
@implementation XSHouseRentStatusModel
+ (instancetype)initWithTitle:(NSString *)title status:(XSBHouseSubStatus)status titleColor:(UIColor *)titleColor editType:(XSEDITTYPE)editType{
    XSHouseRentStatusModel *model = [[XSHouseRentStatusModel alloc]init];
    model.title = title;
    model.titleColor = titleColor;
    model.status = [NSNumber numberWithInteger:status];
    model.editTpye = editType;
    return model;
}
@end

@interface XSHouseRentStatusView ()
@property(nonatomic,strong) NSMutableArray *modelArray;
@property(nonatomic,strong) NSMutableArray *viewArray;

@end

@implementation XSHouseRentStatusView
- (NSMutableArray *)modelArray{
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
- (NSMutableArray *)viewArray{
    if (!_viewArray) {
        _viewArray = [NSMutableArray array];
    }
    return _viewArray;
}
- (void)setStatus:(NSNumber *)status{
    _status = status;
    
    [self.modelArray removeAllObjects];

    for (UIView *view in self.viewArray) {
        [view removeFromSuperview];
    }
    self.viewArray = nil;
    
    [self resetModelArray];
    
    [self addStatusSubView];
}
- (void)resetModelArray{

   UIColor *editcolor =  [UIColor hb_colorWithHexString:@"#1A9FF0" alpha:1];
   UIColor *orgColor =  XSColor(255, 109, 52);
    UIColor *huiseColor =  XSColor(136, 136, 136);

    XSHouseRentStatusModel *editModel = [XSHouseRentStatusModel initWithTitle:@"编辑房源" status:XSBHouseSubStatus_edit titleColor:editcolor editType:XSEDITTYPE_status];
    XSHouseRentStatusModel *xjModel = [XSHouseRentStatusModel initWithTitle:@"下架" status:XSBHouseSubStatus_XJ titleColor:huiseColor editType:XSEDITTYPE_status];
    XSHouseRentStatusModel *sjModel = [XSHouseRentStatusModel initWithTitle:@"重新上架" status:XSBHouseSubStatus_FB titleColor:orgColor editType:XSEDITTYPE_status];
    
    
    
    XSHouseRentStatusModel *weichuzu = [XSHouseRentStatusModel initWithTitle:@"未出租" status:0 titleColor:orgColor editType:XSEDITTYPE_dealStatus];
     XSHouseRentStatusModel *yichuzu = [XSHouseRentStatusModel initWithTitle:@"已出租" status:1 titleColor:orgColor editType:XSEDITTYPE_dealStatus];
     XSHouseRentStatusModel *weijiaoyi = [XSHouseRentStatusModel initWithTitle:@"未交易" status:0 titleColor:orgColor editType:XSEDITTYPE_dealStatus];
    XSHouseRentStatusModel *ztxs = [XSHouseRentStatusModel initWithTitle:@"暂停销售" status:1 titleColor:huiseColor editType:XSEDITTYPE_dealStatus];
    XSHouseRentStatusModel *yijiaoyi = [XSHouseRentStatusModel initWithTitle:@"已交易" status:2 titleColor:orgColor editType:XSEDITTYPE_dealStatus];
    
 
    switch (_status.integerValue) {
        case XSBHouseSubStatus_DSH:
            {
                [self.modelArray addObject:editModel];
            }
        break;
        case XSBHouseSubStatus_SHSB:
            {
                [self.modelArray addObject:editModel];
            }
        break;
        case XSBHouseSubStatus_XJ:
            {
                [self.modelArray addObject:editModel];
                [self.modelArray addObject:sjModel];
            }
        break;
        case XSBHouseSubStatus_FB:
            {
                [self.modelArray addObject:xjModel];
                if (self.model.houseType == XSBHouseType_Rent) {
                    if (self.model.dealStatus.integerValue == 0) {
                        [self.modelArray addObject:yichuzu];

                    }else{
//                        [self.modelArray addObject:yichuzu];
                    }
                }else if(self.model.houseType == XSBHouseType_old){
                    if (self.model.dealStatus.integerValue == 0) {
//                       [self.modelArray addObject:ztxs];
                       [self.modelArray addObject:yijiaoyi];
                   }else if(self.model.dealStatus.integerValue == 1){
//                       [self.modelArray addObject:yijiaoyi];
                   }else if(self.model.dealStatus.integerValue == 2){
//                       [self.modelArray addObject:ztxs];
                   }
                }
            }
        break;
        default:
            break;
    }
}

#define btnWidth 65
#define btnJX 10

- (void)addStatusSubView{
    
    for (int i = 1 ;i <= self.modelArray.count; i++) {
        XSHouseRentStatusModel *model = [self.modelArray safeObjectAtIndex:i-1];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.tag = model.status.integerValue;
        btn.tag = i -1;

        btn.backgroundColor = [UIColor whiteColor];
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn setTitle:model.title forState:UIControlStateNormal];
        [btn setTitleColor:model.titleColor forState:UIControlStateNormal];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5;
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = model.titleColor.CGColor;
        [btn addTarget:self action:@selector(clickEditStatus:) forControlEvents:UIControlEventTouchUpInside];
        if (i > 1) {
            btn.frame = CGRectMake(self.width - (btnWidth * i + 5 * i) - 15 , 0, btnWidth, self.height);
        }else{
            btn.frame = CGRectMake(self.width - (btnWidth * i) - 15 , 0, btnWidth, self.height);
        }
        [self.viewArray addObject:btn];
        [self addSubview:btn];
    }
}
- (void)clickEditStatus:(UIButton *)btn{
    XSHouseRentStatusModel *model = [self.modelArray safeObjectAtIndex:btn.tag];
    if (self.clickEditStatus && model) {
        self.clickEditStatus(model.status,self.model.house_id,self.model.houseType,model.editTpye);
    }
}
@end
