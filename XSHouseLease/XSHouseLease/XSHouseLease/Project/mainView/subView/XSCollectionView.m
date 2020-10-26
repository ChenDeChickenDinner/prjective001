//
//  XSCollectionView.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/26.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSCollectionView.h"


@interface XSCollectionView()<UICollectionViewDelegate,UICollectionViewDataSource>

@end
@implementation XSCollectionView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor clearColor];
    if (self) {
        [self addCollectionView];
    }
    return self;
}
- (void)setArray:(NSMutableArray<XSHouseModuleModel *> *)array{
    _array = array;
    if (self.superview) {
        [self.collectionView reloadData];
    }
}
- (void)addCollectionView{
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:self.layout];
//      collectionView.collectionViewLayout = self.layout;
      collectionView.backgroundColor = [UIColor clearColor];
      collectionView.delegate = self;
      collectionView.dataSource = self;
      collectionView.scrollsToTop = NO;
      collectionView.scrollEnabled = NO;
      collectionView.pagingEnabled = NO;
      collectionView.showsHorizontalScrollIndicator = NO;
      collectionView.bounces = NO;
      [collectionView registerClass:[XSItemCollectionViewCell class] forCellWithReuseIdentifier:XSItemCollectionViewCellStr];
      [self addSubview:collectionView];
      self.collectionView = collectionView;
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectZero];
    lineView.backgroundColor = XSColor(246, 245, 245);
    lineView.layer.shadowOpacity = 0.5;
    lineView.layer.shadowColor = XSColor(187, 187, 187).CGColor;
    lineView.layer.shadowOffset = CGSizeMake(5,0);

    
    self.lineView = lineView;
    [self addSubview:lineView];

}

- (void)layoutSubviews{
    [super layoutSubviews];

    self.collectionView.frame = CGRectMake(0, 0, self.width, self.height - (self.line?15:0));
    self.lineView.frame = CGRectMake(0, self.height -15, self.width, 15);
    if (!self.line) {
        [self.lineView removeFromSuperview];
    }
    [self.collectionView reloadData];
}
//+ (CGFloat)collectionViewheightWithLayout:(UICollectionViewFlowLayout *)layout{
//
//}

// 返回cell个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.array.count;
}
// 返回cell内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

    XSHouseModuleModel *dataModel = [self.array safeObjectAtIndex:indexPath.row];
    
    // 创建cell (重用)
    XSItemCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:XSItemCollectionViewCellStr forIndexPath:indexPath];
    cell.model = dataModel;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView prefetchItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths{
    NSLog(@"1111");
}
// 选中某个cell
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    XSHouseModuleModel *dataModel = [self.array safeObjectAtIndex:indexPath.row];
    if (dataModel.clickBlack) {
        dataModel.clickBlack(dataModel);
    }

    NSLog(@"选中cell: %ld", indexPath.row);
}

- (UICollectionViewFlowLayout *)layout{
    if (!_layout) {
        _layout =  [[UICollectionViewFlowLayout alloc]init];
        //设置cell的尺寸(宽度和高度)
        _layout.itemSize = CGSizeMake(KScreenWidth/4, 105);
        //设置竖直滚动放向(默认是竖直方向)
//        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        //设置cell与cell之间的列距
        _layout.minimumInteritemSpacing = 0;
        //设置cell与cell之间的行距
        _layout.minimumLineSpacing = 0;
    }
    return _layout;
}
@end
