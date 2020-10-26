//
//  DViewController.h
//  GSMAMapDemo
//
//  Created by goldenSir on 2018/6/19.
//  Copyright © 2018年 goldenSir. All rights reserved.
//

#import "BaseViewController.h"
@interface XSHouseCountModel : NSObject
@property (nonatomic, strong) NSNumber *num;

@property (nonatomic, strong) NSNumber *longitude;
@property (nonatomic, strong) NSNumber *latitude;
@property (nonatomic, copy) NSString *region;
@property (nonatomic, strong) NSNumber *regionId;
@property (nonatomic, copy) NSString *town;
@property (nonatomic, strong) NSNumber *townId;
@property (nonatomic, copy) NSString *estate;
@property (nonatomic, strong) NSNumber *estateId;
@end
@interface DViewController : BaseViewController<JXCategoryListContentViewDelegate>
@property(nonatomic,assign) XSBHouseType houseType;
@property(nonatomic,assign) XSHouseSource resource;
@property (nonatomic ,strong) BRProvinceModel *cityModel;
@end
/*
viewForAnnotation 和 didSelectAnnotationView  类似tableView绘制方法和点击方法
本控制器（C）主要满足点击更改缩放级别并更换对应数据。

缩放级别说明：
3-13  --->   11
13-15 --->   14
15-19 --->   16

个人思路为：
页面初始化展示数据为：整个上海各个区域数据。如：徐汇区，松江区。（11）
点击徐汇区：地图放大，显示整个徐汇区数据。如：徐汇滨江，上海南站等。（14）
点击上海南站，展示附近各小区  房源数量。（16）
D控制器满足：手动缩放更改数据源并展示。并与点击缩放融合。

（3-13--->11：当缩放级别在3-11之间，设置当前缩放级别为11，当缩放结束，当前缩放级别发生改变在3-13之间，不处理数据，超过13 则设置缩放级别为14（13-15）或16（15-19），请求数据并绘制。）
所有缩放级别的设置是类比于链家来设置的，并不准确。可根据自己需求来设置。
有疑问或者建议可以发邮件给我：  995216390@qq.com
本人小白，自己摸索的地图点标记，大神见谅
*/
