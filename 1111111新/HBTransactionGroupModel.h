//
//  HBTransactionGroupModel.h
//  HBStockWarning
//
//  Created by hbzq on 16/8/22.
//  Copyright © 2016年 Touker. All rights reserved.
//
//@class HBConditionalDataModel;
#import <Foundation/Foundation.h>
#import "NSObject+TDX.h"

@class HBConditionalDataModel,HBConditionalEntrustedModel;
//批量查询委托状态
@interface HBQueryEntrustStatesModel : NSObject

/** stockCode 代码 */
@property (nonatomic ,copy) NSString *code;

/** name 名称 */
@property (nonatomic ,copy) NSString *name;

/** stockCode 代码 */
@property (nonatomic ,copy) NSString *exchange;

/** stockCode 委托类别 */
@property (nonatomic ,assign) HBEntrustResponseType entrustType;

/** entrustAmount 委托数量 */
@property (nonatomic ,copy) NSString *entrustAmount;

/** entrustPrice 委托价格 */
@property (nonatomic ,strong) NSNumber *entrustPrice;

/** entrustDate 委托时间 */
@property (nonatomic ,strong) NSNumber *entrustDate;

/** entrustCode 委托号 */
@property (nonatomic ,copy) NSString *entrustCode;

/** entrustResultCode 委托结果code */
@property (nonatomic ,assign) HBTransactionStatus entrustResultCode;


/** entrustResultMsg 委托结果信息 */
@property (nonatomic ,copy) NSString *entrustResultMsg;

/** 委托失败原因 entrustNote */
@property (nonatomic ,copy) NSString *entrustNote;

/** transacAmount 成交数量 */
@property (nonatomic ,strong) NSNumber *transacAmount;
/** transacPrice 成交价格 */
@property (nonatomic ,strong) NSNumber *transacPrice;

/** transacDate 成交时间code */
@property (nonatomic ,strong) NSNumber *transacDate;
/** revokeAmount 撤单数量 */
@property (nonatomic ,strong) NSNumber *revokeAmount;

/** 证券类型 */
@property (nonatomic ,assign) HBSecurityType securityType;
/** 实收佣金 ，用于历史成交记录显示 realCommission */
@property (nonatomic ,strong) NSNumber *realCommission;
/** 印花税，用于历史成交记录显示 stampTax */
@property (nonatomic ,strong) NSNumber *stampTax;
/** 过户费，用于历史成交记录显示 transferFee */
@property (nonatomic ,strong) NSNumber *transferFee;
/** 结算费 clearingFee */
@property (nonatomic ,strong) NSNumber *clearingFee;
/** frozen 冻结资金 */
@property (nonatomic ,strong) NSNumber *frozen;

@end


@interface HBTransactionGroupModel : NSObject

//@property (copy, nonatomic) NSString *month;
//@property (strong, nonatomic) NSArray *entrustVOList;
@property (strong, nonatomic) NSNumber *counts;
@property (strong, nonatomic) NSArray *list;
@end


@interface HBTransactionRecordModel : NSObject

@property (nonatomic,assign) BOOL isOpen;

/**securityType*/
@property (nonatomic ,assign) HBSecurityType securityType;

/**股票名称*/
@property (nonatomic ,copy) NSString *name;
/**code*/
@property (nonatomic ,copy) NSString *code;
/**委托股数*/
@property (nonatomic ,strong) NSNumber *entrustAmount;

/**成交股数 transacAmount*/
@property (nonatomic ,strong) NSNumber *transacAmount;

/**委托价格*/
@property (nonatomic ,strong) NSNumber *entrustPrice;
/** 成交价格 transacPrice*/
@property (nonatomic ,strong) NSNumber *transacPrice;


/** 实收佣金 ，用于历史成交记录显示 realCommission */
@property (nonatomic ,strong) NSNumber *realCommission;

/** 印花税，用于历史成交记录显示 stampTax */
@property (nonatomic ,strong) NSNumber *stampTax;

/** 过户费，用于历史成交记录显示 transferFee */
@property (nonatomic ,strong) NSNumber *transferFee;

/** 结算费 clearingFee */
@property (nonatomic ,strong) NSNumber *clearingFee;

/** frozen 冻结资金 */
@property (nonatomic ,strong) NSNumber *frozen;
/** frozen 委托金额 */
@property (nonatomic ,strong) NSNumber *entrustTotalPrice;
/** 委托号 entrustCode */
//@property (nonatomic ,copy) NSString *entrustCode;
@property (nonatomic ,strong) NSString *entrustCode;


