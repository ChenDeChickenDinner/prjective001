//
//  CViewController.m
//  GSMAMapDemo
//
//  Created by goldenSir on 2018/6/19.
//  Copyright © 2018年 goldenSir. All rights reserved.
//

#import "DViewController.h"
#import "MapTabView.h"
#import "GSCustomRoundView.h"
#import "GSMAPointAnnotation.h"
#import "GSCustomRectangleView.h"
#import "ZHFilterMenuView.h"
#import "FilterDataUtil.h"
#define KMenuViewHeight2      45


@interface DViewController ()<MAMapViewDelegate,UITableViewDelegate,UITableViewDataSource,ZHFilterMenuViewDelegate,
ZHFilterMenuViewDetaSource>{
    NSMutableArray *mapDataArray;//获取的地图数据
    NSInteger neededZoomLevel;

}
//@property (nonatomic, strong) MapTabView *botTabView;
@property (nonatomic, strong) NSMutableArray *regionArray;
@property (nonatomic, strong) NSMutableArray *townArray;
@property (nonatomic, strong) NSMutableArray *estateArray;
@property (nonatomic, strong) UITableView *dataTableView;
@property (nonatomic, strong) NSMutableArray *array;
@property (nonatomic, strong) GSMAPointAnnotation *FFdata;
@property (nonatomic, strong) UIView *listHeanderView;

@property (nonatomic, weak)GSCustomRectangleView *cusView;

@property (nonatomic, strong) NSMutableDictionary *searchDict;
@property (nonatomic, strong) ZHFilterMenuView *menuView;
@property(nonatomic,strong)NSMutableArray *searchArray;

@end

@implementation DViewController
- (UIView *)listView {
    return self.view;
}
- (UIView *)listHeanderView{
    if (!_listHeanderView) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, 35)];
        view.backgroundColor = XSColor(256, 256, 256);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.backgroundColor = [UIColor clearColor];
        btn.frame = CGRectMake(0, 0, KScreenWidth, 35);
        UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth-30)/2, (35-8)/2, 30, 8)];
        image.image = [UIImage imageNamed:@"listh"];
        UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 34, KScreenWidth, 1)];
        view1.backgroundColor = XSColor(239, 239, 239);
        [btn addTarget:self action:@selector(showMap) forControlEvents:UIControlEventTouchUpInside];
        [view addSubview:image];
        [view addSubview:btn];
        [view addSubview:view1];

        _listHeanderView = view;
    }
    return _listHeanderView;
}
- (BRProvinceModel *)cityModel{
    if (!_cityModel) {
        _cityModel = [XSUserServer sharedInstance].cityModel;
    }
    return _cityModel;
}
- (UITableView *)dataTableView{
    if ( !_dataTableView){
        _dataTableView = [[UITableView alloc]init];
        _dataTableView.backgroundColor = [UIColor whiteColor];
        _dataTableView.delegate = self;
        _dataTableView.dataSource = self;
        _dataTableView.rowHeight = UITableViewAutomaticDimension;
        _dataTableView.estimatedRowHeight = 100;
        _dataTableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
//        _dataTableView.tableHeaderView = self.listHeanderView;
//        _dataTableView.bounces = NO;
        _dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _dataTableView;
}
- (NSMutableArray *)array{
    if (!_array) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *searchArray =  [[[FilterDataUtil alloc] init] getTabDataByType:self.houseType mainCity:self.cityModel];
    [self.view addSubview:self.menuView];
    self.menuView.filterDataArr = searchArray;
    [self.menuView beginShowMenuView];
    
    self.mapView.delegate = self;
    neededZoomLevel = Section_11;
    self.mapView.zoomLevel = Section_11;
    [self getAreaMainDataWithZoomLevel:Section_11 isDidSelect:NO data:nil];

}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];

    self.menuView.maxHeight = CGRectGetHeight(self.view.frame) - KMenuViewHeight2;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.menuView animateMenuViewWithShow:NO];
    [self.menuView removeMenuList];

}


