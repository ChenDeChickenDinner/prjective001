//
//  XSHouseEnum.h
//  XSHouseLease
//
//  Created by xs on 2020/4/8.
//  Copyright © 2020 fang. All rights reserved.
//

#ifndef XSHouseEnum_h
#define XSHouseEnum_h


//登录业务
typedef void(^logSuccess)(void);
typedef void(^logCancel)(void);

//搜索完成回调
typedef NS_ENUM(NSInteger,XSHouseSource) {
    XSHouseSource_0 = 0, // 全部
    XSHouseSource_1 = 1, // 个人
    XSHouseSource_2 = 2 , // 中介
};
typedef NS_ENUM(NSInteger,XSBHouseCountType) {
    XSBHouseCountType_Region = 2, // 区
    XSBHouseCountType_Town = 1 , // 镇
    XSBHouseCountType_Estate = 3  // x小区
};
typedef NS_ENUM(NSInteger,XSBHouseType) {
    XSBHouseType_New = 2, // 新房
    XSBHouseType_old = 1 , // 二手房
    XSBHouseType_Rent = 3  // 出租
};

typedef NS_ENUM(NSInteger,XSAgencyType) {
    XSAgencyType_NOAgency = 0, // 未认证
    XSAgencyType_notPass = -1 , // 未通过
    XSAgencyType_Agencying = 1,  // 认证中
    XSAgencyType_Pass = 2  // 认证通过

};
typedef NS_ENUM(NSInteger,XSPayType) {
    XSPayType_zfb = 1,
    XSPayType_wx = 2 ,
};
typedef NS_ENUM(NSInteger,XSPayTimeType) {
    XSPayTimeType_month = 1,
    XSPayTimeType_season = 2 ,
    XSPayTimeType_year = 3 ,

};
typedef void(^searchBlack)(NSString *searhKey,XSBHouseType type);

// 租房列表类型
typedef NS_ENUM(NSInteger,XSBHouseInfoSource) {
    XSBHouseInfoSource_keyPush = 0, // 城市推荐
    XSBHouseInfoSource_WatchPush, // 关注推荐
    XSBHouseInfoSource_HouseIdPush, // 详情推荐
    XSBHouseInfoSource_MyPublish, // 发布
    XSBHouseInfoSource_MyWatch , // 关注

};


// 租房出租状态
typedef NS_ENUM(NSInteger,XSBHouseRentStatus) {
    XSBHouseRentStatus_notrent = 0, // 0未出租
    XSBHouseRentStatus_rent , // 1是已出租
};
// 操作房子状态
typedef NS_ENUM(NSInteger,XSEDITTYPE) {
    XSEDITTYPE_status = 0, // 发布状态
    XSEDITTYPE_dealStatus , // 交易状态
};
//1待审核2审核失败3取消发布4下架5暂停6发布(恢复上架)
typedef NS_ENUM(NSInteger,XSBHouseSubStatus) {
    XSBHouseSubStatus_edit = 0, // 编辑
    XSBHouseSubStatus_DSH = 1, //
    XSBHouseSubStatus_SHSB = 2 , //
    XSBHouseSubStatus_QXFB = 3, //
    XSBHouseSubStatus_XJ = 4, //
    XSBHouseSubStatus_ZT = 5, //
    XSBHouseSubStatus_FB = 6 //
};
typedef NS_ENUM(NSInteger,XSHouseSubmitType) {
    XSHouseSubmitType_Rent= 0,//出租
    XSHouseSubmitType_Sell,
};

// 列表点击事件
typedef NS_ENUM(NSInteger, XShouseOperation) {
    XShouseOperation_click = 0,//点击事件
};

// value编辑状态
typedef NS_ENUM(NSInteger,XSBHouseKeyValueEditStatus) {
    XSBHouseKeyValueEdit = 0, // 无状态
    XSBHouseKeyValueEditBegin , // 开始编辑
    XSBHouseKeyValueCity , // 地址选择
    XSBHouseKeyValueImagesChange , // 图片重新选择
    XSBHouseKeyValueImagesSend , // 图片传送
    XSBHouseKeyValueImagesDoorSend , // 图片传送
    XSBHouseKeyValueEsSend , // 小区传送
    XSBHouseKeyValueIntroduce , // 房源详情
    XSBHouseKeyValueInfoSMore , // 二手房房源信息
    XSBHouseKeyValueInfoNMore , // 新房房源信息
    XSBHouseKeyValueInfoDoorInfo , // 新房户型
    XSBHouseKeyValueInfoDoorImageInfo , // 新房户型
    XSBHouseKeyValueInfoLDIX , // 新房楼栋信息
    XSBHouseKeyValueInfoLPIX , // 新房楼盘动态
    XSBHouseKeyValueInfoSC , // 滚动

};
// value信息
typedef NS_ENUM(NSInteger,XSBHouseKeyValueDataSource) {
    rentHouseInfo = 0,
    secondHouseInfo, // 无状态
    newHouseInfo , // 无状态
    secondHouseBaseInfo , // 基础属性
    secondHouseTradingInfo , // 交易属性
    newHouseBaseInfo , // 基础属性
    newHouseTradingInfo , // 销售信息
    newHouseEstateInfo , // 小区概况
    newHouseDataLicenceInfo , // 预售许可证
    newHouseLdxiInfo , // 楼栋信息

};
typedef NS_ENUM(NSInteger,XSValueInputType) {
    XSValueInputType_textField = 0,
    XSValueInputType_listSelect,
    XSValueInputType_collectionview,
    XSValueInputType_textView,

};
typedef NS_ENUM(NSInteger,XSValueTextInputType) {
    XSValueTextInputType_Str = 0,
    XSValueTextInputType_Number,
    XSValueTextInputType_phone,

};
typedef NS_ENUM(NSInteger,XSValueSendType) {
    XSValueSendType_Int = 0,
    XSValueSendType_Str,
};

typedef NS_ENUM(NSInteger,XSHouseImageLoadType) {
    XSHouseImageLoadType_Imags = 0, // 房屋图片
    XSHouseImageLoadType_door = 1, // 户型
};

#endif /* XSHouseEnum_h */
