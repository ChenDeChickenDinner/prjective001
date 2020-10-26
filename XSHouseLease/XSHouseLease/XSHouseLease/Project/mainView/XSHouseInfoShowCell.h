//
//  XSHouseRentInfoCell.h
//  XSHouseLease
//
//  Created by xs on 2020/3/27.
//  Copyright © 2020 fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSHouseInfoShowModel.h"

#import "XSHouseRentStatusView.h"
#import "XSHouseInfoTableView.h"
#import "XSHouseInfoShowModel.h"
#import "XSHouseDetailsController.h"
#import "XSHouselishViewController.h"
#import "XSHouseIntroduceController.h"
#import "XSMapViewController.h"
#import "XSPublicServer.h"
#import "XSDoorViewController.h"
#import "XSDoorCollectionViewCell.h"




#pragma mark -基类
@interface XSHouseInfoCell : UITableViewCell
@property(nonatomic,strong)XSHouseInfoShowModel *model;
- (void)updateWithModel:(XSHouseInfoShowModel *)model;
+ (NSInteger)indexForClassName:(NSString *)className;

@end

#pragma mark -租房列表
@interface XSHouseRentInfoCell : XSHouseInfoCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *infoLable;
@property (weak, nonatomic) IBOutlet UILabel *featurePointsLablea;
@property (weak, nonatomic) IBOutlet UILabel *featurePointsLableb;
@property (weak, nonatomic) IBOutlet UILabel *featurePointsLablec;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *featurePointsLableaW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *featurePointsLablebW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *featurePointsLablecW;
@property (weak, nonatomic) IBOutlet UILabel *rentPricelabe;
@property (weak, nonatomic) IBOutlet UILabel *unitPriceLable;
@property (weak, nonatomic) IBOutlet UILabel *dealStatusLable;
@property (weak, nonatomic) IBOutlet UIView *watchNumBKView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *statusEditViewHeight;
@property (weak, nonatomic) IBOutlet UILabel *watchNumLable;
@property (weak, nonatomic) IBOutlet XSHouseRentStatusView *statusEditView;
@property (weak, nonatomic) IBOutlet UILabel *lxLable;

@end




#pragma mark -房屋图片
@interface XSHouseDetailsImagesCell : XSHouseInfoCell<SDCycleScrollViewDelegate,JXCategoryViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *modelImg;
@property (weak, nonatomic) IBOutlet UIView *bkView;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property(nonatomic,strong) SDCycleScrollView *cycleScrollView;
@property (weak, nonatomic) IBOutlet UIView *doorBkView;
@property (weak, nonatomic) IBOutlet UILabel *doorLable;
@property(nonatomic,strong) UILabel *lable;
@property (nonatomic, strong) JXCategoryTitleView *myCategoryView;

@end

#pragma mark -基本信息A
@interface XSHouseDetailsBasicInfoCell : XSHouseInfoCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *featurePointsLablea;
@property (weak, nonatomic) IBOutlet UILabel *featurePointsLableb;
@property (weak, nonatomic) IBOutlet UILabel *featurePointsLablec;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *featurePointsLableaW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *featurePointsLablebW;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *featurePointsLablecW;
@property (weak, nonatomic) IBOutlet UILabel *rentPricelabe;
@property (weak, nonatomic) IBOutlet UILabel *rentPricelabeBow;

@property (weak, nonatomic) IBOutlet UILabel *formTypelabe;
@property (weak, nonatomic) IBOutlet UILabel *formTypelabeBow;

@property (weak, nonatomic) IBOutlet UILabel *rarealabe;
@property (weak, nonatomic) IBOutlet UILabel *rarealabeBow;

@end
#pragma mark -其它信息B
@interface XSHouseKeyVlaueCollectionCell : UICollectionViewCell
@property (strong, nonatomic) XSHouseKeyVlaueModel  *model;
@property (weak, nonatomic)  UILabel *titleLable;
@property (weak, nonatomic)  UILabel *contentLable;
@end
@interface XSHouseDetailsBusinessInfoCell : XSHouseInfoCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titH;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleH;
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (strong, nonatomic) UIView *lineView;
@property (weak, nonatomic) IBOutlet UIView *bkView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView ;
@property (strong, nonatomic) XSHouseKeyValueModuleModel *keyValueModuleModel;
//@property (strong, nonatomic) NSArray<XSHouseKeyVlaueModel *> *array;
@end


#pragma mark -配套设施
@interface XSFacilitiesCollectionCell : UICollectionViewCell
@property (strong, nonatomic) XSHouseFacilitiesModel  *model;
@property (weak, nonatomic)  UIImageView *image;
@property (weak, nonatomic)  UILabel *contentLable;
@property (weak, nonatomic)  UIView *bkView;
@end
@interface XSHouseDetailsFacilitiesInfoCell : XSHouseInfoCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView ;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@property (strong, nonatomic) NSMutableArray<XSHouseFacilitiesModel *> *array;
@end

#pragma mark -地图信息
@interface XSHouseDetailsAddressInfoCell : XSHouseInfoCell
@property (weak, nonatomic) IBOutlet UILabel *locationLable;
@property (weak, nonatomic) IBOutlet UIView *mapBkView;
@property (strong, nonatomic) XSMapViewController *mapVc;
@end


#pragma mark -房源介绍
@interface XSHouseDetailsIntroduceInfoCell : XSHouseInfoCell
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIView *bkView;
@property (weak, nonatomic) UIView  *line;
@property (strong, nonatomic)  UIButton *selbtn;
@end

#pragma mark -更多推荐
@interface XSHouseRecommendedCell : XSHouseInfoCell
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *listHeight;
@property (weak, nonatomic) IBOutlet UIView *bkView;
@property (nonatomic,strong) XSHouseInfoTableView *tableView;
@property (strong, nonatomic)XSHouselishViewController *listvc;
@end

#pragma mark - 户型
@interface XSHouseDoorCell : XSHouseInfoCell<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (strong, nonatomic)  UIButton *selbtn;
@property (weak, nonatomic) UIView  *line;
@property (weak, nonatomic) IBOutlet UIView *bkView;
@property (weak, nonatomic) IBOutlet UIView *conBkView;
@property (strong, nonatomic) XSDoorViewController *door;
@property (strong, nonatomic) UIView *conView;
@property (strong, nonatomic) UICollectionView *collectionView ;

@end
#pragma mark -楼盘
@interface XSHouseBuildingCell : XSHouseInfoCell
@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *lableA;
@property (weak, nonatomic) IBOutlet UILabel *lableAT;
@property (weak, nonatomic) IBOutlet UILabel *lableB;
@property (weak, nonatomic) IBOutlet UILabel *lableBT;

@end
#pragma mark -楼栋
@interface XSHouseStoriedCell : XSHouseInfoCell<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *titleImageView;
@property (weak, nonatomic) IBOutlet UITableView *listTableView;
@property(nonatomic,strong) NSArray *array;

@end


@interface XSHouseStoriedBuildingCell : XSHouseInfoCell
@property (weak, nonatomic) IBOutlet UILabel *lableA;
@property (weak, nonatomic) IBOutlet UILabel *lableB;
@property (weak, nonatomic) IBOutlet UILabel *lableC;
@property(nonatomic,strong)  XSHouseDetailsDataBuildingCellBasicInfosModel *cellModel;
@end