- (NSMutableDictionary *)searchDict{
    if (_searchDict == nil) {
        _searchDict = [NSMutableDictionary dictionary];
        [_searchDict  safeSetObject:self.cityModel.name forKey:@"city"];
        [_searchDict  safeSetObject:@(self.cityModel.code.intValue) forKey:@"cityId"];
    }
    return _searchDict;
}

//点击控件做什么事情
- (void)mapView:(MAMapView *)mapView didSelectAnnotationView:(MAAnnotationView *)view{

    if ([view isKindOfClass:[GSCustomRoundView class]]) {
        GSCustomRoundView *cusView = (GSCustomRoundView *)view;
        CLLocationCoordinate2D coorinate = [cusView.annotation coordinate];
        NSLog(@"coordinate = {%f, %f}", coorinate.latitude, coorinate.longitude);
        [self.mapView setCenterCoordinate:coorinate animated:YES];//设置中心点位置
        if (neededZoomLevel == Section_11) {
               self.FFdata = cusView.data;
         }
        if (neededZoomLevel == Section_11) {
            neededZoomLevel = Section_14;
            [self getAreaMainDataWithZoomLevel:neededZoomLevel isDidSelect:YES data:cusView.data];
        }else if (neededZoomLevel == Section_14){
            neededZoomLevel = Section_16;
            [self getAreaMainDataWithZoomLevel:neededZoomLevel isDidSelect:self data:cusView.data];
        }
   
    }else{
        GSCustomRectangleView *rectangleView =(GSCustomRectangleView *)view;
        self.cusView = rectangleView;
        GSMAPointAnnotation *data = rectangleView.data;
        CLLocationCoordinate2D coorinate = [rectangleView.annotation coordinate];
        NSLog(@"coordinate = {%f, %f}", coorinate.latitude, coorinate.longitude);
        self.mapView.frame = CGRectMake(0, statusAndNav_H, self.view.width, self.view.height-statusAndNav_H-400);
        [self.mapView setCenterCoordinate:coorinate animated:YES];//设置中心点位置

//        NSArray *array = [rectangleView.annotation.title componentsSeparatedByString:@"\n"];
//        NSString *title = [NSString stringWithFormat:@"%@(%@)",array[0],array[1]];
//        [self.dataTableView reloadDataWithTitle:title withContent:title];
        WEAK_SELF;
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//        [dict safeSetObject:self.cityModel.name forKey:@"city"];
//        [dict safeSetObject:@(self.cityModel.code.integerValue) forKey:@"cityId"];
//        [dict safeSetObject:self.FFdata.areaName forKey:@"region"];
//        [dict safeSetObject:@(self.FFdata.areaID.integerValue) forKey:@"regionId"];
//        [dict safeSetObject:data.FareaName forKey:@"town"];
//        [dict safeSetObject:@(data.FareaID.integerValue) forKey:@"townId"];
//        [dict safeSetObject:data.areaName forKey:@"estate"];
        [dict safeSetObject:@(data.areaID.integerValue) forKey:@"estateId"];
                
        [self loadDataWithDict:dict black:^{
            STRONG_SELF;
            [self.view addSubview:self.dataTableView];
             [self.dataTableView mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.left.right.bottom.equalTo(self.view);
                 make.height.mas_equalTo(400);
             }];
            self.dataTableView.ly_emptyView = self.emptyView;
            [self.dataTableView reloadData];
        }];
 
    }

}

