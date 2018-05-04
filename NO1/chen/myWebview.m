
#import "myWebview.h"

@implementation myWebview

https://www.jianshu.com/p/8f3c47c24e29

@end

@property (nonatomic) BOOL scalesPageToFit;// YES代表网页可以缩放,NO代表不可以缩放

@property (nonatomic) BOOL detectsPhoneNumbers ;//
@property (nonatomic) UIDataDetectorTypes dataDetectorTypes ;//

@property (nonatomic) BOOL allowsInlineMediaPlayback ; // 设置是否使用内联播放器播放视频
@property (nonatomic) BOOL mediaPlaybackRequiresUserAction ; // 设置视频是否自动播放

@property (nonatomic) BOOL mediaPlaybackAllowsAirPlay ; // 设置音频播放是否支持ari play功能

@property (nonatomic) BOOL suppressesIncrementalRendering ; // 设置是否将数据加载入内存后渲染界面

@property (nonatomic) BOOL keyboardDisplayRequiresUserAction ; // 设置用户是否能打开keyboard交互

@property (nonatomic) UIWebPaginationMode paginationMode ;// 这个属性用来设置一种模式，当网页的大小超出view时，将网页以翻页的效果展示
@property (nonatomic) UIWebPaginationBreakingMode paginationBreakingMode ;//这个属性决定CSS的属性分页是可用还是忽略
@property (nonatomic) CGFloat pageLength ;// 设置每一页的长度
@property (nonatomic) CGFloat gapBetweenPages ;// 设置每一页的间距
@property (nonatomic, readonly) NSUInteger pageCount ;// 获取页数

@property (nonatomic) BOOL allowsPictureInPictureMediaPlayback;//

@property (nonatomic) BOOL allowsLinkPreview ; //

@property(nonatomic, readonly, strong) UIScrollView *scrollView;
1.只读的，但是利用这个属性,设置scrollView的代理,就可以控制整个webView的滚动事件

@property (nullable, nonatomic, readonly, strong) NSURLRequest *request;
1.只读的，默认是空值 （在加载过程中 request 的地址 是在不断发生变化的，并不是 一直都同一个对象，其保存的 URL 才是重要信息）
2.一旦 发起加载，有则 不管，无则懒加载一个 无URL 的 request
3.加载成功，重新生成 一个 request 覆盖掉自身的
4.加载失败，不会覆盖
5.结论:只要加载过，request 就有值，只要 有一次加载成功 则 request 中 就有 有效的 URL,反之 是空 URL


@property (nonatomic, readonly, getter=canGoBack) BOOL canGoBack;  //如果这个属性为YES,才能后退
@property (nonatomic, readonly, getter=canGoForward) BOOL canGoForward; // 如果这个属性为YES,才能前进
@property (nonatomic, readonly, getter=isLoading) BOOL loading; //是否正在加载

- (void)loadRequest:(NSURLRequest *)request;

- (void)reload; // 只有当前 有加载的页面 是否 才 有用
- (void)stopLoading;

- (void)goBack; // 前往上一页
- (void)goForward; // 前往下一页


//请求 是否 加载 当前 发起的加载请求
/*
 1.由谁的发起 请求，会造成回调
 1. webView视图控件 自身的主动的 reload 2.服务器的重定向跳转？
 2.达到什么条件就会被触发
 3.被回调的次数
 4.此方法的工作:只管理 是否发起 请求，并不检验 请求的合法性
 */
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSString *type  = @"";
    switch (navigationType) {
        case UIWebViewNavigationTypeLinkClicked:
            type  = @"用户触击了一个链接";
            break;
        case UIWebViewNavigationTypeFormSubmitted:
            type  = @"用户提交了一个表单";
            break;
        case UIWebViewNavigationTypeBackForward:
            type  = @"用户触击前进或返回按钮";
            break;
        case UIWebViewNavigationTypeReload:
            type  = @"用户触击重新加载的按钮";
            break;
        case UIWebViewNavigationTypeFormResubmitted:
            type  = @"用户重复提交表单";
            break;
        case UIWebViewNavigationTypeOther:
            type  = @"发生其它行为";
            break;
        default:
            type  = @"xxxx";
            break;
    }
    NSLog(@"准备加载:%@ -- 加载的request = %@;自身的request = %@",type,request,self.myWebView.request);
    return YES;
}

//开始加载
- (void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"已经开始加载，自身的request = %@",self.myWebView.request);
}

//加载结束===>加载完成（成功？哪个层面的成功）
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"加载结束，自身的request = %@",self.myWebView.request);
    // 什么条件达到会 回调此方法（找到这个地址服务器有反馈？只要有反馈，管不管反馈的结果）
    // 什么 情况下才会更新整体界面？？？？（点击一个按钮 之后:不动、灰屏、刷新）
}

//加载结束===>加载中发生错误（失败？哪个层面的失败）
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"加载失败，自身的request = %@",self.myWebView.request);
    // 什么条件达到会 回调此方法（1.地址不合格？2.网络问题？3，服务器找不到？谁来反馈这些结果？）

}

// 1.加载 公告 服务器
// 2.加载 私有服务器
// 3.与 web js 的交互
1.添加 系统库 JavaScriptCore.framework
2.了解 JavaScriptCore.framework 基本类

#import "JSContext.h"
#import "JSValue.h"
#import "JSManagedValue.h"
#import "JSVirtualMachine.h"
#import "JSExport.h"
