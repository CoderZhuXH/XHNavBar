# XHNavBar
* 快速创建navigationBar,支持系统navigationBar及自定义navigationBar

## 使用方法
### 1.栗子
*   自定义navigationBar-快速设置
```objc
    //1.初始化navigationBar + 设置标题
    [self cus_initNavBarAndSetTitle:@"首页"];
    //1.初始化navigationBar + 设置标题 + 自定义返回事件 (两方法二选一)
    [self cus_initNavBarAndSetTitle:@"首页" backAction:@selector(backAction)];
    
    //2.设置rightBarButtonItem
    //-文字类型
    [self cus_setNavBarRightButtonWithTitle:@"保存" action:@selector(saveAction)];
    //-图片类型
    //[selector cus_setNavBarRightButtonWithImageName:@"xh_navbar_back" action:@selector(saveAction)];
```
*   使用系统navigationBar-快速设置
```objc
    //1.初始化navigationBar + 设置标题
    [self cus_initNavBarAndSetTitle:@"首页"];
    
    //2.设置rightBarButtonItem
    //-文字类型
    [self cus_setNavBarRightButtonWithTitle:@"保存" action:@selector(saveAction)];
    //-图片类型
    //[selector cus_setNavBarRightButtonWithImageName:@"xh_navbar_back" action:@selector(saveAction)];
```
### 2.文字颜色,字体大小等请在XHNavBar.m 上面宏定义中修改
### 3.相关API
```objc
#pragma mark-使用系统 navigationBar

/**
 *   系统navbar-初始化+设置标题(此方法,包含初始化和设置标题 2步操作)
 *
 *  @param title 标题
 */
-(void )sys_initNavBarAndSetTitle:(NSString *)title;

/**
 *   系统navbar-设置rightButton with title
 *
 *  @param name     title
 *  @param selecter 事件
 *
 *  @return Button
 */
-(UIButton *)sys_setNavBarRightButtonWithTitle:(NSString *)name action:(SEL)selecter;

/**
 *  系统navbar-设置rightButton with imageName
 *
 *  @param name     图片名
 *  @param selecter 事件
 *
 *  @return Button
 */
-(UIButton *)sys_setNavBarRightButtonWithImageName:(NSString *)name action:(SEL)selecter;

#pragma mark-自定义navigationBar

/**
 *  自定义navbar-初始化+设置标题
 *
 *  @param title 标题
 *
 *  @return 标题Label
 */
-(UILabel  *)cus_initNavBarAndSetTitle:(NSString *)title;

/**
 *  自定义navbar-初始化+设置标题+自定义返回事件
 *
 *  @param title    标题
 *  @param selecter 返回事件
 *
 *  @return 标题Label
 */
-(UILabel *)cus_initNavBarAndSetTitle:(NSString *)title backAction:(SEL)selecter;

/**
 *  自定义navbar-设置rightButton(文字类型)
 *
 *  @param name     title
 *  @param selecter 事件
 *
 *  @return Button
 */
-(UIButton *)cus_setNavBarRightButtonWithTitle:(NSString *)name action:(SEL)selecter;
/**
 *  自定义navbar-设置rightButton(图片类型)
 *
 *  @param name     图片名
 *  @param selecter 事件
 *
 *  @return Button
 */
-(UIButton *)cus_setNavBarRightButtonWithImageName:(NSString *)name action:(SEL)selecter;

```

##  安装
### 手动添加:<br>
*   1.将 XHNavBar 文件夹添加到工程目录中<br>
*   2.导入 XHNavBar.h

### CocoaPods:<br>
*   1.在 Podfile 中添加 pod 'XHNavBar'<br>
*   2.执行 pod install 或 pod update<br>
*   3.导入 XHNavBar.h

##  系统要求
*   该项目最低支持 iOS 7.0 和 Xcode 7.0

##  许可证
XHNavBar 使用 MIT 许可证，详情见 LICENSE 文件