- (void)getAreaMainDataWithZoomLevel:(NSInteger)zoomLevel isDidSelect:(BOOL)isDidSelect data:(GSMAPointAnnotation *)data{
    NSLog(@"开始获取 主数据，并清除已有标注点");
    [self.mapView removeAnnotations:mapDataArray];//清除已有标注点
    self->mapDataArray = [NSMutableArray array];
    if (isDidSelect) {//只有在点击的时候才更改缩放级别
        [self.mapView setZoomLevel:zoomLevel animated:YES];
        if (zoomLevel==Section_16) {
            self.estateArray = nil;
        }else if (zoomLevel==Section_14){
            self.townArray = nil;
        }else{
            self.regionArray = nil;
        }
    }
    WEAK_SELF;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict safeSetObject:self.cityModel.name forKey:@"city"];
    [dict safeSetObject:@(self.cityModel.code.integerValue) forKey:@"cityId"];
    
    for (NSString *key in self.searchDict.allKeys) {
        
    }
    if (zoomLevel==Section_16){
        if (self.estateArray == nil) {
            [dict safeSetObject:data.FareaName forKey:@"region"];
            [dict safeSetObject:@(data.FareaID.integerValue) forKey:@"regionId"];
            [dict safeSetObject:data.areaName forKey:@"town"];
            [dict safeSetObject:@(data.areaID.integerValue) forKey:@"townId"];
            [self loadDataWithDict:dict fdata:data countType:XSBHouseCountType_Estate callback:^(NSMutableArray *array) {
                STRONG_SELF;
                self.estateArray = array;
                self->mapDataArray = self.estateArray;
                [self.mapView addAnnotations:self->mapDataArray];
                [self mapCenterCoordinate];
            }];
        }else{
            self->mapDataArray = self.estateArray;
            [self.mapView addAnnotations:self->mapDataArray];
            [self mapCenterCoordinate];
        }

    }else if (zoomLevel==Section_14){
        if (self.townArray == nil) {
            [dict safeSetObject:data.areaName forKey:@"region"];
            [dict safeSetObject:@(data.areaID.integerValue) forKey:@"regionId"];
            [self loadDataWithDict:dict fdata:data countType:XSBHouseCountType_Town callback:^(NSMutableArray *array) {
                STRONG_SELF;
                self.townArray = array;
                self->mapDataArray = self.townArray;
                [self.mapView addAnnotations:self->mapDataArray];
                [self mapCenterCoordinate];
            }];
        }else{
            self->mapDataArray = self.townArray;
            [self.mapView addAnnotations:self->mapDataArray];
            [self mapCenterCoordinate];
        }
    }else{//Section_11
        if (self.regionArray == nil) {

            [self loadDataWithDict:dict fdata:data countType:XSBHouseCountType_Region callback:^(NSMutableArray *array) {
                STRONG_SELF;
                self.regionArray = array;
                self->mapDataArray = self.regionArray;
                [self.mapView addAnnotations:self->mapDataArray];
                [self mapCenterCoordinate];
            }];
        }else{
            self->mapDataArray = self.regionArray;
            [self.mapView addAnnotations:self->mapDataArray];
            [self mapCenterCoordinate];
        }
    }

}

