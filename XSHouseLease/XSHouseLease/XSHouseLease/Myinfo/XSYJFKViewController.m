//
//  XSYJFKViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/24.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSYJFKViewController.h"

@interface XSYJFKViewController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *YIText;
@property (weak, nonatomic) IBOutlet UILabel *number;

@end

@implementation XSYJFKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"意见反馈";
    self.view.backgroundColor = XSColor(236, 236, 236);
    self.YIText.delegate = self;
    // Do any additional setup after loading the view from its nib.
}
- (void)textViewDidChange:(UITextView *)textView{
    self.number.text = [NSString stringWithFormat:@"%ld/200",textView.text.length];
}
- (IBAction)submit:(id)sender {
    if (self.YIText.text.length < 10) {
        [ProgressHUD showError:@"字数过短"];
        return;
    }else if (self.YIText.text.length > 200){
        [ProgressHUD showError:@"字数过长"];
        return;
    }
    if (self.YIText.text.length >= 10) {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict safeSetObject:[XSUserServer sharedInstance].userModel.ID forKey:@"customerId"];
    [dict safeSetObject:[XSUserServer sharedInstance].userModel.phone forKey:@"contact"];
    [dict safeSetObject:self.YIText.text forKey:@"content"];
    WEAK_SELF;
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [self.subInfoInterface adviseSaver:dict callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        [MBProgressHUD  hideHUDForView:weakSelf.view animated:YES];
        if (error == nil && responseModel.code.integerValue == SuccessCode) {
            [ProgressHUD showSuccess:@"反馈成功"];
            [weakSelf.navigationController popToRootViewControllerAnimated:YES];
         }
    }];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
