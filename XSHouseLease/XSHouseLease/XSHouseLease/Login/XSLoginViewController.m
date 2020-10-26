//
//  XSLoginViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/16.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSLoginViewController.h"
#import "XSRoundedView.h"
#import "XSLogInVcModel.h"
#import "XSUserLogInModel.h"
#import "XSWKWebViewController.h"
#define MessageWaitTime 60



typedef void (^sendMessageSuccessful)(BOOL successful);

@interface XSLoginViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *picyureCheckView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *picyureCheckViewHeight;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *pictureTextField;
@property (weak, nonatomic) IBOutlet UITextField *messageTextField;

@property (weak, nonatomic) IBOutlet UIImageView *pictureImage;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property (weak, nonatomic) IBOutlet UIButton *agreedBtn;


@property (strong, nonatomic)  XSLogInVcModel *logInModel;
@property (strong, nonatomic)  CADisplayLink *displayLink;

@property (assign, nonatomic)  NSUInteger midCount;

@end

@implementation XSLoginViewController
- (XSLogInVcModel *)logInModel{
    if (!_logInModel) {
        _logInModel = [[XSLogInVcModel alloc]init];
    }
    return _logInModel;
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
     self.displayLink = nil;
    [self.view endEditing:YES];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.phoneTextField.delegate = self;
    self.pictureTextField.delegate = self;
    self.messageTextField.delegate = self;
    self.phoneTextField.textColor = XSColor(47, 47, 47);
    self.pictureTextField.textColor = XSColor(47, 47, 47);
    self.messageTextField.textColor = XSColor(47, 47, 47);

//    self.picyureCheckViewHeight.constant = 0.1;
    [self refreshUIData];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;

}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}
- (void)refreshUIData{
    self.phoneTextField.text = self.logInModel.phone;
    self.pictureTextField.text = self.logInModel.pictureCheckCode;
    self.messageTextField.text = self.logInModel.messageCheckCode;

    self.picyureCheckViewHeight.constant = self.logInModel.pictureData?58:0.1;
    self.picyureCheckView.hidden = self.logInModel.pictureData?NO:YES;

    
    self.pictureImage.image = [UIImage imageWithData:self.logInModel.pictureData];
    if (self.logInModel.waitingMessage) {
//        [self.messageBtn setTitle:@"等待接收中" forState:UIControlStateNormal];
        self.messageBtn.userInteractionEnabled = NO;
    }else{
        [self.messageBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        self.messageBtn.userInteractionEnabled = YES;
    }
    [self.loginBtn setSelected:self.logInModel.allowLogin];
    if (self.logInModel.allowLogin) {
        [self.loginBtn setBackgroundColor:XSColor(235, 48, 48)];
    }else{
        [self.loginBtn setBackgroundColor:XSColor(255, 204, 204)];
    }
//    self.loginBtn.userInteractionEnabled = self.logInModel.allowLogin;
    
    self.agreedBtn.selected = self.logInModel.agreement;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == self.messageTextField){
        [self.loginBtn setSelected:self.logInModel.allowLogin];

        if (self.logInModel.phone) {
            [self.loginBtn setBackgroundColor:XSColor(235, 48, 48)];
        }else{
            [self.loginBtn setBackgroundColor:XSColor(255, 204, 204)];
        }
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
    if (textField.text.length > 0) {
        if (textField == self.phoneTextField) {
            self.logInModel.phone = textField.text;
        }else if (textField == self.pictureTextField){
            self.logInModel.pictureCheckCode = textField.text;
        }else if (textField == self.messageTextField){
            self.logInModel.messageCheckCode = textField.text;
        }
    }else{
        if (textField == self.phoneTextField) {
            self.logInModel.phone = nil;
        }else if (textField == self.pictureTextField){
            self.logInModel.pictureCheckCode = nil;
        }else if (textField == self.messageTextField){
            self.logInModel.messageCheckCode = nil;
        }
    }

    [self refreshUIData];
}


- (IBAction)sendMessage:(id)sender {
    [self.view endEditing:YES];
    
    if (!self.logInModel.phone || self.logInModel.phone.length < 11) {
        [ProgressHUD showError:@"请输入号码"];

        return;
    }
    if (self.logInModel.pictureData && !self.logInModel.pictureCheckCode) {
        [ProgressHUD showError:@"请输入图像验证码"];
        return;
     }
    WEAK_SELF;
    [self sendPhoneMessage:^(BOOL successful) {
        STRONG_SELF;
        if (successful) {
            self.logInModel.waitingMessage = YES;
            self.messageBtn.userInteractionEnabled = NO;
            [self.messageBtn setTitle:@"60" forState:UIControlStateNormal];
             self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateMidLabel)];
             [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
        }
       
    }];
}
- (IBAction)getPicture:(id)sender {

    [self sendPhoneMessage:nil];
}
- (void)sendPhoneMessage:(sendMessageSuccessful)block{
    WEAK_SELF;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.userInfoInterface sendmessageWithPhone:self.logInModel.phone pictureCode:self.logInModel.pictureCheckCode callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;
        [MBProgressHUD  hideHUDForView:self.view animated:YES];
        if (error == nil) {
            if (responseModel.code.integerValue == SuccessCode) {
//                self.logInModel.pictureCheck = NO;
                self.logInModel.pictureData = nil;
                self.logInModel.pictureCheckCode = nil;

                [ProgressHUD showSuccess:@"短信已发送"];

                if (block)block(YES);
            }else{
                self.logInModel.waitingMessage = NO;
                NSData *pictureData = [NSData base64DataFromString:responseModel.data];
                if ([UIImage imageWithData:pictureData]) {
                    self.logInModel.pictureCheckCode = nil;
                    self.logInModel.pictureData = pictureData;
    //                self.logInModel.pictureCheck = YES;
                    [ProgressHUD showSuccess:@"输入图形验证码"];

                }else{
                    [self alertWithMessage:[NSString stringWithFormat:@"%@",responseModel.data]];
                }
            }

        }else{
            self.logInModel.waitingMessage = NO;
            [self alertWithMessage:error.localizedDescription];
        }
        [self refreshUIData];

    }];
    
}

