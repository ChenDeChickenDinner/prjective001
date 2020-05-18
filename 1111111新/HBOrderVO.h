//
//  HBOrderVO.h
//  HBStockDev
//
//  Created by Walker on 2016/11/10.
//  Copyright © 2016年 Walker. All rights reserved.
//


#import "HBValueObject.h"

#pragma mark - HBDeviceInfoVO
/**
 当前的设备信息模型
 */
@interface HBDeviceInfoVO : HBValueObject
/** 当前设备信息/型号 */
@property (nonatomic, copy) NSString *model;
/** iPhone名称 */
@property (nonatomic, copy) NSString *iPhoneName;
/** app版本号 */
@property (nonatomic, copy) NSString *appVerion;
/** localizedModel */
@property (nonatomic, copy) NSString *localizedModel;
/** 当前系统名称 */
@property (nonatomic, copy) NSString *systemName;
/** systemVersion 系统版本号 */
@property (nonatomic ,copy) NSString *systemVersion;
/** 广告位标识符idfa idfa */
@property (nonatomic ,copy) NSString *idfa;
/** uuid  */
@property (nonatomic ,copy) NSString *uuid;

/** 电话号码 */
@property (nonatomic, copy) NSString *phoneNum;

/** 移动终端ip*/
@property (nonatomic, copy) NSString *ipAdress;

/** 分辨率*/
@property (nonatomic, copy) NSString *resolution;

+ (HBDeviceInfoVO *)getDeviceInfo;

@end


#pragma mark - HBEntrustStatesVO
/**
 批量查询委托状态接口，单个委托状态信息
 */
@interface HBEntrustStatesVO : HBValueObject
/** 股票代码 */
@property (nonatomic, copy) NSString *code;
/** 股票名称 */
@property (nonatomic, copy) NSString *name;
/** 交易所 */
@property (nonatomic, copy) NSString *exchange;
/** 委托类别 */
@property (nonatomic, assign) HBEntrustResponseType entrustType;
/** 委托数量 int */
@property (nonatomic, strong) NSNumber *entrustAmount;
/** 委托价格 BigDecimal */
@property (nonatomic, strong) NSNumber *entrustPrice;
/** 委托时间，毫秒值 int */
@property (nonatomic, strong) NSNumber *entrustDate;
/** 委托号 int */
@property (nonatomic, strong) NSNumber *entrustCode;
/** 委托结果code */
@property (nonatomic, assign) HBTransactionStatus entrustResultCode;
/** 委托结果说明 */
@property (nonatomic, copy) NSString *entrustResultMsg;
/** 成交数量 int */
@property (nonatomic, strong) NSNumber *transacAmount;
/** 成交价格 BigDecimal */
@property (nonatomic, strong) NSNumber *transacPrice;
/** 交易时间，毫秒值 int */
@property (nonatomic, strong) NSNumber *transacDate;
/** 撤单数量 int */
@property (nonatomic, strong) NSNumber *revokeAmount;
/** 只有当委托失败时，表示失败原因，用于当日委托和历史委托记录中显示 */
@property (nonatomic, copy) NSString *entrustNote;
/** *新增出参: 证券类型，对应FollowType */
@property (nonatomic, assign) HBSecurityType securityType;
/** 可撤单标志 false:不能，true:能，仅限于今日委托接口 */
@property (nonatomic, assign) BOOL hasRevoke;

@end

#pragma mark 撤单模型
@interface HBCancelOrdersModel : NSObject



/**股票名称*/
@property (nonatomic ,copy) NSString *name;

/**code*/
@property (nonatomic ,copy) NSString *code;

/** 上证 深证 exchange */
@property (nonatomic ,copy) NSString *exchange;
// tdx
@property (nonatomic ,strong) NSNumber *exchangeInt;
// tdx 股东代码
@property (nonatomic ,copy) NSString *account;


/**委托类别 */
@property (nonatomic ,assign) HBEntrustResponseType entrustType;
// tdx 委托类别int
@property (nonatomic ,copy) NSString *entrustTypeInt;
// tdx 委托类别描述
@property (nonatomic ,copy) NSString *entrustTypeDesc;

/**委托股数、金额*/
@property (nonatomic ,copy) NSString *entrustAmount;
/** tdx委托股数*/
@property (nonatomic ,copy) NSString *entrustNumberTdx;


/** transacAmount 成交股数 */
@property (nonatomic ,copy) NSString *transacAmount;

/**撤单数量*/
@property (nonatomic ,strong) NSNumber *revokeAmount;

/**委托价格*/
@property (nonatomic ,strong) NSNumber *entrustPrice;

/**委托时间 毫秒值*/
@property (nonatomic ,copy) NSString *entrustDate;
// tdx
@property (nonatomic ,copy) NSString *entrustDataTdx;
@property (nonatomic ,copy) NSString *entrustTimeTdx;


/** 委托号 entrustCode */
@property (nonatomic ,copy) NSString *entrustCode;

//委托结果
@property (nonatomic ,assign) HBTransactionStatus entrustResultCode;

/** frozen 冻结资金 */
@property (nonatomic ,copy) NSString *frozen;

/** securityType 证券类型 */
@property (nonatomic ,assign) HBSecurityType securityType;

/**委托结果说明*/
@property (nonatomic ,copy) NSString *entrustResultMsg;


/**左侧选中按钮的状态*/
@property (nonatomic) BOOL selected;

/**左侧选中按钮是否显示*/
@property (nonatomic) BOOL show;

/**撤单按钮是否显示*/
@property (nonatomic) BOOL cancelTransactionBtnHidden;
/**撤单再买*/
@property (nonatomic, strong) void(^cancelAndBuyEvent)(void);
/**立即撤单*/
@property (nonatomic, strong) void(^cancelAndNowEvent)(void);
/**底部的撤单再买入，卖出是否隐藏*/
@property (nonatomic) BOOL hiddenBottonCancelBtns;
- (void)tdxConversion;
@end
