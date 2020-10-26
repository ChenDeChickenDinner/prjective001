//
//  FindHouseViewController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/16.
//  Copyright © 2020 fang. All rights reserved.
//

#import "FindHouseViewController.h"
#import "XSLocationSearchview.h"
#import "XSCollectionView.h"
#import "XSHouseModuleViewController.h"
#import "XSSearchEstateController.h"
#import "XSBuyHouseViewController.h"
#import "XSWKWebViewController.h"
#import "XSHouseCollectionViewCell.h"

@interface FindHouseViewController ()<UINavigationControllerDelegate,JXCategoryViewDelegate,JXCategoryListContainerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet XSLocationSearchview *searchView;
@property (weak, nonatomic) XSCollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIView *imageView;
@property (weak, nonatomic) IBOutlet UIView *resourceView;
@property (weak, nonatomic) IBOutlet UIView *searchCdView;
@property (weak, nonatomic) IBOutlet UIView *mustlookView;
@property (weak, nonatomic) IBOutlet UIView *loveView;
@property (weak, nonatomic) IBOutlet UIImageView *source0;
@property (weak, nonatomic) IBOutlet UIImageView *source1;
@property (nonatomic,assign) XSHouseSource resource;
@property (strong, nonatomic) NSMutableArray<XSHouseModuleModel *> *array;
@property (weak, nonatomic) IBOutlet UIView *changeTypeView;
@property(nonatomic,strong) JXCategoryTitleView *categoryView;
@property(nonatomic,strong) JXCategoryListContainerView *listContainerView;
@property(nonatomic,strong) NSMutableArray<id<JXCategoryListContentViewDelegate>> *listVc;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loveViewHeight;
@property (weak, nonatomic) IBOutlet UICollectionView *colView;
@property (strong, nonatomic) NSMutableArray<XSHouseInfoShowModel *> *arraycol;

@end

