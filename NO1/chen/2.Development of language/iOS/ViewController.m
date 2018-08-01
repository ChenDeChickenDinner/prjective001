//
//  ViewController.m
//  webView
//
//  Created by xs on 2018/5/4.
//  Copyright © 2018年 Touker. All rights reserved.
//

#import "ViewController.h"
#import "myWebview.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet myWebview *myWebView;
@property (nonatomic,strong)JSContext *jsContext;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myWebView.delegate = self;

    self.myWebView.scalesPageToFit = YES;
    self.myWebView.allowsInlineMediaPlayback = YES;
    self.myWebView.mediaPlaybackRequiresUserAction = YES;
    self.myWebView.mediaPlaybackAllowsAirPlay = YES;
    self.myWebView.suppressesIncrementalRendering = YES;

    self.myWebView.keyboardDisplayRequiresUserAction = YES;
    self.myWebView.paginationBreakingMode = UIWebPaginationModeRightToLeft;



    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建
    [self.myWebView loadRequest:request];

    // 1.只要当前 存在 有效页面的时候 掉此方法 才会刷新
//    [self.myWebView reload];

//    [self.myWebView stopLoading];
//    [self.myWebView goBack];
//    [self.myWebView goForward];


//    BOOL  canGoBack = self.myWebView.canGoBack ;
//    BOOL  canGoForward =self.myWebView.canGoForward;
//    BOOL  loading =self.myWebView.loading;

}


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

    //创建JSContext 对象
//    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
//    NSString *alertJS=@"alert('我是拉拉吖')"; //准备执行的js代码
//    [context evaluateScript:alertJS];//通过oc方法调用js的alert





}

//加载结束===>加载中发生错误（失败？哪个层面的失败）
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"加载失败，自身的request = %@",self.myWebView.request);
    // 什么条件达到会 回调此方法（1.地址不合格？2.网络问题？3，服务器找不到？谁来反馈这些结果？）

}


- (IBAction)postLoad:(id)sender {
    NSURL *url = [NSURL URLWithString:@"https://www.baiduxxx.com"];//创建URL
    NSURLRequest* request = [NSURLRequest requestWithURL:url];//创建
    [self.myWebView loadRequest:request];
}
- (IBAction)loadRefresh:(id)sender {
    [self.myWebView reload];
}

// ios7 之前的 交互
- (void)interactionBeforIOS7{

    /* OC 调用 JS 语句
     0.当网页加载完成后，才能对网页进行操作，利用webView执行js代码，操作网页中的节点
     1.返回值为 NSString*,单纯的nil 不能判断 js语句 是否调用成功
     2.返回值为 NSString*,返回值的类型过于限制，当返回值为 字典  数组 时候 还需要转换
     */
    NSString *str =  [self.myWebView stringByEvaluatingJavaScriptFromString:@"document.title"];
    NSLog(@"执行js语句结果：%@",str);


    /* JS  调用 OC 语句
     1.当我们点击webView上的某个按钮的时候，发送 一个 请求，而这个请求 会 调用shouldStartLoadWithRequest
     2.提供 shouldStartLoadWithRequest 拿到 NSURLRequest 中的 URL 来 解析 字符串 做出匹配
     */
}


/*JavaScriptCore
 JavaScriptCore是苹果Safari浏览器的JavaScript引擎，或许你听过Google的V8引擎，在WWDC上苹果演示了最新的Safari，
 据说JavaScript处理速度已经大大超越了Google的Chrome，这就意味着JavaScriptCore在性能上也不输V8了。
 */