/** 确定回调 */
- (void)menuView:(ZHFilterMenuView *)menuView didSelectConfirmAtSelectedModelArr:(NSArray *)selectedModelArr{
//    NSArray *dictArr = [ZHFilterItemModel mj_keyValuesArrayWithObjectArray:selectedModelArr];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];

    for (ZHFilterItemModel *model in selectedModelArr) {
        if (model.key && model.selected) {
            
            [self dictManage:dict key:model.key value:model.code isinteger:model.isinteger multiple:model.multiple];
            if (model.parentKey) {
                [dict safeSetObject:model.parentCode forKey:model.parentKey];
            }
            if ([model.key isEqualToString:@"totalPrice"]||[model.key isEqualToString:@"rentPrice"]) {
                NSArray *aray = [model.code componentsSeparatedByString:@"-"];
                [dict safeSetObject:aray.firstObject forKey:@"minPrice"];
                [dict safeSetObject:aray.lastObject forKey:@"maxPrice"];
                [dict removeObjectForKey:@"totalPrice"];
                [dict removeObjectForKey:@"rentPrice"];

            }
        }
    
        if (model.minPrice && model.maxPrice){
            [dict safeSetObject:model.minPrice forKey:@"minPrice"];
            [dict safeSetObject:model.maxPrice forKey:@"maxPrice"];
        }
    }
    
    NSString *distance = [dict safeObjectForKey:@"distance"];
    if (distance) {
        CLLocation * location =[XSUserServer sharedInstance].location;
        [dict safeSetObject:@(location.coordinate.longitude) forKey:@"longitude"];
        [dict safeSetObject:@(location.coordinate.latitude) forKey:@"latitude"];
        [self.mapView setCenterCoordinate:location.coordinate animated:YES];//设置中心点位置

    }
        self.searchDict = nil;
        for (NSString *key in dict.allKeys) {
            [self.searchDict safeSetObject:[dict safeObjectForKey:key] forKey:key];
        }
        NSLog(@"结果回调：%@",self.searchDict);

        NSNumber *regionId = [self.searchDict safeObjectForKey:@"regionId"];
        NSNumber *townId = [self.searchDict safeObjectForKey:@"townId"];
        NSInteger zoomLevel = 11;
        XSBHouseCountType type = XSBHouseCountType_Region;

    if (dict.allKeys) {
        if (regionId && townId) {
              type = XSBHouseCountType_Estate;
              zoomLevel = 16;
          }else if(regionId){
              type = XSBHouseCountType_Town;
              zoomLevel = 14;
          }else{
              zoomLevel = 16;
              type = XSBHouseCountType_Estate;
          }
    }else{
        zoomLevel = 11;
        type = XSBHouseCountType_Region;
    }
  if (distance) {
      type = XSBHouseCountType_Estate;

  }
    [self.mapView setZoomLevel:zoomLevel animated:YES];

        WEAK_SELF;
        [self loadDataWithDict:self.searchDict fdata:nil countType:type callback:^(NSMutableArray *array) {
            STRONG_SELF;

            if (array.count > 0) {
                [self.mapView setZoomLevel:zoomLevel animated:YES];
                [self.mapView removeAnnotations:self->mapDataArray];//清除已有标注点
                   if (type == XSBHouseCountType_Estate) {
                       self.estateArray = array;
                       self->mapDataArray = self.estateArray;
                   }else if (type == XSBHouseCountType_Town){
                       self.townArray = array;
                       self->mapDataArray = self.townArray;
                   }else if (type == XSBHouseCountType_Region){
                       self.regionArray = array;
                       self->mapDataArray = self.regionArray;
                   }

                 [self.mapView addAnnotations:self->mapDataArray];
                 [self mapCenterCoordinate];
                  [self showMap];

            }else{
                [ProgressHUD showError:@"暂无房源" Interaction:YES];
            }
 
            
        }];

}
- (void)loadDataWithDict:(NSDictionary *)dict fdata:(GSMAPointAnnotation *)fdata  countType:(XSBHouseCountType)countType  callback:(void(^)(NSMutableArray *array))callback{

//    NSLog(@"dict = %@",dict);
    [self.subInfoInterface houseCountWithDict:dict houseType:self.houseType countType:countType callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        NSMutableArray *dataArray = [NSMutableArray array];
        if (error == nil && responseModel.code.intValue == SuccessCode) {
            NSArray *array  = [XSHouseCountModel mj_objectArrayWithKeyValuesArray:responseModel.data];
//            NSLog(@"%@",responseModel.data);
            for (XSHouseCountModel *model in array) {
                GSMAPointAnnotation *annotation = [[GSMAPointAnnotation alloc] init];
                CLLocationCoordinate2D coor = {model.latitude.floatValue,model.longitude.floatValue};
                annotation.coordinate = coor;
                annotation.areaCount = model.num.stringValue;
                NSString *areaName = @"";
                NSString *areaID = @"";
                if (model.region) {
                    areaName = model.region;
                }else if (model.town){
                    areaName = model.town;
                }else if (model.estate){
                    areaName = model.estate;
                }
                if (model.regionId) {
                   areaID = model.regionId.stringValue;
                }else if (model.townId){
                   areaID = model.townId.stringValue;
                }else if (model.estateId){
                   areaID = model.estateId.stringValue;
                }
                annotation.title = [NSString stringWithFormat:@"%@\n%@",areaName,model.num];
                annotation.areaID = areaID;
                annotation.areaName = areaName;
                annotation.FareaID = fdata.areaID;
                annotation.FareaName = fdata.areaName;
                [dataArray addObject:annotation];
            }
        }
        if (callback) {
            callback(dataArray);
        }
    }];
}
- (void)loadDataWithDict:(NSMutableDictionary *)dict black:(void(^)(void))black{
    WEAK_SELF;
    [self.subInfoInterface houseLisetWith:self.houseType source:XSBHouseInfoSource_keyPush resource:self.resource house_id:@"" KeyVales:dict per_page:50 page_index:0 callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;
          if (error == nil) {
            [self.array removeAllObjects];
            if (responseModel.code.intValue == SuccessCode) {
                NSMutableArray *array = [XSHouseInfoShowModel mj_objectArrayWithKeyValuesArray:responseModel.data];
                for (XSHouseInfoShowModel *model in array) {
                     model.source = XSBHouseInfoSource_keyPush;
                     model.houseType = self.houseType;
                 }
                [self.array addObjectsFromArray:array];
            }
        }
        if (black) {
            black();
        }
    }];


}



