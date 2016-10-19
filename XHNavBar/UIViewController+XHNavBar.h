//
//  UIViewController+XHNavBar.h

//  Copyright (c) 2016 XHNavBar (https://github.com/CoderZhuXH/XHNavBar)

//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <UIKit/UIKit.h>

@interface UIViewController (XHNavBar)

#pragma mark-使用系统navigationBar

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
 *  自定义navbar-设置返回按钮
 */
-(void)cus_setNavBarBack;

/**
 *  自定义navbar-设置返回按钮+自定义事件
 */
-(void)cus_setNavBarBackAndAction:(SEL)selecter;

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
@end
