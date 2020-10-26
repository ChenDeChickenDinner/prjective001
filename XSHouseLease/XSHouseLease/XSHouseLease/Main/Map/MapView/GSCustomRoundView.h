//
//  GSCustomRoundView.h
//  GSMAMapDemo
//
//  Created by goldenSir on 2018/6/15.
//  Copyright © 2018年 goldenSir. All rights reserved.
//

#import <MAMapKit/MAMapKit.h>
#import "GSMAPointAnnotation.h"

//自定义圆形标记点儿

@interface GSCustomRoundView : MAAnnotationView

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) GSMAPointAnnotation *data;

@end
