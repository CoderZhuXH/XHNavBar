//
//  UIViewController+XHNavBar.m

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

#import "UIViewController+XHNavBar.h"

#define NavBar_OtherColor  [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1]
#define NavBar_RGBAColor(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

#define NavBar_BackgroundColor  [UIColor orangeColor] //背景色
#define NavBar_TextColor        [UIColor whiteColor]  //字体颜色
#define NavBar_LineColor        NavBar_RGBAColor(220,220,220,1) //底部线颜色
#define NavBar_BackImageName    @"xh_navbar_back"  //返回 imageName
#define NavBar_TitleFont        18  //title字体大小

#define NavBar_StatusBar_Height   [UIApplication sharedApplication].statusBarFrame.size.height
#define NavBar_Height  (NavBar_StatusBar_Height + 44.0)  //状态栏高度+导航栏
#define NavBar_IPhoneX_Top_SafeH  24.0//iphonex 顶部安全距离
#define NavBarButtonLeft_Width  60  //item left button宽度
#define NavBarButtonRight_Width 60  //item right button 宽度
#define NavBarButton_Height     44  //item button 高度
#define NavBarButton_TitleFont  16  //item Button字体大小

//间隙相关
#define NavbarItem_Space        10 //item 到屏幕左右间距(除系统navigationBar 返回item外)
#define NavBarButton_ImgSpace   8 //item button 图片边缘到button左右两端间隙

static BOOL const translucent = YES;//导航栏以下视图是否自动向下偏移64,YES不偏移,NO偏移


typedef NS_ENUM(NSInteger,NavBarItemType) {
    
    NavBarItemTypeLeftImage,
    NavBarItemTypeRightTitle,
    NavBarItemTypeRightImage
    
};

@implementation UIViewController (XHNavBar)

#pragma mark-使用系统 navigationBar
-(void )sys_initNavBarAndSetTitle:(NSString *)title
{
    [self sys_initNavBar];

    self.navigationItem.title=title;
}

-(UIButton *)sys_setNavBarRightButtonWithTitle:(NSString *)name action:(SEL)selecter
{
    return [self sys_setNavBarButtonWithName:name action:selecter type:NavBarItemTypeRightTitle];
}
-(UIButton *)sys_setNavBarRightButtonWithImageName:(NSString *)name action:(SEL)selecter
{
    return [self sys_setNavBarButtonWithName:name action:selecter type:NavBarItemTypeRightImage];
}
#pragma mark-private
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    return self.navigationController.childViewControllers.count > 1;
}
-(void)sys_initNavBar
{
    self.navigationController.navigationBar.translucent = translucent;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    //背景
    [self.navigationController.navigationBar setBackgroundImage:[self imageFromColor:NavBar_BackgroundColor] forBarMetrics:UIBarMetricsDefault];
    //title 字体颜色,大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:NavBar_TextColor,NSFontAttributeName:[UIFont systemFontOfSize:NavBar_TitleFont]}];
    if(self.navigationController.viewControllers.count>1)
    {
        //返回按钮
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:NavBar_BackImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    }
}

-(void)sys_setNavBarTitle:(NSString *)title
{
    self.navigationItem.title = title;
}
-(UIButton *)sys_setNavBarButtonWithName:(NSString *)name action:(SEL)selecter type:(NavBarItemType)type
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, NavBarButtonRight_Width, NavBarButton_Height)];
    UIButton *button = [[UIButton alloc] initWithFrame:view.bounds];
    [button addTarget:self action:selecter forControlEvents:UIControlEventTouchUpInside];
    //button.backgroundColor = NavBar_OtherColor;
    [view addSubview:button];
    UIBarButtonItem *item =[[UIBarButtonItem alloc]initWithCustomView:view];
    
    if (type==NavBarItemTypeRightTitle)
    {
        [button setTitle:name forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:NavBarButton_TitleFont];
        [button setTitleColor:NavBar_TextColor forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        //占位item,用于调整右间距
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                      target:nil action:nil];
        spaceItem.width = -16+NavbarItem_Space;
        self.navigationItem.rightBarButtonItems = @[spaceItem,item];
        
        return button;

    }
    else if (type==NavBarItemTypeRightImage)
    {
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
         button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -NavBarButtonRight_Width/2.0+NavBarButton_ImgSpace);
        //占位item,用于调整右间距
        UIBarButtonItem *spaceItem = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                      target:nil action:nil];
        spaceItem.width = -16+NavbarItem_Space;
        self.navigationItem.rightBarButtonItems = @[spaceItem,item];
        
        return button;
    }
    
    return nil;
}
#pragma mark-自定义navigationBar
-(UILabel *)cus_initNavBarAndSetTitle:(NSString *)title
{
    [self cus_initNavBar];
    return [self cus_setNavBarTitle:title];
}
-(void)cus_setNavBarBack
{
    [self cus_setNavBarBackAndAction:@selector(backAction)];
}
-(void )cus_setNavBarBackAndAction:(SEL)selecter
{
    [self cus_setNavBarLeftButtonWithImageName:NavBar_BackImageName action:selecter];
}
-(UIButton *)cus_setNavBarRightButtonWithTitle:(NSString *)name action:(SEL)selecter
{
    return [self cus_setNavBarButtonWithName:name action:selecter type:NavBarItemTypeRightTitle];
}

