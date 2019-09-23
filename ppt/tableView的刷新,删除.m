1.tableView的刷新
1> 数据刷新的总体步骤
* 修改模型数据
* 刷新表格(刷新界面)

2> 刷新表格(刷新界面)的方法
* 全局刷新(每一行都会重新刷新)
- (void)reloadData;

* 局部刷新(使用前提: 刷新前后, 模型数据的个数不变)
- (void)reloadRows:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

* 局部删除(使用前提: 模型数据减少的个数 == indexPaths的长度)
- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation;

2.@property属性的用法
* weak(assign) :  代理\UI控件
* strong(retain) : 其他对象(除代理\UI控件\字符串以外的对象)
* copy : 字符串
* assign : 非对象类型(基本数据类型int\float\BOOL\枚举\结构体)