//
//  SysSubViewController.m
//  XHNavBarExample
//
//  Created by zhuxiaohui on 16/10/19.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "SysSubViewController.h"
#import "UIViewController+XHNavBar.h"

@interface SysSubViewController ()

@end

@implementation SysSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     使用系统navigationBar,快速设置:
     */
    
    //1.初始化navigationBar + 设置标题
    [self sys_initNavBarAndSetTitle:@"SysSubViewController"];
    
    //2.设置rightBarButtonItem
    //-文字类型
    [self sys_setNavBarRightButtonWithTitle:@"save" action:@selector(saveAction)];
    //-图片类型
    //[selector sys_setNavBarRightButtonWithImageName:@"xh_navbar_back" action:@selector(saveAction)];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)saveAction
{
    NSLog(@"save");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
