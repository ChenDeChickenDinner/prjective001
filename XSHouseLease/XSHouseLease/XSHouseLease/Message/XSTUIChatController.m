//
//  XSTUIChatController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/23.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSTUIChatController.h"
#import "MMLayout/UIView+MMLayout.h"
#import "TUISystemMessageCellData.h"

@interface XSTUIChatController ()<TUIChatControllerDelegate>
@property(nonatomic,strong) TUIChatController *messageVc;
@property(nonatomic,strong) TIMConversation *conv;
@property(nonatomic,assign) BOOL risk;
@end

@implementation XSTUIChatController

- (void)viewDidLoad {
    [super viewDidLoad];
    TIMConversation *conv = [[TIMManager sharedInstance] getConversation:TIM_C2C receiver: self.conversationId];
    self.conv = conv;
    TUIChatController *messageVc = [[TUIChatController alloc] initWithConversation:conv];
    messageVc.view.frame = self.view.bounds;
    messageVc.delegate = self;
    [self.view addSubview:messageVc.view];
    self.messageVc = messageVc;

    [self riskMessage];
    
   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.messageVc.messageController scrollToBottom:NO];

}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.risk = YES;
    [self.messageVc.messageController scrollToBottom:NO];
}
- (void)riskMessage{
    TUISystemMessageCellData *sysdata = [[TUISystemMessageCellData alloc] init];
    sysdata.content = @"风险提示:请不要轻易相信对方的汇款要求!";
    sysdata.contentColor = [UIColor redColor];
    sysdata.contentFont = [UIFont systemFontOfSize:10];
    [self.messageVc sendMessage:sysdata];
}
- (TUIMessageCellData *)chatController:(TUIChatController *)controller onNewMessage:(TIMMessage *)msg{
    TIMElem *elem = [msg getElem:0];
     //判断是否为自定义元素。
    if([elem isKindOfClass:[TIMTextElem class]] && self.risk){
        TIMTextElem *testElem = (TIMTextElem *)elem;
        if ([testElem.text containsString:@"银行卡"] ||
            [testElem.text containsString:@"转账"] ||
            [testElem.text containsString:@"付款"]) {
            [self performSelector:@selector(riskMessage) withObject:self afterDelay:0.5];
        }
    }
    
    if (!msg.isReaded) {
        [self.conv setReadMessage:msg succ:^{
//            NSLog(@"信息已读上报成功");
        } fail:^(int code, NSString *msg) {
//            NSLog(@"%@的信息已读上报失败",msg);
        }];
//        NSLog(@"%@的信息已读",[msg getSenderNickname]);
    }else{
//        NSLog(@"%@的信息未读",[msg getSenderNickname]);

    }

     return nil;
}
- (TUIMessageCell *)chatController:(TUIChatController *)controller onShowMessageData:(TUIMessageCellData *)cellData {

//    TIMElem *elem = [cellData.innerMessage getElem:0];
//     //判断是否为自定义元素。
//    if([elem isKindOfClass:[TIMTextElem class]]){
//        TIMTextElem *testElem = (TIMTextElem *)elem;
//        if ([testElem.text containsString:@"银行卡"] ||
//            [testElem.text containsString:@"转账"] ||
//            [testElem.text containsString:@"付款"]) {
//            TUISystemMessageCellData *sysdata = [[TUISystemMessageCellData alloc] init];
//            sysdata.content = @"风险提示:请不要轻易相信对方的汇款要求!";
//            sysdata.contentColor = [UIColor redColor];
//            sysdata.contentFont = [UIFont systemFontOfSize:13];
//            [self.messageVc sendMessage:sysdata];
//        }
//    }
    
      return nil;
}

@end



@implementation MyCustomCellData
- (CGSize)contentSize{
    CGRect rect = [self.link boundingRectWithSize:CGSizeMake(300, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:15] } context:nil];
    
    CGSize size = CGSizeMake(ceilf(rect.size.width)+1, ceilf(rect.size.height));

    // 加上气泡边距
    size.height += 60;
    size.width += 20;

    return size;

}
@end

@implementation MyCustomCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _myLinkLabel = [[UILabel alloc] init];
        _myLinkLabel.numberOfLines = 0;
        _myLinkLabel.font = [UIFont systemFontOfSize:15];
        _myLinkLabel.textColor = [UIColor redColor];
        _myLinkLabel.textAlignment = NSTextAlignmentCenter;
        [self.container addSubview:_myLinkLabel];

//        _myLinkLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _myLinkLabel.font = [UIFont systemFontOfSize:15];
//        _myLinkLabel.textColor = [UIColor blueColor];
//        [self.container addSubview:_myLinkLabel];


    }
    return self;
}

- (void)fillWithData:(MyCustomCellData *)data;
{
    [super fillWithData:data];
    self.myLinkLabel.text = data.link;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
     self.myLinkLabel.mm_top(10).mm_left(10).mm_flexToRight(10).mm_flexToBottom(50);

}
@end
