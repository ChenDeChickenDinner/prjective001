//
//  HBLoginAccoutCheckView.m
//  HBStockWarning
//
//  Created by xs on 2017/6/15.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "HBLoginAccoutCheckView.h"
@interface HBLoginAccoutCheckView ()
@property (weak, nonatomic) IBOutlet UIButton *openAccoutBtn; // 开户引导
@property (weak, nonatomic) IBOutlet UILabel *commissionLable; // 万2.5
@property (weak, nonatomic) IBOutlet HBAccountLoginBut *clickBtn;

@property (weak, nonatomic) IBOutlet UIView *HBBackView;

@end


@implementation HBLoginAccoutCheckView
/*
 计算机，网络，语言三者之间的发展关系

 
 计算机网络出现背景
 1:从独立模式到网络互连模式
    a:局域网，b:广域网
 
2:从计算机通信到信息通信
    私有网络的连接======发展到======>互联网任意二个计算机连接，各种通信工具接入网络通信
 
 网络发展的7个阶段
 1，批处理系统：个人携带程序卡带，到机构的计算机中心 交由管理员 运行，个人并没有计算机
 2，分时系统：让多个终端连接到一个计算机上，实现多个终端可同时使用计算机系统。<多路，独占，交互，及时>，
    独站: 多终端围绕计算机之间形成星形结构，小型机的产生，计算机之间的通信（网络通信逐渐浮出水面）
    交互：出现对话式操作的交互方式，发展起 BASIC 此类能与计算机交互的编程语言
 3.计算机之间的通信：
   a: 计算机的小型化，大众化，使得，计算机直接通过通信线路连接可以相互直接传输数据，分布式处理业务数据
   b:对计算机互连，相互传输数据

4：计算机网络产生
   a:基于分组交换技术的计算机网络出现，窗口操作系统的发明，使得 每台计算机直接都可以上网，通信。
   b:形式 任意一个计算机 通过窗口操作系统 访问互联网上任意资源

 5：互联网普及
    a:异构型计算机的通信网络技术的发展，建立成本更低的网络环境搭建技术，发展处万维网。。。
    b:形式 公司--------互联网-------外部，
          公司内部：认证服务器----> 外部通过认证可访问公司内部网络
                  对外服务器---->外部任意人可以访问对外服务器上的资源
 
 6：以互联网技术为中心的时代
    a:电话网等其它网络通信技术都向互联网靠拢，非计算机设备也能接入到互联网上来
 7:从 单纯建立连接 到安全建立连接
 8：tcp/ip 协议出现

  2：tcp/ip 协议 是  ip tcp http 等协议的集合,计算机通过协议实现通信 交换数据
 协议
 
 
 
 协议

  0:什么是协议
    一种约定，遵守方 严格按照协议来说实现
  1:协议的必要性
    为了解决 不同 类型cpu，OS 之间能相互 通信 而定制的一种约定，各大厂商在软硬件制造的时候都按照这个协议实现

  2：计算机中的协议
        计算机从物理连接层到软件层各个组件都必须严格遵循事先达成的协议， 达成一个详细的约定，并遵循这一约定进行 处理， 才能实现真正的通信，
  3：分组交换协议

 
 协议由谁规定
 1：计算机通信的诞生及其标准
    a,最初 各大计算机厂商所配备的通信协议都是自家的，不同厂商之间的计算机即使物理连接上了也无法实行相互通信
    b,ISO,对通信进行了标准化，虽未得到普及，但其OSI参考模型却常被用于网络协议的制定中，后来IETF制定了TCP/IP 协议 ，并推送了其标准化。
 2:协议分层概念

 3:OSI参考模型
    是什么：
    实现思路：定制过程中所采用的方法是将整个庞大而复杂的问题划分为若干个容易处理的小问题，这就是分层的体系结构方法，采用了三级抽象，即体系结构、服务定义和协议规定说明。

    具体定义:OSI参考模型定义了开放系统的<层次结构> <层次之间的相互关系> <各层所包含的可能的服务>


<层次之间的相互关系>
定义了层与层之间的接口和各层的所使用的原语，但是不涉及接口是怎么实现的。各层相互配合，通过标准的接口进行通信

<各层所包含的可能的服务>
详细说明了各层所提供的服务，某层的服务是其本身跟其下各层能力的体现，通过接口提供给更高一层使用，
 
 <层次结构>
 该体系结构标准定义了网络互连的七层框架（物理层、数据链路层、网络层、传输层、会话层、表示层和应用层），即ISO开放系统互连参考模型,是一个概念性的框架
 
 <<软件层，面向信息处理>>
 应用层：<应用信息展示> <data数据> 不同的应用程序使用不同的应用协议，电子邮件协议，文件传输协议等.........
 表示层：<统一数据格式> <data数据> 为上层用户解决用户信息的语法问题。它包括数据格式交换、数据加密与解密、数据压缩与终端类型的转换,设备固有数据格式 与 网络标准数据格式的转换,
 会话层：<建立通信进程> <data数据> 为端系统的应用程序之间提供了对话控制机制，会话层管理登入和注销过程。它具体管理两个用户和进程之间的对话，只对何时建立连接，何时发送进行管理。
 
 
 
<<硬件层，面向通信>>真正负责在网络上传输数据
 传输层：<协议> <建立断开连接>  <端口号><数据段> 为会话层用户提供一个端到端的数据传输服务机制，把消息分成若干个分组，并在接收端对它们进行重组。不同的分组可以通过不同的连接传送到主机，
 网络层：<协议>  <寻址>   <IP地址> <分组流,数据包>;    本层通过寻址来建立两个节点之间的连接，为源端的运输层送来的分组，选择合适的路由和交换节点，正确无误地按照地址传送给目的端的运输层
 链路层：<协议> <区域通信>  <MAC地址><帧流，数据帧>;     从物理层解决两个相邻结点之间的通信问题，传送的协议数据单元称为数据帧，数据帧中包含物理地址（又称MAC地址）、控制码、数据及校验码等信息
 物理层：<协议> <提供物理连接> <比特流>;    主要关心的是通过物理链路从一个节点向另一个节点传送比特流，负责比特流与电子信号之间的切换
 
 
 
 
 传输方式分类-- 根据其数据发送方法有多种传输方式
 
 从连接上区分
    a,面向有连接型，在发送数据之前，需要在收发主机之间连接一条通信线路，在通信传输前后，必须专门进行建立和断开连接处理（打电话）。
    b,面向无连接型，不需要要求建立和断开连接，发送端可任何时候自由发送数据，反之接收端也不知道会在何时从哪收到数据

 从通信线路上区分
     a,电路交换，通过交换机与目标主机建立通信电路，传输数据，断开连接；《通信资源的严重私占有》
        通信线条数路固定，传输速度固定
     b,分组交换，将数据分成多个数据包，按照一定的顺序排列之后分别发送。数据发送到路由器，路由器缓存起来，再转发。蓄积交换《分时系统》
       通信线条通常只有一条，其是共享线路。速度根据网络拥堵情况而不同
 从接受端数量上分
 a,单播:一对一通信《固定电话》
 b,广播:一对多，有广播范围，叫广播域《电视播放》
 c，多播:一对限定的多《电视会议》
 c,任播：一对限定的多中的一
 
 
 
 地址---->在网络通信中，每一层的协议使用的地址都不尽相同，例如在tcp/ip 协议中使用 MAC,IP，端口号作为地址
a,地址的唯一性:每个收发端都有一个唯一的地址代表其个体,即使是广播，也是将这些由多个设备组成的一组通信赋予同一个具有唯一特效的地址
b,:地址的层次性，当地址总数很多时候，如何高效的从中找出通信目标，MAC地址 和IP地址在标识一个通信主体时虽然都具有唯一性，但只有IP地址具有层次性，层次性 不仅能利于快速查找，其还有分组，区域的概念。
    MAC地址，是设备厂商通过针对每块网卡进行分别指定，以确保MAC地址的唯一性，但无法知道哪个网卡被用到哪个地方
    IP地址，由网络号+主机号组成，相同网络号的主机说明其在同一多个网段。
    地址转发表，路由控制表？？？？？？？？？
 
 
 
  网络通信相关单位
1:传输速率《带宽》
 a,二个设备之间数据流动的物理速度--->传输速率（bps，每秒比特数，单位时间内传输的数据量的多少）；路宽，路窄。
 b,实际，主机之间的实际传输速率被称作吞吐量，其不仅衡量带宽，同时也衡量主机的CPU处理能力，网络的拥堵程度等信息


 网络的构成要素<硬件>
 1：通信媒介
    电缆（同轴，光纤，双绞线），电磁波
 2:数据链路
    以太网，无线，ATM,FDDI,ISDN..
 
3：网卡《链路层》实现以太网协议
a网卡是工作在链路层的网络组件，是局域网中连接计算机和传输介质的接口，不仅能实现与局域网传输介质之间的物理连接和电信号匹配，还涉及帧的发送与接收、帧的封装与拆封、介质访问控制、数据的编码与解码以及数据缓存的功能等
    a1,当网卡收到一个正确的帧时，它就使用中断来通知该计算机并交付给协议栈中的网络层，
    a2, 当计算机要发送一个IP数据包时，它就由协议栈向下交给网卡组装成帧后发送到局域网

《串行/并行转换》
a,网卡和局域网之间的通信是通过电缆或双绞线以串行传输方式进行的
b,网卡和计算机之间的通信则是通过计算机主板上的I/O总线以并行传输方式进行


 

 4：中继器《/1层交换机》
物理层上---->延长网络的设备，主要功能是通过对数据信号的重新发送或者转发，来扩大网络传输的距离
 所连接的所有设备都处于同一个冲突域，所有的设备都处于同一个广播域，设备共享相同的带宽。集线器只是简单将信息洪泛给所有端口，目标主机接收并保留信号，非目标主机接收后丢弃

 
 5：网桥--集线器《/2层交换机》<基于MAC地址的交换>
数据链路层上--->是在同一个网段内，链接二个网络，可以识别数据包中的MAC地址信息，根据MAC地址进行转发，并将这些MAC地址与对应的端口记录在自己内部的一个地址表中。
a,读取源MAC地址--->知道源MAC地址的机器是连在哪个端口上的
b,读取目的MAC地址--->并在地址表中查找相应的端口
   1:如表中有与这目的MAC地址对应的端口，把数据包直接复制到这端口上
   2如表中找不到相应的端口则把数据包广播到所有端口上,等待反应，学习 维护MAC地址表




 6:路由器《/3层交换机》<根据IP地址处理>
网络层面上--->在不同的网段内，决定最优路由和转发数据包，其内部有一个路由表，这表标明了如果要去某个地方。收到数据包，拆包--读取IP地址，查找路由列表--打包转发，或者丢掉
 
 7:4-7层交换机
 */
