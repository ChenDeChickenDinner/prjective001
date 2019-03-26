//
//  HBConditionalDetailController.m
//  HBStockWarning
//
//  Created by xs on 16/5/9.
//  Copyright © 2016年 Touker. All rights reserved.
//

#import "HBConditionalDetailController.h"


#import "HBConditionalInterfaces.h"
#import "HBConditionalTableViewCell.h"
#import "HBConditionalTools.h"
#import "HBTitleViewButton.h"

#import "HBConditionalDetailTableViewController.h"
#import "HBConditionalStockDataModel.h"
#import "HBConditionCreatesViewController.h"

#import "HBConditionalShareView.h"
#import "HBBaseNavigationController.h"
/*
 ；物理层
	TCP/IP 是在网络互连的设备之间能够通信的前提下被提出的协议
 2；网络接口层
	利用以太网中的数据链路层进行通信，驱动程序




 3；互联网层（网络层）
	互联网使用IP协议，IP协议基于IP地址转发分包数据，由操作系统实现，链接互联网的所以主机  跟路由器必须实现IP功能，其它（网桥，中继器）就没必要一定实现IP或者TCP功能
	IP (协议)：是跨越网络传送数据包，使整个互联网都能接受数据的协议，使用IP地址作为主机的标识。但他不具有重发机制 ，属于非可靠性传输协议
	ICMP (协议)：当IP数据包 发送途中出现异常，需要给发送端发送一个异常通知
	ARP(协议)： 从分组数据包的IP地址中解析出的物理地址（MAC地址）的一种协议

 4；传输层
	传输层最主要的功能就是能够让应用程序直接实现通信，但，为了分清 哪些程序与哪些程序在进行通信，以端口号来识别。
 TCP,是一种面向有链接的传输层协议，可以保证二端通信主机直接的通信可达，能够处理再传输过程中 丢包，传输顺序乱掉 等异常情况，还能有效利用带宽，环节网络拥堵。
	劣势，TCP 在通信过程中，收发包次数多，为了提高网络利用率，定义了各种各样复杂的规范，因此 不利于 特定场合使用（音视频）

 UDP,是一种面向无连接的传输层协议，不会关注对端是否真正接受到数据，如果要检查，或者对端是否连接到网络，需要在应用程序中实现（适用与分组数据少，广播，多播，多媒体）

 5 应用,表示层
 功能==》 TCP/IP 中将OSI 中 （会话层，表示层，应用层）的功能都集中到 ---------> 应用程序当中(遵守的协议，实现了OSI中的三层功能)

 运用==》 应用架构大多以—客户端/服务端，方式进行通信，利用浏览器与服务端 通过 HTTP通信协议，HTML表示层协议进行数据传输，实现上网冲浪。

 各种协议==》
 SMTP,电子邮件协议，通过MIME协议的扩展后，拥有可发送声音，图像，各种样式的信息<表示层>

 FTP，文件传输协议，传输时候会建立二个TCP链接，1，发请求的控制链接；2，传输数据的数据链接。

 TELNET,SSH,远程登录协议，指可以通过此协议登录到远程的计算机上，
 SNMP，网络管理协议，网络管理终端（SNMP管理器）——>管理，修改配置（SNMP协议）——各种设备（SNMP代理）


 数据形式
 以太网包首部—【IP包首部—【TCP包首部—【数据】】】
 每个分层中都可看做是以：包首部  +  数据部 形式传递
 包首部：是为协议提供的信息,比如目标地址以及协议相关信息，首部就像协议的脸
 数据部：所要发送的内容，由上层传递而来

 发送数据包
 1:应用程序处理———》
	>《应用首部》（各种应用，表示层协议）+ 《应用数据》
	>点击发送，开始TCP/IP通信,将经过编码过的数据发送——>TCP

 2:TCP模块的处理——》
	>《TCP首部》（源端口号+目标端口号+序号+校验）+ 《TCP数据》(应用层数据)
	>TCP根据应用的指示，负责建立连接、发送数据以及断开连接。TCP提供将应用层发来的数据顺利发送至对端的可靠传输，组装数据包发送——>IP


 3:IP模块的处理——》
	>《IP首部》（源IP地址+目标P地址+校验其后是TCP还是UDP）+ 《IP数据》(TCP首部 + TCP数据)
	>IP包生成后，参考路由控制表，将包发送到能链接到路由或主机的—>以太网的驱动程序


 4:网络接口（以太网驱动）
	>《以太网首部》(源MAC地址+目标MAC地址 + 以太网协议) + 《以太网数据》(IP首部 + TCP首部 + TCP数据) + 《以太网包尾》
	>产生的以太网数据包将通过物理层传输给接收端



 总：每个包首部中至少都会包含两个信息：
 1→[发送端和接收端地址]、
 2→包含一个识别位，它是用来识别上一层协议的种类信息



 接受数据包
 （以太网驱动）
 1：主机收到以太网包以后，首先从以太网的包首部找到MAC地址判断是否为发给自己的包。如果不是发给自己的包则丢弃数据
 2：查找以太网包首部中的类型域从而确定以太网协议所传送过来的数据类型
 3:根据传送过来的数据类型，再传给对应子处理程序，若无法识别的协议类型，则丢弃数据


 1：如果判断得出包首部中的IP地址与自己的IP地址匹配，则可接收数据并从中查找上一层的协议；
 2：如果上一层是TCP就将IP包首部之后的部分传给TCP处理，如果是UDP则将IP包首部后面的部分传给UDP处理
 3：对于有路由器的情况下，接收端地址往往不是自己的地址，此时，需要借助路由控制表，在调查应该送达的主机或路由器以后再转发数据



 TCP模块的处理
 1：首先会计算一下校验和，判断数据是否被破坏，然后检查是否按照序号接收数据，最后检查端口号，确定具体的应用程序
 2：接收端则发送一个"确认回执"给发送端(如果这个回执信息未能达到发送端，那么发送端会认为接收端没有接收到数据而一直反复发送)
 3：数据被完整的接收以后，会传给有段口号识别的应用程序


 应用程序的处理
 1：接收端应用程序会直接接收发送端发送的数据
 2：返回一个"处理正常”、或者 发送一个"处理异常"的回执给发送端
 
 
 

 
 */
