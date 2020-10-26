//
//  XShouseSubNetworkInterface.m
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/24.
//  Copyright © 2020 fang. All rights reserved.
//
//    NSError *error;
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"XSHouseSave" ofType:@"json"];
//    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:path] options:NSJSONReadingMutableLeaves error:&error];
//    NSLog(@"jsonDict %@",jsonDict);
//    [self POST:url param:jsonDict progress:nil callback:callback];
#import "XShouseSubNetworkInterface.h"

@implementation XShouseSubNetworkInterface
// 上传图片
- (void)uploadImage:(UIImage *)image imageUrl:(NSURL *)imageUrl  callback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dict safeSetObject:[XSUserServer sharedInstance].userModel.ID forKey:@"customerId"];

    NSString *url = [NSString stringWithFormat:@"%@/file/image",XSBaseUrl];
    
    [self loadImageWithURL:url imageUrl:imageUrl param:dict progress:nil callback:callback];
}

// 城市信息-市区镇
- (void)city_treeWithCallback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/city/tree",XSBaseUrl];
    [self GET:url param:dict progress:nil callback:callback];
}

//轮播图
- (void)bunnerListWithCallback:(HBCompletionBlock)callback{
NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
NSString *url = [NSString stringWithFormat:@"%@/bunner/list",XSBaseUrl];
[self GET:url param:dict progress:nil callback:callback];
}
//二手房轮播图
- (void)secondhousebunnerListWithDict:(NSMutableDictionary *)keyVales callback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    for (NSString *key in keyVales.allKeys) {
        [dict safeSetObject:[keyVales safeObjectForKey:key] forKey:key];
    }
    
    NSString *url = [NSString stringWithFormat:@"%@/secondhouse/bunner",XSBaseUrl];
    [self POST:url param:dict progress:nil callback:callback];
}
// 热搜
- (void)hotsSearchWithCallback:(HBCompletionBlock)callback{
NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
NSString *url = [NSString stringWithFormat:@"%@/estate/hots",XSBaseUrl];
[self GET:url param:dict progress:nil callback:callback];
}

// 小区查询
- (void)searchEstateWithDict:(NSDictionary *)dict callback:(HBCompletionBlock)callback{
    NSString *url = [NSString stringWithFormat:@"%@/estate/estates",XSBaseUrl];
    [self GET:url param:dict progress:nil callback:callback];
}

// 配套
- (void)enumFacilitiesWithCallback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/enum/facilities",XSBaseUrl];
    [self GET:url param:dict progress:nil callback:callback];
    
}



// 租房上传-动态入参获取
- (void)getRentEnumsWithCallback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/enum/rentenums",XSBaseUrl];
    [self GET:url param:dict progress:nil callback:callback];

}


// 二手房上传-动态入参获取
- (void)getSellEnumsWithCallback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/enum/save/secondenums",XSBaseUrl];
    [self GET:url param:dict progress:nil callback:callback];
}
//获取房屋筛选选择项
- (void)getQueryEnumsWithhouseType:(XSBHouseType)houseType callback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/enum/save/secondenums",XSBaseUrl];
    if (houseType == XSBHouseType_old){
       url = [NSString stringWithFormat:@"%@/enum/query/secondenums",XSBaseUrl];
    }else if (houseType == XSBHouseType_New){
        url = [NSString stringWithFormat:@"%@/enum/query/newenums",XSBaseUrl];
    }else if (houseType == XSBHouseType_Rent){
        url = [NSString stringWithFormat:@"%@/enum/query/rentenums",XSBaseUrl];
    }
    [self GET:url param:dict progress:nil callback:callback];
}

// 租房二手房上传提交
- (void)renthouseSaveWithDict:(NSMutableDictionary *)dict houseType:(XSBHouseType)houseType callback:(HBCompletionBlock)callback{
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    [dict safeSetObject:customer_id forKey:@"customerId"];
    NSString *url = [NSString stringWithFormat:@"%@/renthouse/save2",XSBaseUrl];;
    if (houseType == XSBHouseType_old){
       url = [NSString stringWithFormat:@"%@/secondhouse/save",XSBaseUrl];
    }
    [self POST:url param:dict progress:nil callback:callback];

}



