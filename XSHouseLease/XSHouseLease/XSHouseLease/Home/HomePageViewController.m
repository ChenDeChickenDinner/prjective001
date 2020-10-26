//
//  HomePageViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/22.
//  Copyright © 2020 fang. All rights reserved.
//

#import "HomePageViewController.h"
#import "XSLocationSearchview.h"
#import "XSHouseSubmitFirstViewController.h"
#import "XSResourceViewController.h"
#import "XSHouselishViewController.h"
#import "XSSearchEstateController.h"
#import "XSBuyHouseViewController.h"
#import <ShareSDK/ShareSDK.h>
#import <ShareSDKUI/ShareSDK+SSUI.h>
#import "XSPaymentViewController.h"
@interface HomePageViewController ()<UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet XSLocationSearchview *searchView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tom1;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tom2;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tom3;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tom4;

@property (weak, nonatomic) IBOutlet UIImageView *source0;
@property (weak, nonatomic) IBOutlet UIImageView *source1;

@property (weak, nonatomic) IBOutlet UIView *tomBk;
@property (weak, nonatomic) IBOutlet UIImageView *tisImage1;
@property (weak, nonatomic) IBOutlet UIImageView *tisImage2;
@property (weak, nonatomic) IBOutlet UIImageView *tisImage3;
@property (weak, nonatomic) IBOutlet UIImageView *tisImage4;


@property (weak, nonatomic) IBOutlet UILabel *tis1;
@property (weak, nonatomic) IBOutlet UILabel *tis2;
@property (weak, nonatomic) IBOutlet UILabel *tis3;
@property (weak, nonatomic) IBOutlet UILabel *tis4;

@property (weak, nonatomic) IBOutlet UILabel *titleLable1;
@property (weak, nonatomic) IBOutlet UILabel *titleLable2;
@property (weak, nonatomic) IBOutlet UILabel *titleLable3;
@property (weak, nonatomic) IBOutlet UILabel *titleLable4;

// 发布信息
@property (nonatomic, assign) BOOL freeRelease;

@property (nonatomic,assign) XSHouseSource resource;
@end

@implementation HomePageViewController
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    CGFloat height = (self.tomBk.height - 75 *4)/5;
    self.tom1.constant = height;
    self.tom2.constant = height;
    self.tom3.constant = height;
    self.tom4.constant = height;
    [self.view layoutIfNeeded];

}

