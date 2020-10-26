//
//  XSBaseViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/16.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSBaseViewController.h"



@interface XSBaseViewController ()
@end

@implementation XSBaseViewController

- (XSUserInfoInterface *)userInfoInterface{
    if (_userInfoInterface == nil) {
        _userInfoInterface = [XSUserInfoInterface interfaceWithOperationManager:self.operationManager];
    }
    _userInfoInterface.operationManger = self.operationManager;
    return _userInfoInterface;
}
- (XShouseSubNetworkInterface *)subInfoInterface{
    if (_subInfoInterface == nil) {
        _subInfoInterface = [XShouseSubNetworkInterface interfaceWithOperationManager:self.operationManager];
    }
    _subInfoInterface.operationManger = self.operationManager;
    return _subInfoInterface;
}
- (AFSecurityPolicy *)customSecurityPolicy{
    /** https */
    NSString*cerPath = [[NSBundle mainBundle] pathForResource:@"fangdinghui"ofType:@"cer"];
    NSData*cerData = [NSData dataWithContentsOfFile:cerPath];
    NSSet*set = [[NSSet alloc] initWithObjects:cerData,nil];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:set];
    policy.allowInvalidCertificates = YES;
    policy.validatesDomainName = NO;
    policy.pinnedCertificates = [[NSSet alloc] initWithObjects:cerData, nil];
    return policy;
}
- (AFHTTPSessionManager *)operationManager{
    if (_operationManager == nil) {
        _operationManager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:XSBaseMomain]];
        [_operationManager setSecurityPolicy:[self customSecurityPolicy]];
        _operationManager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        _operationManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _operationManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _operationManager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json",
                                                                                  @"text/html",
                                                                                  @"text/json",
                                                                                  @"text/plain",
                                                                                  @"text/javascript",
                                                                                  @"text/xml",
                                                                                  @"image/*"]];
        [_operationManager.requestSerializer setValue:@"application/json;charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    }
    NSString *token  = [XSUserServer sharedInstance].userModel.token;
      if (token) {
          [_operationManager.requestSerializer setValue:token forHTTPHeaderField:@"token"];
      }
    return _operationManager;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    LYEmptyView *emptyView = [LYEmptyView emptyActionViewWithImageStr:@"xsnodata"
                                                             titleStr:@"暂无数据"
                                                            detailStr:@""
                                                          btnTitleStr:nil
                                                        btnClickBlock:nil];
    emptyView.subViewMargin = 20.f;
    emptyView.titleLabTextColor = XSColor(205, 205, 205);
    emptyView.detailLabFont = [UIFont systemFontOfSize:17];
    emptyView.actionBtnBackGroundColor = XSColor(90, 180, 160);
    self.emptyView = emptyView;
    
}


- (void)refreshUIData{
    
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)alertWithMessage:(NSString *)str{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:str preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * act =[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        [alert addAction:act];

        [self presentViewController:alert animated:YES completion:nil];
    
//    [ProgressHUD showSuccess:@"努力开发中"];
//    [ProgressHUD showSuccess:str];
}
@end
@implementation XSBKView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.layer.shadowColor = [UIColor hb_colorWithHexString:@"#929292" alpha:1].CGColor;
     self.layer.shadowOffset = CGSizeMake(3, 0);
     self.layer.shadowOpacity = 0.8;
     self.layer.shadowRadius = 1.5;
//     self.layer.cornerRadius = 5.0;
    
//    UIView *bkView = [[UIView alloc]initWithFrame:self.bounds];
//    bkView.backgroundColor = [UIColor hb_colorWithHexString:@"#EBEBEB" alpha:1];
////    bkView.layer.cornerRadius = 8;
//    bkView.layer.masksToBounds = YES;
//    bkView.layer.borderColor = [UIColor hb_colorWithHexString:@"#929292" alpha:1].CGColor;
//
//    [self addSubview:bkView];
}

@end
