//
//  MyInfoViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/16.
//  Copyright © 2020 fang. All rights reserved.
//

#import "MyInfoViewController.h"
#import "XSLoginViewController.h"
#import "XSHouselishViewController.h"
#import "XSHouseModuleViewController.h"
#import "XSUserInfoEditViewController.h"
#import "XSEditUserInfoController.h"
#import "XSAboutViewController.h"
#import "XSYJFKViewController.h"
#import "XSResourceViewController.h"
#import "XSPaymentViewController.h"

@interface MyInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *phoneLable;
@property (strong, nonatomic) XSMyHouseStatistical *dataModel;
@property (weak, nonatomic) IBOutlet UILabel *zjrz;
@property (weak, nonatomic) IBOutlet UIView *zjView;
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UIImageView *vipView;
@property (weak, nonatomic) IBOutlet UIImageView *vipXF;
@property (weak, nonatomic) IBOutlet UIView *vipbkview;

@property(nonatomic,weak)IBOutlet UILabel *publishRentNum;
@property(nonatomic,weak)IBOutlet UILabel *publishSecondNum;
@property(nonatomic,weak)IBOutlet UILabel *watchNewNum;
@property(nonatomic,weak)IBOutlet UILabel *watchRentNum;
@property(nonatomic,weak)IBOutlet UILabel *watchSecondNum;
@end