- (void)mapCenterCoordinate{
    
    GSMAPointAnnotation *annotation = self->mapDataArray.firstObject;
    if (annotation) {
        [self.mapView setCenterCoordinate:annotation.coordinate animated:YES];//设置中心点位置
    }
}

// 根据数据 返回什么样的控件
- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id<MAAnnotation>)annotation{

    if ([annotation isKindOfClass:[GSMAPointAnnotation class]]){
        GSMAPointAnnotation *data= (GSMAPointAnnotation *)annotation;
        if (neededZoomLevel!=Section_16) {//显示圆形标注点(根据缩放级别来设置)
            static NSString *customReuseIndetifier = @"GSCustomRoundView";
            GSCustomRoundView *annotationView = (GSCustomRoundView*)[mapView dequeueReusableAnnotationViewWithIdentifier:customReuseIndetifier];
            if (annotationView == nil){
                annotationView = [[GSCustomRoundView alloc] initWithAnnotation:annotation reuseIdentifier:customReuseIndetifier];
                annotationView.canShowCallout = NO;
                annotationView.draggable = YES;
                annotationView.name = annotation.title;
            }else{
                annotationView.name = annotation.title;
            }
            annotationView.data = data;
            return annotationView;
        }else{
            static NSString *customRectangleView = @"customRectangleView";
            GSCustomRectangleView *rectangleView = (GSCustomRectangleView*)[mapView dequeueReusableAnnotationViewWithIdentifier:customRectangleView];
            NSString *title = annotation.title;
            NSArray *array = [title componentsSeparatedByString:@"\n"];
            if (rectangleView == nil){
                rectangleView = [[GSCustomRectangleView alloc] initWithAnnotation:annotation reuseIdentifier:customRectangleView];
                rectangleView.canShowCallout = NO;
                rectangleView.draggable = YES;

                rectangleView.name = [NSString stringWithFormat:@"%@(%@)",array[0],array[1]];
            }else{
                rectangleView.name = [NSString stringWithFormat:@"%@(%@)",array[0],array[1]];
            }
            rectangleView.portrait = [UIImage imageNamed:@"loc_green"];
            rectangleView.data = data;
            return rectangleView;
        }
    }
    return nil;

}

