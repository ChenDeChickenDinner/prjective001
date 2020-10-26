//
//  XSHouseInfoShowModel.m
//  房鼎汇
//
//  Created by indulgeIn on 2020/03/27.
//  Copyright © 2020 indulgeIn. All rights reserved.
//

#import "XSHouseInfoShowModel.h"
@implementation XSHouseEsModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end
@implementation XSHouseInfoModel

- (instancetype)init{
    self  =[super init];
    if (self) {
        self.cellClass = @"XSHouseRentInfoCell";
    }
    return self;
}
- (void)setHouseType:(XSBHouseType)houseType{
    _houseType = houseType;
    
}
@end
@implementation XSHouseInfoShowModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"house_id":@"id"};
}
+ (NSDictionary *)mj_objectClassInArray {
    return @{@"forms":@"XSHouseDetailsDataFormsModel", @"dynamics":@"XSHouseDetailsDataDynamicsModel", @"imgs":@"XSHouseDetailsDataImgsModel"};
}
- (void)setContentImg:(NSArray<NSString *> *)contentImg{
    NSMutableArray<NSString *> *xsarray  = [NSMutableArray array];
    for (NSString *str in contentImg) {
        NSString *xsstr = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [xsarray addObject:xsstr];
    }
    _contentImg = [NSArray arrayWithArray:xsarray];
}
- (void)setFirstImg:(NSString *)firstImg{
    _firstImg = [firstImg stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}
-(XSHouseKeyValueModuleModel *)houseInfoBArrayWithSourceType:(XSBHouseKeyValueDataSource)type sourceDict:(NSMutableDictionary *)sourceDict{
    NSMutableDictionary *modeDict = [self mj_keyValues];
    XSHouseKeyValueModuleModel *model = [XSPublicServer houseInfoArrayForSourceType:type];
    for (XSHouseKeyVlaueModel *KeyVlaueModel in model.array) {
        id value =nil;
            if (sourceDict) {
                value = [sourceDict safeObjectForKey:KeyVlaueModel.key];
            }else{
                value = [modeDict safeObjectForKey:KeyVlaueModel.key];
            }
     
          if ([KeyVlaueModel.key isEqualToString:@"floor"]) {//楼层
              KeyVlaueModel.value = [NSString stringWithFormat:@"%@层(共%@层)",self.floor?self.floor:@"--",self.totalFloor?self.totalFloor:@"--"];
          }else if ([KeyVlaueModel.key isEqualToString:@"elevator"]){//电梯
              KeyVlaueModel.value = self.elevator.intValue?@"有":@"无";
          }else if ([KeyVlaueModel.key isEqualToString:@"createYears"]){//年代
              KeyVlaueModel.value = [NSString stringWithFormat:@"%@年建成",self.createYears?self.createYears:@"--"];
          }else if ([KeyVlaueModel.key isEqualToString:@"other"]){//其他
              KeyVlaueModel.value = [NSString stringWithFormat:@"产权年限 梯户比 >"];
          }else if ([KeyVlaueModel.key isEqualToString:@"elevatorDoor"]){//其他
              KeyVlaueModel.value = [NSString stringWithFormat:@"1梯%@户",self.elevatorDoor];
          }else{
              KeyVlaueModel.value = [NSString stringWithFormat:@"%@%@",value?value:@"",KeyVlaueModel.hindDescribe?KeyVlaueModel.hindDescribe:@""];
          }
     }
    return model;
}
@end






