//
//  CusSubViewController.m
//  XHNavBarExample
//
//  Created by zhuxiaohui on 16/10/19.
//  Copyright © 2016年 qiantou. All rights reserved.
//

#import "CusSubViewController.h"
#import "UIViewController+XHNavBar.h"

@interface CusSubViewController ()

@end

@implementation CusSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.初始化navigationBar + 设置标题
    [self cus_initNavBarAndSetTitle:@"CusSubViewController"];
    
    //2.设置返回
    [self cus_setNavBarBack];
    
    //2.1设置返回并自定义返回事件
    //[self cus_setNavBarBackAndAction:@selector(backAction)];
    
    //3.设置rightBarButtonItem
    //-文字类型
    [self cus_setNavBarRightButtonWithTitle:@"save" action:@selector(saveAction)];
    //-图片类型
    //[selector cus_setNavBarRightButtonWithImageName:@"xh_navbar_back" action:@selector(saveAction)];

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
