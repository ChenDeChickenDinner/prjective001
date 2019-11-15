//
//  ViewController.h
//  JavaScriptCore
//
//  Created by xs on 2019/4/18.
//  Copyright © 2019 xs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController






//常用属性
//**webView的代理**
@property (nullable, nonatomic, assign) id <UIWebViewDelegate> delegate;
//**内置的scrollView**
@property (nonatomic, readonly, strong) UIScrollView *scrollView ;
//**URL请求**
@property (nullable, nonatomic, readonly, strong) NSURLRequest *request;
//**是否缩放到适合屏幕大小**
@property (nonatomic) BOOL scalesPageToFit;

//多媒体属性
//设置某些数据变为链接形式，这个枚举可以设置如电话号，地址，邮箱等转化为链接
@property (nonatomic) UIDataDetectorTypes dataDetectorTypes NS_AVAILABLE_IOS(3_0);
//设置是否使用内联播放器播放视频 // iPhone Safari defaults to NO. iPad Safari defaults to YES
@property (nonatomic) BOOL allowsInlineMediaPlayback NS_AVAILABLE_IOS(4_0);
//设置视频是否自动播放 // iPhone and iPad Safari both default to YES
@property (nonatomic) BOOL mediaPlaybackRequiresUserAction NS_AVAILABLE_IOS(4_0);
//设置音频播放是否支持ari play功能 // iPhone and iPad Safari both default to YES
@property (nonatomic) BOOL mediaPlaybackAllowsAirPlay NS_AVAILABLE_IOS(5_0);
//设置是否将数据加载如内存后渲染界面// iPhone and iPad Safari both default to NO
@property (nonatomic) BOOL suppressesIncrementalRendering NS_AVAILABLE_IOS(6_0);
//设置用户交互模式
@property (nonatomic) BOOL keyboardDisplayRequiresUserAction NS_AVAILABLE_IOS(6_0);

//iOS7.0 新特性
//这个属性用来设置一种模式，当网页的大小超出view时，将网页以翻页的效果展示，枚举如下：

/*typedef NS_ENUM(NSInteger, UIWebPaginationMode)
 {
 UIWebPaginationModeUnpaginated, //不使用翻页效果
 UIWebPaginationModeLeftToRight, //将网页超出部分分页，从左向右进行翻页
 UIWebPaginationModeTopToBottom, //将网页超出部分分页，从上向下进行翻页
 UIWebPaginationModeBottomToTop, //将网页超出部分分页，从下向上进行翻页
 UIWebPaginationModeRightToLeft //将网页超出部分分页，从右向左进行翻页
 } __TVOS_PROHIBITED;*/
@property (nonatomic) UIWebPaginationMode paginationMode NS_AVAILABLE_IOS(7_0);

//设置每一页的长度
@property (nonatomic) CGFloat pageLength NS_AVAILABLE_IOS(7_0);
//设置每一页的间距
@property (nonatomic) CGFloat gapBetweenPages NS_AVAILABLE_IOS(7_0);
//获取分页数
@property (nonatomic, readonly) NSUInteger pageCount NS_AVAILABLE_IOS(7_0);
// 这个属性决定CSS的属性分页是可用还是忽略。默认是UIWebPaginationBreakingModePage
/*typedef NS_ENUM(NSInteger, UIWebPaginationBreakingMode)
 {
 UIWebPaginationBreakingModePage,
 UIWebPaginationBreakingModeColumn
 } ;*/
@property (nonatomic) UIWebPaginationBreakingMode paginationBreakingMode NS_AVAILABLE_IOS(7_0);


//iOS9.0新特性
// 是否允许画中画播放
@property (nonatomic) BOOL allowsPictureInPictureMediaPlayback NS_AVAILABLE_IOS(9_0);
// 是否支持3d touch 预览 相关
@property (nonatomic) BOOL allowsLinkPreview NS_AVAILABLE_IOS(9_0); //


//加载属性方法
@property (nonatomic, readonly, getter=canGoBack) BOOL canGoBack; //能否返回上一级
@property (nonatomic, readonly, getter=canGoForward) BOOL canGoForward; //能否跳转下一级
@property (nonatomic, readonly, getter=isLoading) BOOL loading; //是否正在加载


/**通过NSURLRequest去加载html界面**/
- (void)loadRequest:(NSURLRequest *)request;

/**加载html格式的字符串，其中的baseUrl下面会介绍
 
 **/
- (void)loadHTMLString:(NSString *)string baseURL:(nullable NSURL *)baseURL;
/**这种方式表示没见到过，我也不知道是什么，有兴趣的可以自己去查查 很少用
 
 **/
- (void)loadData:(NSData *)data MIMEType:(NSString *)MIMEType textEncodingName:(NSString *)textEncodingName baseURL:(NSURL *)baseURL;


- (void)reload; //重新加载数据
- (void)stopLoading; //停止加载数据
- (void)goBack; //返回上一级
- (void)goForward; //跳转下一级

//**执行javaScript操作**
- (nullable NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script;

@end