@interface HBConditionalDetailController ()<UIScrollViewDelegate,HBConditionalDetailTitleViewDeletage>

@property (nonatomic, assign) CoditionalExchangeType exchangeType;

/** 条件单warnId */
@property (nonatomic, copy) NSString *warnId;

@property (nonatomic, copy) NSString *strategyType;


/** 整体的ScrollView */
@property (nonatomic,   weak) UIScrollView *scrollView;

/** 标题栏 */
@property (nonatomic,   weak) UIView *titlesView;

/** 标题栏底部滑块 */
@property (nonatomic,   weak) UIView *titleBottomView;

/** 标题栏中所有按钮 */
@property (nonatomic, strong) NSMutableArray  *titleButtons;

/** 标题栏中当前所选中的按钮 */
@property (nonatomic,   weak) UIButton *selectedTitleButton;

/** 标题栏中所有按钮 */
@property (nonatomic, assign) CGFloat  LastContentOffsetX;


/** 顶部按钮 */
@property (nonatomic, strong) HBTitleViewButton *titleButton_A;
@property (nonatomic, strong) HBTitleViewButton *titleButton_B;
@property (nonatomic, strong) HBConditionalDetailTitleView *titleView;


@property (nonatomic, strong) HBConditionalDetailTableViewController *entrustVc;


/** 是否是排序状态 */
@property (nonatomic, assign) BOOL  isCompositor;

/** 记录是正序 倒序  */
@property (nonatomic, assign) BOOL  upOrDown;


@property (nonatomic, strong) HBConditionalInterfaces *interface;
@property (nonatomic, strong) HBConditionalEntrustModel *entrustModel;
@property (nonatomic,   weak) UIView *fotterView;


@end

@implementation HBConditionalDetailController