@implementation FindHouseViewController
- (IBAction)source:(UIButton *)sender {

    if (sender.tag == XSHouseSource_1) {
        self.source0.image = [UIImage imageNamed:@"source0S"];
        self.source1.image = [UIImage imageNamed:@"source1"];

    }else if(sender.tag == XSHouseSource_2){
        self.source0.image = [UIImage imageNamed:@"source0"];
        self.source1.image = [UIImage imageNamed:@"source1S"];
    }
    self.resource = (XSHouseSource)sender.tag;
    [self resourceImage];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.delegate = self;
    self.resource = XSHouseSource_1;
    WEAK_SELF;
    self.searchView.searchBlack = ^(NSString *searhKey,XSBHouseType type) {
        STRONG_SELF;
         XSSearchEstateController *vc = [[XSSearchEstateController alloc]init];
        vc.black = YES;
          vc.cityModel = [XSUserServer sharedInstance].cityModel;
        vc.searchTitleBlock = ^(NSString * _Nonnull searchStr, XSBHouseType houseType) {
            XSHouselishViewController *list = [[XSHouselishViewController alloc]init];
             list.searchTitle = searchStr;
             list.houseType = houseType;
             list.source = XSBHouseInfoSource_keyPush;
             list.resource = self.resource;
             list.search = YES;
             list.screening = YES;
             [self.navigationController pushViewController:list animated:YES];
        };

          [self.navigationController pushViewController:vc animated:YES];
    };
    
    
    XSCollectionView *collectionView = [[XSCollectionView alloc]init];
    [self.searchCdView addSubview:collectionView];
    self.collectionView = collectionView;
    
    NSMutableArray *array = [self getDataWithJsonName:@"XSHouseSearch"];
    for (XSHouseModuleModel *model in array) {
        WEAK_SELF;
        model.clickBlack = ^(XSHouseModuleModel * _Nonnull model) {
            STRONG_SELF;
            XSHouselishViewController *list = [[XSHouselishViewController alloc]init];
            list.houseType = XSBHouseType_old;
            list.source = XSBHouseInfoSource_keyPush;
            list.search = YES;
            list.screening = YES;
            list.resource = self.resource;
            if ([model.name isEqualToString:@"租房"]) {
                list.houseType = XSBHouseType_Rent;
                list.module = YES;
            }else if ([model.name isEqualToString:@"新房"]){
                list.houseType = XSBHouseType_New;
                list.module = YES;
            }else if ([model.name isEqualToString:@"二手房"]){
                 list.module = YES;
            }else if ([model.name isEqualToString:@"地图找房"]){
                  XSBuyHouseViewController *vc = [[XSBuyHouseViewController alloc]init];
                   vc.resource = self.resource;
                   vc.map = YES;
                   [self.navigationController pushViewController:vc animated:YES];
                    return ;
            }else if ([model.name isEqualToString:@"新上房源"]){
                [list.searchDict safeSetObject:@(1) forKey:@"order"];

            }else if ([model.name isEqualToString:@"必看好房"]){

             }else if ([model.name isEqualToString:@"地铁周边"]){
                 [list.searchDict safeSetObject:@[@(23)] forKey:@"featurePoints"];

              }else if ([model.name isEqualToString:@"房贷计算器"]){
                  XSWKWebViewController *vc = [[XSWKWebViewController alloc]init];
                  vc.url = XSJSQURL;
                  vc.title = @"房贷计算器";
                  [self.navigationController pushViewController:vc animated:YES];
                   return ;
               }
    

            [self.navigationController pushViewController:list animated:YES];

        };
    }
    self.array = array;

    
    self.categoryView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 0, 150, 25)];
    self.categoryView.delegate = self;
    self.categoryView.titles = [self getTitlese];
    self.categoryView.titleFont = [UIFont systemFontOfSize:12];
    self.categoryView.titleColorGradientEnabled = YES;
    self.categoryView.titleLabelStrokeWidthEnabled = YES;
    self.categoryView.titleColor = [UIColor hx_colorWithHexStr:@"#929292"];
    self.categoryView.titleSelectedColor = [UIColor hx_colorWithHexStr:@"#E82B2B"];
    self.listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    self.listContainerView.backgroundColor = [UIColor clearColor];
    self.categoryView.listContainer = self.listContainerView;

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
      layout.itemSize = CGSizeMake((KScreenWidth - 60)/2, 125);
      layout.minimumInteritemSpacing = 30;
      layout.minimumLineSpacing = 15;
    
    self.colView.backgroundColor = [UIColor clearColor];
    self.colView.collectionViewLayout = layout;
    self.colView.delegate = self;
    self.colView.dataSource = self;
    self.colView.scrollsToTop = NO;
    self.colView.scrollEnabled = NO;
    self.colView.pagingEnabled = NO;
    self.colView.showsHorizontalScrollIndicator = NO;
    self.colView.bounces = NO;
    
    [self.colView registerNib: [UINib nibWithNibName:NSStringFromClass([XSHouseCollectionViewCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:XSItemCollectionViewCellStr222];
    
    [self.colView reloadData];
    [self.changeTypeView addSubview:self.categoryView];
    [self.loveView addSubview:self.listContainerView];

    [self resourceImage];
    [self loadData];
}
#pragma mark -数据请求
- (void)loadData{
    self.arraycol = [NSMutableArray array];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict safeSetObject:@([XSUserServer sharedInstance].cityModel.code.integerValue) forKey:@"cityId"];
    WEAK_SELF;
    [self.subInfoInterface houseLisetWith:XSBHouseType_old source:XSBHouseInfoSource_keyPush resource:self.resource house_id:@"" KeyVales:dict per_page:4 page_index:0 callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;
          if (error == nil) {
            [self.arraycol removeAllObjects];
            if (responseModel.code.intValue == SuccessCode) {
                NSMutableArray *array = [XSHouseInfoShowModel mj_objectArrayWithKeyValuesArray:responseModel.data];
               for (int i = 0; i < array.count; i++) {
                  [self.arraycol addObject:array[i]];
              }
                [self.colView reloadData];
            }
        }
    }];


}
// 返回cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arraycol.count;
}
// 返回cell内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    XSHouseInfoShowModel *dataModel = [self.arraycol safeObjectAtIndex:indexPath.row];
    
    // 创建cell (重用)
    XSHouseCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XSItemCollectionViewCellStr222 forIndexPath:indexPath];
    cell.dataModel = dataModel;
    return cell;
}

