//
//  XSHouseSubMitModel.h
//  XSHouseLease
//
//  Created by xs on 2020/4/9.
//  Copyright © 2020 fang. All rights reserved.
//

#import <Foundation/Foundation.h>


@class XSHouseInfoCellModel;
//value发生set变化
typedef void (^XSValueUpdate)(void);
//value发生编辑
typedef void(^XSValuechangeStatus)(XSHouseInfoCellModel *model,id data,XSBHouseKeyValueEditStatus editStatus);

@interface XSValue : NSObject
@property (nonatomic,assign) BOOL isSelect;
@property (nonatomic,assign) BOOL NotEdit;
@property (nonatomic,copy) NSString *key;
@property (nonatomic,copy) NSString *keyStr;
@property (nonatomic,copy) NSNumber *value;
@property (nonatomic,copy) NSString *valueStr;
@property (nonatomic,copy) NSString *frontDescribe;
@property (nonatomic,copy) NSString *hindDescribe;
@property (nonatomic,copy) NSString *placeholder;
@property (nonatomic,copy)   XSValueUpdate updateBlack;
@property (nonatomic,assign) XSValueSendType sendType;
@property (nonatomic, copy) NSArray<NSString *> *imgs;//内容照片
@end

@interface XSKeyValueModel : NSObject
@property (nonatomic,assign) BOOL chooseType;
@property (nonatomic,assign) BOOL multiple;
@property (nonatomic,copy)   NSString *name;
@property (nonatomic,copy)   NSString *key;
@property (nonatomic,strong) NSNumber *sequence;
@property (nonatomic,strong) NSArray<XSValue *> *values;
@property (nonatomic,copy)   XSValueUpdate updateBlack;
@property (nonatomic,assign) XSValueInputType keyInputType;
@property (nonatomic,assign) XSValueTextInputType keyTextInputType;
@end



@interface XSHouseInfoCellModel : NSObject
@property (nonatomic,copy)   NSString *title;
@property (nonatomic,strong) NSNumber *sequence;
@property (nonatomic,copy)   NSString *cellClass;
@property (nonatomic,strong) NSNumber *cellHeight;
@property (nonatomic,strong) NSArray<XSKeyValueModel *> *arrayValue;
@property (nonatomic,copy)   XSValuechangeStatus valuechangeStatus;
@end



//接口拉取的
@interface XSHouseEnumDataEnumRes : NSObject
@property (nonatomic, strong) NSNumber *value;
@property (nonatomic, copy  ) NSString *name;
@end

@interface XSHouseEnumData : NSObject
@property (nonatomic, copy) NSString *key;//选项值
@property (nonatomic, copy) NSString *name;//选项描述
@property (nonatomic, strong) NSNumber *type;//选项顺序位置
@property (nonatomic, assign) BOOL multiple;//是否可以多选
@property (nonatomic, copy) NSArray<XSHouseEnumDataEnumRes *> *enumRes;//可选项选项
- (XSHouseInfoCellModel *)combinationToCellModel;
@end

