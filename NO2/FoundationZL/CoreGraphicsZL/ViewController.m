//
//  ViewController.m
//  CoreGraphicsZL
//
//  Created by xs on 2017/6/19.
//  Copyright © 2017年 Touker. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


@end

/*
 
 
 CGFloat:数值单位 等于 double(64) float(32)

 ******************************** CGGeometry.h<几何> 简介 *******************************************





 struct CGPoint {
 CGFloat x;
 CGFloat y;
 }; CGPoint: 定义一个点，表示某个点的位置结构体，设置x坐标和y坐标



 struct CGSize {
 CGFloat width;
 CGFloat height;
 }; CGSize: 定义一个尺寸，设置宽度和高度




 struct CGVector {
 CGFloat dx;
 CGFloat dy;
 };CGVector:定义一个二维矢量



 struct CGRect {
 CGPoint origin;
 CGSize size;
 };CGRect: 定义一个矩形,表示某个东西位置大小的结构体



 CGPointMake(0, 0);
 CGSizeMake(0, 0);
 CGRectMake(0, 0, 0, 0);


 CGPointZero:零点，与CGPointMake(0, 0)等效
 CGSizeZero:零尺寸，与CGSizeMake(0, 0)等效
 CGRectZero:零矩形，与CGRectMake(0, 0, 0, 0)等效
 CGRectNull:空矩形，这个和零矩形并不相同，当我们返回两个不相交矩形的交集时，会返回空矩形。
 CGRectInfinite:无限的矩形


 CGFloat CGRectGetMinX(CGRect rect):获得矩形最左边的x值
 CGFloat CGRectGetMidX(CGRect rect):获取矩形中点的x值
 CGFloat CGRectGetMaxX(CGRect rect):获取矩形最右端的x值

 CGFloat CGRectGetMinY(CGRect rect):获取矩形最上端的y值
 CGFloat CGRectGetMidY(CGRect rect):获取矩形中心点的y值
 CGFloat CGRectGetMaxY(CGRect rect):获取矩形最下端的y值

 CGFloat CGRectGetWidth(CGRect rect):获取矩形宽度
 CGFloat CGRectGetHeight(CGRect rect):获取矩形高度



 CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
 CGRect CGRectIntegral(CGRect rect)
 CGRect CGRectUnion(CGRect r1, CGRect r2)
 CGRect CGRectIntersection(CGRect r1, CGRect r2)
 CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)



 bool CGPointEqualToPoint(CGPoint point1, CGPoint point2):判断两个点是否相等
 bool CGSizeEqualToSize(CGSize size1, CGSize size2):判断两个尺寸是否相等
 bool CGRectEqualToRect(CGRect rect1, CGRect rect2):判断两个矩形是否相等
 bool CGRectIsEmpty(CGRect rect):判断是否为零矩形
 bool CGRectIsNull(CGRect rect):判断是否为空矩形
 bool CGRectIsInfinite(CGRect rect):判断是否为无限矩形





 struct CGAffineTransform {
 CGFloat a, b, c, d;
 CGFloat tx, ty;
 }; 虽然结构体中只有a,b,c,d,tx,ty 6个参数，但其实还有3个固定的参数[0,0,1]来组成3x3的矩阵。

 CGAffineTransform:
 CGAffineTransform transform2 =  CGAffineTransformIdentity; 系统常量

 CGAffineTransformMake:
 CGAffineTransformMakeTranslation:平移，实现以初始位置为基准,在x轴方向上平移x单位,在y轴方向上平移y单位
 CGAffineTransformMakeScale:缩放, 实现以初始位置为基准,在x轴方向上缩放x倍,在y轴方向上缩放y倍
 CGAffineTransformMakeRotation:旋转,现以初始位置为基准,将坐标系统逆时针旋转angle弧度(弧度=π/180×角度,M_PI弧度代表180角度)
 CGAffineTransformTranslate:实现以一个已经存在的形变为基准,在x轴方向上平移x单位,在y轴方向上平移y单位
 CGAffineTransformScale实现以一个已经存在的形变为基准,在x轴方向上缩放x倍,在y轴方向上缩放y倍
 CGAffineTransformRotate实现以一个已经存在的形变为基准,将坐标系统逆时针旋转angle弧度(弧度=π/180×角度,M_PI弧度代表180角度)

 
 ********************************  CGColorSpace: 简介 *******************************************

 

 CGColorSpace:表示需要使用的色彩标准（为创建CGColor做准备）


 图片渲染相关参数
 typedef CF_ENUM (int32_t, CGColorRenderingIntent) {
 kCGRenderingIntentDefault,
 kCGRenderingIntentAbsoluteColorimetric,
 kCGRenderingIntentRelativeColorimetric,
 kCGRenderingIntentPerceptual,
 kCGRenderingIntentSaturation
 };


 typedef CF_ENUM (int32_t,  CGColorSpaceModel) {
 kCGColorSpaceModelUnknown = -1,
 kCGColorSpaceModelMonochrome,
 kCGColorSpaceModelRGB,
 kCGColorSpaceModelCMYK,
 kCGColorSpaceModelLab,
 kCGColorSpaceModelDeviceN,
 kCGColorSpaceModelIndexed,
 kCGColorSpaceModelPattern
 };


 灰度 色彩
 CGColorSpaceRef cg_nullable CGColorSpaceCreateDeviceGray(void)

 RGBA 色彩 （显示3色）
 CGColorSpaceRef cg_nullable CGColorSpaceCreateDeviceRGB(void)

 CMYK 色彩 （印刷4色）
 CGColorSpaceRef cg_nullable CGColorSpaceCreateDeviceCMYK(void)








 ********************************   CGColor: 简介 *******************************************






 CGColor主要用于CoreGaphics框架之中，CGColor其实是个结构体，而我们通常在使用的CGColor的时候使用的是它的引用类型CGColorRe


 创建一个 CGColorRef 颜色

 @param space 指定CGColor对应的颜色空间，Quartz就会retain该对象，因此调用完之后你就可以安全的释放该对象
 @param components 一个CGFloat的数组，该数组的元素个数是指定色彩空间包含的颜色分量数n，加上对应的alpha值
 @return CGColorRef

CGColorRef __nullable CGColorCreate(CGColorSpaceRef cg_nullable space,const CGFloat * cg_nullable components);


CGColorRef  CGColorCreateGenericGray(CGFloat gray, CGFloat alpha);
CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green,CGFloat blue, CGFloat alpha);
CGColorRef CGColorCreateGenericCMYK(CGFloat cyan, CGFloat magenta,CGFloat yellow, CGFloat black, CGFloat alpha);


CGColorRef __nullable CGColorGetConstantColor(CFStringRef cg_nullable colorName);
CGColorRef __nullable CGColorCreateWithPattern(CGColorSpaceRef cg_nullable space,CGPatternRef cg_nullable pattern, const CGFloat * cg_nullable components);
CGColorRef __nullable CGColorCreateCopy(CGColorRef cg_nullable color);
CGColorRef __nullable CGColorCreateCopyWithAlpha(CGColorRef cg_nullable color,CGFloat alpha);





void CGColorRelease(CGColorRef cg_nullable color);
bool CGColorEqualToColor(CGColorRef cg_nullable color1, CGColorRef cg_nullable color2);
const CGFloat * __nullable CGColorGetComponents(CGColorRef cg_nullable color);


CGFloat CGColorGetAlpha(CGColorRef cg_nullable color);
CGColorSpaceRef __nullable CGColorGetColorSpace(CGColorRef cg_nullable color);
CGPatternRef __nullable CGColorGetPattern(CGColorRef cg_nullable color);




const CFStringRef  kCGColorWhite;
const CFStringRef  kCGColorBlack;
const CFStringRef  kCGColorClear;


 ********************************   CGContext: 简介 *******************************************
 CGContext:又叫图形上下文，相当于一块画布，以堆栈形式存放，只有在当前 context上绘图才有效




 typedef CF_ENUM (int32_t, CGPathDrawingMode) {
 kCGPathFill,
 kCGPathEOFill,
 kCGPathStroke,
 kCGPathFillStroke,
 kCGPathEOFillStroke
 };

 /* Drawing modes for text. */

