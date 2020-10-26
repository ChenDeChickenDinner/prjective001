//
//  XSWKWebViewController.m
//  XSHouseLease
//
//  Created by xs on 2020/4/22.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSWKWebViewController.h"
#import <WebKit/WKWebView.h>
@interface XSWKWebViewController ()<WKUIDelegate,WKNavigationDelegate>
@property(nonatomic,strong) WKWebView *webView;


@end

@implementation XSWKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.webView = [[WKWebView alloc]initWithFrame:self.view.bounds];
     self.webView.UIDelegate = self;
     self.webView.navigationDelegate = self;
     self.webView.allowsBackForwardNavigationGestures = YES;
    
    [self.view addSubview:self.webView];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.url]];
    [self.webView loadRequest:request];
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];

}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [MBProgressHUD  hideHUDForView:self.view animated:YES];

}
  
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    [MBProgressHUD  hideHUDForView:self.view animated:YES];
    [ProgressHUD showError:@"加载失败请点击重试" Interaction:YES];

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
@end