/** 上证 深证 exchange */
@property (nonatomic ,copy) NSString *exchange;
// tdx exchange int
@property (nonatomic ,strong) NSNumber *exchangeInt;
//tdx 委托日期
@property (nonatomic ,copy) NSString *entrustDataTdx;
//tdx 委托时间
@property (nonatomic ,copy) NSString *entrustTimeTdx;

/**委托时间 毫秒值*/
//@property (nonatomic ,copy) NSString *entrustDate;
@property (nonatomic ,strong) id entrustDate;
/**成交时间 毫秒值*/
//@property (nonatomic ,copy) NSString *transacDate;
@property (nonatomic ,strong) NSNumber *transacDate;

// 委托类型  普通交易
@property (nonatomic ,copy) NSString *tradeType;
/** 买 卖 借出 申购 盘后卖出 int 值 */
@property (nonatomic ,assign) HBEntrustResponseType entrustType;
@property (nonatomic ,copy) NSString *FID;
// tdx 买卖标志
@property (nonatomic ,strong) NSNumber *entrustTypeInt;
// tdx 委托类型
@property (nonatomic ,copy) NSString *entrustTypeDesc;

// 报价方式 限价
@property (nonatomic ,copy) NSString *orderType;
// 委托结果 int 值
@property (nonatomic ,assign) HBTransactionStatus entrustResultCode;

/** 委托失败原因 entrustNote */
@property (nonatomic ,copy) NSString *entrustNote;
/**委托结果说明*/
@property (nonatomic ,copy) NSString *entrustResultMsg;

/** 撤单数量 */
@property (nonatomic ,strong) NSNumber *revokeAmount;
/**定位串，用于分页查询*/
@property (nonatomic ,copy) NSString *rowIndex;

/** 成交金额(新增)*/
@property (nonatomic ,strong) NSNumber *transacTotalPrice;


/** 可撤单标志 false:不能，true:能，仅限于今日委托接口 */
@property (nonatomic ,assign) BOOL hasRevoke;

@property (nonatomic, copy) NSString *followId; //xs集成新详情界面添加


@property (nonatomic ,assign)HBTransactionRecordsType transactionRecordsType;
//股东账号
@property (nonatomic ,copy)NSString *account;
- (void)tdxConversion;
//整合数据
- (NSMutableArray *)getDataSource;

+ (HBTransactionRecordModel *)transferWithEntrustModel:(HBConditionalEntrustedModel *)model;

@end

//委托明细 成交明细 viewModel
@interface HBEntrustDetailViewModel : HBValueObject

@property (nonatomic ,copy) NSString *titleName;

@property (nonatomic ,strong) NSAttributedString *attributedString;


@property (nonatomic, strong) NSArray *list;
@end


/**
 引导条件单广告位
 */
@interface HBEntrustConditionalModel : NSObject

/**主标题(名称)*/
@property (nonatomic ,copy) NSString *mainTitle;

/**副标题(描述)*/
@property (nonatomic ,copy) NSString *subTitle;

/**图片URL(icon url)*/
@property (nonatomic ,copy) NSString *imgUrl;

/**跳转链接*/
@property (nonatomic ,copy) NSString *jumpUrl;

/**最小版本号*/
@property (nonatomic ,copy) NSString *minVersion;

/**最小版本号*/
@property (nonatomic ,strong) NSNumber *sort;

/**是否创建过该类型条件单*/
@property (nonatomic ,assign) BOOL hasCreateCondition;

@property (nonatomic ,copy) NSString *strategyType;


/**创建条件单*/
@property (nonatomic, copy) void(^createsConditonal)();

// 版本验证是否展示此广告
- (BOOL)showGuide;

// 后台字符串匹配成前端类型
- (HBNewConditionTradeType)showtype;

@end

@interface HBNewTransactionRecordModel : NSObject

@property (nonatomic ,copy) NSString *code;
@property (nonatomic ,copy) NSString *name;
@property (nonatomic ,copy) NSString *exchange;
@property (nonatomic ,strong) NSNumber *entrustType;
@property (nonatomic ,strong) NSNumber *entrustAmount;
@property (nonatomic ,strong) NSNumber *entrustPrice;
@property (nonatomic ,strong) NSNumber *entrustDate;
@property (nonatomic ,strong) NSNumber *entrustCode;
@property (nonatomic ,strong) NSNumber *entrustResultCode;
@end