- (void)awakeFromNib{
    [super awakeFromNib];

    self.openAccoutBtn.layer.borderWidth = 0.5;
    self.openAccoutBtn.layer.cornerRadius = 15;
    self.openAccoutBtn.layer.borderColor = KConditionalRed.CGColor;
    self.openAccoutBtn.layer.masksToBounds = YES;

    self.commissionLable.layer.borderWidth = 0.5;
    self.commissionLable.layer.cornerRadius = 8;
    self.commissionLable.layer.borderColor = HBColor(245, 166, 35).CGColor;
    self.commissionLable.layer.masksToBounds = YES;

/*
 
 由于独占，使得个人装备一套可直接操作计算机的环境变得简单，
 应用层
    TCP/IP 中将OSI 中 会话层，表示层，应用层的功能都集中到 ---------> 应用程序当中(遵守的协议，实现了OSI中的三次功能)
 
 */

}
- (void)layoutSubviews{
    [super layoutSubviews];

    [self bringSubviewToFront:self.commissionLable];
    [self logicCode];
}

+ (HBLoginAccoutCheckView *)checkViewWithFrame:(CGRect)frame{

    if ([self isNeedGuide]) {
        HBLoginAccoutCheckView *view  = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])  owner:self options:nil].lastObject;
         view.frame = frame;

        HBAccountTriangleView *bottomView = [[HBAccountTriangleView alloc]initWithFrame:CGRectMake(0, 0, 11, 6)];
        [view.HBBackView addSubview:bottomView];
        [view logicCode];
        return view;
    }else{
        return nil;
    }
}

