//
//  CusViewController.m
//  XHNavBarExample
//
//  Created by xiaohui on 16/5/26.
//  Copyright © 2016年 CoderZhuXH. All rights reserved.
//

#import "CusViewController.h"
#import "UIViewController+XHNavBar.h"
#import "CusSubViewController.h"

@interface CusViewController ()

@end

@implementation CusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /**
     *  自定义navigationBar,快速设置:
     */
    
    //1.初始化navigationBar + 设置标题
    [self cus_initNavBarAndSetTitle:@"CusViewController"];
    
    //2.设置rightBarButtonItem
    //-文字类型
    [self cus_setNavBarRightButtonWithTitle:@"save" action:@selector(saveAction)];
    //-图片类型
    //[selector cus_setNavBarRightButtonWithImageName:@"xh_navbar_back" action:@selector(saveAction)];
    
}
- (IBAction)pushAction:(UIButton *)sender {

    CusSubViewController *VC = [[CusSubViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];

}
-(void)otherAction{
    
    NSLog(@"other");
}
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
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
