//
//  XSHouseMasterInfoView.m
//  XSHouseLease
//
//  Created by xs on 2020/4/13.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSHouseMasterInfoView.h"
#import "TUIConversationListController.h"
#import "TUIChatController.h"
#import "XSTUIChatController.h"

@implementation XSHouseMasterInfoView
- (instancetype)initWithCoder:(NSCoder *)coder{
    self = [super initWithCoder:coder];
    if (self) {
        _customView = [[NSBundle mainBundle] loadNibNamed:@"XSHouseMasterInfoView" owner:self options:nil].firstObject;
        [self addSubview:_customView];
    }
    return self;
}
- (void)layoutSubviews{
    [super layoutSubviews];
    _customView.frame = self.bounds;
}
- (void)awakeFromNib{
    [super awakeFromNib];
      self.name.text = nil;
    
    self.image.layer.masksToBounds = YES;
    self.image.layer.cornerRadius = 23;
    
    self.name.adjustsFontSizeToFitWidth = YES;
     self.callIm.layer.masksToBounds = YES;
     self.callIm.layer.cornerRadius = 5;
     self.cellPhone.layer.masksToBounds = YES;
     self.cellPhone.layer.cornerRadius = 5;
     self.cellPhone.layer.borderWidth = 1;
     self.cellPhone.layer.borderColor = [UIColor hb_colorWithHexString:@"#E82B2B" alpha:1].CGColor;
}
- (void)setModel:(XSHouseInfoShowModel *)model{
    _model = model;
    if (model.houseType == XSBHouseType_New) {
        self.name.text = model.basic.customerName;
        self.namedescribe.text = @"客户经理";
        [self.image sd_setImageWithURL:[NSURL URLWithString:model.basic.icon] placeholderImage:[UIImage imageNamed:@"userIcon"]];
    }else{
        self.name.text = model.customerName;
        self.namedescribe.text = @"房主";
        [self.image sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"userIcon"]];

    }
    self.namedescribe.text = @"房主";
    [self.image sd_setImageWithURL:[NSURL URLWithString:model.icon] placeholderImage:[UIImage imageNamed:@"userIcon"]];
}

- (IBAction)callPhone:(id)sender {
    WEAK_SELF;
    [XSUserServer needLoginSuccess:^{
       STRONG_SELF;
        NSString *telString = nil;
        if (self.model.houseType == XSBHouseType_New) {
            telString = [NSString stringWithFormat:@"telprompt://%@",self.model.serviceTel?self.model.serviceTel:self.model.callPhone];
        }else{
            if (self.model.resource == XSHouseSource_2) {
                telString = [NSString stringWithFormat:@"telprompt://%@",self.model.serviceTel?self.model.serviceTel:self.model.callPhone];
            }else{
                telString = [NSString stringWithFormat:@"telprompt://%@",self.model.callPhone?self.model.callPhone:self.model.serviceTel];
            }
        }
          telString = [NSString stringWithFormat:@"telprompt://%@",self.model.serviceTel?self.model.serviceTel:self.model.callPhone];
        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:telString]]) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString] options:@{} completionHandler:nil];
        }
    } cancel:^{

    }];
    

    
}
- (IBAction)callMassage:(id)sender {
    WEAK_SELF;
    [XSUserServer needLoginSuccess:^{
       STRONG_SELF;
        
        
        XSTUIChatController *message = [[XSTUIChatController alloc]init];
          message.conversationId = self.model.customerId.stringValue;
          message.title = self.model.customerName;
         [[NSObject getTopViewController].navigationController pushViewController:message animated:YES];

    } cancel:^{

    }];
 
}
@end