- (void)logicCode{
    if (Login) {

        if (![HBUserModel sharedUser].hasOpenAccount) { // 未开户
            if ( [HBUserModel sharedUser].secCustomerNo.length > 0 ) {// 有关联
                [self.clickBtn setTitle:@"华宝证券，超低佣金"  forState:UIControlStateNormal];
                [self.clickBtn  setImage:nil forState:UIControlStateNormal];

                self.clickBtn.userInteractionEnabled = NO;
            }else{
                [self.clickBtn setTitle:@"关联华宝账户"  forState:UIControlStateNormal];
                [self.clickBtn  setImage:[UIImage imageNamed:@"HB_AccountLogin"] forState:UIControlStateNormal];
            }

        }else{
            [self.clickBtn setTitle:@""  forState:UIControlStateNormal];
            [self.clickBtn  setImage:nil forState:UIControlStateNormal];
        }
    }else{
        [self.clickBtn setTitle:@"已有账户，立即登录"  forState:UIControlStateNormal];
        [self.clickBtn  setImage:[UIImage imageNamed:@"HB_AccountLogin"] forState:UIControlStateNormal];

    }


    if ([HBUserModel sharedUser].zhoushan) {
        self.commissionLable.hidden = YES;
    }else{
        self.commissionLable.hidden = NO;
    }
}

