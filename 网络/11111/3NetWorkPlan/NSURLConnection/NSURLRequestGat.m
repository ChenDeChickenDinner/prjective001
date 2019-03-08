//
//  NSURLRequestGat.m
//  11111
//
//  Created by xs on 2019/3/6.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "NSURLRequestGat.h"
@interface NSURLRequestGat()<NSURLConnectionDelegate>
@property(nonatomic,strong) NSMutableData *data;

@end
@implementation NSURLRequestGat
- (NSMutableData *)data{
    if (!_data) {
        _data = [[NSMutableData alloc]init];
    }
    return _data;
}

- (void)test1{
    // 在当前线程中同步执行，等待回调后才能执行后面的代码
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest* request  = [[NSURLRequest alloc]initWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSLog(@"开始发送请求");
    NSURLConnection *connection = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"当前线程:%@",[NSThread currentThread]);
    NSLog(@"response = %@",response);
    NSLog(@"error = %@",error);
}
- (void)test2{
    // 在当前线程中同步执行，等待回调后才能执行后面的代码
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest* request  = [[NSURLRequest alloc]initWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSLog(@"开始发送请求");
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSLog(@"当前线程:%@",[NSThread currentThread]);
    NSLog(@"response = %@",response);
    NSLog(@"error = %@",error);
    NSLog(@"请求发送完毕");

}
- (void)test3{
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest* request  = [[NSURLRequest alloc]initWithURL:url];
    NSURLResponse *response = nil;
    NSError *error = nil;
    // 异步发送 不影响后面代码的执行，回调在主线程中执行
    NSOperationQueue *queue1 = [NSOperationQueue mainQueue];
    //异步发送 不影响后面代码的执行，回调在子线程中执行
    NSOperationQueue *queue2 = [[NSOperationQueue alloc]init];
    NSLog(@"开始发送请求");
    [NSURLConnection sendAsynchronousRequest:request queue:queue2 completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        NSLog(@"当前线程:%@",[NSThread currentThread]);
        NSLog(@"response = %@",response);
        NSLog(@"error = %@",error);
    }];
    NSLog(@"请求发送完毕");

}
- (void)test4{
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
    NSURLRequest* request  = [[NSURLRequest alloc]initWithURL:url];
    [[NSURLConnection alloc]initWithRequest:request delegate:self];
}


/**
 开始接收到服务器的响应时调用
 @param connection
 @param response <#response description#>
 */
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{

    NSLog(@"response = %@",response);
    NSLog(@"%s",__func__);
}

/**
 接收到服务器返回的数据时调用（服务器返回的数据比较大时会调用多次）


 @param connection
 @param data 二进制数据
 */
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{

    [self.data appendData:data];
    NSLog(@"%s",__func__);

}

/**
 服务器返回的数据完全接收完毕后调用
 @param connection
 */
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{

    NSString *str = [[NSString alloc]initWithData:self.data encoding:NSUTF8StringEncoding];
    NSLog(@"str = %@",str);
    NSLog(@"%s",__func__);

}
/**
 请求出错时调用（比如请求超时）
 */

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{

    NSLog(@"%s",__func__);

}

@end
