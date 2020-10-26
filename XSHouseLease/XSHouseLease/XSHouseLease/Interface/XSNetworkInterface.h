//
//  XSNetworkInterface.h
//  XSHouseLease
//
//  Created by heartbeats on 2020/3/22.
//  Copyright © 2020 fang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "XSOperationParam.h"
//#define XSBaseMomain @"https://test.fangdinghui.cn:1113"
//#define XSBaseUrl @"https://test.fangdinghui.cn:1113/api/v1.0"
//#define XSImgaeBaseUrl @"https://test.fangdinghui.cn:1112"

#define XSBaseMomain @"https://fangdinghui.cn"
#define XSBaseUrl @"https://fangdinghui.cn/api/v1.0"
#define XSImgaeBaseUrl @"https://fangdinghui.cn"

#define XSJSQURL @"https://h5.fangdinghui.cn"
#define XSYHXY @"https://h5.fangdinghui.cn/pages/agreement/agreement"

#define XSXCX @"gh_d75c810fe904"

#define SuccessCode 200
NS_ASSUME_NONNULL_BEGIN


@class XSNetworkResponse;

typedef void (^ __nullable HBCompletionBlock)(XSNetworkResponse * __nullable responseModel, NSError * __nullable error);
typedef void (^ __nullable HBRequestProgress)(NSProgress * __nullable downloadProgress);
typedef BOOL (^ __nullable HBRepeatRequestBlock)(void);


@interface XSNetworkResponse : NSObject

@property (nonatomic, strong) NSNumber *code;
@property (nonatomic, strong) id data;
@property (nonatomic, copy) NSString *message;
@end


@interface XSNetworkInterface : NSObject
@property (nonatomic, strong) XSOperationParam *paramModel;
@property (nonatomic, strong) AFHTTPSessionManager *operationManger;
/**
 *  初始化方法
 */
+ (instancetype)interfaceWithOperationManager:(AFHTTPSessionManager *)aOperationManger;

- (void)POST:(NSString *)URLString param:(NSDictionary *)aParam progress:(HBRequestProgress)downloadProgress callback:(HBCompletionBlock)callback;

- (void)GET:(NSString *)URLString param:(NSDictionary *)aParam progress:(HBRequestProgress)downloadProgress callback:(HBCompletionBlock)callback;

- (void)loadImageWithURL:(NSString *)URLString imageUrl:(NSURL *)imageUrl param:(NSDictionary *)aParam progress:(HBRequestProgress)downloadProgress callback:(HBCompletionBlock)callback;
@end

NS_ASSUME_NONNULL_END