+ (BOOL)isNeedGuide {
    if (Login && [HBUserModel sharedUser].hasOpenAccount ) {
        return NO;
    }
    return YES;
}

- (IBAction)openAccountBtnClick:(UIButton *)sender {

    if (self.openAccount) {
        self.openAccount();
    }

}
- (IBAction)loginBtnClick:(UIButton *)sender {

    if (Login) {
        if (self.associated) {
            self.associated();
        }
    }else{
        if (self.lonig) {
            self.lonig();
        }

    }

}


@end





@implementation HBAccountTriangleView

- (void)drawRect:(CGRect)rect{

    //设置背景颜色


    [KConditionalRed set];
    UIRectFill([self bounds]);

    //拿到当前视图准备好的画板

    CGContextRef context = UIGraphicsGetCurrentContext();

    //利用path进行绘制三角形

    CGContextBeginPath(context);//标记

    CGContextMoveToPoint(context,0, 0);//设置起点

    CGContextAddLineToPoint(context, self.width, 0);

    CGContextAddLineToPoint(context,self.width / 2, self.height -1);

    CGContextClosePath(context);//路径结束标志，不写默认封闭

    [HBColor(246, 166, 35) setFill]; //设置填充色

    [HBColor(246, 166, 35) setStroke]; //设置边框颜色

    CGContextDrawPath(context,kCGPathFillStroke);//绘制路径path
    
}

@end
@implementation HBAccountLoginBut

- (void)layoutSubviews
{
    [super layoutSubviews];


    // 调整文字的位置和尺寸
    self.titleLabel.x  = self.titleLabel.x - 10;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame)  + 10;


}
@end