//- (void)sendPictureMeaasge{
//    WEAK_SELF;
//    [self.userInfoInterface sendpictureWithPhone:self.logInModel.phone callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
//        STRONG_SELF;
//        if (error == nil) {
//            if (responseModel.code.integerValue == SuccessCode) {
//                  NSData *pictureData = [NSData base64DataFromString:responseModel.message];
//                if (pictureData) {
//                    self.logInModel.pictureData = pictureData;
//                    self.logInModel.pictureCheckCode = nil;
//                    [self refreshUIData];
//                }
//
//            }
//        }else{
//
//        }
//    }];
//}


- (IBAction)loginClick:(id)sender {
    [self.view endEditing:YES];
    if (!self.logInModel.phone) {
        [ProgressHUD showError:@"请输入号码"];

        return;
    }
    if (self.logInModel.pictureData && !self.logInModel.pictureCheckCode) {
        [ProgressHUD showError:@"请输入图像验证码"];
        return;
     }
    if (!self.logInModel.messageCheckCode) {
        [ProgressHUD showError:@"请输入短信验证码"];
        return;
     }
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    XSUserLogInModel *model = [XSUserLogInModel userLogInModelForVcModel:self.logInModel];
    WEAK_SELF;
    [self.userInfoInterface loginWithCheckInfo:model callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;
        [MBProgressHUD  hideHUDForView:self.view animated:YES];
        if (error == nil) {
            [ProgressHUD showSuccess:responseModel.message];
           if (responseModel.code.integerValue == SuccessCode) {
               [self loginSuccess:responseModel];
           }
        }else{
            [ProgressHUD showError:error.description];
        }
    }];
}
- (void)loginSuccess:(XSNetworkResponse *)responseModel{
    XSUserModel *model =  [XSUserModel mj_objectWithKeyValues:responseModel.data];
    [XSUserServer sharedInstance].userModel = model;

    WEAK_SELF;
    [self dismissViewControllerAnimated:YES completion:^{
        STRONG_SELF;
           if(self.successBlack)self.successBlack();
    }];
}
- (void)loginFailure{
    
}

- (IBAction)dismissViewController:(UIButton *)sender {
    WEAK_SELF;
    [self dismissViewControllerAnimated:YES completion:^{
        STRONG_SELF;
        if(self.cancelBlack)self.cancelBlack();
    }];
}

- (IBAction)agreementClick:(UIButton *)sender {
    [self.view endEditing:YES];
    self.logInModel.agreement =  !self.logInModel.agreement;
    [self refreshUIData];
//    sender.selected = !sender.selected;
//    sender.state = sender.selected?UIControlStateSelected:UIControlStateNormal;
}
- (IBAction)uhhax:(id)sender {
    XSWKWebViewController *vc = [[XSWKWebViewController alloc]init];
    vc.title = @"房源用户服务协议";
    vc.url = XSYHXY;
    [self.navigationController pushViewController:vc animated:YES];
}


#define XDMIN 60
- (void)updateMidLabel {
    _midCount += 1;
    if (_midCount % XDMIN == 0) {
        NSInteger result = MessageWaitTime - _midCount / XDMIN;
         NSString *str = [NSString stringWithFormat:@"%ld",result];
        [self.messageBtn setTitle:str forState:UIControlStateNormal];
        if (result == 0) {
            [self.displayLink invalidate];
            self.midCount = 0;
            self.logInModel.waitingMessage = NO;
            [self refreshUIData];
        }

    }
}

@end
