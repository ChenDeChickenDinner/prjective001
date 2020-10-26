//
//  XSTabBarViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/16.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSTabBarViewController.h"

#import "HomePageViewController.h"
#import "FindHouseViewController.h"
#import "MyInfoViewController.h"
#import "XSMessageViewController.h"
#import <Foundation/Foundation.h>
#import "XSNavViewController.h"
#import "TUIKit.h"
#import "UITabBar+DLBadge.h"

@interface XSTabBarViewController ()

@end

@implementation XSTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    
//    [XSUserServer automaticLogin];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(unReadCount:) name:TUIKitNotification_onChangeUnReadCount object:nil];
    
    HomePageViewController *HomePage =  [[HomePageViewController alloc]init];
     FindHouseViewController *find =  [[FindHouseViewController alloc]init];
     XSMessageViewController *message =  [[XSMessageViewController alloc]init];
     MyInfoViewController *myinfo =  [[MyInfoViewController alloc]init];
     [self addChildVc:HomePage title:@"首页" image:@"pageN" selectedImage:@"pageS"];
     [self addChildVc:find title:@"查找" image:@"findN" selectedImage:@"findS"];
     [self addChildVc:message title:@"消息" image:@"messageN" selectedImage:@"messageS"];
     [self addChildVc:myinfo title:@"我的" image:@"myN" selectedImage:@"myS"];
    
    
    // Do any additional setup after loading the view.
//    ChildControllerPageAttributes *sub1 = [ChildControllerPageAttributes attributeWithClass:[HomePageViewController class]
//                                                              NavigationClass:[UINavigationController class]
//                                                              TabBarItemTitle:@"首页"
//                                                                        image:@"pageN"
//                                                                  selectImage:@"pageS"];
//    ChildControllerPageAttributes *sub2 = [ChildControllerPageAttributes attributeWithClass:[FindHouseViewController class]
//                                                              NavigationClass:[UINavigationController class]
//                                                              TabBarItemTitle:@"查找"
//                                                                        image:@"findN"
//                                                                  selectImage:@"findS"];
//    ChildControllerPageAttributes *sub3 = [ChildControllerPageAttributes attributeWithClass:[XSMessageViewController class]
//                                                              NavigationClass:[UINavigationController class]
//                                                              TabBarItemTitle:@"消息"
//                                                                        image:@"messageN"
//                                                                  selectImage:@"messageS"];
//    ChildControllerPageAttributes *sub4 = [ChildControllerPageAttributes attributeWithClass:[MyInfoViewController class]
//                                                              NavigationClass:[UINavigationController class]
//                                                              TabBarItemTitle:@"我的"
//                                                                        image:@"myN"
//                                                                  selectImage:@"myS"];
//    // 自定义颜色
//    sub1.titleNormolColor = XSColor(138, 138, 138);
//    sub1.titleSelectColor = XSColor(232, 43, 43);
//    sub2.titleNormolColor = XSColor(138, 138, 138);
//     sub2.titleSelectColor = XSColor(232, 43, 43);
//    sub3.titleNormolColor = XSColor(138, 138, 138);
//     sub3.titleSelectColor = XSColor(232, 43, 43);
//    sub4.titleNormolColor = XSColor(138, 138, 138);
//     sub4.titleSelectColor = XSColor(232, 43, 43);
    
    //赋值属性数组
//    self.childControllerPageAttributes = @[sub1,sub2,sub3,sub4];
    
    //tabbar背景颜色
    self.tabBar.barTintColor = [UIColor whiteColor];
    
 


//    [self unReadCount:nil];

    self.tabBar.badgeSize = CGSizeMake(8, 8);           //不设置默认为12
    self.tabBar.badgeColor = [UIColor redColor];       //不设置默认为红色
}
- (void)unReadCount:(NSNotification *)no{
    int unReadCount = 0;
    if ([XSUserServer sharedInstance].isLogin) {
        NSArray *convs = [[TIMManager sharedInstance] getConversationList];
        for (TIMConversation *conv in convs) {
            if([conv getType] == TIM_SYSTEM){
                continue;
            }
            unReadCount += [conv getUnReadMessageNum];
        }
        NSNumber *totalUnReadCount = [NSNumber numberWithInteger:unReadCount];
    }

    if (unReadCount > 0) {
        [self.tabBar showBadgeOnItemIndex:2];
    }else{
        [self.tabBar hiddenRedPointOnIndex:2 animation:NO];
    }

}


- (void)YBMFConfig{

}
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
  
    XSNavViewController *nav = [[XSNavViewController alloc] initWithRootViewController:childVc];
    nav.tabBarItem.title = title;
    [nav.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nav.tabBarItem setSelectedImage:[[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateHighlighted];
    [nav.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor redColor] forKey:NSForegroundColorAttributeName] forState:UIControlStateHighlighted];
    [self addChildViewController:nav];

}
@end
