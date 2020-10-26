//
//  XSIMagesViewController.m
//  XSHouseLease
//
//  Created by xs on 2020/5/11.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSAllIMagesViewController.h"

@interface XSAllIMagesViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>
@property(nonatomic,strong) JXCategoryTitleView *categoryView;
@property(nonatomic,strong) JXCategoryListContainerView *listContainerView;
@property(nonatomic,strong) NSMutableArray<id<JXCategoryListContentViewDelegate>> *listVc;

@end

@implementation XSAllIMagesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    XSHouseDetailsDataImgsModel *dataModel = self.array.firstObject;
    self.title = [NSString stringWithFormat:@"1/%ld",dataModel.contentImg.count];
     self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 25)];
     self.categoryView.backgroundColor = [UIColor clearColor];
     self.categoryView.delegate = self;
     self.categoryView.titles = [self getTitlese];
     self.categoryView.titleFont = [UIFont systemFontOfSize:12];
     self.categoryView.titleColorGradientEnabled = YES;
     self.categoryView.titleLabelStrokeWidthEnabled = YES;
     self.categoryView.titleColor = [UIColor hx_colorWithHexStr:@"#929292"];
      self.categoryView.titleSelectedColor = [UIColor whiteColor];
     self.listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
     self.listContainerView.backgroundColor = [UIColor clearColor];
     self.categoryView.listContainer = self.listContainerView;

    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.listContainerView];


}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.categoryView selectItemAtIndex:self.indexPath.section];
//    [self.listContainerView didClickSelectedItemAtIndex:self.indexPath.section];
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.listContainerView.frame = CGRectMake(0,25 , KScreenWidth, self.view.height - 25);
    
}
//点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index{
//    XSHouseDetailsDataImgsModel *dataModel  =  [self.array safeObjectAtIndex:index];
//    self.title = [NSString stringWithFormat:@"1/%ld",dataModel.contentImg.count];

}
//返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.listVc.count;
}
//根据下标index返回对应遵从`JXCategoryListContentViewDelegate`协议的列表实例
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    return [self.listVc safeObjectAtIndex:index];
}

- ( NSArray<NSString *>*)getTitlese{
    NSMutableArray *titleArray = [NSMutableArray array];
    for (XSHouseDetailsDataImgsModel *dataModel  in self.array) {
        NSString *str = [NSString stringWithFormat:@"%@(%ld)",dataModel.name,dataModel.contentImg.count];
        [titleArray addObject:str];
    }
    return titleArray;
}
- (NSMutableArray<id<JXCategoryListContentViewDelegate>>*)listVc{
    if (!_listVc) {
        _listVc = [NSMutableArray array];
        WEAK_SELF;
        for (int i = 0; i < self.array.count; i++) {
            XSHouseDetailsDataImgsModel *dataModel  = [self.array safeObjectAtIndex:i];
            XSIMagesSubViewController *vc  = [[XSIMagesSubViewController alloc]init];
            if (i == self.indexPath.section) {
                vc.indexPath = self.indexPath;
            }
            vc.imageBlack = ^(NSString *str) {
                STRONG_SELF;
                self.title = str;
            };
            vc.dataModel = dataModel;
            [_listVc addObject:vc];
        }
        
    }
    return _listVc;
}
@end

@interface XSIMagesSubViewController ()<SDCycleScrollViewDelegate>
@property (nonatomic,strong) SDCycleScrollView  *cycleScrollView;
@property (nonatomic,assign) NSInteger index;
@end

@implementation XSIMagesSubViewController

- (SDCycleScrollView *)cycleScrollView{
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, KScreenWidth, 221) delegate:self placeholderImage:nil];
        _cycleScrollView.imageURLStringsGroup = nil;
        _cycleScrollView.backgroundColor = [UIColor clearColor];
        _cycleScrollView.showPageControl = NO;
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;

        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleNone;
        _cycleScrollView.infiniteLoop  = NO;
        _cycleScrollView.autoScroll  = NO;
        
    }
    return _cycleScrollView;
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.cycleScrollView.frame = CGRectMake(0,(self.view.height - 221)/2 , KScreenWidth, 221);
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.imageBlack && self.dataModel.contentImg.count) {
          self.imageBlack([NSString stringWithFormat:@"%ld/%ld",(self.index+1),self.dataModel.contentImg.count]);
      }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.cycleScrollView];
    self.cycleScrollView.imageURLStringsGroup = self.dataModel.contentImg;
    if(self.indexPath){
        self.index = self.indexPath.row;
        [self.cycleScrollView makeScrollViewScrollToIndex:self.index];
    }

    
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    self.index = index;
    if (self.imageBlack) {
        self.imageBlack([NSString stringWithFormat:@"%ld/%ld",index+1,self.dataModel.contentImg.count]);
    }
}
@end