/* JavaScriptCore框架
 1.JavaScriptCore是iOS7中新加入的框架，用来处理JavaScript。该框架让Objective-C和JavaScript代码直接的交互变得更加的简单方便。
2.JavaScriptCore框架其实就是基于webkit中以C/C++实现的JavaScriptCore的一个包装
3.JavaScriptCore框架在OS X平台上很早就存在的，不过接口都是纯C语言的，而在之前的iOS平台（iOS7之前），苹果没有开放该框架，所以不少需要在iOS app中处理JavaScript的都得自己从开源的WebKit中编译出JavaScriptCore.a，接口也是纯C语言的。可能是苹果发现越来越多的程序使用了自编译的JavaScriptCore，干脆做个顺水人情将JavaScriptCore框架开放了，同时还提供了Objective-C的封装接口。
4.是基于Objective-C封装的JavaScriptCore接口 框架有3个目标
 自动化的：使用这些API的时候，很多事都是苹果帮我们做了的，比如在OC和JS之间交互的时候，很多时候会自动帮我们转换类型。
 安全的：我们都知道JS是一门动态类型的语言，也就是说那你从JS传递到OC中的值可能是任何值，而OC是静态类型的语言，它可不能动态的接收各种类型的值，但是你可以随便传，程序并不会奔溃，苹果希望这些API是不容易出错的，就算出错了，也是不会导致程序奔溃的，事实上也是如此。还有一点就是这些API本身是线程安全的，我们后面会说到。
 高保真的：前面两点比较好理解，但是这个高保真是作何解释呢，很简单，就是苹果希望我们在使用这些API与JS交互的时候，写OC的时候就像在写OC，写JS的时候就像在写JS，不需要一些奇怪的语法，这点我们后面会用实例说明。
 */

/*JSVirtualMachine
1.JSVirtualMachine看名字直译是JS 虚拟机，也就是说JavaScript是在一个虚拟的环境中执行，而JSVirtualMachine为其执行提供底层资源。
2.一个JSVirtualMachine实例，代表一个独立的JavaScript对象空间，并为其执行提供资源。
3.它通过加锁虚拟机，保证JSVirtualMachine是线程安全的，如果要并发执行JavaScript，那我们必须创建多个独立的JSVirtualMachine实例，在不同的实例中执行JavaScript
4.通过alloc/init就可以创建一个新的JSVirtualMachine对象。但是我们一般不用新建JSVirtualMachine对象，因为创建JSContext时，如果我们不提供一个特性的JSVirtualMachine，内部会自动创建一个JSVirtualMachine对象。

 */
/*JSContext
 1.JSContext 是JS代码的执行环境:
    JSContext为JS代码的执行提供了上下文环境，通过jSCore执行的JS代码都得通过JSContext来执行
 2.JSContext对应于一个 JS 中的 一个全局环境的实例:可以给这个对象 添加 属性 跟方法，
    相当于浏览器中的window对象，JSContext中有一个GlobalObject属性，实际上JS代码都是在这个GlobalObject上执行的，但是为了容易理解，可以把JSContext等价于全局对象。
 3.其实WebKit都有一个内嵌的js代码的执行环境,一般我们在页面加载完成之后，获取js上下文 JSContext.
 4.与某JSContext对象关联的所有JSValue释放后，JSContext也会被释放
 5.每个页面加载完都是一个新的context
 */
