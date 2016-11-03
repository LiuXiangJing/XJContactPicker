#XJContactPicker
一个简单联系人选取器。
## 使用条件

仅适用于iOS 8.0以上。ARC项目

## 使用方法

```
[[XJContactManager shareManager] presentContactsViewOnController:self chooseComplete:^(XJContact *contact) {
    XJLog(@"联系人==%@",contact.description);
}];

```
## 注意事项

`XJContactManager` 使用的时候要么直接用`shareManager`方法创建单例。要么自定义成全局变量，否则选择联系人不会生效，而是直接拨打出去电话！
