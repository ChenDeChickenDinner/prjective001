//
//  XSHouseSubTableViewCell.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/23.
//  Copyright © 2020 fang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XSHouseInfoShowModel.h"
#import "XSHouseIntroduceController.h"
#import "XSIMageCollectionViewController.h"

#pragma mark - 枚举多选显示
@interface XSCollectionViewCell :  UICollectionViewCell
@property(nonatomic,strong) XSValue *valueModel;
@property (weak, nonatomic)  UILabel *textlabel;
- (void)refreshData;
@end


#pragma mark -
@interface XSHouseSubTableViewCell : UITableViewCell
@property(nonatomic,strong) XSHouseInfoCellModel *dataModel;
@property(nonatomic,strong) NSMutableDictionary *subDict;
@property (strong, nonatomic) XSHouseInfoShowModel *renhousetInfoModel;

- (void)refreshData;
+ (NSInteger)indexForClassName:(NSString *)className;
@end

#pragma mark -
@interface XSHouseSubListChooseTableViewCell : XSHouseSubTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *value;

@end
#pragma mark -
@interface XSHouseSubTextFieldTableViewCell : XSHouseSubTableViewCell<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titlew;
@property (weak, nonatomic) IBOutlet UITextField *textFieldFirst;
@property (weak, nonatomic) IBOutlet UILabel *frontDescribeLableFirst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *frontDescribeWidthFirst;
@property (weak, nonatomic) IBOutlet UILabel *hindDescribeLablethFirst;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hindDescribeWidthFirst;
@property (weak, nonatomic) IBOutlet UIView *valueViewSceend;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *valueViewSceendWidth;
@property (weak, nonatomic) IBOutlet UITextField *textFieldSceend;
@property (weak, nonatomic) IBOutlet UILabel *frontDescribeLableSceend;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *frontDescribeWidthSceend;
@property (weak, nonatomic) IBOutlet UILabel *hindDescribeLablethSceend;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *hindDescribeWidthSceend;
@end
#pragma mark -
@interface XSHouseSubTextViewCell : XSHouseSubTableViewCell<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UITextView *textView ;
@property (strong, nonatomic)XSHouseMoreInfoCellMdeol *keyValueModel;
@end
#pragma mark -
@interface XSHouseSubCollectionviewACell : XSHouseSubTableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView ;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectionViewWidth;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@end
#pragma mark -
@interface XSHouseSubCollectionviewBCell : XSHouseSubTableViewCell<UICollectionViewDelegate,UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView ;
@property (strong, nonatomic) UICollectionViewFlowLayout *layout;
@end
#pragma mark -
@interface XSHouseSubPictureSubmitCell : XSHouseSubTableViewCell<UICollectionViewDelegate,UICollectionViewDataSource,HXPhotoViewDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *titleB;

@property (strong, nonatomic) HXPhotoManager *manager;
@property (weak, nonatomic) IBOutlet UIView *bkPhotoView;
@property (strong, nonatomic) HXPhotoView *photoView;
@property (strong, nonatomic)  UICollectionView *collectionView ;
@property (strong, nonatomic) XSIMageCollectionViewController *imageVc;
@end
#pragma mark -
@interface XSHouseSubProcessViewCell : XSHouseSubTableViewCell

@end

