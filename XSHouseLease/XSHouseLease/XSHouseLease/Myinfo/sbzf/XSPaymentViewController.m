//
//  XSPaymentViewController.m
//  XSHouseLease
//
//  Created by xs on 2020/6/12.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSPaymentViewController.h"
#import "APAuthInfo.h"
#import "APOrderInfo.h"

@interface XSPayModel : NSObject
@property(nonatomic,strong) NSNumber *packageId;
@property(nonatomic,strong) NSNumber *type;
@property(nonatomic,strong) NSNumber *price;
@property(nonatomic,copy) NSString *name;
@property(nonatomic,assign) BOOL sel;

@end
@interface XSPayZfbModel : NSObject

@property(nonatomic,copy) NSString *alipay_sdk;
@property(nonatomic,copy) NSString *app_id;
@property(nonatomic,copy) NSString *biz_content;
@property(nonatomic,copy) NSString *charset;
@property(nonatomic,copy) NSString *format;
@property(nonatomic,copy) NSString *method;
@property(nonatomic,copy) NSString *notify_url;
@property(nonatomic,copy) NSString *return_url;
@property(nonatomic,copy) NSString *sign;
@property(nonatomic,copy) NSString *sign_type;
@property(nonatomic,copy) NSString *timestamp;
@property(nonatomic,copy) NSString *version;
@end
@implementation XSPayZfbModel

@end

@implementation XSPayModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"packageId":@"id"};
}

@end
@interface XSPaymentViewController ()
@property(nonatomic,strong) XSPayModel *payModel;
@property (weak, nonatomic) IBOutlet UILabel *money1;
@property (weak, nonatomic) IBOutlet UILabel *money2;
@property (weak, nonatomic) IBOutlet UILabel *money3;
@property (weak, nonatomic) IBOutlet UIImageView *zfbimage;
@property (weak, nonatomic) IBOutlet UIImageView *wximage;
@property(nonatomic,assign) XSPayType  payType;
@property(nonatomic,assign) XSPayTimeType  payTimeType;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image3;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property(nonatomic,strong) NSMutableArray *array;
@property (weak, nonatomic) IBOutlet UIButton *chooseBtn;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *ggg;
@end

@implementation XSPaymentViewController
+(instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static XSPaymentViewController *instance;
    dispatch_once(&onceToken, ^{
        instance = [[XSPaymentViewController alloc] init];
    });
    return instance;
}
- (NSMutableArray *)array{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (IBAction)dis:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#define TU_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)

- (void)viewDidLoad {
    [super viewDidLoad];
    self.money1.text = [NSString stringWithFormat:@"--"];
    self.money2.text = [NSString stringWithFormat:@"--"];
    self.money3.text = [NSString stringWithFormat:@"--"];

    self.image1.layer.masksToBounds = YES;
    self.image1.layer.cornerRadius = 5;
    self.image2.layer.masksToBounds = YES;
    self.image2.layer.cornerRadius = 5;
    self.image3.layer.masksToBounds = YES;
    self.image3.layer.cornerRadius = 5;
    if (TU_SCREEN_HEIGHT <= 568) {
        self.ggg.constant = 130;
    }else if (TU_SCREEN_HEIGHT <= 667){
        self.ggg.constant = 170;
    }
    self.payType = XSPayType_zfb;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(alipaySuccess:) name:@"XSAlipaySuccess" object:nil];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self loadPackage];
}
- (void)alipaySuccess:(id)ob{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (void)loadPackage{
    WEAK_SELF;
    self.array = nil;
    [self.subInfoInterface packagesWithCallback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        if (error == nil && responseModel.code.integerValue == SuccessCode) {
            STRONG_SELF;
            self.array = [XSPayModel mj_objectArrayWithKeyValuesArray:[responseModel.data objectForKey:@"dtos"]];
            XSPayModel *model = self.array.firstObject;
            model.sel = YES;
            [self refreshUIData];
        }
    }];
}