- (instancetype)initWithWarnId:(NSString *)warnId strategyType:(NSString *)strategyType index:(NSInteger)index exchangeType:(CoditionalExchangeType)exchangeType{
    self = [super init];
    if (self) {
        self.warnId = warnId;
        self.strategyType = strategyType;
        self.exchangeType = exchangeType;
        
        HBConditionalDetailTableViewController *entrustVc = [[HBConditionalDetailTableViewController alloc]initWithWarnId:self.warnId strategyType:self.strategyType listType:CoditionalListDetailEntrust exchangeType:self.exchangeType];
        self.entrustVc = entrustVc;
        entrustVc.title = @"相关委托";
        [self addChildViewController:entrustVc];
        
        
        HBConditionalDetailTableViewController *alterationVc = [[HBConditionalDetailTableViewController alloc]initWithWarnId:self.warnId strategyType:self.strategyType listType:CoditionalListDetailModifyLog exchangeType:self.exchangeType];
        alterationVc.title = @"变更记录";
        [self addChildViewController:alterationVc];
        
        
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if (self.exchangeType == CoditionalExchangetype_simulate) {
        [(HBBaseNavigationController *)self.navigationController setupNavBarTheme:KNavigationBarSimulate];
        self.statusBarStyle = UIStatusBarStyleLightContent;

 
    }else{
        [(HBBaseNavigationController *)self.navigationController setupNavBarTheme:kNavigationBarRedState];
        self.statusBarStyle = UIStatusBarStyleLightContent;
    }

}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
- (HBConditionalInterfaces *)interface{
    if (!_interface) {
        _interface = [HBConditionalInterfaces interfaceWithOperationManager:self.operationManager type:self.exchangeType];
    }
    return _interface;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.exchangeType == CoditionalExchangetype_simulate) {
        self.title = @"模拟条件单详情";

    }else{
        self.title = @"条件单详情";

    }

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(shareConditional) imageName:@"conditional_shareBtn" highImageName:@"conditional_shareBtn"];

    HBConditionalDetailTitleView *titleView = [[HBConditionalDetailTitleView alloc]initWithXibWithType:self.exchangeType];
    titleView.frame = CGRectMake(0, 0, self.view.width, 150);
    titleView.delegate = self;
    if (self.exchangeType == CoditionalExchangetype_simulate) {
        titleView.backgroundColor = simulateColor;
    }else{
        titleView.backgroundColor = KConditionalRed;
    }
    
    self.titleView = titleView;
    [self.view addSubview:titleView];
    
    CGFloat viewY = self.titleView.height;
    CGFloat viewW = self.view.width;
    CGFloat viewH = self.view.height - self.titleView.height;

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, viewY, viewW, viewH)];
    self.fotterView  = view;
    [self.view addSubview:view];
    
    
    // :添加所有的子控制器
    [self setupChildVcs];
    
    // :添加ScrollerView
    [self setupScrollView];
    
    // :添加顶部标签栏
    [self setupTitlesView];
    
    [self loadNewCondition];
    

}
- (void)shareConditional{

    [HBUMobClick condOrderDetail_Share];

    if (self.entrustModel.strategyType) {

        NSString *imgae =[HBConditionalTools getImageName:self.entrustModel.strategyType.integerValue direction:self.entrustModel.direction.integerValue];

        [HBConditionalShareView shareWithImageName:imgae];

    }

}

- (void)manageFrame:(CGFloat)height{
    
    CGFloat viewW = self.view.width;
    
    CGFloat viewH = self.view.height - height;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.titleView.frame = CGRectMake(0, 0, viewW, height);
        
        self.fotterView.frame = CGRectMake(0, height, viewW, viewH);
        self.scrollView.frame = CGRectMake(0, 35, viewW, viewH - 35);

    }];


}
#pragma mark - 请求数据
- (void)loadNewCondition{
    
    [self.interface conditionalQueryDetaileHeard:self.warnId completion:^(HBNetworkResponse *model, NSError *error) {
        if (!error) {
            
            HBConditionalEntrustModel *entrustModel = [HBConditionalEntrustModel conditionalCellModelWithDict:model.data];
            self.entrustModel = entrustModel;
            self.titleView.entrustModel = entrustModel;
            
            [self manageFrame:[self.titleView heardViewheight]];
            
        }
    }];
 
}