- (void)JSContext_learning{



    //  1.JSContext的创建 （需要注册吗？）
    JSContext *context = [[JSContext alloc]init];
    JSVirtualMachine *virtualMachine = context.virtualMachine; //虚拟机


    /* 2.设置异常回调
     1.JSContext中执行的JavaScript如果出现异常，只会被JSContext捕获并存储在exception属性上,而不会向外抛出
     2.当 exception 不为nil  时候 则 出现异常
     3.监听异常合理的方式是给JSContext对象设置exceptionHandler
     */
    JSValue *value3 = context.exception; // 异常对象

    context.exceptionHandler = ^(JSContext *context, JSValue *exception) {
        // 当发生异常回调的时候，将 exception 赋值给 context.exception
        context.exception = exception;
    };


    //  3.添加 JSValue对象（字符串和数字；数组、对象和方法）, 需要一个字符串下标
    [context setObject:@"chenxiaowei" forKeyedSubscript:@"name"];




    //  4.执行JS 代码 获得返回值
    JSValue *value =  [context evaluateScript:@"document.title"];
    NSLog(@"value = %@",value);




}
/*JSValue
 1.JSValue 是对 JS 值的包装:
    JSValue 顾名思义，就是JS值嘛，但是JS中的值拿到OC中是不能直接用的，需要包装一下，这个JSValue就是对JS值的包装，一个JSValue对应着一个JS值，
    这个JS值可能是JS中的number，boolean等基本类型，也可能是对象，函数，甚至可以是undefined，或者null。
 2.JSValue存在于JSContext中:
    JSValue是不能独立存在的，它必须存在于某一个JSContext中，就像浏览器中所有的元素都包含于Window对象中一样，一个JSContext中可以包含多个JSValue。就像这样
 3.都是强引用:
     JSValue对其对应的-->JS值,和其所属的-->JSContext对象，都是强引用的关系，因为JSContext需要这两个东西来执行JS代码，所以JSValue会一直持有着它们。
     JSContext(JSValue1/JSValue2) <------>  Window(Var1/Var2):JSValue1 强引用着 JSContext 跟  Var1
 4.运用:
     1.新建:你也可以创建一个新的对象，数组，正则表达式，错误，这几个方法达到的效果就相当于在JS中写 var a = new Array();
     2.类型转换: 你可以将OC中的类型，转换成JS中的对应的类型，并包装在JSValue中，包括基本类型，Null和undfined
     3.对象转换: 可以将一个OC对象，转成JS中的对象，但是这样转换后的对象中的属性和方法，在JS中是获取不到的
 */