@implementation MyInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    [self observeNotification:NotificationLoginStatusChangedLogin];
    [self observeNotification:NotificationLoginStatusChangedLogout];
    [self loadData];
    [self messageServicete];

}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    self.userIcon.layer.masksToBounds = YES;
    self.userIcon.layer.cornerRadius = self.userIcon.bounds.size.height/2;
    self.userIcon.layer.borderWidth = 3.0;
    self.userIcon.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (void)messageServicete{
    [self.subInfoInterface messageServicetelWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        if (error == nil && responseModel.code.integerValue == SuccessCode) {
            [XSUserServer sharedInstance].kfPhone = responseModel.data;
        }
    }];
    
    [self.subInfoInterface bunneraboutWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        if (error == nil && responseModel.code.integerValue == SuccessCode) {
            [XSUserServer sharedInstance].wmdeshuoming = responseModel.data;

          }
    }];
}
- (void)loadData{
//    if (![XSUserServer sharedInstance].isLogin) {
//        return;
//    }
    WEAK_SELF;
    [self.subInfoInterface statisticsWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        if (error == nil) {
            STRONG_SELF;
            if (responseModel.code.integerValue == SuccessCode) {
              self.dataModel =  [XSMyHouseStatistical mj_objectWithKeyValues:responseModel.data];
                self.publishRentNum.text = [NSString stringWithFormat:@"(%@)",self.dataModel.publishRentNum];
                self.publishSecondNum.text = [NSString stringWithFormat:@"(%@)",self.dataModel.publishSecondNum];
                self.watchNewNum.text = [NSString stringWithFormat:@"(%@)",self.dataModel.watchNewNum];
                self.watchRentNum.text = [NSString stringWithFormat:@"(%@)",self.dataModel.watchRentNum];
                self.watchSecondNum.text = [NSString stringWithFormat:@"(%@)",self.dataModel.watchSecondNum];
                [XSUserServer sharedInstance].userModel.vip = self.dataModel.customer.vip;
            }
        }else{
                self.publishRentNum.text = [NSString stringWithFormat:@""];
                self.publishSecondNum.text = [NSString stringWithFormat:@""];
                self.watchNewNum.text = [NSString stringWithFormat:@""];
                self.watchRentNum.text = [NSString stringWithFormat:@""];
                self.watchSecondNum.text = [NSString stringWithFormat:@""];
        }
    }];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self refreshUIData];
    [self loadData];
}
- (void)refreshUIData{
      [self.userIcon sd_setImageWithURL:[NSURL URLWithString:[XSUserServer sharedInstance].userModel.icon] placeholderImage:[UIImage imageNamed:@"userIcon"]];
    if ([XSUserServer sharedInstance].isLogin) {
        if ([XSUserServer sharedInstance].userModel.nickName) {
            self.phoneLable.text = [XSUserServer sharedInstance].userModel.nickName;
        }else{
            self.phoneLable.text = [XSUserServer sharedInstance].userModel.phone;
        }

    }else{
        self.phoneLable.text = @"请登录";
    }
    self.dataModel = nil;
    self.zjrz.text = [XSUserServer sharedInstance].userModel.agency?@"已认证中介": @"未认证中介";
    self.zjView.hidden = ![XSUserServer sharedInstance].isLogin;
    self.vipView.hidden = ![XSUserServer sharedInstance].userModel.vip;
    self.vipXF.hidden = self.vipView.hidden;
    self.vipbkview.hidden = ![XSUserServer sharedInstance].isLogin;

}
- (IBAction)renzzj:(id)sender {
    if (![XSUserServer sharedInstance].userModel.agency) {
          XSResourceViewController *vc = [[XSResourceViewController alloc]init];
          [self.navigationController pushViewController:vc animated:YES];
      }
    
}
- (IBAction)jumpToSomePlace:(UIButton *)sender {
    WEAK_SELF;
    if (sender.tag == 6 || sender.tag == 7  || sender.tag == 8 ) {
        if (sender.tag == 6){
           XSAboutViewController *vc = [[XSAboutViewController alloc]init];
           [self.navigationController pushViewController:vc animated:YES];
        }else if (sender.tag == 7){
           NSString *telString = [XSUserServer sharedInstance].kfPhone;
            NSString *str=[[NSString alloc] initWithFormat:@"telprompt://%@",telString];
           if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:str]]) {
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:nil];
           }
        }else if (sender.tag == 8){
            [XSUserServer needLoginSuccess:^{
                STRONG_SELF;
                XSYJFKViewController *vc = [[XSYJFKViewController alloc]init];
                [self.navigationController pushViewController:vc animated:YES];
            } cancel:nil];
        }
    }else{
        [XSUserServer needLoginSuccess:^{
            STRONG_SELF;
            XSHouseResourceListViewController *vc = [[XSHouseResourceListViewController alloc]init];
            if (sender.tag == 1) {
                vc.houseType = XSBHouseType_old;
                vc.source = XSBHouseInfoSource_MyWatch;
            }else if (sender.tag == 2){
                XSHouselishViewController *vc = [[XSHouselishViewController alloc]init];
                vc.houseType = XSBHouseType_New;
                vc.source = XSBHouseInfoSource_MyWatch;
                [self.navigationController pushViewController:vc animated:YES];
                return ;
            }else if (sender.tag == 3){
                vc.houseType = XSBHouseType_Rent;
                vc.source = XSBHouseInfoSource_MyWatch;

            }else if (sender.tag == 4){
                vc.houseType = XSBHouseType_old;
                vc.source = XSBHouseInfoSource_MyPublish;
            }else if (sender.tag == 5){
                vc.houseType = XSBHouseType_Rent;
                vc.source = XSBHouseInfoSource_MyPublish;
            }
            [self.navigationController pushViewController:vc animated:YES];

        } cancel:^{
            
        }];

    }

}
- (IBAction)vip:(id)sender {
    WEAK_SELF;
    [XSUserServer needLoginSuccess:^{
        XSPaymentViewController *vc =   [XSPaymentViewController  sharedManager];
        vc.modalPresentationStyle = UIModalPresentationFullScreen;
        STRONG_SELF;
        [self presentViewController:vc animated:YES completion:^{
            
        }];
    } cancel:^{
        
    }];

}



- (void)handleNotification:(NSNotification *)notification {
    if ([notification.name isEqualToString:NotificationLoginStatusChangedLogin] || [notification.name isEqualToString:NotificationLoginStatusChangedLogout]) {
        [self refreshUIData];
    }
}

- (IBAction)userInfoClick:(id)sender {
    
    if ([XSUserServer sharedInstance].isLogin) {
        XSEditUserInfoController *login = [[XSEditUserInfoController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }else{
//        XSLoginViewController *login = [[XSLoginViewController alloc]init];
//         login.modalPresentationStyle = UIModalPresentationFullScreen;
//         [self presentViewController:login animated:YES completion:^{
//             
//         }];
        [XSUserServer needLoginSuccess:^{
            
        } cancel:^{
            
        }];
    }

}



@end

@implementation XSMyHouseStatistical



@end