typedef CF_ENUM (int32_t, CGTextDrawingMode) {
    kCGTextFill,
    kCGTextStroke,
    kCGTextFillStroke,
    kCGTextInvisible,
    kCGTextFillClip,
    kCGTextStrokeClip,
    kCGTextFillStrokeClip,
    kCGTextClip
};

/* Text encodings. */

typedef CF_ENUM (int32_t, CGTextEncoding) {
    kCGEncodingFontSpecific,
    kCGEncodingMacRoman
}


typedef CF_ENUM (int32_t, CGInterpolationQuality) {
    kCGInterpolationDefault = 0,  /* Let the context decide. */
    kCGInterpolationNone = 1,     /* Never interpolate. */
    kCGInterpolationLow = 2,      /* Low quality, fast interpolation. */
    kCGInterpolationMedium = 4,   /* Medium quality, slower than kCGInterpolationLow. */
    kCGInterpolationHigh = 3      /* Highest quality, slower than kCGInterpolationMedium. */
};



typedef CF_ENUM (int32_t, CGBlendMode) {
    /* Available in Mac OS X 10.4 & later. */
    kCGBlendModeNormal,
    kCGBlendModeMultiply,
    kCGBlendModeScreen,
    kCGBlendModeOverlay,
    kCGBlendModeDarken,
    kCGBlendModeLighten,
    kCGBlendModeColorDodge,
    kCGBlendModeColorBurn,
    kCGBlendModeSoftLight,
    kCGBlendModeHardLight,
    kCGBlendModeDifference,
    kCGBlendModeExclusion,
    kCGBlendModeHue,
    kCGBlendModeSaturation,
    kCGBlendModeColor,
    kCGBlendModeLuminosity,


    kCGBlendModeClear,                  /* R = 0 */
    kCGBlendModeCopy,                   /* R = S */
    kCGBlendModeSourceIn,               /* R = S*Da */
    kCGBlendModeSourceOut,              /* R = S*(1 - Da) */
    kCGBlendModeSourceAtop,             /* R = S*Da + D*(1 - Sa) */
    kCGBlendModeDestinationOver,        /* R = S*(1 - Da) + D */
    kCGBlendModeDestinationIn,          /* R = D*Sa */
    kCGBlendModeDestinationOut,         /* R = D*(1 - Sa) */
    kCGBlendModeDestinationAtop,        /* R = S*(1 - Da) + D*Sa */
    kCGBlendModeXOR,                    /* R = S*(1 - Da) + D*(1 - Sa) */
    kCGBlendModePlusDarker,             /* R = MAX(0, (1 - D) + (1 - S)) */
    kCGBlendModePlusLighter             /* R = MIN(1, S + D) */
};
