// 选中某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XSHouseInfoShowModel *dataModel = [self.arraycol safeObjectAtIndex:indexPath.row];
    XSHouseDetailsController *vc = [[XSHouseDetailsController alloc]init];
    vc.houseType = XSBHouseType_old;
    vc.source = XSBHouseInfoSource_keyPush;
    vc.houseid = dataModel.house_id;
    [[NSObject getTopViewController].navigationController pushViewController:vc animated:YES];
}

- ( NSArray<NSString *>*)getTitlese{
    return @[@"二手房",@"新房",@"租房"];;
}
- (NSMutableArray<id<JXCategoryListContentViewDelegate>>*)listVc{
    if (!_listVc) {
        WEAK_SELF;
        _listVc = [NSMutableArray array];
        for (int i = 0; i < [self getTitlese].count; i++) {
            XSHouselishViewController *vc  = [[XSHouselishViewController alloc]init];
            vc.nubmer = 5;
            vc.source  = XSBHouseInfoSource_keyPush;
            vc.resource  = self.resource;
            vc.callBackHeight = ^(CGFloat height) {
                STRONG_SELF;
                self.loveViewHeight.constant = height + 50;
                [self.view layoutIfNeeded];
            
            };
            if (i == 0) {
                vc.houseType  = XSBHouseType_old;
            }else if (i == 1){
                vc.houseType  = XSBHouseType_New;
            }else{
                vc.houseType  = XSBHouseType_Rent;
            }
            [_listVc addObject:vc];
        }
    }

    return _listVc;
}
//点击选中或者滚动选中都会调用该方法。适用于只关心选中事件，不关心具体是点击还是滚动选中的。
- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index{
    
}
//返回列表的数量
- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.listVc.count;
}
//根据下标index返回对应遵从`JXCategoryListContentViewDelegate`协议的列表实例
- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    return [self.listVc safeObjectAtIndex:index];
}

- (void)resourceImage{
    for (XSHouseModuleModel *model in self.array) {
        if ([model.name isEqualToString:@"房贷计算器"]) {
            model.tipImageName = nil;
        }else{
            model.tipImageName = self.resource ==XSHouseSource_1?@"source0image":@"source1image";
            model.tipImageName = self.resource ==XSHouseSource_1?@"免中介费":@"中介费优惠";

        }
    }
    self.collectionView.array = self.array;

}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.searchView.frame = CGRectMake(0, 0, KScreenWidth, 220);
    self.collectionView.frame = self.searchCdView.bounds;
    self.categoryView.frame = self.changeTypeView.bounds;
    self.listContainerView.frame = self.loveView.bounds;

}
- (IBAction)moreNiceHouse:(id)sender {
    XSHouselishViewController *list = [[XSHouselishViewController alloc]init];
    list.houseType = XSBHouseType_old;
    list.source = XSBHouseInfoSource_keyPush;
//    list.search = YES;
//    list.screening = YES;
    list.resource = self.resource;
    list.title = @"必看好房";
    [self.navigationController pushViewController:list animated:YES];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.collectionView.collectionView reloadData];
}
// 将要显示控制器
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // 判断要显示的控制器是否是自己
    BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
    [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
}



- (NSMutableArray *)getDataWithJsonName:(NSString *)name{
    NSError *error;
    NSString *path = [[NSBundle mainBundle]pathForResource:name ofType:@"json"];
    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableLeaves error:&error];
    NSMutableArray *modelArray = [XSHouseModuleModel mj_objectArrayWithKeyValuesArray:dataArray];
    return modelArray;
}
@end
