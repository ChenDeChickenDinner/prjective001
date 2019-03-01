//
//  ViewController.m
//  2019OC
//
//  Created by xs on 2019/2/21.
//  Copyright © 2019 Touker. All rights reserved.
//

#import "ViewController.h"
@interface CXWOperation:NSOperation
@end
@implementation CXWOperation
- (void)main{

}
@end
@interface ViewController ()
@property(nonatomic,strong) NSBlockOperation *op1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


}

- (IBAction)cancel:(id)sender {
    [self.op1 cancel];
    NSLog(@"cancelcancelcancelcancel");
}

- (void)run{


}

@end
