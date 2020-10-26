//
//  XSAboutViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/23.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSAboutViewController.h"

@interface XSAboutViewController ()
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UILabel *vsLable;

@end

@implementation XSAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于我们";
    self.text.text = [XSUserServer sharedInstance].wmdeshuoming;
    // Do any additional setup after loading the view from its nib.
    
    
    NSString *executableFile = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];//获取项目名称NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];//获取项目版本号
    self.vsLable.text = [NSString stringWithFormat:@"v%@",executableFile];
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
