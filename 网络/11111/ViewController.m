//
//  ViewController.m
//  11111
//
//  Created by xs on 2019/3/6.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDelegate>
@property(nonatomic,strong) NSMutableData *data;
@end

@implementation ViewController
- (NSMutableData *)data{
    if (!_data) {
        _data = [[NSMutableData alloc]init];
    }
    return _data;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

@end
