//
//  ViewController.m
//  2019OC2
//
//  Created by xs on 2019/3/1.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ViewController.h"
#import "MemoryDistribution.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[[MemoryDistribution alloc]init] test2];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
