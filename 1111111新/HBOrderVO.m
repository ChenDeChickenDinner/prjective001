//
//  HBOrderVO.m
//  HBStockDev
//
//  Created by Walker on 2016/11/10.
//  Copyright © 2016年 Walker. All rights reserved.
//

#import "HBOrderVO.h"
#import "NSString+HBNumberChange.h"
#import <AdSupport/AdSupport.h>
#import "TdxCore.h"

#pragma mark - HBDeviceInfoVO
@implementation HBDeviceInfoVO

+ (HBDeviceInfoVO *)getDeviceInfo {
    HBDeviceInfoVO *deviceInfo = [[HBDeviceInfoVO alloc] init];
    deviceInfo.model = [NSString getCurrentDevice];
    deviceInfo.iPhoneName =  [UIDevice currentDevice].name;
    deviceInfo.appVerion = [NSString stringWithFormat:@"HBStockWarningIos_%@",XcodeAppVersion];
    deviceInfo.localizedModel = [UIDevice currentDevice].localizedModel;
    deviceInfo.systemName = [UIDevice currentDevice].systemName;
    deviceInfo.systemVersion = [UIDevice currentDevice].systemVersion;
    deviceInfo.idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    deviceInfo.uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    deviceInfo.phoneNum = [HBUserServer sharedInstance].userModel.phone;
    deviceInfo.ipAdress = [NSString getTelephoneIPAddress];
    return deviceInfo;
}

-(NSString *)resolution{
    //1、得到当前屏幕的尺寸：
    
    
    CGRect rect_screen = [[UIScreen mainScreen] bounds];
    
    CGSize size_screen = rect_screen.size;
    
    //2、获得scale：
    
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    
    //3、获取分辨率
    CGFloat width = size_screen.width*scale_screen;
    
    CGFloat height = size_screen.height*scale_screen;
    
    return [NSString stringWithFormat:@"%ld*%ld",(NSInteger)height,(NSInteger)width];
}
@end


#pragma mark - HBEntrustStatesVO
@implementation HBEntrustStatesVO


@end

#pragma mark 撤单模型
@implementation HBCancelOrdersModel
- (void)tdxConversion{
    
     TdxCore *ob = [[TdxCore alloc]init];
    NSString *securityType =    [ob GetBreedTypeStr2:self.exchangeInt.integerValue zqdm:self.code];
     self.securityType = HBSecurityTypeWithTDXType(securityType);
    
    self.exchange = [self.exchangeInt f100Exchange];

    if ([self.entrustTypeDesc isEqualToString:@"买入"]) {
        self.entrustType = HBEntrustTypeBuy;
    }else if ([self.entrustTypeDesc isEqualToString:@"卖出"]){
        self.entrustType = HBEntrustTypeSell;
    }
    if ([self.entrustResultMsg isEqualToString:@"撤单中"]) {
        self.entrustResultCode = HBTransactionStatecancellationsing;
    }
    if ([self.entrustResultMsg containsString:@"-"]) {
          NSArray *arr = [self.entrustResultMsg componentsSeparatedByString:@"-"];
          if (arr.count >1) {
              self.entrustResultMsg  = arr.lastObject;
          }
      }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p> {name: %@, code: %@ entrustResultMsg: %@}", self.class, self,self.name , self.code,self.entrustResultMsg];
}


@end
