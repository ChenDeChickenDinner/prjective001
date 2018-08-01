//
//  AppDelegate.h
//  CoreGraphicsZL
//
//  Created by xs on 2017/6/19.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end
/*
 
 
 UI系统架构
 UIKit

 Core Animation

 OpenGL ES  + CoreGraphics

 Graphics Hardware


 0.0 基础框架学习
 .1 CoreGraphics
 .2 UIKit

 2:本质学习
 1.1 布局管理，坐标系统
 1.2 渲染及动画 代码 到 硬件 到展示
 2.1（View 与 CALayer）
 2.2 Offscreen Render


 3:实践，探索学习
 .1 view 在代码层如何正常的显示出来，前提条件，什么颜色，透明度，层级。。。。。
 .2 控件在生命周期中什么时候才有的frame
 .3系统的布局方法 都是干嘛的 什么时候调用的
 .4view 中 子view 的布局关系，谁先布局的 前后调用关系，依赖关系
 .5 自动布局

 4:控件学习




 5:事件响应
 6:升级
 .1 精简扁平的View层次结构
 .2 通用控件；
 .3 合理运用VC在替代View组合复杂界面；
 



 ******************************** UIKit 简介 *******************************************

 【】UIColor 对象代表的颜色，有时不透明（alpha值
 【】UIImage 对象是一个高层次的的方式来显示图像数据
 【】UIFont类提供了用于获取和设置字体信息的接口。
 【】UIBezierPath您可以定义一个路径由直线和曲线的线段组成，并呈现在您的自定义视图路径。



 【】UIDecive 提供了一个单个实例代表当前设备。
 【】UIScreen 对象包含设备的整个屏幕的边界矩形。
 【】UINib实例作为对象包装或容器，一个UINib对象在内存中缓存的一个nib文件的内容，
 【】UIAcceleration:被叫做加速事件的一个UIAcceleration类的实例是用来代表即时的三维加速数据。
 【】UIAccelerater:可以让你的寄存器接收到从板载硬件上得到的加速相关数据。



 【】UIBarItem(UIBarButtonItem/UITabBarItem)是一个抽象的超类用来在屏幕的底部给项目加上一栏
 【】UINavigationItem封装了一个UINavigationBar对象的堆栈上推导航项目的信息。



 【】UIResponder 定义了一个接口，应对和处理事件的对象。
 （1）UIApplication 提供了一个在iOS上运行的应用程序的控制和协调集中点。
 （2）UIViewController(UITabBarController/UITableViewController/UINavigationController/UIImagePickerController/UIVideoEditorController
 （3）UIView 类通过定义一个在屏幕和界面上的矩形区域来管理这块区域的内容。
 UIWindow/UILabel/UIImageView/UIWebView/UITabBar/UIToolBar/UINavigationBar/UITableViewCell
 UISearchBar/UIPickerView/UIAlterView/UIProgressView/UIActionSheet/UIActivityIndicatorView/
 UIScrollView/ UITextView /UITableView/
 UIControl 是为控制对象( UIButton/UISlider/UISwitch、UIStepper/UITextField/UIDatePicker/UIPageControl/UISegmentedControl)

 UIVisualEffectView:通常要想创建一个特殊效果
 UIStackView

 【】UIStoryboard
 【】UIStoryboardSegue
 【】UIStoryboardPopoverSegue


 【】UITouch对象表示存在一个特定事件的屏幕上用手指或运动。你可以通过UIEvent对象传递到事件处理响应对象UITouch对象。
 【】UIEvent一个UIEvent对象（或者简单地说，一个事件对象）代表在IOS的事件。
 【】UIGestureRecognizer是一个具体的手势识别类的抽象基类。




 UIViewPropertyAnimator:类可以视为面向对象版本的 UIView Animation
 UIViewControllerTransitioning:自定义转场
 UIViewControllerTransitionCoordinator（控制器过渡协调器）
 UIPresentationController:对象为所呈现的视图控制器提供高级视图的转换管理



 UIViewAnimating:动画协议
 UIUserNotificationSettings:通知协议

 UITraitCollection:这个类封装了像水平和竖直方向的Size Class等信息
 UITimingCurveProvider 协议重新封装了时间函数

 UITextInput/UITextInputTraits:键盘 协议

 UIStringDrawing:字符串分类

 ******************************** CoreGraphics简介 *******************************************


 概述:核心图形框架是基于Quartz的（高级的绘图引擎）。它提供了低级别的，轻量级的二维渲染与无与伦比的输出保真度。你用这个框架来处理基于路径的绘制、变换、色彩管理、屏幕绘制，图案，渐变和阴影的图像数据管理、图像创作、图像掩模，以及PDF文档的创建、显示、和解析



 CGFloat:数值单位 等于 double(64) float(32)

 CGError:
 CGPoint: 定义一个点，表示某个点的位置结构体，设置x坐标和y坐标
 CGSize: 定义一个尺寸，设置宽度和高度
 CGRect: 定义一个矩形,表示某个东西位置大小的结构体
 CGAffineTransform: 2D图形绘制中的仿射变换矩阵



 CGColor:一组组件定义一个颜色,一个颜色空间指定如何解释它们
 CGColorSpace:表示需要使用的色彩标准（为创建CGColor做准备）
 CGColorConversionInfoRef:

 CGFont:一组字符符号和绘制文本的布局信息。
 CGImage:位图图像或图像的面具
 CGLayer:离屏重用内容；
 CGPath:精确描述形状或线条绘制的图形上下文
 CGPattern：一个2D模式用于绘制图形的路径。


 CGContext:又叫图形上下文，相当于一块画布，

 CGBitmapContext:一种CGContextRef格式可以用来将位绘制到内存
 CGDataConsumer:抽象数据写入任务,消除了需要管理一个原始内存缓冲区。
 CGDataProvider:抽象为读取任务,消除了需要管理一个原始内存缓冲区。




 CGFunction:定义和使用回调函数的方法。
 CGGradient:径向和轴向 颜色渐变填充


 */








