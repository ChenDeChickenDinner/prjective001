//
//  XSTUIChatController.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/5/23.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSBaseViewController.h"
#import "TUIConversationListController.h"
#import "TUIChatController.h"

@interface MyCustomCellData : TUIMessageCellData
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *link;
@end

@interface MyCustomCell : TUIMessageCell
@property(nonatomic,strong) UILabel *myTextLabel;
@property(nonatomic,strong) UILabel *myLinkLabel;
@end

@interface XSTUIChatController : XSBaseViewController
@property(nonatomic,copy) NSString *conversationId;
@end


