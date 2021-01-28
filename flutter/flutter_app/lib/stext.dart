import 'package:flutter/widgets.dart';

Text textCreate() {
  /* 如果不为null，则为该文本使用的样式 */
  TextStyle style = textStyleCreate();
  /* 要显示为InlineSpan的文本 */
  InlineSpan textSpan = TextSpan();
  /* 使用的支撑杆样式。撑杆样式定义撑杆，该撑杆设置最小的垂直布局度量 */
  StrutStyle strutStyle = StrutStyle();
  /* 文本是否应在换行符处中断 */
  bool softWrap = true;
  /* 文本可跨越的可选最大行数，必要时可换行。如果文本超过给定的行数，则会根据overflow将其截断 */
  int maxLines = 1;
  /* 此文本的替代语义标签 */
  String semanticsLabel = "99999";
  /* 每个逻辑像素的字体像素数 */
  double textScaleFactor = 0.5;
  /* 定义如何测量渲染文本的宽度 */
  TextWidthBasis textWidthBasis = TextWidthBasis.parent;
  /* 文本应如何水平对齐。 */
  TextAlign textAlign = TextAlign.center;
  /* 视觉溢出应如何处理 */
  TextOverflow overflow = TextOverflow.clip;
  /* 文本的方向性 */
  TextDirection textDirection = TextDirection.ltr;
  /* 定义段落如何将TextStyle.height应用于第一行的上升沿和最后一行的下降沿 */
  // TextHeightBehavior textHeightBehavior = TextHeightBehavior();
  Text text = Text(
    "9999",
    style: style,
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
    textWidthBasis: textWidthBasis,
  );

  return text;
}
TextStyle textStyleCreate() {
  bool inherit = true;

  double height = 18;
  double decorationThickness = 6.0;
  double fontSize = 15.0;
  double letterSpacing = 5.0;
  double wordSpacing = 5.0;

  FontWeight fontWeight = FontWeight.bold;
  FontStyle fontStyle = FontStyle.normal;


  Color color = Color.fromARGB(1, 172, 172, 172);
  Color backgroundColor = Color.fromARGB(1, 152, 255, 255);
  Color decorationColor = Color.fromARGB(1, 136, 136, 136);

  Paint foreground = Paint();
  Paint background = Paint();

  TextBaseline textBaseline = TextBaseline.alphabetic;
  TextDecoration decoration = TextDecoration.lineThrough;
  TextDecorationStyle decorationStyle = TextDecorationStyle.dashed;
  String fontFamily = "123";

  String debugLabel = "debugLabel";

  // List<ui.Shadow> shadows = [];
  // List<ui.FontFeature> fontFeatures = [];

  return TextStyle();
}
