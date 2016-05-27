//
//  CusViewController.m
//  XHNavBarExample
//
//  Created by xiaohui on 16/5/26.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "CusViewController.h"
#import "UIViewController+XHNavBar.h"

@interface CusViewController ()

@end

@implementation CusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /**
     *  自定义navigationBar,快速设置:
     */
    
    //1.初始化navigationBar + 设置标题
    [self cus_initNavBarAndSetTitle:@"首页"];
    //1.初始化navigationBar + 设置标题 + 自定义返回事件
    //[self cus_initNavBarAndSetTitle:@"首页" backAction:@selector(backAction)];
    
    //2.设置rightBarButtonItem
    //-文字类型
    [self cus_setNavBarRightButtonWithTitle:@"保存" action:@selector(saveAction)];
    //-图片类型
    //[selector cus_setNavBarRightButtonWithImageName:@"xh_navbar_back" action:@selector(saveAction)];
    
    
    
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)pushAction:(UIButton *)sender {

    
    CusViewController *VC = [[CusViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];

}
-(void)otherAction{
    
    NSLog(@"其他");
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)saveAction
{
    NSLog(@"保存");
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
