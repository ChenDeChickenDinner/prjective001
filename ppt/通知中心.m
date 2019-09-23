1.UISwitch
* UISwitch继承自UIControl,因此也能像UIButton一样监听一些事件,比如状态改变事件
* UISwitch可以通过拖线监听状态改变
* UISwitch可以通过addTarget:...方法监听状态改变
- (void)addTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
// 其中controlEvents参数传递的是:UIControlEventValueChanged(值改变事件)

2.监听文本框的文字改变
* 一个文本输入框的文字发生改变时,文本输入框会发出一个UITextFieldTextDidChangeNotification通知
* 因此通过监听通知来监听文本输入框的文字改变
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChange) name:UITextFieldTextDidChangeNotification object:textField];
// textField文本输入框的文字改变了,就会调用self的textChange方法