- (void)refreshUIData{
    self.image1.image = [UIImage imageNamed:@"moneyicon"];
    self.image2.image = [UIImage imageNamed:@"moneyicon"];
    self.image3.image = [UIImage imageNamed:@"moneyicon"];

    for (XSPayModel *model in self.array) {
        if (model.type.integerValue == XSPayTimeType_month) {
            self.money1.text = [NSString stringWithFormat:@"￥%@",model.price];
            if (model.sel) {
                self.image1.image = [UIImage imageNamed:@"thisMoney"];
                [self.chooseBtn setTitle:[NSString stringWithFormat:@"您现在选择的是%@",model.name] forState:UIControlStateNormal];

            }

        }else if (model.type.integerValue == XSPayTimeType_season){
            self.money2.text = [NSString stringWithFormat:@"￥%@",model.price];
            if (model.sel) {
                       self.image2.image = [UIImage imageNamed:@"thisMoney"];
                [self.chooseBtn setTitle:[NSString stringWithFormat:@"您现在选择的是%@",model.name] forState:UIControlStateNormal];

                   }

        }else if (model.type.integerValue == XSPayTimeType_year){
            self.money3.text = [NSString stringWithFormat:@"￥%@",model.price];
            if (model.sel) {
                       self.image3.image = [UIImage imageNamed:@"thisMoney"];
                [self.chooseBtn setTitle:[NSString stringWithFormat:@"您现在选择的是%@",model.name] forState:UIControlStateNormal];

                   }

        }
    }
    
    self.zfbimage.image = [UIImage imageNamed:@"zfbx"];
    self.wximage.image = [UIImage imageNamed:@"zfbx"];
    if (self.payType == XSPayType_zfb) {
        self.zfbimage.image = [UIImage imageNamed:@"zfxt"];
    }else{
        self.wximage.image = [UIImage imageNamed:@"zfxt"];
    }
    

}
- (IBAction)chooseMoney:(UIButton *)sender {
    for (XSPayModel *model in self.array) {
        if (model.type.integerValue == sender.tag) {
            model.sel = YES;
        }else{
            model.sel = NO;
        }
    }
    [self refreshUIData];

}
- (IBAction)zfbclick:(id)sender {
    self.payType = XSPayType_zfb;
    [self refreshUIData];

}
- (IBAction)wxClick:(id)sender {
    self.payType = XSPayType_wx;
    [self refreshUIData];

}
- (IBAction)pay:(id)sender {
    if (self.array.count > 0) {
        [self payRequest];
    }
}

- (void)payRequest{
    NSNumber *packageId = nil;
    for (XSPayModel *model in self.array) {
        if (model.sel) {
            packageId = model.packageId;
        }
    }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    WEAK_SELF;
    [self.subInfoInterface orderstringWithCode:nil packageId:packageId payType:self.payType callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;
        [MBProgressHUD  hideHUDForView:self.view animated:YES];
        if (error == nil && responseModel.code.integerValue == SuccessCode) {
            [self jumpPaYAPPWithStr:responseModel.data];
        }
    }];
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (void)jumpPaYAPPWithStr:(NSString *)str{
    
    if (str && str.length > 0) {
        if (self.payType == XSPayType_wx) {
             if (![WXApi isWXAppInstalled]) {
                 [ProgressHUD showError:@"未安装微信客户端"];
                 return;
             }
             if (![WXApi isWXAppSupportApi]) {
                 [ProgressHUD showError:@"微信客户端版本过低"];
                 return;
             }
            NSDictionary *dict = [self dictionaryWithJsonString:str];

             [self wxPaymentWithUrl:dict];

         }else{

             [[AlipaySDK defaultService] payOrder:str fromScheme:@"fangdinghuiios" callback:^(NSDictionary *resultDic) {
                        NSLog(@"reslut = %@",resultDic);
             }];
             
             return;

         }
    }
    
 
}

- (NSDictionary *)jsonDict:(NSString *)str{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    NSArray *array = [str componentsSeparatedByString:@"&"];
    for (NSString *keyValueStr in array) {
        NSArray *keyAndValue = [keyValueStr componentsSeparatedByString:@"="];
        [dict safeSetObject:keyAndValue.lastObject forKey:keyAndValue.firstObject];
    }
    return dict;
}


- (void)wxPaymentWithUrl:(NSDictionary *)dict{
    
    
    NSMutableString *retcode = [dict objectForKey:@"retcode"];
    if (retcode.intValue == 0){
        NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
        PayReq* req             = [[PayReq alloc] init];
        req.partnerId           = [dict objectForKey:@"partnerid"];
        req.prepayId            = [dict objectForKey:@"prepayid"];
        req.nonceStr            = [dict objectForKey:@"noncestr"];
        req.timeStamp           = stamp.intValue;
        req.package             = [dict objectForKey:@"package"];
        req.sign                = [dict objectForKey:@"sign"];

        [WXApi sendReq:req completion:^(BOOL success) {
            NSLog(@"11");
        }];

    }

}

#pragma mark - WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    if([resp isKindOfClass:[PayResp class]]){
        //支付返回结果，实际支付结果需要去微信服务器端查询
        switch (resp.errCode) {
            case WXSuccess:
            {
                [XSUserServer sharedInstance].userModel.vip = YES;
                [ProgressHUD showSuccess:@"支付结果：成功！"];
                WEAK_SELF;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [weakSelf dismissViewControllerAnimated:YES completion:nil];
                });
            }
                break;
                
            default:
                [ProgressHUD showError:@"支付结果：失败！"];
                break;
        }

    }else {
        
    }
}



@end