//点击地图空白区域  移除tableView
- (void)mapView:(MAMapView *)mapView didSingleTappedAtCoordinate:(CLLocationCoordinate2D)coordinate {
    [self showMap];
}
- (void)showMap{
//    [self.cusView setSelected:NO animated:NO];
//    MAAnnotation 
    [self.mapView deselectAnnotation:self.cusView.annotation animated:YES];
    
     self.mapView.frame = self.view.bounds;
     [self.dataTableView removeFromSuperview];
     self.dataTableView = nil;
}
//地图缩放结束后调用。
- (void)mapView:(MAMapView *)mapView mapDidZoomByUser:(BOOL)wasUserAction{
//实际开发中需要根据 判断缩放前的区域参数，板块参数，小区参数等来确定缩放后需要请求的数据。
//这里只是模拟全部区域和龙华板块对应的数据源
//    if (wasUserAction) {
        switch (neededZoomLevel) {
            case Section_11:
            {
                if (mapView.zoomLevel<=Section_13) {
//                    当前设置的缩放级别为11时，如果真实缩放级别小于13，不处理
                }else{
                    if (mapView.zoomLevel>Section_13&&mapView.zoomLevel<=Section_15) {
//                        当前设置的缩放级别为11时，如果真实缩放级别满足(13,15]，则设置：
                        neededZoomLevel = Section_14;
                    }else{
//                        当前设置的缩放级别为11时，如果真实缩放级别满足(15,19]，则设置：
                        neededZoomLevel = Section_16;
                    }
                    [self getAreaMainDataWithZoomLevel:neededZoomLevel isDidSelect:NO data:nil];
                }
            }
                break;

            case Section_14:
            {
//                    当前设置的缩放级别为14时，如果真实缩放级别小于13，不处理
                if (mapView.zoomLevel>Section_13&&mapView.zoomLevel<=Section_15) {
                    ;
                }else{
                    if (mapView.zoomLevel<=Section_13){
                        neededZoomLevel = Section_11;
                    }else{
                        neededZoomLevel = Section_16;
                    }
                    [self getAreaMainDataWithZoomLevel:neededZoomLevel isDidSelect:NO data:nil];
                }
            }
                break;

            case Section_16:
            {
                if (mapView.zoomLevel>Section_15) {
                    ;
                }else{
                    if (mapView.zoomLevel<=Section_13){
                        neededZoomLevel = Section_11;
                    }else{
                        neededZoomLevel = Section_14;
                    }
                    [self getAreaMainDataWithZoomLevel:neededZoomLevel isDidSelect:NO data:nil];
                }
            }
                break;

            default:
                break;
        }

//    }else{
//                NSLog(@"用户 点击 被动缩放");
//
//    }
}






- (ZHFilterMenuView *)menuView{
    if (!_menuView) {
        _menuView = [[ZHFilterMenuView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), KMenuViewHeight2) maxHeight:CGRectGetHeight(self.view.frame) - KMenuViewHeight2];
        _menuView.zh_delegate = self;
        _menuView.zh_dataSource = self;
        _menuView.titleColor = [UIColor hx_colorWithHexStr:@"#444444"];
        _menuView.titleSelectedColor = [UIColor hx_colorWithHexStr:@"#E82B2B"];

        _menuView.itemBGColor = [UIColor hx_colorWithHexStr:@"#EFEFEF"];
//        _menuView.itemBGSelectedColor = [UIColor hx_colorWithHexStr:@"#E82B2B"];

        //下拉列表展示在window上，以应对列表视图展示的问题
        _menuView.showInWindow = YES;
        //移动后的menuView坐标转换在window上的minY值，showInWindow为YES时有效
        _menuView.inWindowMinY = KNavbarAndStatusHieght;
        if (self.houseType == XSBHouseType_Rent) {
            _menuView.titleArr = @[@"区域",@"价格",@"更多",@"排序"];
            _menuView.imageNameArr = @[@"x_arrow",@"x_arrow",@"x_arrow",@"x_arrow"];
        }else{
            _menuView.titleArr = @[@"区域",@"价格",@"户型",@"更多"];
            _menuView.imageNameArr = @[@"x_arrow",@"x_arrow",@"x_arrow",@"x_arrow"];
        }
        self.searchArray =  [[[FilterDataUtil alloc] init] getTabDataByType:self.houseType mainCity:self.cityModel];
        _menuView.filterDataArr = self.searchArray;
        
    }
    return _menuView;
}
//下拉菜单展示时禁止点击状态栏回到顶部，避免滑动后下拉框未消失的情况（贝壳找房是存在这样的问题）
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return !self.menuView.isOpen;
}


