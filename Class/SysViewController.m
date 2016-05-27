//
//  SysViewController.m
//  XHNavBarExample
//
//  Created by xiaohui on 16/5/26.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "SysViewController.h"
#import "UIViewController+XHNavBar.h"

@interface SysViewController ()

@end

@implementation SysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     使用系统navigationBar,快速设置:
     */
    
    //1.初始化navigationBar + 设置标题
    [self sys_initNavBarAndSetTitle:@"首页"];
    
    //2.设置rightBarButtonItem
    //-文字类型
    [self sys_setNavBarRightButtonWithTitle:@"保存" action:@selector(saveAction)];
    //-图片类型
    //[selector sys_setNavBarRightButtonWithImageName:@"xh_navbar_back" action:@selector(saveAction)];
    
    
    // Do any additional setup after loading the view from its nib.
}
-(void)saveAction
{
    NSLog(@"保存");
}
- (IBAction)pushAction:(UIButton *)sender {
 
    SysViewController *VC = [[SysViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
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