1 CGContextMoveToPoint 开始画线

2 CGContextAddLineToPoint 画直线



4 CGContextAddEllipseInRect 画一椭圆

4 CGContextSetLineCap 设置线条终点形状

4 CGContextSetLineDash 画虚线

4 CGContextAddRect 画一方框

4 CGContextStrokeRect 指定矩形

4 CGContextStrokeRectWithWidth 指定矩形线宽度

4 CGContextStrokeLineSegments 一些直线



5 CGContextAddArc 画一曲线 前2点为中心 中间俩店为起始弧度 最后一数据为0则顺时针画1则逆时针

5 CGContextAddArcToPoint(context,0,0, 2, 9, 40);先画俩条线从point 到第1点 从第1点到第2点的线  切割里面的圆


6 CGContextSetShadowWithColor 设置阴影
颜色
7 CGContextSetRGBFillColor 设置填充颜色

7 CGContextSetRGBStrokeColor 设置画笔/边框颜色


7 CGContextSetFillColorSpace 颜色空间填充

7 CGConextSetStrokeColorSpace 颜色空间画笔设置


8 CGContextFillRect 补充当前填充颜色的rect

8 CGContextSetAlaha 透明度


9 CGContextTranslateCTM 改变画布位置

10 CGContextSetLineWidth 设置线的宽度

11 CGContextAddRects 画多个线

12 CGContextAddQuadCurveToPoint 画曲线


13  CGContextStrokePath 开始绘制图片

13 CGContextDrawPath 设置绘制模式

14 CGContextClosePath 封闭当前线路


15 CGContextTranslateCTM(context, 0, rect.size.height);
CGContextScaleCTM(context, 1.0, -1.0);反转画布


16 CGContextSetInterpolationQuality 背景内置颜色质量等级

16 CGImageCreateWithImageInRect 从原图片中取小图



17 字符串的写入可用  NSString本身的画图方法
- (CGSize)drawInRect:(CGRect)rect withFont:(UIFont *)font lineBreakMode:
(UILineBreakMode)lineBreakMode alignment:(UITextAlignment)alignment;

18对图片放大缩小的功能就是慢了点

UIGraphicsBeginImageContext(newSize);

UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();

UIGraphicsEndImageContext();



19 CGColorGetComponents（） 返回颜色的各个直 以及透明度 可用只读const float 来接收  是个数组


20 画图片
CGImageRef image＝CGImageRetain(img.CGImage);

CGContextDrawImage(context, CGRectMake(10.0, height - 100.0, 90.0, 90.0), image);



21 实现逐变颜色填充方法
CGContextClip(context);

CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();


CGFloat colors[] =
{

    204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,

    29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,

    0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
};


CGGradientRef gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));

CGColorSpaceRelease(rgb);


CGContextDrawLinearGradient(context, gradient,CGPointMake(0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),kCGGradientDrawsBeforeStartLocation);



22 注:  画完图后,必须先用CGContextStrokePath来描线,即形状后用CGContextFillPath来填充形状内的颜色.

填充一个路径的时候，路径里面的子路径都是独立填充的。


假如是重叠的路径，决定一个点是否被填充，有两种规则

1,nonzero winding number rule:非零绕数规则，假如一个点被从左到右跨过，计数器+1，从右到左跨过，计数器-1，最后，如果结果是0，那么不填充，如果是非零，那么填充。

2,even-odd rule: 奇偶规则，假如一个点被跨过，那么+1，最后是奇数，那么要被填充，偶数则不填充，和方向没有关系。




CGContextEOFillPath     使用奇偶规则填充当前路径
CGContextFillPath     使用非零绕数规则填充当前路径
CGContextFillRect     填充指定的矩形
CGContextFillRects     填充指定的一些矩形
CGContextFillEllipseInRect     填充指定矩形中的椭圆


CGContextDrawPath
两个参数决定填充规则，
kCGPathFill表示用非零绕数规则，
kCGPathEOFill表示用奇偶规则，
kCGPathFillStroke表示填充，
kCGPathEOFillStroke表示描线，不是填充




当一个颜色覆盖上另外一个颜色，两个颜色怎么混合
默认方式是
result = (alpha * foreground) + (1 - alpha) * background


CGContextSetBlendMode :设置blend mode.

CGContextSaveGState :保存blend mode.

CGContextRestoreGState:在没有保存之前，用这个函数还原blend mode.

CGContextSetBlendMode 混合俩种颜色




 */