// 房详情
- (void)houseDetailsWithHouseType:(XSBHouseType)houseType house_id:(NSNumber *)house_id callback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    [dict safeSetObject:customer_id forKey:@"customer_id"];

    NSString *url = nil;
    if (houseType == XSBHouseType_Rent) {
          url = [NSString stringWithFormat:@"%@/renthouse/details",XSBaseUrl];
      }else if (houseType == XSBHouseType_old){
          url = [NSString stringWithFormat:@"%@/secondhouse/details",XSBaseUrl];
      }else if (houseType == XSBHouseType_New){
          url = [NSString stringWithFormat:@"%@/newhouse/details",XSBaseUrl];
      }
    if (house_id) {
        url = [url stringByAppendingFormat:@"/%@",house_id];
    }
    [self GET:url param:dict progress:nil callback:callback];

}

- (void)houseLisetWith:(XSBHouseType)houseType source:(XSBHouseInfoSource)source resource:(XSHouseSource)resource house_id:(NSString *)house_id KeyVales:(NSMutableDictionary *)keyVales per_page:(NSInteger)per_page page_index:(NSInteger)page_index  callback:(HBCompletionBlock)callback{
    
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    if (source == XSBHouseInfoSource_keyPush) {
        for (NSString *key in keyVales.allKeys) {
            [dict safeSetObject:[keyVales safeObjectForKey:key] forKey:key];
        }
    }
   NSNumber *num = [dict safeObjectForKey:@"resource"];
    if (!num) {
        if (resource > 0) {
            [dict safeSetObject:@(resource) forKey:@"resource"];
        }
    } 

    NSLog(@"dict = %@",dict);
     NSString *customer_id = [XSUserServer sharedInstance].userModel.ID.stringValue;
    NSString *url = nil;
    if (source == XSBHouseInfoSource_keyPush) {
        if (houseType == XSBHouseType_Rent) {
            url = [NSString stringWithFormat:@"%@/renthouse/page?per_page=%ld&page_index=%ld",XSBaseUrl,per_page,page_index];
         }else if (houseType == XSBHouseType_old){
            url = [NSString stringWithFormat:@"%@/secondhouse/page?per_page=%ld&page_index=%ld",XSBaseUrl,per_page,page_index];
         }else if (houseType == XSBHouseType_New){
            url = [NSString stringWithFormat:@"%@/newhouse/page?per_page=%ld&page_index=%ld",XSBaseUrl,per_page,page_index];
         }
    }else if (source == XSBHouseInfoSource_WatchPush){
        if (houseType == XSBHouseType_Rent) {
             url = [NSString stringWithFormat:@"%@/renthouse/watchlike/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,customer_id,per_page,page_index];
         }else if (houseType == XSBHouseType_old){
             url = [NSString stringWithFormat:@"%@/secondhouse/watchlike/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,customer_id,per_page,page_index];
         }else if (houseType == XSBHouseType_New){
             url = [NSString stringWithFormat:@"%@/newhouse/watchlike/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,customer_id,per_page,page_index];
         }
    }else if (source == XSBHouseInfoSource_HouseIdPush){
        if (houseType == XSBHouseType_Rent) {
             url = [NSString stringWithFormat:@"%@/renthouse/like/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,house_id,per_page,page_index];
         }else if (houseType == XSBHouseType_old){
             url = [NSString stringWithFormat:@"%@/secondhouse/like/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,house_id,per_page,page_index];
         }else if (houseType == XSBHouseType_New){
             url = [NSString stringWithFormat:@"%@/newhouse/like/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,house_id,per_page,page_index];
         }
    }else if (source == XSBHouseInfoSource_MyPublish){
        if (houseType == XSBHouseType_Rent) {
             url = [NSString stringWithFormat:@"%@/renthouse/publish/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,customer_id,per_page,page_index];
         }else if (houseType == XSBHouseType_old){
             url = [NSString stringWithFormat:@"%@/secondhouse/publish/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,customer_id,per_page,page_index];
         }
    }else if (source == XSBHouseInfoSource_MyWatch){
        if (houseType == XSBHouseType_Rent) {
             url = [NSString stringWithFormat:@"%@/renthouse/watch/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,customer_id,per_page,page_index];
         }else if (houseType == XSBHouseType_old){
             url = [NSString stringWithFormat:@"%@/secondhouse/watch/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,customer_id,per_page,page_index];
         }else if (houseType == XSBHouseType_New){
             url = [NSString stringWithFormat:@"%@/newhouse/watch/page/%@?per_page=%ld&page_index=%ld",XSBaseUrl,customer_id,per_page,page_index];
         }
    }
 
    
    if (houseType == XSBHouseType_Rent) {
            if (source == XSBHouseInfoSource_keyPush){
               [self POST:url param:dict progress:nil callback:callback];
            }else{
               [self GET:url param:dict progress:nil callback:callback];
            }
     }else if (houseType == XSBHouseType_old){
         if (source == XSBHouseInfoSource_keyPush){
             [self POST:url param:dict progress:nil callback:callback];
         }else{
             [self GET:url param:dict progress:nil callback:callback];
         }
     }else if (houseType == XSBHouseType_New){
        if (source == XSBHouseInfoSource_keyPush){
            [self POST:url param:dict progress:nil callback:callback];
        }else{
            [self GET:url param:dict progress:nil callback:callback];
        }
     }
    
}



// 更变房子状态
- (void)editHouseStatusWithHouse_id:(NSNumber *)house_id houseType:(XSBHouseType)houseType status:(XSBHouseSubStatus)status editType:(XSEDITTYPE)editType callback:(HBCompletionBlock)callback{
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    NSString *url = [NSString stringWithFormat:@"%@/house/status",XSBaseUrl];

    if (editType == XSEDITTYPE_dealStatus) {
          url = [NSString stringWithFormat:@"%@/house/dealstatus",XSBaseUrl];
       }
    if (house_id) {
        url = [url stringByAppendingFormat:@"/%@",house_id];
    }
    [dict safeSetObject:[NSString stringWithFormat:@"%ld",(long)houseType] forKey:@"type"];
    if (editType == XSEDITTYPE_status) {
        [dict safeSetObject:[NSString stringWithFormat:@"%ld",(long)status] forKey:@"status"];
    }else{
        [dict safeSetObject:[NSString stringWithFormat:@"%ld",(long)status] forKey:@"deal_status"];

    }

    [self GET:url param:dict progress:nil callback:callback];

}
// 关注取消关注房子
- (void)rentWatchHouseWithHouse_id:(NSNumber *)house_id houseType:(XSBHouseType)houseType watch:(BOOL)watch callback:(HBCompletionBlock)callback{
    
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    NSString *url = [NSString stringWithFormat:@"%@/house/watch",XSBaseUrl];

    if (customer_id) {
        url = [url stringByAppendingFormat:@"/%@",customer_id];
    }
    if (house_id) {
        url = [url stringByAppendingFormat:@"/%@",house_id];
    }
    [dict safeSetObject:[NSString stringWithFormat:@"%ld",(long)houseType] forKey:@"type"];
    [dict safeSetObject:[NSNumber numberWithBool:watch] forKey:@"watch"];

    [self GET:url param:dict progress:nil callback:callback];

}



//租房搜索条件-key
- (void)renthouseConditionWithCallback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/renthouse/condition",XSBaseUrl];
    [self GET:url param:dict progress:nil callback:callback];

}
// 保存中介公司信息
- (void)saveagencyWithDict:(NSMutableDictionary *)dict callback:(HBCompletionBlock)callback{
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    [dict safeSetObject:customer_id forKey:@"customerId"];
    NSString *url = [NSString stringWithFormat:@"%@/customer/saveagency",XSBaseUrl];;
    [self POST:url param:dict progress:nil callback:callback];

}
//客服电话
- (void)messageServicetelWithCallback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/message/servicetel",XSBaseUrl];
    [self GET:url param:dict progress:nil callback:callback];

}
//关于我们
- (void)bunneraboutWithCallback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/bunner/about",XSBaseUrl];
    [self GET:url param:dict progress:nil callback:callback];

}
//上传意见
- (void)adviseSaver:(NSDictionary *)info callback:(HBCompletionBlock)callback{
    NSString *url = [NSString stringWithFormat:@"%@/advise/save",XSBaseUrl];
    [self POST:url param:info progress:nil callback:callback];
    
}
// 保存用户信息
- (void)savecustome:(NSDictionary *)info callback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dict safeSetObject:info forKey:@""];
    NSString *url = [NSString stringWithFormat:@"%@/customer/savecustomer",XSBaseUrl];
    [self POST:url param:info progress:nil callback:callback];
    
}

- (void)authenticationWithCallback:(HBCompletionBlock)callback{
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/customer/authentication",XSBaseUrl];
    if (customer_id) {
        url = [url stringByAppendingFormat:@"/%@",customer_id];
    }
    [self GET:url param:dict progress:nil callback:callback];

}

// 信息统计
- (void)statisticsWithCallback:(HBCompletionBlock)callback{
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/customer/statistics",XSBaseUrl];
    if (customer_id) {
        url = [url stringByAppendingFormat:@"/%@",customer_id];
    }
    [self GET:url param:dict progress:nil callback:callback];

}


- (void)usersigWithCallback:(HBCompletionBlock)callback{
//    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/im/usersig",XSBaseUrl];
//    if (customer_id) {
//        url = [url stringByAppendingFormat:@"/%@",customer_id];
//    }
    [self GET:url param:dict progress:nil callback:callback];

}
- (void)houseCountWithDict:(NSDictionary *)dict houseType:(XSBHouseType)houseType  countType:(XSBHouseCountType)countType  callback:(HBCompletionBlock)callback{
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
//    [dict safeSetObject:customer_id forKey:@"customerId"];
    NSString *host = nil;
    NSString *path = nil;

     if (houseType == XSBHouseType_Rent) {
         host = @"renthouse";
     }else if (houseType == XSBHouseType_old){
         host = @"secondhouse";
     }else if (houseType == XSBHouseType_New){
         host = @"newhouse";
     }
    if (countType == XSBHouseCountType_Region) {
         path = @"regioncount";
     }else if (countType == XSBHouseCountType_Town){
         path = @"towncount";
     }else if (countType == XSBHouseCountType_Estate){
         path = @"estatecount";
     }
    NSString *url = [NSString stringWithFormat:@"%@/%@/%@",XSBaseUrl,host,path];;

    [self POST:url param:dict progress:nil callback:callback];

}


- (void)packagesWithCallback:(HBCompletionBlock)callback{
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSString *url = [NSString stringWithFormat:@"%@/order/packages",XSBaseUrl];
    if (customer_id) {
        url = [url stringByAppendingFormat:@"/%@",customer_id];
    }
    [self GET:url param:dict progress:nil callback:callback];

}


- (void)limitstatusWithresource:(XSHouseSource)resource houseType:(XSBHouseType)houseType Callback:(HBCompletionBlock)callback{
    NSNumber *customer_id = [XSUserServer sharedInstance].userModel.ID;
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dict safeSetObject:@(resource) forKey:@"resource"];
    [dict safeSetObject:@(houseType) forKey:@"house_type"];

    NSString *url = [NSString stringWithFormat:@"%@/order/enable/limit/status",XSBaseUrl];
    if (customer_id) {
        url = [url stringByAppendingFormat:@"/%@",customer_id];
    }
    [self GET:url param:dict progress:nil callback:callback];

}

- (void)orderstringWithCode:(NSString *)code packageId:(NSNumber *)packageId payType:(XSPayType)payType callback:(HBCompletionBlock)callback{
    NSMutableDictionary * dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    NSNumber *customerId = [XSUserServer sharedInstance].userModel.ID;
    [dict safeSetObject:customerId forKey:@"customerId"];
    [dict safeSetObject:packageId forKey:@"packageId"];
    [dict safeSetObject:@(payType) forKey:@"payType"];
//    [dict safeSetObject:code forKey:@"code"];

    NSString *url = [NSString stringWithFormat:@"%@/order/orderstring",XSBaseUrl];
    [self POST:url param:dict progress:nil callback:callback];
    
}
@end