- (IBAction)source:(UIButton *)sender {

    if (sender.tag == XSHouseSource_1) {
        self.source0.image = [UIImage imageNamed:@"source0S"];
        self.source1.image = [UIImage imageNamed:@"source1"];
        self.tis1.text = @"免中介费";
        self.tis2.text = @"免中介费";
        self.tis3.text = @"免中介费";
        self.tis4.text = @"免中介费";
    }else if(sender.tag == XSHouseSource_2){
        self.source0.image = [UIImage imageNamed:@"source0"];
        self.source1.image = [UIImage imageNamed:@"source1S"];
        self.tis1.text = @"中介费优惠";
        self.tis2.text = @"中介费优惠";
        self.tis3.text = @"中介费优惠";
        self.tis4.text = @"中介费优惠";
    }
    self.resource = (XSHouseSource)sender.tag;
}
- (void)changeLbaleFount:(UILabel *)lable{
    NSMutableAttributedString *numString = [[NSMutableAttributedString alloc] initWithString:lable.text];
    NSRange ran2 = NSMakeRange(2, 1);
    [numString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:23] range:ran2];
    lable.attributedText = numString;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.titleLable1.attributedText = nil;
    
    [self changeLbaleFount:self.titleLable1];
    [self changeLbaleFount:self.titleLable2];
    [self changeLbaleFount:self.titleLable3];
    [self changeLbaleFount:self.titleLable4];

    
    self.navigationController.delegate = self;
    self.resource = XSHouseSource_1;
    WEAK_SELF;
    self.searchView.searchBlack = ^(NSString *searhKey,XSBHouseType type) {
        STRONG_SELF;
         XSSearchEstateController *vc = [[XSSearchEstateController alloc]init];
        vc.black = YES;
          vc.cityModel = [XSUserServer sharedInstance].cityModel;
          vc.searchTitleBlock = ^(NSString * _Nonnull searchStr, XSBHouseType houseType) {
              XSHouselishViewController *list = [[XSHouselishViewController alloc]init];
               list.searchTitle = searchStr;
               list.houseType = houseType;
               list.source = XSBHouseInfoSource_keyPush;
               list.resource = self.resource;
               list.search = YES;
               list.screening = YES;
               [self.navigationController pushViewController:list animated:YES];
          };
          [self.navigationController pushViewController:vc animated:YES];
    };
    [XSHouseSubMitDynamicServer sharedInstance];
    
    [[XSUserServer sharedInstance] YHGetLocationPermissionVerifcationWithController:self];

    [XSUserServer automaticLogin];
    
    [self city_tree];

}
- (void)xaxa{
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    
//    [params SSDKSetupShareParamsByText:@"房鼎汇" images:[UIImage imageNamed:@"XSLOGO"] url:[NSURL URLWithString:@"https://apps.apple.com/cn/app/%E6%88%BF%E9%BC%8E%E6%B1%87/id1515851118"] title:@"房鼎汇" type:SSDKContentTypeAuto];

    [params SSDKSetupWeChatParamsByText:@"房鼎汇描述" title:@"房鼎汇标题" url:[NSURL URLWithString:@"https://apps.apple.com/cn/app/%E6%88%BF%E9%BC%8E%E6%B1%87/id1515851118"] thumbImage:[UIImage imageNamed:@"XSLOGO"] image:[UIImage imageNamed:@"appStoreIcon"] musicFileURL:nil extInfo:nil fileData:nil emoticonData:nil sourceFileExtension:nil sourceFileData:nil type:SSDKContentTypeApp forPlatformSubType:SSDKPlatformSubTypeWechatSession];
    [ShareSDK showShareActionSheet:nil //(第一个参数要显示菜单的视图,
                     customItems:@[@(SSDKPlatformSubTypeWechatSession),@(SSDKPlatformSubTypeWechatTimeline)]
                     shareParams:params
              sheetConfiguration:nil
                  onStateChanged:^(SSDKResponseState state, SSDKPlatformType platformType,NSDictionary *userData,SSDKContentEntity *contentEntity,NSError *error,BOOL end)
             {
    switch (state) {
                 case SSDKResponseStateSuccess:
                         NSLog(@"成功");//成功
                         break;
                 case SSDKResponseStateFail:
                    {
                         NSLog(@"--%@",error.description);//失败
                         break;
                    }
                 case SSDKResponseStateCancel:
                 break;
                 default:
                 break;
             }
    }];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([XSUserServer sharedInstance].isLogin ) {
//        [self.subInfoInterface authenticationWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
//            if (error == nil && responseModel.code.intValue == SuccessCode) {
//                NSNumber *num = responseModel.data;
//                [XSUserServer sharedInstance].userModel.agencyType = (XSAgencyType)num.integerValue;
//
//            }
//        }];
        [self.subInfoInterface statisticsWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
            if (error == nil) {
                if (responseModel.code.integerValue == SuccessCode) {
                   NSDictionary *dict =  [responseModel.data objectForKey:@"customer"];
                    [XSUserServer sharedInstance].userModel.vip = (BOOL)[dict objectForKey:@"vip"];;
                    NSNumber *num = [dict objectForKey:@"agencyStatus"];
                    [XSUserServer sharedInstance].userModel.agencyType =  (XSAgencyType)num.integerValue;
                    XSUserModel *userModel = [XSUserServer sharedInstance].userModel;
                    NSLog(@"123");
                }
            }else{
          
            }
        }];
    }

    
}
- (void)vipjianCeHouseType:(XSBHouseType)type black:(void(^)(void))black{
    if ([XSUserServer sharedInstance].userModel.vip) {
        if (black) {
            black();
        }
    }else{
        [self.subInfoInterface limitstatusWithresource:self.resource houseType:type Callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
            if (error == nil) {
                if (responseModel.data) {
                    if (black) {
                        black();
                     }
                }else{
                       WEAK_SELF;
                       UIAlertController *arl =  [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"免费发布房源次数已用完，开通VIP可无限次发布\n是否开通VIP" preferredStyle:UIAlertControllerStyleAlert];
                         UIAlertAction *can = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                             
                         }];
                         UIAlertAction *ok = [UIAlertAction actionWithTitle:@"开通" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                             STRONG_SELF;
                             XSPaymentViewController *vc = [[XSPaymentViewController alloc]init];
                             vc.modalPresentationStyle = UIModalPresentationFullScreen;
                             [self presentViewController:vc animated:YES completion:nil];
                             
                         }];
                         [arl addAction:can];
                         [arl addAction:ok];

                         [self presentViewController:arl animated:YES completion:^{
                             
                         }];
                }
            }
        }];
    }
}
- (void)agencyChicken:(void(^)(void))success{
    
    if (self.resource == XSHouseSource_2) {
        if (![XSUserServer sharedInstance].userModel.agency) {
            
            WEAK_SELF;
            UIAlertController *arl =  [UIAlertController alertControllerWithTitle:@"发布房源前" message:@"请先进行中介认证" preferredStyle:UIAlertControllerStyleAlert];
              UIAlertAction *can = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                  
              }];
              UIAlertAction *ok = [UIAlertAction actionWithTitle:@"免费认证" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                  STRONG_SELF;
                     XSResourceViewController *vc = [[XSResourceViewController alloc]init];
                     [self.navigationController pushViewController:vc animated:YES];
               }];
              [arl addAction:can];
              [arl addAction:ok];

              [self presentViewController:arl animated:YES completion:^{
                  
              }];

            
    
            return;
        }
    }
    if (success) {
        success();
    }
}
- (IBAction)jumpClick:(UIButton *)sender {
//    [self xaxa];
//    return;
    WEAK_SELF;
      switch (sender.tag) {
          case 0:
          {
            [XSUserServer needLoginSuccess:^{
                STRONG_SELF;
                [self agencyChicken:^{
                    
                    [self vipjianCeHouseType:3 black:^{
                        XSHouseSubmitFirstViewController *vc = [[XSHouseSubmitFirstViewController alloc]init];
                       vc.subMitServer.houseType = XSBHouseType_Rent;
                       vc.subMitServer.resource = self.resource;
                       [self.navigationController pushViewController:vc animated:YES];
                    }];
           
                }];
            } cancel:^{
                
            }];
        

          }
              break;
          case 1:
          {
            [XSUserServer needLoginSuccess:^{
                STRONG_SELF;
                [self agencyChicken:^{
                    
                    [self vipjianCeHouseType:1 black:^{
                        XSHouseSubmitFirstViewController *vc = [[XSHouseSubmitFirstViewController alloc]init];
                        vc.subMitServer.houseType = XSBHouseType_old;
                        vc.subMitServer.resource = self.resource;
                        [self.navigationController pushViewController:vc animated:YES];
                    }];
           
                }];

            } cancel:^{

            }];
        
          }
          break;

          case 2:
          {
               XSHouselishViewController *list = [[XSHouselishViewController alloc]init];
               list.houseType = XSBHouseType_Rent;
               list.source = XSBHouseInfoSource_keyPush;
               list.resource = self.resource;
               list.module = YES;
               list.search = YES;
               list.screening = YES;
               [self.navigationController pushViewController:list animated:YES];
           }
          break;
          case 3:
          {
              XSBuyHouseViewController *vc = [[XSBuyHouseViewController alloc]init];
              vc.resource = self.resource;
              [self.navigationController pushViewController:vc animated:YES];
          }
          break;

              
          default:
              break;
      }

}

// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}

-(void)city_tree{
    WEAK_SELF;

    
    [[XSPublicServer sharedInstance] cityTreeWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        
    }];
    [[XSPublicServer sharedInstance] bunnerListWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;
          self.searchView.imagePathsGroup = [XSPublicServer sharedInstance].bunnerUrlArray;

      }];
     [[XSPublicServer sharedInstance] hotsSearchWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;

          self.searchView.hotsSearchArray = [XSPublicServer sharedInstance].hotsSearchArray;

      }];

    [[XSPublicServer sharedInstance] enumFacilitiesWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
          
      }];
    [[XSPublicServer sharedInstance] renthouseConditionWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
          
      }];
}
@end