- (void)saveToTrueConditional{
    NSLog(@"挑。。。。。。。");
   HBConditionalStockDataModel *model =  [self.entrustModel newConditionalDataModel];
    model.warnId = nil;
    [HBConditionCreatesViewController changeConditionalParameter:model target:self];

}

- (void)manageUpOrDoen:(UIButton *)titleButton{
    if (titleButton.tag == 0) {
        
        if (self.isCompositor && self.titleButton_A.selected) {
            
            self.upOrDown = !self.upOrDown;
            
            if (self.upOrDown) {
                
                NSLog(@"----排上 最新的在最下面-----");
                [self.entrustVc entrustCompositorEvent:YES];
            }else{
                [self.entrustVc entrustCompositorEvent:NO];

                NSLog(@"----排下 默认 最新的在最上面-----");
            }
            
        }
        
        if (self.upOrDown) {
            
            NSLog(@"----亮显上-----");
            
            if (self.exchangeType == CoditionalExchangetype_simulate) {
                [self.titleButton_A setImage:[UIImage imageNamed:@"conditional_MnEntrustSeletedUp"] forState:UIControlStateSelected];
            }else{
                [self.titleButton_A setImage:[UIImage imageNamed:@"conditional_entrustSeletedUp"] forState:UIControlStateSelected];
            }
            
        }else{
            NSLog(@"-----亮显下-----");
            if (self.exchangeType == CoditionalExchangetype_simulate) {
                [self.titleButton_A setImage:[UIImage imageNamed:@"conditional_MnEntrustSeletedDown"] forState:UIControlStateSelected];
            }else{
                [self.titleButton_A setImage:[UIImage imageNamed:@"conditional_entrustSeletedDown"] forState:UIControlStateSelected];
            }

        }
        
        self.isCompositor = YES;
        
        
    }else{
        
        self.isCompositor = NO;
        
        
        if (self.upOrDown) {
            // 非选中上状态
            NSLog(@"灰显上----------");
 
                [self.titleButton_A setImage:[UIImage imageNamed:@"conditional_entrustDefauitUp"] forState:UIControlStateNormal];

        }else{
            // 非选中下状态
            NSLog(@"灰显下----------");

                [self.titleButton_A setImage:[UIImage imageNamed:@"conditional_entrustDefauitDown"] forState:UIControlStateNormal];

        }
        
    }
    
}



#pragma mark  - 添加所有的子控制器
- (void)setupChildVcs{


 
}

#pragma mark  - 添加ScrollerView
- (void)setupScrollView{
    
    // 1:创建ScrollView
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = CGRectMake(0, 35, self.view.width, self.fotterView.height - 35);
    scrollView.backgroundColor = backGroundColor;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    [self.fotterView addSubview:scrollView];
    self.scrollView = scrollView;
    
    
    // 2:不要让ScrollView自动调整便宜位
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 3:一开始默认让ScrollView滑动到第一个
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    
}

