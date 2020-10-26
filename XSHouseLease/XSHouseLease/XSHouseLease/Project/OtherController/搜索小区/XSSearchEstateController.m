//
//  XSSearchEstateController.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/4/12.
//  Copyright © 2020 fang. All rights reserved.
//

#import "XSSearchEstateController.h"
#import "XShouseSubNetworkInterface.h"

@interface XSSearchEstateController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)XSRegionSearchView *searcView;
@property (strong, nonatomic)  UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong) NSMutableDictionary *dict;
@property (nonatomic,strong) NSMutableArray *oldArray;
@property (assign, nonatomic) BOOL history;
@property(nonatomic,strong) UIView *historyView;

@end

@implementation XSSearchEstateController
- (UIView *)historyView{
    if (_historyView == nil) {
        _historyView =[[UIView alloc]initWithFrame:CGRectZero];
        _historyView.backgroundColor = XSColor(232, 232, 232);
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(15, 7, 60, 15)];
        lab.text = @"历史搜索";
        lab.font = [UIFont systemFontOfSize:13];
        lab.textColor = XSColor(74, 74, 74);
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KScreenWidth -30 , 7, 15, 15);
        [btn setBackgroundImage:[UIImage imageNamed:@"hisde"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(delegateHis) forControlEvents:UIControlEventTouchUpInside];
        
        [_historyView addSubview:lab];
        [_historyView addSubview:btn];

    }
    return _historyView;
}

- (NSMutableArray *)oldArray{
    if (!_oldArray) {
        _oldArray = [NSMutableArray array];
    }
    return _oldArray;
}
- (void)setCityModel:(BRProvinceModel *)cityModel{
    _cityModel = cityModel;
    [self.dict safeSetObject:cityModel.name forKey:@"city"];
    [self.dict safeSetObject:cityModel.code forKey:@"cityId"];
}
- (NSMutableDictionary *)dict{
    if (!_dict) {
        _dict = [NSMutableDictionary dictionary];
        [_dict safeSetObject:_cityModel.name forKey:@"city"];
        [_dict safeSetObject:_cityModel.code forKey:@"cityId"];

    }
    return _dict;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = XSColor(232, 232, 232);

    if (self.black) {
        self.history = YES;
    }
    [self gethistory];
    self.array = [NSMutableArray array];
    WEAK_SELF;
    if (self.houseType <= 0) {
        self.houseType = XSBHouseType_old;

    }
    XSRegionSearchView *searcView =[[XSRegionSearchView alloc]initWithFrame:CGRectZero type:self.houseType];
    if (self.black) {
        searcView.placeholder = @"搜索您感兴趣的内容";
    }
    searcView.search = YES;
    searcView.searchBlack = ^(NSString *searhKey,XSBHouseType type) {
        STRONG_SELF;
        self.houseType = type;
        if (self.black) {
            [self save:searhKey];
            [self searctBlack:searhKey];
        }else{
            if (searhKey.length > 0) {
                [self loadDataWithkeywords:searhKey];
            }
        }

    };
    self.searcView = searcView;
    self.navigationItem.titleView = searcView;
    UITableView *tableView = [[UITableView alloc]init];
    self.tableView = tableView;
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStyleDone target:self action:@selector(diss)];
    
    [self.view addSubview:tableView];
    [self.tableView reloadData];
    self.tableView.ly_emptyView = self.emptyView;
}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.searcView.frame = CGRectMake(0, 0, SCREEN_SIZE.width - 150, 35);
    self.tableView.frame = self.view.bounds;
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.oldArray.count <= 0) {
        [self.searcView beganEditing];
    }

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self gethistory];
}
- (void)loadDataWithkeywords:(NSString *)keywords{
    self.dict = nil;
    [self.dict safeSetObject:keywords forKey:@"keywords"];
    WEAK_SELF;
    [self.subInfoInterface searchEstateWithDict:self.dict callback:^(XSNetworkResponse * _Nullable responseModel, NSError * _Nullable error) {
        STRONG_SELF;
        if (error == nil && responseModel.code.integerValue == SuccessCode) {
            [self.array removeAllObjects];
            NSMutableArray *array = [XSHouseEsModel mj_objectArrayWithKeyValuesArray:responseModel.data];
            [self.array addObjectsFromArray:array];
            [self.tableView reloadData];
            self.tableView.ly_emptyView = self.emptyView;
        }
    }];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return self.history?self.historyView:nil;

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return self.history?30:0;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.history?self.oldArray.count:self.array.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45.0;
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{

    NSString *oldStr = [self.oldArray safeObjectAtIndex:indexPath.row];

    XSHouseEsModel *dataModel = [self.array safeObjectAtIndex:indexPath.row];
    static NSString *ID = @"XSHouseEsModel";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.text = self.history?oldStr:dataModel.name;
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(15, 44.5, self.view.width - 15, 0.5)];
        line.backgroundColor = XSColor(239, 239, 239);
        [cell.contentView addSubview:line];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *oldStr = [self.oldArray safeObjectAtIndex:indexPath.row];
    XSHouseEsModel *dataModel = [self.array safeObjectAtIndex:indexPath.row];

    if (self.history) {
        [self searctBlack:oldStr];
    }else{
        [self.navigationController popViewControllerAnimated:NO];
        if (self.searchBlock) {
            self.searchBlock(dataModel,self.houseType);
         }
    }

}
- (void)searctBlack:(NSString *)str{
//    [self.navigationController popViewControllerAnimated:NO];
    if (self.searchTitleBlock) {
        self.searchTitleBlock(str,self.houseType);
    }
}
- (void)save:(NSString *)str{
   NSDictionary *dict =  [[NSUserDefaults standardUserDefaults] objectForKey:@"XShistory"];
    NSMutableDictionary *mDict = [NSMutableDictionary dictionaryWithDictionary:dict];
    [mDict  safeSetObject:str forKey:str];
    NSDictionary *dictnew =  [NSDictionary dictionaryWithDictionary:mDict];
    [[NSUserDefaults standardUserDefaults] setObject:dictnew forKey:@"XShistory"];

}
-(void)gethistory{
    [self.oldArray removeAllObjects];
    NSDictionary *dict =  [[NSUserDefaults standardUserDefaults] objectForKey:@"XShistory"];
    if (dict.allValues.count) {
        [self.oldArray addObjectsFromArray:dict.allValues];
    }
    [self.tableView reloadData];

}
- (void)delegateHis{
    [[NSUserDefaults standardUserDefaults] setObject:@{} forKey:@"XShistory"];
    [self gethistory];
}
- (void)diss{
    [self.searcView endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];

//    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