- (void)JSValue_learning{
    JSContext *context = [[JSContext alloc]init];
    /*
    // 1.创建 JSValue 对象
    + valueWithDouble:inContext:

    // 2.读取、转换 JSValue 对象
    - toObject

    // 3.判断 JSValue 对象的类型
    isBoolean

    // 4.比较 JSValue 对象
    - isEqualToObject:
    - isEqualWithTypeCoercionToObject:
    - isInstanceOf:

    // 5.函数和构造函数
    - callWithArguments:
    - constructWithArguments:
    - invokeMethod:withArguments:

    // 6.容器
    - defineProperty:descriptor:
    - hasProperty:
    - deleteProperty:
    - valueAtIndex:
    - setValue:atIndex:
    - valueForProperty:
    - setValue:forProperty:


    // 7.获取一个 JSValue 的上下文
    context

    // 8.通过下标获取 JSValue
    - (JSValue *)objectForKeyedSubscript:(id)key;
    - (JSValue *)objectAtIndexedSubscript:(NSUInteger)index;
    - (void)setObject:(id)object forKeyedSubscript:(NSObject <NSCopying> *)key;
    - (void)setObject:(id)object atIndexedSubscript:(NSUInteger)index;

     1. JSValue 允许使用字符串或整数标来得到里面的对象和数  而对于Array或者Object类型，JSValue也可以通过下标直接取值和赋值
     2. 根据 之前添加时候 设置的 下标来取 JSValue（1.自动默认的值(下标) 2.自己设置的值(下标)）
     3. JSValue是遵循JavaScript的数组特性：无下标越位，自动延展数组大小
     */
    JSValue *value = [context objectForKeyedSubscript:@"name"];

}




 - (void)JS_call_iOS{


 // B 从webView 中获取 JSContext(取原本有的)
 JSContext *context = [self.myWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
 JSValue *value4 = context.globalObject; // 方法执行对象


     /*
      1.Block : 第一种方式是使用block，block也可以称作闭包和匿名函数，使用block可以很方便的将OC中的单个方法暴露给JS调用，具体实现我们稍后再说.(Block是用来暴露单个方法的)
      */
     // 一个 OC 方法 注入到 context
     context[@"login"]= ^(){

        // 1.可以拿到的属性
         JSContext *context = [JSContext currentContext]; // 获取 当前的 context

         JSValue *thisValue = [JSContext currentThis]; // JSContext对象方法- (JSValue *)globalObject

         JSValue *Value = [JSContext currentCallee];

        // 2.使用注意 不要在Block中直接使用外部JSValue 不要在Block中直接使用外部JSContext

        // 3.昨晚自己的操作后，可以再调用JS 方法，给JS回调结果
             [[JSContext currentContext] evaluateScript:@"xxxx"];
     };

     /*
      2.JSExport 协议 : 第二种方式，是使用JSExport协议，可以将OC的中某个对象直接暴露给JS使用，而且在JS中使用就像调用JS的对象一样自然.(JSExport 协议是用来暴露一个OC对象)
          1.1.创建一个自定义协议XXXExport 继承自JSExport。
          2.在自定义的XXXExport中添加JS里需要调用的属性和方法。
          3.在自定义的Model类中实现XXXExport中的属性的get/set方法以及定义的方法。
          4.方法名的处理:
            1.当我们暴露一个带参数的OC方法给JS时，JSCore会用以下两个规则生成一个对应的JS函数：1.移除所有的冒号、2.将跟在冒号后面的第一个小写字母大写
            2.JSExportAs 宏 来 给JSCore在JS中为OC方法生成的对应方法指定名字 这个宏只对带参数的OC方法有效
      */
     // 一个 OC 对象 注入到 context
     context[@"login"]= [[NSObject alloc]init];


    NSArray *argsArray = [JSContext currentArguments]; // 获取 当前的 方法参数列表


     // 利用 context 执行 方法
     [context evaluateScript: @"function add(a,b) {return a+b}"];

 }
 

- (void)iOS_call_JS{
    // 1.直接 拿  webView 执行
    NSString *str =  [self.myWebView stringByEvaluatingJavaScriptFromString:@"document.title"];

    JSContext *context = [self.myWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];

    // 2.拿JSContext 执行JS
    [context evaluateScript:@"document.title"];

    // 先将JS 方法注入到 context中 通过下标  拿 JSContext中带方法的 JSValue执行 方法 ,并带入参数
    [context evaluateScript: @"function add(a,b) {return a+b}"];
    [context[@"login"] callWithArguments:@[@"111111"]];
}




- (void)axaxaxax{

}
- (void)axaxax{
    // 1.通过  webView 取 JSContext，并设置 异常回调
    self.jsContext = [self.myWebView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];

    // 2.直接 给 jsContext 注入方法（可以写很多个方法）
    // 1.没有入参，可以有返回值
    self.jsContext[@"iosGetDeviceUDID"] = ^(NSString *per) {
        return@"xxxx";
    };

    /*
    // 3.直接 给 jsContext 注入遵守协议对象
            1.HBMobile （暴露大量方法，让JS直接调用方法）
            2.HBAuthBridge（）
    3.HBWebBridge
     使用步骤：
    1.回调管理对象:@{@"方法名":block,@"方法名":block,}block:params，errorCallBack，successCallBack
    2.将某个对象声明的方法 遍历出来，将 方法名  + block 添加到 回调管理对象中

    3.暴露一个方法给JS 接受（requestObject:({"Method":"方法","Data":"参数"})） + callBack
    4.实现暴露的方法:
        1.解析 方法名 + 参数
        2.利用方法名 在自身 回调管理对象 找到对应的 block方法，传入参数 执行 block方法
     任务分配
    1.Bridge 做了什么
        0.定义暴露的方法（同步  异步  个一个方法）
        1.定义了方法入惨的 数据结构 字段====>正确的解析 出 方法 跟参数
        2.添加回调管理队列，定义了添加 block 的类型（参数类型，个数)
        3.实现暴露方法，解析出方法 跟参数，找到对应的 回调 ；传入参数，调用block
    2.外部做了什么
        1.定义与js协议好的方法名
        2.
        2.定义好入惨（一个入参数类型 ===>单独看这个方法 协议号的参数字段，一个回调类型）

     */

}
@end
