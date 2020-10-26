//
//  XSUserLogInModel.m
//  XSHouseLease
//
//  Created by indulgeIn on 2020/03/22.
//  Copyright © 2020 indulgeIn. All rights reserved.
//

#import "XSUserLogInModel.h"

#import "JPUSHService.h"


@implementation XSUserLogInModel
- (instancetype)init{
    if (self = [super init]) {
        
        self.channelId = [JPUSHService registrationID];
        self.clientType = [NSNumber numberWithInt:2];
        self.clientBrand =  [[UIDevice currentDevice] model];
        self.osInfo =  [[UIDevice currentDevice] systemName];
        self.clientModel = [NSString stringWithFormat:@"%@ %@",[[UIDevice currentDevice] model], [[UIDevice currentDevice] systemVersion]];
    }
    return self;
}
+ (instancetype)userLogInModelForVcModel:(XSLogInVcModel *)model{
    XSUserLogInModel *LogInModel = [[XSUserLogInModel alloc]init];
    LogInModel.phone = model.phone;
    LogInModel.authCode = model.messageCheckCode;
    LogInModel.pictureCode = model.pictureCheckCode;
    
//    LogInModel.phone = @"15271323321";
//    LogInModel.authCode = @"1234";
//
    return LogInModel;
}

@end