- (void)dictManage:(NSMutableDictionary *)dict key:(NSString *)key value:(NSString *)value isinteger:(BOOL)isinteger multiple:(BOOL)multiple{
    id oldValue = [dict safeObjectForKey:key];
    if (oldValue) {
        if ([oldValue isKindOfClass:[NSNumber class]]) {
            NSMutableArray *array = [NSMutableArray array];
            NSNumber *valye = (NSNumber *)oldValue;
            [array addObject:valye];
            [array addObject:@(value.intValue)];
            [dict safeSetObject:array forKey:key];
        }else if ([oldValue isKindOfClass:[NSArray class]]){
            NSMutableArray *array = [NSMutableArray arrayWithArray:oldValue];
           [array addObject:@(value.intValue)];
           [dict safeSetObject:array forKey:key];
        }else{
            [dict safeSetObject:isinteger?@(value.intValue):value forKey:key];
        }
    }else{
        [dict safeSetObject:isinteger?multiple?@[@(value.intValue)]:@(value.intValue):value forKey:key];
    }
}
/** 警告回调(用于错误提示) */
- (void)menuView:(ZHFilterMenuView *)menuView wangType:(ZHFilterMenuViewWangType)wangType{
    if (wangType == ZHFilterMenuViewWangTypeInput) {
        NSLog(@"请输入正确的价格区间！");
    }
}

/** 点击菜单回调 */
- (void)menuView:(ZHFilterMenuView *)menuView selectMenuAtTabIndex:(NSInteger)tabIndex{

}

/** 返回每个 tabIndex 下的确定类型 */
- (ZHFilterMenuConfirmType)menuView:(ZHFilterMenuView *)menuView confirmTypeInTabIndex:(NSInteger)tabIndex{
    if (tabIndex == 4) {
        return ZHFilterMenuConfirmTypeSpeedConfirm;
    }
    return ZHFilterMenuConfirmTypeBottomConfirm;
}

/** 返回每个 tabIndex 下的下拉展示类型 */
- (ZHFilterMenuDownType)menuView:(ZHFilterMenuView *)menuView downTypeInTabIndex:(NSInteger)tabIndex{
    if (tabIndex == 0) {
        return ZHFilterMenuDownTypeTwoLists;
    } else if (tabIndex == 1) {
        return ZHFilterMenuDownTypeItemInput;
    } else if (tabIndex == 2) {
        return ZHFilterMenuDownTypeOnlyItem;
    } else if (tabIndex == 3) {
        return ZHFilterMenuDownTypeOnlyItem;
    } else if (tabIndex == 4) {
        return ZHFilterMenuDownTypeOnlyList;
    }
    return ZHFilterMenuDownTypeOnlyList;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.listHeanderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 35;
}

#pragma mark -UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    XSHouseInfoShowModel *model = [self.array safeObjectAtIndex:indexPath.row];
    static NSString *ID = @"XSHouseRentInfoCell";
    XSHouseRentInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
           cell = [[NSBundle mainBundle] loadNibNamed:@"XSHouseInfoShowCell" owner:self options:nil].firstObject;
          NSLog(@"0000");
    }
    [cell updateWithModel:model];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XSHouseInfoShowModel *model = [self.array safeObjectAtIndex:indexPath.row];
    XSHouseDetailsController *vc = [[XSHouseDetailsController alloc]init];
    vc.houseType = self.houseType;
    vc.source = XSBHouseInfoSource_keyPush;
    vc.houseid = model.house_id;
    [[NSObject getTopViewController].navigationController pushViewController:vc animated:YES];
  
}
@end



@implementation XSHouseCountModel



@end