-(UIButton *)cus_setNavBarRightButtonWithImageName:(NSString *)name action:(SEL)selecter
{
    return [self cus_setNavBarButtonWithName:name action:selecter type:NavBarItemTypeRightImage];
}

#pragma mark-private
-(void)cus_initNavBar
{
    //影藏系统自带NavBar
    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = translucent;
    self.automaticallyAdjustsScrollViewInsets = NO;
    //背景
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, NavBar_Height)];
    bgView.backgroundColor = NavBar_BackgroundColor;//设置默认颜色
    
    
    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, NavBar_Height-0.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    lineLabel.backgroundColor = NavBar_LineColor;
    [bgView addSubview:lineLabel];
    
    [self.view addSubview:bgView];

}
-(UILabel  *)cus_setNavBarTitle:(NSString *)title
{
    UILabel *navBarTitleLab = [self createNavBarTitleWithName:title];
    [self.view addSubview:navBarTitleLab];
    
    return navBarTitleLab;
}

-(UIButton *)cus_setNavBarLeftButtonWithImageName:(NSString *)name action:(SEL)selecter
{
    return [self cus_setNavBarButtonWithName:name action:selecter type:NavBarItemTypeLeftImage];
}
-(UIButton *)cus_setNavBarButtonWithName:(NSString *)name action:(SEL)selecter type:(NavBarItemType)type
{
    if(type==NavBarItemTypeLeftImage)
    {
        UIButton *button = [self createNavBarButtonWithFrame:CGRectMake(NavbarItem_Space, NavBar_StatusBar_Height, NavBarButtonLeft_Width, NavBarButton_Height) action:selecter];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, -NavBarButtonLeft_Width/2.0+NavBarButton_ImgSpace, 0, 0);
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [self.view addSubview:button];
        return button;
    }
    else if (type==NavBarItemTypeRightTitle)
    {
        UIButton *button = [self createNavBarButtonWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-NavBarButtonRight_Width-NavbarItem_Space, NavBar_StatusBar_Height, NavBarButtonRight_Width, NavBarButton_Height) action:selecter];
        button.titleLabel.font = [UIFont systemFontOfSize:NavBarButton_TitleFont];
        [button setTitleColor:NavBar_TextColor forState:UIControlStateNormal];
        [button setTitle:name forState:UIControlStateNormal];
        [self.view addSubview:button];
        return button;
    }
    else if (type==NavBarItemTypeRightImage)
    {
        UIButton *button = [self createNavBarButtonWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-NavBarButtonRight_Width-NavbarItem_Space, NavBar_StatusBar_Height, NavBarButtonRight_Width, NavBarButton_Height) action:selecter];
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -NavBarButtonRight_Width/2.0+NavBarButton_ImgSpace);
        [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
        [self.view addSubview:button];
        return button;
    }
    return nil;
}
-(UILabel  *)createNavBarTitleWithName:(NSString *)titleName
{
    CGFloat x = NavBarButtonRight_Width>NavBarButtonLeft_Width?NavBarButtonRight_Width:NavBarButtonLeft_Width;
    x = x+NavbarItem_Space;//间隙
    UILabel *navBarTitleLab = [[UILabel alloc] initWithFrame:CGRectMake(x,NavBar_StatusBar_Height,[UIScreen mainScreen].bounds.size.width- x*2, NavBarButton_Height)];
    navBarTitleLab.text = titleName;
    navBarTitleLab.textAlignment =NSTextAlignmentCenter;
    navBarTitleLab.textColor = NavBar_TextColor;
    navBarTitleLab.font = [UIFont systemFontOfSize:NavBar_TitleFont];
    //navBarTitleLab.backgroundColor = NavBar_OtherColor;
    return navBarTitleLab;
}
-(UIButton *)createNavBarButtonWithFrame:(CGRect)frame action:(SEL)selecter{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    //button.backgroundColor = NavBar_OtherColor;
    [button addTarget:self action:selecter forControlEvents:UIControlEventTouchUpInside];
    return button;
}
#pragma mark-backAction
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark-其他
-(UIImage *)imageFromColor:(UIColor *)color{
    
    CGSize size=CGSizeMake(1.0f, 1.0f);
    CGRect rect=(CGRect){{0.0f,0.0f},size};
    //开启一个图形上下文
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0f);
    //获取图形上下文
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    //获取图像
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

@end