#pragma mark  - 添加顶部标签栏
- (void)setupTitlesView{
    
    // 1:创建标题栏
    UIView *titlesView = [[UIView alloc]init];
    titlesView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1];
    titlesView.frame = CGRectMake(0, 0, self.view.width, 35);
    [self.fotterView addSubview:titlesView];
    self.titlesView = titlesView;
    
    
    UIView *ds = [[UIView alloc]initWithFrame:CGRectMake(0, titlesView.height-1, titlesView.width, 1)];
    ds.backgroundColor = HBColor(221, 221, 221);
    [self.titlesView addSubview:ds];
    
    
    // 2:创建标题栏中的按钮
    NSInteger count = self.childViewControllers.count;
    CGFloat titleButtonW = titlesView.width / count;
    CGFloat titleButtonH = titlesView.height;
    
    for (int i = 0 ; i < count; i++) {
        // 1:创建(自带状态颜色，字体大小)
        HBTitleViewButton *titleButton = [HBTitleViewButton buttonWithType:UIButtonTypeCustom];

        titleButton.tag = i;
        
        if ( i == 0) {
            self.titleButton_A = titleButton;
        }else if (i == 1){
            self.titleButton_B = titleButton;
            
        }
        // 2:文字
        NSString *title = [self.childViewControllers[i] title];
        [titleButton setTitle:title forState:UIControlStateNormal];
        
        // 3:frame
        titleButton.width = titleButtonW;
        titleButton.height = titleButtonH;
        titleButton.y = 0;
        titleButton.x = i * titleButtonW;
        
        if (self.exchangeType == CoditionalExchangetype_simulate) {
            [titleButton setTitleColor:simulateColor forState:UIControlStateSelected];
            
        }
        
        // 4：点击
        [titleButton addTarget:self action:@selector(titleChick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 5：添加到父控件
        [titlesView addSubview:titleButton];
        
        // 6:添加到数组
        [self.titleButtons addObject:titleButton];
        
        
    }
    
    
    // 3:创建添加标签栏底部滑块
    UIView *titleBottomView = [[UIView alloc]init];
    
    if (self.exchangeType == CoditionalExchangetype_simulate) {
        titleBottomView.backgroundColor = simulateColor;

    }else{
        titleBottomView.backgroundColor = KConditionalRed;

    }
    titleBottomView.height  = 1;
    titleBottomView.y = titlesView.height -titleBottomView.height - 1;
    [titlesView addSubview:titleBottomView];
    self.titleBottomView = titleBottomView;
    
    // 默认进入可排序状态
    self.isCompositor = YES;
    self.upOrDown = YES;
    
    self.titleButton_A.selected = YES;
    // 4:默认点击最前面的按钮
    HBTitleViewButton *firstTitleButton = self.titleButtons.firstObject;
    [firstTitleButton.titleLabel sizeToFit];
    titleBottomView.width = firstTitleButton.titleLabel.width + 20;
    titleBottomView.centerX = firstTitleButton.centerX;
    [self titleChick:firstTitleButton];
    

    self.titleButton_A.imageEdgeInsets = UIEdgeInsetsMake(0, self.titleButton_A.titleLabel.width, 0, - (self.titleButton_A.titleLabel.width + 3));
    self.titleButton_A.titleEdgeInsets = UIEdgeInsetsMake(0, -self.titleButton_A.imageView.width, 0, self.titleButton_A.imageView.width);
}

#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"refreshLastCell" object:self];
    
    // 取出对应的子控制器
    int index = scrollView.contentOffset.x / scrollView.width;
    UIViewController *willShowChildVc = self.childViewControllers[index];
    
    // A:根据最后的偏移位是否变化决定对应的控制器的view是否进行刷新
    if (self.LastContentOffsetX == scrollView.contentOffset.x) { // 等于
        
        if (willShowChildVc.isViewLoaded) return;
        
    }else{  // 不等于
        
        self.LastContentOffsetX = scrollView.contentOffset.x;

            
        if (willShowChildVc.isViewLoaded) return;
        
    }
    
    
    self.LastContentOffsetX = scrollView.contentOffset.x;

    willShowChildVc.view.frame = scrollView.bounds;
    [scrollView addSubview:willShowChildVc.view];
        


}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
    
    // 点击按钮
    int index = scrollView.contentOffset.x / scrollView.width;
    [self titleChick:self.titleButtons[index]];
}
#pragma mark  - 标签栏按钮的点击事件
- (void)titleChick:(UIButton *)titleButton{
    
    
    [self manageUpOrDoen:titleButton];
    
    
    // 控制按钮状态
    self.selectedTitleButton.selected = NO;
    titleButton.selected = YES;
    self.selectedTitleButton = titleButton;
    
    // 底部控件的位置和尺寸
    [UIView animateWithDuration:0.2 animations:^{
        self.titleBottomView.width = titleButton.titleLabel.width + 20;
        self.titleBottomView.centerX = titleButton.centerX;
    }];
    
    // 让scrollView滚动到对应的位置
    CGPoint offset = self.scrollView.contentOffset;
    offset.x = self.view.width * [self.titleButtons indexOfObject:titleButton];
    [self.scrollView setContentOffset:offset animated:YES];
    
}

#pragma mark - lazy
- (NSMutableArray *)titleButtons{
    if (!_titleButtons) {
        _titleButtons = [NSMutableArray array];
    }
    return _titleButtons;
}



@end
