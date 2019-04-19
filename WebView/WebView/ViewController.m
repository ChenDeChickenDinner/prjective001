//
//  ViewController.m
//  JavaScriptCore
//
//  Created by xs on 2019/4/18.
//  Copyright © 2019 xs. All rights reserved.
//

#import "ViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>



@interface ViewController ()<JSExport,UIWebViewDelegate>
@property(nonatomic,strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self webViewInformationSetting];
    [self webViewMultimediaSetting];
    [self webViewLoadData];
    
    
}
#pragma mark webView 视图层级
- (void)webViewInformationSetting{
    if (!self.webView) {
        self.webView = [[UIWebView alloc]init];
        self.webView.frame = self.view.bounds;
        self.webView.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:self.webView];
    }
    if (self.webView.scrollView) {
        self.webView.scrollView.bounces  = YES;
    }
    
    self.webView.scalesPageToFit = YES;
}
#pragma mark webView 多媒体交互信息
- (void)webViewMultimediaSetting{
    self.suppressesIncrementalRendering = NO;
    self.keyboardDisplayRequiresUserAction = YES;
    
    self.webView.dataDetectorTypes = UIDataDetectorTypeAll;
    
    self.webView.allowsInlineMediaPlayback = YES;
    self.webView.mediaPlaybackAllowsAirPlay = YES;
    self.webView.mediaPlaybackRequiresUserAction = YES;
    
    self.webView.paginationMode = UIWebPaginationModeUnpaginated;
    self.webView.pageLength = 10;
    self.webView.gapBetweenPages = 5;
    
    if (@available(iOS 9.0, *)) {
        self.webView.allowsInlineMediaPlayback = YES;
    }
    if (@available(iOS 9.0, *)) {
        self.webView.allowsLinkPreview = YES;
    }
    
}
#pragma mark webView 自身信息
- (void)webViewInformation{
    NSURLRequest *request = self.webView.request;
    BOOL canGoBack = self.webView.canGoBack;
    BOOL canGoForward = self.webView.canGoForward;
    BOOL loading = self.webView.loading;
    
}
#pragma mark webViewLoadData
- (void)webViewLoadData{
    //    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jianshu.com"]]];
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"HBHTML" ofType:@"html"];
    NSString *htmlStr = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    //    [self.webView loadHTMLString:htmlStr baseURL:nil];
    
    NSString *pdfPath = [[NSBundle mainBundle] pathForResource:@"HBBaiduPDF" ofType:@"pdf"];
    NSData *fileData = [NSData dataWithContentsOfFile:pdfPath];
    NSString *mimeType  = [self mimeType:[NSURL fileURLWithPath:pdfPath]];
    [self.webView loadData:fileData MIMEType:mimeType textEncodingName:@"UTF-8" baseURL:nil];
}

- (NSString *)mimeType:(NSURL *)url{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLResponse *response = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:nil];
    return response.MIMEType;
}
#pragma mark webView 执行操作
- (void)webViewPerformAction{
    [self.webView reload];
    
    [self.webView stopLoading];
    
    [self.webView goBack];
    
    [self.webView goForward];
}


#pragma mark webView 加载数据代理方法
//是否允许加载网页，也可获取js要打开的url，通过截取此url可与js交互
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
    //    1.从webView获取的信息
    
    //    2.从request获取的信息
    return YES;
}
//开始加载网页
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
//网页加载完成
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    
}
//网页加载错误
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}



#pragma mark 从webView获取JsContext信息
- (void)javaScriptContextInfoWithWebView:(UIWebView *)webView{
    
}
#pragma mark 从webView获取 请求信息
- (void)requestInfoWithRequest:(NSURLRequest *)request{
    
}
#pragma mark webView 执行JS
- (void)webViewPerformJavaScriptFromString:(NSString *)script{
    [self.webView stringByEvaluatingJavaScriptFromString:script];
}

#pragma mark 通过Safari打开一个网页
- (void)openUrlbySafariWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        [[UIApplication sharedApplication] openURL:[request URL]];
    }
}
@end
